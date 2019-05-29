Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA402DD0F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 14:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfE2M3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 08:29:17 -0400
Received: from casper.infradead.org ([85.118.1.10]:42998 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfE2M3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 08:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SBMdAEsGciD2hXmzFUMea4ozjqK1PitMoOOY837wIt0=; b=Dt1cikzbs17Sjf5yuKr85mUrZh
        5ywlqMqe6pL4xixwVM8GD6Web8tFV8qzuVoSxMxeefAeyg6AO1qPbtKs089ZtqyYW259moUTzzdJR
        Beg5rjqJi3oNzkyn3zhENu28H2B309BBbV5Fto/XKo/yj5nyd5WJRvBCQQe+uJnX8JzQAgey/pny/
        2HfHYW+u7YyOZ8L5MeyXsQWMXzJ9YVDsUT8RUdWBkB1QpqFehikOQvGC18Hdt5Nb5niwK4TJhsuId
        0no4OKaVaT+NI/ytrRfHN+jprWjm+MOk88wbJlNNqoTIQFIRiU2HvG7uJtDdl27pmImK0TebpqcZK
        c8i7lYJw==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVxhe-0006mm-Vz; Wed, 29 May 2019 12:29:11 +0000
Date:   Wed, 29 May 2019 09:29:05 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize
 in fill_pixfmt()
Message-ID: <20190529092905.337ac423@coco.lan>
In-Reply-To: <20190529092632.779f5f1b@coco.lan>
References: <20190528170232.2091-1-ezequiel@collabora.com>
        <20190528170232.2091-4-ezequiel@collabora.com>
        <20190529082809.0b9f3553@coco.lan>
        <cc51be76-81c3-1c54-2005-1b99d00a8ac1@xs4all.nl>
        <20190529085854.6c689f8d@coco.lan>
        <20190529141633.19c5079b@collabora.com>
        <20190529092632.779f5f1b@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 May 2019 09:26:32 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Wed, 29 May 2019 14:16:33 +0200
> Boris Brezillon <boris.brezillon@collabora.com> escreveu:
> 
> > On Wed, 29 May 2019 08:58:54 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> >   
> > > Em Wed, 29 May 2019 13:43:20 +0200
> > > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > >     
> > > > On 5/29/19 1:28 PM, Mauro Carvalho Chehab wrote:      
> > > > > Em Tue, 28 May 2019 14:02:19 -0300
> > > > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > > > >         
> > > > >> From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >>
> > > > >> Users can define custom sizeimage as long as they're big enough to
> > > > >> store the amount of pixels required for a specific width/height under a
> > > > >> specific format. Avoid overriding those fields in this case.
> > > > >>
> > > > >> We could possibly do the same for bytesperline, but it gets tricky when
> > > > >> dealing with !MPLANE definitions, so this case is omitted for now and        
> > > > >> ->bytesperline is always overwritten with the value calculated in        
> > > > >> fill_pixfmt().
> > > > >>
> > > > >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >> ---
> > > > >> Changes from v5:
> > > > >> * Overwrite bytesperline with the value calculated in fill_pixfmt()
> > > > >>
> > > > >> Changes from v4:
> > > > >> * New patch
> > > > >>
> > > > >>  drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-------
> > > > >>  1 file changed, 43 insertions(+), 15 deletions(-)
> > > > >>
> > > > >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > >> index b2d1e55d9561..fd286f6e17d7 100644
> > > > >> --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > >> @@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > > > >>  	pixfmt->num_planes = info->mem_planes;
> > > > >>  
> > > > >>  	if (info->mem_planes == 1) {
> > > > >> +		u32 sizeimage = 0;
> > > > >> +
> > > > >>  		plane = &pixfmt->plane_fmt[0];
> > > > >> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
> > > > >> -		plane->sizeimage = 0;
> > > > >>  
> > > > >>  		for (i = 0; i < info->comp_planes; i++) {
> > > > >>  			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> > > > >> @@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> > > > >>  			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> > > > >>  			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> > > > >>  
> > > > >> -			plane->sizeimage += info->bpp[i] *
> > > > >> -				DIV_ROUND_UP(aligned_width, hdiv) *
> > > > >> -				DIV_ROUND_UP(aligned_height, vdiv);
> > > > >> +			sizeimage += info->bpp[i] *
> > > > >> +				     DIV_ROUND_UP(aligned_width, hdiv) *
> > > > >> +				     DIV_ROUND_UP(aligned_height, vdiv);
> > > > >>  		}
> > > > >> +
> > > > >> +		/* Custom bytesperline value is not supported yet. */
> > > > >> +		plane->bytesperline = ALIGN(width,
> > > > >> +					    v4l2_format_block_width(info, 0)) *
> > > > >> +				      info->bpp[0];
> > > > >> +
> > > > >> +		/*
> > > > >> +		 * The user might have specified a custom sizeimage, only
> > > > >> +		 * override it if it's not big enough.
> > > > >> +		 */
> > > > >> +		plane->sizeimage = max(sizeimage, plane->sizeimage);        
> > > > > 
> > > > > No upper limit? That doesn't sound a good idea to me, specially since some
> > > > > (broken) app might not be memset the format to zero before filling the ioctl
> > > > > structure.
> > > > > 
> > > > > Perhaps we could do something like:
> > > > > 
> > > > > 		sizeimage = min (sizeimage, 2 * plane->sizeimage)
> > > > > 
> > > > > or something similar that would be reasonable.        
> > > > 
> > > > I've no idea what's sane.
> > > > 
> > > > Buffers can be really large. The largest video resolution defined by CTA-861-G
> > > > is 10240x4320, so at 4 bytes per pixel that's 0x0a8c0000. So perhaps we can
> > > > use min(sizeimage, 0x10000000)? Although we should probably use the clamp function
> > > > instead of min/max.      
> > > 
> > > Well, the max is driver-specific. 
> > > 
> > > For example, for a camera with a max resolution of 640x480 with 2 bytes
> > > per pixel as the max format can only be
> > > 
> > > 	max_size = 640*480*2 (plus some alignment value if pertinent)
> > > 
> > > It sounds to me that the best would be to have a callback function
> > > or value filled by the drivers that would support custom sizeimage.
> > > 
> > > The core could actually calculate during init (by asking the driver
> > > to a very big resolution and getting the returned value), but
> > > it sounds better to let the drivers to explicitly calculate it.    
> > 
> > If we want max_sizeimage to be driver specific I can add it as an extra
> > arg to the fill_pixfmt() funcs.  
> 
> Works for me.
> 
> > If that works for you, we'll send a new version of this patch alone
> > (unless you want us to send the whole series again).  
> 
> If the other patches on this series don't depend on this, I can
> apply the PR just skipping this one, applying your patch afterwards.

Well, I can also apply the PR as-is and apply an extra patch at the
end.

> 
> Thanks,
> Mauro



Thanks,
Mauro
