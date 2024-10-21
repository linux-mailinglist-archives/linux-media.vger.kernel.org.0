Return-Path: <linux-media+bounces-19975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C69A5E39
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697B91C22AF0
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15431E1A37;
	Mon, 21 Oct 2024 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX8X8nQh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DA4C70;
	Mon, 21 Oct 2024 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498223; cv=none; b=Hbzin0pRJDuf+DAjJWxvidoBII7oAjO9k9YdkKE8UIHXQKIvSDkRHHSE91ghJB5exdrMLcYfqnceQBmF5tlU1Wlc7xFD46ZfypIbU4y/gyN4+RpzLpMnzXU47zSxQwboCvG2QRrEs6lFoQg5KAl2QX7KUqUrQSkmCg0VTngHtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498223; c=relaxed/simple;
	bh=B2baQL7Yao/qvFETd2xzbvbIt8o56EyJ0yLR6QW70jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbmGQP3ceOXiVMVQOZWZyojvxVorGgPvd881GmTRQdLumZ1mmu58SgftdC+wa/Dt8Fbfu5MiF3psD+FP3aCD9t1eP+P/xrijqjMi5LwTO9ZQcEjSvUwaAWigBKumPgxSI5TwoDdS2+x3GdxDDaqUdsdBjxL4HcQA44mdNVcEQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX8X8nQh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0cee600aso526755266b.1;
        Mon, 21 Oct 2024 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729498219; x=1730103019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pV0wxru8ZTmJJ3DXaiDgnoaMc7aIZtWQq4UscqIJZ5w=;
        b=bX8X8nQhOLBAVfmQfTBH/pbyOCXxlJ+380liChbiG5M7xycDFLnb67t8d9M9nPBp0D
         AfnYqxO4TPDtnHiTBuog6tIXJaLLc9xQN2iW30nzvqnPpodvFW5kLtD4RhZjGfTPjvZ7
         uNE1N9jwjWTt+Ulvj/UBmGsfZERLZiFjyqcLGMVTnBf6zqyDwmzNpjQfQXCub/5TwssO
         4T4MktZjPSmOxTpR3DjwDAUjl1ePO8/UGPsgnqTEEsQcUczxsDQJTYYf6mxr1S/6RIk2
         KllHDJqiQufhzcnMzAcVkwm+fyd7p7OJFfudZkSUPP/vpMrx77r/d5cMzXMnLTcWRYim
         Gkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498219; x=1730103019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV0wxru8ZTmJJ3DXaiDgnoaMc7aIZtWQq4UscqIJZ5w=;
        b=p6R1s3C0YmfK1r5WOGF5Qhebx1QF4n8vNlNbF0uAp///MZTqmnfsRz6o8PMJBwlC2R
         aeNphe/kl6UrxVoWRvfKCbgWlYqYXqol6avC93WxpRMGoCUCz82JoysdS7e9+WCVe9u8
         VPQVa7l0ViX0NNYnKHnZjvExpYofAIjgwLxdGrAeXwNr5PwIt+uLFxLRCLg5okFh0N6a
         /gmv2MdpyBGvq2PpYKeq2tG8gDRZ2lrZci6+5F0z4KDTnVF7n5iMDXs1uAn2H9EsMMEC
         iMbr6QXvSBmVwAwwhLnSZxGAwBkvBkjeeVnJ6/BxeLIyyflR7ZDQHFVZWrW92uuLYri3
         glJw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Efm2TvXOg+ROeji0MItNzard2H741WXwvObKGzXviFAM1pLpobJUNFGzX3l8OeRC+8p9/2aRcCMwvBMdtyJXTiU=@vger.kernel.org, AJvYcCUNN5OiL8dB7x3iDnIzPbEwaOYqidk2tvp1puJhcdgN2X9iEVTt0tgA4fseQNSmzzLbBduB3VNS2XRbc9w=@vger.kernel.org, AJvYcCUZW3KPtKfBcGHRirCs5IL+3R1dESyUCXia5kc5tmwqoPQiFKZnLrRhkxxzz+/qYSmC6ZFHSf+KK5nKxlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4cQnB80Jx/hSV5PjkZ+wc2vmsyKTcEXu6NGfPt687nKTf93dq
	f2PjFVjQNyavemqdbZHd0UObIk8IdIZI+9TVwau7fD+ga+zPyLXK
X-Google-Smtp-Source: AGHT+IEFpqonq7tJjXCKr2XitZpRbFziVX/A1hcSmKlgEAUVLOrekq2iccign6jqCBqyoSDqmvje2w==
X-Received: by 2002:a17:907:6e92:b0:a99:f977:70c2 with SMTP id a640c23a62f3a-a9a69c98b2dmr1001775466b.48.1729498218839;
        Mon, 21 Oct 2024 01:10:18 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee0f5sm173371666b.66.2024.10.21.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:10:18 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:10:16 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
