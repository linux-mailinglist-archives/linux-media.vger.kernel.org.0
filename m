Return-Path: <linux-media+bounces-39809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C394B248FB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB97A5876EB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5962FAC0F;
	Wed, 13 Aug 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X8LrEFHC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF42F746C
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086268; cv=none; b=hRoryDAi50i609UHmDwwY/Jswiq+ScHpM2EZv3gKS54S2SBFelAI0+S9YqwNGQRA0ytHxhqtUWKo/PE233VV519yhIImUpqbYESgoxQ0BIZU8BwT8Sm1MYaBOEfLILWfC+8QrhKtPPx4Tpn31Zex9QxUFHO4DGYMYAiLOVeXkK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086268; c=relaxed/simple;
	bh=EwYtYpW4KMQhUmV4iEPGw3LFP38+qIuBkFUwqdFlLDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uujrtLXCwXtu4wIWCn95/wE5n6ko/mPmCW7ZcA1/CQwAGMH1dEW/yvAfS+7FrWEV+DDt0jo5Q3EMf7mAbtV5vl5Cto/mhdHPMABZRt62K91KyucG9WCOMZlnm+iE76aQvfyBCUnPlaSZbHqPX6QyGylZwk1FfdveyXjIJ5/BwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X8LrEFHC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1585E2C5;
	Wed, 13 Aug 2025 13:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755086212;
	bh=EwYtYpW4KMQhUmV4iEPGw3LFP38+qIuBkFUwqdFlLDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8LrEFHC1E4VRwebzgGmfeqcKQfCrhzgeZ+JnfefXah9phWIUuYCj5Wy+Z+Hmb9w/
	 yXUnWiTEAqqBEBvjzjKkSFPKhOeZsOZ/2lS1UBSdfaxo9mbAmXx7e36PuI/plIUwix
	 ddsk8TSk7AMYUMooBEdkKUZWjznr2g2a7d6hy3ko=
Date: Wed, 13 Aug 2025 14:57:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
	mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
Message-ID: <20250813115726.GC20174@pendragon.ideasonboard.com>
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
 <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
 <20250813113558.GH6440@pendragon.ideasonboard.com>
 <20250813114153.GA20174@pendragon.ideasonboard.com>
 <cd44c529-9c39-40c5-9fb7-07b36ab4c616@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd44c529-9c39-40c5-9fb7-07b36ab4c616@gocontroll.com>

On Wed, Aug 13, 2025 at 01:45:40PM +0200, Maud Spierings wrote:
> On 8/13/25 13:41, Laurent Pinchart wrote:
> > On Wed, Aug 13, 2025 at 02:36:01PM +0300, Laurent Pinchart wrote:
> >> On Wed, Aug 13, 2025 at 01:31:34PM +0200, Maud Spierings wrote:
> >>> On 8/13/25 13:23, Fabio Estevam wrote:
> >>>> Hi Maud,
> >>>>
> >>>> [Adding Tim]
> >>>>
> >>>> On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings wrote:
> >>>>
> >>>>> My devicetree setup is practically identical to the one in
> >>>>> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
> >>>>> regulator gpio only)
> >>>>
> >>>> You'll need to configure the camera pipeline using media-ctl commands.
> >>>>
> >>>> Take a look at:
> >>>> https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
> >>>
> >>> I have been messing around with that, but it still shouldn't panic right?
> >>
> >> It shouldn't panic, no. That's a bug in the driver.
> >>
> >>> It seems to be happen in:
> >>> sd = media_entity_to_v4l2_subdev(pad->entity);
> >>>
> >>> in mxc_isi_crossbar_xlate_streams()
> >>>
> >>> Checking now if the pad variable is the issue
> >>>
> >>> it seems media_pad_remote_pad_first() can return NULL which would cause
> >>> the issue there I think.
> > 
> > Can you share the media graph as output by `media-ctl -p -d /dev/media0`
> > just before running ffmpeg ? You may need to replace media0 with the
> > device corresponding to the ISI if you have multiple media devices in
> > the system.
> 
> media-ctl -p -d 1
> Media controller API version 6.12.41
> 
> Media device information
> ------------------------
> driver          mxc-isi
> model           FSL Capture Media Device
> serial
> bus info        platform:32e00000.isi
> hw revision     0x0
> driver version  6.12.41
> 
> Device topology
> - entity 1: crossbar (5 pads, 4 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev0
>          pad0: SINK,MUST_CONNECT
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                  <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]
>          pad1: SINK,MUST_CONNECT
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]

There's an issue here. The MUST_CONNECT flag should have preventeed the
pipeline from starting when nothing is connected to the pad. I'll test
it locally.

>          pad2: SINK,MUST_CONNECT
>                  <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
>          pad3: SOURCE
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                  -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
>          pad4: SOURCE
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                  -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]
> 
> - entity 7: mxc_isi.0 (2 pads, 2 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>          pad0: SINK
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
>                   compose.bounds:(0,0)/1920x1080
>                   compose:(0,0)/1920x1080]
>                  <- "crossbar":3 [ENABLED,IMMUTABLE]
>          pad1: SOURCE
>                  [stream:0 fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
>                   crop.bounds:(0,0)/1920x1080
>                   crop:(0,0)/1920x1080]
>                  -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 10: mxc_isi.0.capture (1 pad, 1 link)
>               type Node subtype V4L flags 0
>               device node name /dev/video1
>          pad0: SINK
>                  <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]
> 
> - entity 18: mxc_isi.1 (2 pads, 2 links, 0 routes)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev2
>          pad0: SINK
>                  [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
>                   compose.bounds:(0,0)/1920x1080
>                   compose:(0,0)/1920x1080]
>                  <- "crossbar":4 [ENABLED,IMMUTABLE]
>          pad1: SOURCE
>                  [stream:0 fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
>                   crop.bounds:(0,0)/1920x1080
>                   crop:(0,0)/1920x1080]
>                  -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 21: mxc_isi.1.capture (1 pad, 1 link)
>               type Node subtype V4L flags 0
>               device node name /dev/video2
>          pad0: SINK
>                  <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]
> 
> - entity 29: mxc_isi.output (1 pad, 1 link)
>               type Node subtype V4L flags 0
>          pad0: SOURCE
>                  -> "crossbar":2 [ENABLED,IMMUTABLE]
> 
> - entity 36: csis-32e40000.csi (2 pads, 2 links, 0 routes)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev3
>          pad0: SINK,MUST_CONNECT
>                  [stream:0 fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                  <- "imx219 5-0010":0 []
>          pad1: SOURCE,MUST_CONNECT
>                  [stream:0 fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                  -> "crossbar":0 [ENABLED,IMMUTABLE]
> 
> - entity 41: imx219 5-0010 (1 pad, 1 link, 0 routes)
>               type V4L2 subdev subtype Sensor flags 0
>               device node name /dev/v4l-subdev4
>          pad0: SOURCE
>                  [stream:0 fmt:SRGGB10_1X10/3280x2464 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
>                   crop.bounds:(8,8)/3280x2464
>                   crop:(8,8)/3280x2464]
>                  -> "csis-32e40000.csi":0 []
> 
> media0 seems to be dw100, 2 and 3 are hantro-vpu

-- 
Regards,

Laurent Pinchart

