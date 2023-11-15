Return-Path: <linux-media+bounces-372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D437EC3ED
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 14:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78D82811DA
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 13:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B79F1EB2C;
	Wed, 15 Nov 2023 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r7t6ZcKK"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C731A261
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 13:42:07 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56032AC
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 05:42:06 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31E55289;
	Wed, 15 Nov 2023 14:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700055697;
	bh=eq8EjcbCgu112UGFKxE1qgeyTHZHtnW2lqyNKeLkX7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7t6ZcKKEAIXUyhkRUsxnWOxzRPiBbDrl/CQBEmUrxNZddsUs88DYZ9szl6FBRzge
	 YpkgUP7FnrLsj85c1udQIOeoWnrVd3Yjx1DPGBslqs673SWLoIdmF13bph/x3HSXuM
	 tjZtAULZD/L4v9X+thyuDYNtSLTWWk70/rA2aanw=
Date: Wed, 15 Nov 2023 14:42:00 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <blzh5j2z4vldprymxasfbupye4ria3hsjpjeda63arscxyn336@myaif6eyx3j6>
References: <20231114182831.220823-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231114182831.220823-1-jacopo.mondi@ideasonboard.com>

Hi myself

On Tue, Nov 14, 2023 at 07:28:29PM +0100, Jacopo Mondi wrote:
> Add a v4l2 sensor driver for OmniVision OV64A40
>
> v1->v2:
> * rebased on sailus master
>   * Use new subdev state helpers
> * link frequency support (456MHz, 360MHz)
> * invert vflip bit setting
> * remove 1280x720 mode as it was broken
> * expanded VTS range to 24 bits
> * Reduce max resolution output to 9152x6944. Using full output resolution causes
>   green frames to be produced by the ISP (the raw frames are however correct)

This should actually be kept downstream, as the frames produced at
full 9248x6944 resolution are correct.

> * reduce max analogue gain to 16x
>
> ./utils/v4l2-compliance/v4l2-compliance -d /dev/v4l-subdev0
> v4l2-compliance 1.25.0-5100, 32 bits, 32-bit time_t
> v4l2-compliance SHA: 8bf6cba8c0ef 2023-10-10 12:50:46
>
> Compliance test for device /dev/v4l-subdev0:
>
> Driver Info:
> 	Driver version   : 6.2.16
> 	Capabilities     : 0x00000000
>
> Required ioctls:
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
>
> Allow for multiple opens:
> 	test second /dev/v4l-subdev0 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
>
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 14 Private Controls: 0
>
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
>
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 	test TIME32/64: OK
>
> Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0
>
> Jacopo Mondi (2):
>   media: dt-bindings: Add OmniVision OV64A40
>   media: i2c: Add driver for OmniVision OV64A40
>
>  .../bindings/media/i2c/ovti,ov64a40.yaml      |   98 +
>  MAINTAINERS                                   |    8 +
>  drivers/media/i2c/Kconfig                     |   10 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/ov64a40.c                   | 3646 +++++++++++++++++
>  5 files changed, 3763 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
>  create mode 100644 drivers/media/i2c/ov64a40.c
>
>
> base-commit: 61ab89c1916219ccbeca9f6cefb1680212de8d1c
> --
> 2.41.0
>