Message-ID: <ZxYMaGhTDLWsUPOm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,
Thanks this series.

On Fri, Oct 18, 2024 at 04:32:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to add the below features,
> - Support subdev active state
> - Support for streams
> - Support for virtual channel
> - Code cleanup
> 
> Note, these patches are dependent on below:
> 1] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-27-sakari.ailus@linux.intel.com/
> 2] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-26-sakari.ailus@linux.intel.com/

I thinks also:
 3] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-45-sakari.ailus@linux.intel.com/

> 
> v2->v3
> - Fixed review commments from Laurent
> - Included RB tags from Laurent
> - Dropped patch "media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()"
> - Fixed checkpatch issues (ie used --max-line-length=80)
> 
> RFC->v2
> - Dropped setting of VC using routes
> - Defaulted the native format to MEDIA_BUS_FMT_SBGGR8_1X8
> - Fixed ov5645_enum_frame_size and ov5645_enum_mbus_code
>   for internal image pad
> 
> RFC patch,
> Link: https://lore.kernel.org/all/20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Test logs:
> ====================================
> root@smarc-rzg2l:~# media-ctl -p
> ......
> - entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
>       type V4L2 subdev subtype Sensor flags 0
>       device node name /dev/v4l-subdev1
>     routes:
>         1/0 -> 0/0 [ACTIVE]
>     pad0: SOURCE
>         [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>         crop:(0,0)/1280x960]
>         -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
>     pad1: SINK,0x8
>         [stream:0 fmt:SBGGR8_1X8/2592x1944 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>         crop:(0,0)/1280x960]
> ......
> 
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=0
> ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0,stream=0)
>     0x200f: MEDIA_BUS_FMT_UYVY8_1X16
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=1
> ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=1,stream=0)
>     0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=1,code=0x3001
> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=1,stream=0)
>     Size Range: 2592x1944 - 2592x1944
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=0,code=0x200f
> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=0,stream=0)
>     Size Range: 1280x960 - 1280x960
>     Size Range: 1920x1080 - 1920x1080
>     Size Range: 2592x1944 - 2592x1944
> root@smarc-rzg2l:~# v4l2-compliance -u /dev/v4l-subdev1
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> Compliance test for device /dev/v4l-subdev1:
> 
> Driver Info:
>     Driver version  : 6.12.0
>     Capabilities   : 0x00000002
>         Streams Support
>     Client Capabilities: 0x00000[ 2429.125325] ov5645 0-003c: ================= START STATUS =================
> 00000000003
> streams int[ 2429.134589] ov5645 0-003c: ================== END STATUS ==================
> erval-uses-which
> Required ioctls:
>     test VIDIOC_SUDBEV_QUERYCAP: OK
>     test invalid ioctls: OK
> 
> Allow for multiple opens:
>     test second /dev/v4l-subdev1 open: OK
>     test VIDIOC_SUBDEV_QUERYCAP: OK
>     test for unlimited opens: OK
> 
> Debug ioctls:
>     test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>     Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>     Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>     test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device routing ioctls:
>     test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
>     test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 
> Control ioctls:
>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>     test VIDIOC_QUERYCTRL: OK
>     test VIDIOC_G/S_CTRL: OK
>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>     Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>     test VIDIOC_G/S_PARM: OK (Not Supported)
>     test VIDIOC_G_FBUF: OK (Not Supported)
>     test VIDIOC_G_FMT: OK (Not Supported)
>     test VIDIOC_TRY_FMT: OK (Not Supported)
>     test VIDIOC_S_FMT: OK (Not Supported)
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     test Cropping: OK (Not Supported)
>     test Composing: OK (Not Supported)
>     test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>     test CREATE_BUFS maximum buffers: OK
>     test VIDIOC_REMOVE_BUFS: OK
>     test VIDIOC_EXPBUF: OK (Not Supported)
>     test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev1: 47, Succeeded: 47, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> Lad Prabhakar (10):
>   media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>   media: i2c: ov5645: Use local `dev` pointer for subdev device
>     assignment
>   media: i2c: ov5645: Replace dev_err with dev_err_probe in probe
>     function
>   media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
>   media: i2c: ov5645: Drop `power_lock` mutex
>   media: i2c: ov5645: Use subdev active state
>   media: i2c: ov5645: Switch to {enable,disable}_streams
>   media: i2c: ov5645: Report streams using frame descriptors
>   media: i2c: ov5645: Add internal image sink pad
>   media: i2c: ov5645: Report internal routes to userspace
> 
>  drivers/media/i2c/ov5645.c | 435 +++++++++++++++++++++----------------
>  1 file changed, 246 insertions(+), 189 deletions(-)
> 
> -- 
> 2.43.0
> 
> 

Same result here.
Tested on rzg2l-smarc evk.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>


Thanks & Regards,
Tommaso

