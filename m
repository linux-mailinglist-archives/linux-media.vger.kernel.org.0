Return-Path: <linux-media+bounces-16429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9295607B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 02:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E793D1C20F21
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 00:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E469753A7;
	Mon, 19 Aug 2024 00:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M8jkRCDS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235D322A;
	Mon, 19 Aug 2024 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724026438; cv=none; b=n14Z+Wz90o7WOf6Y3u19kVif3lzwZNv5TQ7Ob5gVfQlo9aAzzP1hAp4vn+SIdkvK1QT+QqWJFZeJaNUqdxFv8EVtDW2iIUj00TvBYNvMGUbqAwwSsfX7ZmSiShbFY6Df6ucz81ADnhmHw092t+Cy6SF6+BvaXtrAYSJIcLkj9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724026438; c=relaxed/simple;
	bh=6ny6rHhlV1aKKkQum5lxuNYiY0llxK003zN3tiLzpB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yk1ckeeYEC15QpJhaIqRm0MZkKU4arj3oXHYFngL8LSHqLGtBmJMk0jEUr/WS5u2Skh8MJC4LL42l9TLZ06Z+8MD+laH9Qhmhy8zt1LPR+DnIkkiWfThRw1zPnre/g7gXZOp4e4ChyhHSN3Ls4Rr/NmmCKe6PxapKbxWp5MrLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M8jkRCDS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D312D227;
	Mon, 19 Aug 2024 02:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724026374;
	bh=6ny6rHhlV1aKKkQum5lxuNYiY0llxK003zN3tiLzpB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8jkRCDShUR5pgM6LW2GUKr1P38/g5QVGolkWyi/WQZJYLUZxGOUvbp9A5BzWTXN9
	 Skb6dCSWJdzaL59pS3xNHhuB5oMmC61G4VT1mYT9yMekFXkDMWrdxlyWhjDXP2dyc8
	 2XgpVK7FCxY/g3BnCZs51Yxk/tArp5bHXj/T59dw=
Date: Mon, 19 Aug 2024 03:13:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbng==?=
 =?utf-8?B?5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= staging: media: starfive: Add
 multiple resolution support
Message-ID: <20240819001327.GK29465@pendragon.ideasonboard.com>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240809132624.GB1435@pendragon.ideasonboard.com>
 <ZQ0PR01MB13029DA731711FAA57BD13A4F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240812103357.GB18729@pendragon.ideasonboard.com>
 <ZQ0PR01MB130236FA891A04350CBC4245F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB130236FA891A04350CBC4245F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

On Mon, Aug 12, 2024 at 12:13:03PM +0000, Changhuang Liang wrote:
> > On Mon, Aug 12, 2024 at 09:43:47AM +0000, Changhuang Liang wrote:
> > > > On Fri, Aug 09, 2024 at 12:12:01PM +0000, Changhuang Liang wrote:
> > > > > > On Fri, Apr 19, 2024 at 01:19:55AM -0700, Changhuang Liang wrote:
> > > > > > > Add multiple resolution support for video "capture_raw" device.
> > > > > > > Otherwise it will capture the wrong image data if the width is not 1920.
> > > > > > >
> > > > > > > Fixes: e080f339c80a ("media: staging: media: starfive: camss:
> > > > > > > Add capture driver")
> > > > > > >
> > > > > > > Signed-off-by: Changhuang Liang
> > > > > > > <changhuang.liang@starfivetech.com>
> > > > > > > ---
> > > > > > >  drivers/staging/media/starfive/camss/stf-capture.c | 5 ++++-
> > > > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/drivers/staging/media/starfive/camss/stf-capture.c
> > > > > > > b/drivers/staging/media/starfive/camss/stf-capture.c
> > > > > > > index ec5169e7b391..9e853ff2596a 100644
> > > > > > > --- a/drivers/staging/media/starfive/camss/stf-capture.c
> > > > > > > +++ b/drivers/staging/media/starfive/camss/stf-capture.c
> > > > > > > @@ -177,9 +177,12 @@ static void stf_channel_set(struct
> > > > > > > stfcamss_video
> > > > > > > *video)  {
> > > > > > >  	struct stf_capture *cap = to_stf_capture(video);
> > > > > > >  	struct stfcamss *stfcamss = cap->video.stfcamss;
> > > > > > > +	struct v4l2_pix_format *pix;
> > > > > >
> > > > > > This variable can be const as you don't modify the format.
> > > > > >
> > > > > > >  	u32 val;
> > > > > > >
> > > > > > >  	if (cap->type == STF_CAPTURE_RAW) {
> > > > > > > +		pix = &video->active_fmt.fmt.pix;
> > > > > >
> > > > > > And it can be declared and initialized here:
> > > > > >
> > > > > > 		const struct v4l2_pix_format *pix =
> > > > > > &video->active_fmt.fmt.pix;
> > > > > >
> > > > > > > +
> > > > > > >  		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
> > > > > > >  		val &= ~U0_VIN_CHANNEL_SEL_MASK;
> > > > > > >  		val |= CHANNEL(0);
> > > > > > > @@ -193,7 +196,7 @@ static void stf_channel_set(struct stfcamss_video *video)
> > > > > > >  		val |= PIXEL_HEIGH_BIT_SEL(0);
> > > > > > >
> > > > > > >  		val &= ~U0_VIN_PIX_CNT_END_MASK;
> > > > > > > -		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
> > > > > > > +		val |= PIX_CNT_END(pix->width / 4 - 1);
> > > > > >
> > > > > > Is there no need to consider the image height as well ? How does
> > > > > > the driver prevent buffer overflows if the sensor sends more data than expected ?
> > > > >
> > > > > Our hardware will confirm a frame of data through vblank signal,
> > > > > so there is no image height configuration.
> > > >
> > > > What happens if the system expects, for instance, a 1920x1080 RAW8
> > > > image, and allocates a buffer of of 1920x1080 bytes, but the sensor
> > > > outputs more lines ? Does the camera hardware in the SoC offer an
> > > > option to prevent buffer overruns ?
> > >
> > > The hardware can confirm the image height by using the VSYNC signal.
> > >
> > > Image will transfer when VSYNC is high.
> > >
> > > VSYNC time = (width + h_blank) * height;
> > 
> > What I'm trying to understand is what happens if the ISP is configured for
> > 1080 lines, but the camera sensor sends more than 1080 lines (the VSYNC
> > signal is active for more than 1080 lines). Where in the driver is the hardware
> > configure with the 1080 lines limit to avoid buffer overflows ?
> 
> If is "capture_raw" video device, no image height can be configured.

In that case what happens if the camera sensor sends more lines than
expected ? Will the raw video device write past the end of the buffer ?
If so, is there a way to guard against that ?

> If is "capture_yuv" video device, it will be set by stf_isp_config_crop.

Thank you, that's the information I was looking for.

-- 
Regards,

Laurent Pinchart

