Return-Path: <linux-media+bounces-16054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8494D135
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 15:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2F11F23B57
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 13:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BB7194C84;
	Fri,  9 Aug 2024 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgI3QMTH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404918E04E;
	Fri,  9 Aug 2024 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210011; cv=none; b=aIPlVgDlRlJwIxFmkfk/rUgmmvIn/AWzUWkfS8084KyZB4gpxlVObHA2OFSB88aTJnJpRsfXP1dVM5T7X4SXIlURin82FQIOgbk4jZUFoiXBwUkTvlAfQFv9AH+3h5tFNme9rsQLNzaQeRyrH4faWiPFMIyTzwwTFhrrtn4fUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210011; c=relaxed/simple;
	bh=OUVi0BcXKUZp1fbRn52swhMCNKXEgUnUvuZRVcPL5iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD8oGZ9gdmLI035vzvkiqOL9cUKWD4YFKHedbBbN/w9lapeM6oalvBYJYdKJsxfG+LHR026Wp6gnDxOzgUTT5SXrxDV5HI6WTefsaepNC8zKnRKt9nAVb3vLDSBsIdqvspMOUhp9o1wB7AliieiXlrrw4624ZB1vud9pWmfb38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgI3QMTH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09A7383F;
	Fri,  9 Aug 2024 15:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723209954;
	bh=OUVi0BcXKUZp1fbRn52swhMCNKXEgUnUvuZRVcPL5iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgI3QMTHnWcp9+mcdc4ruxC307pNENbg03HDvfj6CNVscRafsHVoNZxJEUckaFPFH
	 Tr1HHu9ByXLDEaQbSSXioLR2G73IKO0zSi52hKXL330/kC46ETXoZCMBg606SN5/53
	 uZuWOXwyb4d5x5FtQ+Ae4Wv1mtCjBCAacWEvoJjo=
Date: Fri, 9 Aug 2024 16:26:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= staging: media:
 starfive: Add multiple resolution support
Message-ID: <20240809132624.GB1435@pendragon.ideasonboard.com>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

On Fri, Aug 09, 2024 at 12:12:01PM +0000, Changhuang Liang wrote:
> Hi, Laurent
> 
> Thanks for your comments.
> 
> > Hi Changhuang,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Apr 19, 2024 at 01:19:55AM -0700, Changhuang Liang wrote:
> > > Add multiple resolution support for video "capture_raw" device.
> > > Otherwise it will capture the wrong image data if the width is not 1920.
> > >
> > > Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add
> > > capture driver")
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/staging/media/starfive/camss/stf-capture.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/starfive/camss/stf-capture.c
> > > b/drivers/staging/media/starfive/camss/stf-capture.c
> > > index ec5169e7b391..9e853ff2596a 100644
> > > --- a/drivers/staging/media/starfive/camss/stf-capture.c
> > > +++ b/drivers/staging/media/starfive/camss/stf-capture.c
> > > @@ -177,9 +177,12 @@ static void stf_channel_set(struct stfcamss_video
> > > *video)  {
> > >  	struct stf_capture *cap = to_stf_capture(video);
> > >  	struct stfcamss *stfcamss = cap->video.stfcamss;
> > > +	struct v4l2_pix_format *pix;
> > 
> > This variable can be const as you don't modify the format.
> > 
> > >  	u32 val;
> > >
> > >  	if (cap->type == STF_CAPTURE_RAW) {
> > > +		pix = &video->active_fmt.fmt.pix;
> > 
> > And it can be declared and initialized here:
> > 
> > 		const struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;
> > 
> > > +
> > >  		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
> > >  		val &= ~U0_VIN_CHANNEL_SEL_MASK;
> > >  		val |= CHANNEL(0);
> > > @@ -193,7 +196,7 @@ static void stf_channel_set(struct stfcamss_video *video)
> > >  		val |= PIXEL_HEIGH_BIT_SEL(0);
> > >
> > >  		val &= ~U0_VIN_PIX_CNT_END_MASK;
> > > -		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
> > > +		val |= PIX_CNT_END(pix->width / 4 - 1);
> > 
> > Is there no need to consider the image height as well ? How does the driver
> > prevent buffer overflows if the sensor sends more data than expected ?
> 
> Our hardware will confirm a frame of data through vblank signal, so
> there is no image height configuration.

What happens if the system expects, for instance, a 1920x1080 RAW8
image, and allocates a buffer of of 1920x1080 bytes, but the sensor
outputs more lines ? Does the camera hardware in the SoC offer an option
to prevent buffer overruns ?

> > >
> > >  		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
> > >  	} else if (cap->type == STF_CAPTURE_YUV) {

-- 
Regards,

Laurent Pinchart

