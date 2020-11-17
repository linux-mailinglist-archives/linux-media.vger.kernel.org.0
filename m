Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648192B6F4C
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 20:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730081AbgKQTtW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Nov 2020 14:49:22 -0500
Received: from mailoutvs20.siol.net ([185.57.226.211]:57695 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728309AbgKQTtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 14:49:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 70A1452215C;
        Tue, 17 Nov 2020 20:49:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gLuD8r2gUYyF; Tue, 17 Nov 2020 20:49:18 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id CC87F522159;
        Tue, 17 Nov 2020 20:49:18 +0100 (CET)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 54561522154;
        Tue, 17 Nov 2020 20:49:18 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: Re: [PATCH v2 2/9] media: cedrus: h264: Support profile and level controls
Date:   Tue, 17 Nov 2020 20:55:14 +0100
Message-ID: <2278543.vxa8QGFfu4@kista>
In-Reply-To: <22e909c7fe5722a7edf0828521c5a43f79ab70e3.camel@collabora.com>
References: <20201113215121.505173-1-ezequiel@collabora.com> <1725677.6jS8d4RcRb@kista> <22e909c7fe5722a7edf0828521c5a43f79ab70e3.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne torek, 17. november 2020 ob 20:40:09 CET je Ezequiel Garcia napisal(a):
> On Tue, 2020-11-17 at 20:24 +0100, Jernej Škrabec wrote:
> > Hi Ezequiel,
> > 
> > sorry for late review.
> > 
> > First of all, this patch doesn't break anything. However, see comment 
below.
> > 
> > Dne petek, 13. november 2020 ob 22:51:14 CET je Ezequiel Garcia 
napisal(a):
> > > Cedrus supports H.264 profiles from Baseline to High,
> > > up to Level 5.1, except for the Extended profile
> > > 
> > > Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and
> > > V4L2_CID_MPEG_VIDEO_H264_LEVEL so that userspace can
> > > query the driver for the supported profiles and levels.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/staging/media/sunxi/cedrus/cedrus.c | 21 +++++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/
staging/
> > media/sunxi/cedrus/cedrus.c
> > > index 9a102b7c1bb9..8b0e97752d27 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > @@ -103,6 +103,27 @@ static const struct cedrus_control 
cedrus_controls[] = 
> > {
> > >  		.codec		= CEDRUS_CODEC_H264,
> > >  		.required	= false,
> > >  	},
> > > +	{
> > > +		.cfg = {
> > > +			.id	= 
> > V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > +			.min	= 
> > V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > > +			.def	= 
> > V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> > > +			.max	= 
> > V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +			.menu_skip_mask =
> > > +				
> > BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > > +		},
> > > +		.codec		= CEDRUS_CODEC_H264,
> > > +		.required	= false,
> > > +	},
> > > +	{
> > > +		.cfg = {
> > > +			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > +			.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> > > +			.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> > 
> > I went through several datasheets and only newer ones (H6, H616) state 
max. 
> > supported level, which is 4.2. Please change it in next revision.
> > 
> > After that, you can add
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > 
> 
> Note that I used level 5.1 based on a commit from you:
> """
>     media: cedrus: h264: Fix 4K decoding on H6
>     
>     Due to unknown reason, H6 needs larger intraprediction buffer for 4K
>     videos than other SoCs. This was discovered by playing 4096x2304 video,
>     which is maximum what H6 VPU is supposed to support.
> """
> 
> I guessed this meant it supported level 5 or higher.
> (Now that I think about it, I meant at least H6, does).
> 
> According to https://en.wikipedia.org/wiki/Advanced_Video_Coding#Levels,
> level 4.2 is up to 2,048×1,080@60.0.

Strange, then I guess datasheet is wrong (wouldn't be first time). 
Unfortunatelly there is no documentation for Cedrus capabilities, so 
everything is either educated guess or tested on HW. Documentation for older 
than H6 SoCs always mention only 1080p @ 60fps limit, even though several of 
them are capable of decoding 4K H264 videos (I'm not sure about max. fps 
though).

> 
> Frankly, I'm open to put whatever value makes you happy.

To be honest, I'm not sure what is correct value here. It may depend on Cedrus 
core variant.

Best regards,
Jernej

>   
> Thanks,
> Ezequiel
> 
> > Best regards,
> > Jernej
> > 
> > > +		},
> > > +		.codec		= CEDRUS_CODEC_H264,
> > > +		.required	= false,
> > > +	},
> > >  	{
> > >  		.cfg = {
> > >  			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
> > > -- 
> > > 2.27.0
> > > 
> > > 
> > 
> > 
> 
> 
> 


