Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2DC754DC06
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 09:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359367AbiFPHlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 03:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiFPHlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 03:41:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB05E5D19A
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 00:41:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B39930B;
        Thu, 16 Jun 2022 09:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655365292;
        bh=83ArDhvb0QFjQekie4YKbuYuSiSn6kZfMwCisqy1E0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3ilFD0nBpMcba0P/VpiSAhhzoMzKUZsbuU5Z48HDAHFvIXYvjpJ1OT94mBMZubR8
         xI9AO7LpfJa/fOwmzJStGaynWDQt1gInWiGJbF226+Omwarnt/DSSGF0QxdvsD/9e+
         L6y6VtD3iW7Er0qkFXaKoRqiB+s4+UqYOO+4bry8=
Date:   Thu, 16 Jun 2022 10:41:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: (EXT) [PATCH 10/55] media: rkisp1: cap: Print debug message on
 failed link validation
Message-ID: <Yqreoo/szj8FhH6r@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-11-paul.elder@ideasonboard.com>
 <7310038.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7310038.DvuYhMxLoT@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jun 16, 2022 at 09:32:17AM +0200, Alexander Stein wrote:
> Am Dienstag, 14. Juni 2022, 21:10:42 CEST schrieb Paul Elder:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > When a link validation failure occurs, print a debug message to help
> > diagnosing the cause.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c index
> > 94819e6c23e2..94a0d787a312 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct
> > media_link *link)
> > 
> >  	if (sd_fmt.format.height != cap->pix.fmt.height ||
> >  	    sd_fmt.format.width != cap->pix.fmt.width ||
> > -	    sd_fmt.format.code != fmt->mbus)
> > +	    sd_fmt.format.code != fmt->mbus) {
> > +		dev_dbg(cap->rkisp1->dev,
> 
> I wonder if a dev_warn is more suitable here.

I usually recommend dev_dbg() for conditions that are triggered directly
by userspace, to avoid giving unpriviledged applications an(other) easy
way to flood the kernel log.

> > +			"link '%s':%u -> '%s':%u not valid: 0x%04x/ %ux%u != 0x%04x/%ux%u",
> > +			link->source->entity->name, link->source->index,
> > +			link->sink->entity->name, link->sink->index,
> > +			sd_fmt.format.code, sd_fmt.format.width,
> > +			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
> > +			cap->pix.fmt.height);
> >  		return -EPIPE;
> > +	}
> > 
> >  	return 0;
> >  }

-- 
Regards,

Laurent Pinchart
