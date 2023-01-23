Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DFE678AB2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 23:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbjAWWXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 17:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjAWWXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 17:23:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E16AEB7C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 14:23:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1BB92D9;
        Mon, 23 Jan 2023 23:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674512596;
        bh=idlBYn0xP9fqp5liJhLvZwolUtuQu/WKM+UUNgLVxN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W8FHrsTrWFGUtkwihMbblZ3IISjoEoOuc8lV3qQJhQAcZvXux99LhYzPRCngSnGZX
         T3CnTe4y4b8EC62J4UUfyBZJ1r6R1Ow5WPuB6QPukkolAehRSJeSC68NuLkdX26GHV
         Uzn1SefwLuD0SkKwRiTHFpr2mcSiigD49Rrreub0=
Date:   Tue, 24 Jan 2023 00:23:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v6.2] media: videobuf2: set q->streaming later
Message-ID: <Y88I0HzHITg/k0ty@pendragon.ideasonboard.com>
References: <c12cfcc5-1d46-7b5f-4a27-f4cd52a1b885@xs4all.nl>
 <Y85k4aNaoPaBbvYD@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y85k4aNaoPaBbvYD@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 12:43:46PM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Jan 23, 2023 at 09:45:49AM +0100, Hans Verkuil wrote:
> > Commit a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops") moved
> > up the q->streaming = 1 assignment to before the call to vb2_start_streaming().
> > 
> > This does make sense since q->streaming indicates that VIDIOC_STREAMON is called,
> > and the call to start_streaming happens either at that time or later if
> > q->min_buffers_needed > 0. So q->streaming should be 1 before start_streaming
> > is called.
> > 
> > However, it turned out that some drivers use vb2_is_streaming() in buf_queue,
> > and if q->min_buffers_needed == 0, then that will now return true instead of
> > false.
> > 
> > So for the time being revert to the original behavior.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Fixes: a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> I'll test it shortly to see if it fixes the VSP1 breakage.

Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > ---
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index fc3758a5bc1c..53e495223ea0 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -2149,8 +2149,6 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
> >  	if (ret)
> >  		return ret;
> > 
> > -	q->streaming = 1;
> > -
> >  	/*
> >  	 * Tell driver to start streaming provided sufficient buffers
> >  	 * are available.
> > @@ -2161,12 +2159,13 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
> >  			goto unprepare;
> >  	}
> > 
> > +	q->streaming = 1;
> > +
> >  	dprintk(q, 3, "successful\n");
> >  	return 0;
> > 
> >  unprepare:
> >  	call_void_qop(q, unprepare_streaming, q);
> > -	q->streaming = 0;
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(vb2_core_streamon);

-- 
Regards,

Laurent Pinchart
