Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B78854E759
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 18:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbiFPQcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 12:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiFPQcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 12:32:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B8A2F007
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 09:32:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44702415;
        Thu, 16 Jun 2022 18:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655397126;
        bh=S5z5ZD8p7hl2X/0iuKB6oLP0porVM3G2KWZlcl03YI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A22chF1qcLt+3wxUr4ZtHgRxEXOwHxq4ewtIUM4k98X13l+TVW/Xb9UqfrgA9B2Ca
         YE8d7ojaTaUk5HnSpN9o4oAB9zN0RQjCeFxhBItYPlDg6rSGDKjogdr6iva+JPyh3c
         4UAo+fF4GzoKK4zzh20o/auPE/g0ihUwZ6l4LZFA=
Date:   Thu, 16 Jun 2022 19:31:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 3/3] media: vivid: Add support for the new YUVA and YUVX
 formats
Message-ID: <Yqta+0Abv4pUVU5B@pendragon.ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
 <20220307180342.10666-4-laurent.pinchart@ideasonboard.com>
 <YmHjzpy/l9Cb7Z8Q@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmHjzpy/l9Cb7Z8Q@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 22, 2022 at 02:07:58AM +0300, Laurent Pinchart wrote:
> Would anyone be able to review this patch ?

Hans maybe ? :-) Same for 2/3.

> On Mon, Mar 07, 2022 at 08:03:42PM +0200, Laurent Pinchart wrote:
> > Extend vivid to support the newly added YUVA and YUVX pixel formats
> > through the TPG.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > index 19701fe72030..38d788b5cf19 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > @@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
> >  		.planes   = 1,
> >  		.buffers = 1,
> >  	},
> > +	{
> > +		.fourcc   = V4L2_PIX_FMT_YUVA32,
> > +		.vdownsampling = { 1 },
> > +		.bit_depth = { 32 },
> > +		.planes   = 1,
> > +		.buffers = 1,
> > +		.alpha_mask = 0xff000000,
> > +	},
> > +	{
> > +		.fourcc   = V4L2_PIX_FMT_YUVX32,
> > +		.vdownsampling = { 1 },
> > +		.bit_depth = { 32 },
> > +		.planes   = 1,
> > +		.buffers = 1,
> > +	},
> >  	{
> >  		.fourcc   = V4L2_PIX_FMT_GREY,
> >  		.vdownsampling = { 1 },

-- 
Regards,

Laurent Pinchart
