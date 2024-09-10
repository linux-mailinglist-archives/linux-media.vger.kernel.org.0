Return-Path: <linux-media+bounces-18087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB6973D3A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 18:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E691C2422E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 16:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDF21A0B1E;
	Tue, 10 Sep 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wU1JRDad"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C7C191F96;
	Tue, 10 Sep 2024 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985719; cv=none; b=WDnpkLX5ye51Ka0iVLFoXB3NcoqcNHkr2q+fGQpuofMsWAVLEJ7WIiFVOWAgYGVUZm3RS3hQQ0RIuX7pDbiY7CEpiccdxLYLYEfxFukwZGCQoAGkQViW9E4x5XVMhiz7Hmh6C4Slc+6LVJmDdzgf5/+Q3axDoGFgp19rcBirZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985719; c=relaxed/simple;
	bh=uWTP+e+i/072JtoUvbU8OqCQE5EkU8sdWTVEYaJ+5oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxNiMJU2cOf5wWkkqIuyqqjC9aTCxtPr3NPC/jlE40JQ1AERAIzsGcC2tv4FHAvebAVSqy67U5oWYj7sw3ZOTMZzrmHksAO6viOK8/RihTUOyUs9Xl0FzTbGvikKx+QS9jHAh30sasrpaRtgs+U6qBiydaYx2SkP1E8bxWH6npU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wU1JRDad; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.53] (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A86E63F;
	Tue, 10 Sep 2024 18:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725985636;
	bh=uWTP+e+i/072JtoUvbU8OqCQE5EkU8sdWTVEYaJ+5oA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wU1JRDadMKuUQcqHc7jPtvCgsMohxq6UXvM8+LCGy1Mpy1I+nzbKbGycbAzsvetOn
	 dXDGVJ5o/WpVhI9KN39uJJXZVHD/0sGEOPJiqBMUBDwx1vRO5niqjD1fm3csvcV0LV
	 HKF0kHym6VrCpurkzdNIewjwme9DjHo3RohgJ4/c=
Message-ID: <e43190e6-ab91-48fe-bfeb-487d52778c23@ideasonboard.com>
Date: Tue, 10 Sep 2024 17:28:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Amlogic C3 ISP support
To: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Keke


Thanks very much for the patchset

On 09/09/2024 08:24, Keke Li via B4 Relay wrote:
> The Amlogic C3 platform integrates an ISP capable of supporting
> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
> 14-bit raw RGB Bayer data.
>      
> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
> an adapter layer that integrates the inline processing from the PHY to
> the ISP, and the ISP driver itself.
>      
> This implementation consists of several distinct module drivers and
> is expected to support different platforms in the future.
>
> The test result of v4l2-compliance:


There are a few errors:


Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, Failed: 9, Warnings: 0


Some of those complaints are about .get/set_fmt() and I think for those the problem is that 
v4l2-compliance expects non-zero sizes for the MEDIA_BUS_FMT_METADATA_FIXED, but the documentation 
says that that's right so there's a disconnect with v4l2-compliance there - probably it needs fixing 
to adhere to the documented behaviour. On the other hand the errors that are reported for 
VIDIOC_REQBUFS will need to be fixed.


>
> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>
> Compliance test for c3-isp device /dev/media0:
>
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
>
> Required ioctls:
>          test MEDIA_IOC_DEVICE_INFO: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/media0 open: OK
>          test MEDIA_IOC_DEVICE_INFO: OK
>          test for unlimited opens: OK
>
> Media Controller ioctls:
>          test MEDIA_IOC_G_TOPOLOGY: OK
>          Entities: 12 Interfaces: 12 Pads: 20 Links: 23
>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>          test MEDIA_IOC_SETUP_LINK: OK
>
> Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video0:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000011
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000000f (15)
>          Name             : isp-cap0
>          Function         : V4L2 I/O
>          Pad 0x01000010   : 0: Sink
>            Link 0x02000023: from remote pad 0x1000008 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video0: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video1:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000015
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000013 (19)
>          Name             : isp-cap1
>          Function         : V4L2 I/O
>          Pad 0x01000014   : 0: Sink
>            Link 0x02000027: from remote pad 0x100000b of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video1: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video2:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000019
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000017 (23)
>          Name             : isp-cap2
>          Function         : V4L2 I/O
>          Pad 0x01000018   : 0: Sink
>            Link 0x0200002b: from remote pad 0x100000e of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video2 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video2: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video3:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84a00000
>                  Metadata Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04a00000
>                  Metadata Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x0300001d
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000001b (27)
>          Name             : isp-stats
>          Function         : V4L2 I/O
>          Pad 0x0100001c   : 0: Sink
>            Link 0x0200002f: from remote pad 0x1000004 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video3 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video3: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video4:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x8c200000
>                  Metadata Output
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x0c200000
>                  Metadata Output
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000021
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000001f (31)
>          Name             : isp-params
>          Function         : V4L2 I/O
>          Pad 0x01000020   : 0: Source
>            Link 0x02000031: to remote pad 0x1000003 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video4 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video4: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev0:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000041
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000001 (1)
>          Name             : isp-core
>          Function         : Video Pixel Formatter
>          Pad 0x01000002   : 0: Sink
>            Link 0x02000036: from remote pad 0x1000035 of entity 'mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>          Pad 0x01000003   : 1: Sink
>            Link 0x02000031: from remote pad 0x1000020 of entity 'isp-params' (V4L2 I/O): Data, Enabled
>          Pad 0x01000004   : 2: Source
>            Link 0x0200002f: to remote pad 0x100001c of entity 'isp-stats' (V4L2 I/O): Data, Enabled
>          Pad 0x01000005   : 3: Source
>            Link 0x02000025: to remote pad 0x1000007 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>            Link 0x02000029: to remote pad 0x100000a of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>            Link 0x0200002d: to remote pad 0x100000d of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev0 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 2):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 3):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev0: 72, Succeeded: 68, Failed: 4, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev1:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000043
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000006 (6)
>          Name             : isp-resizer0
>          Function         : Video Scaler
>          Pad 0x01000007   : 0: Sink
>            Link 0x02000025: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          [  124.084364] isp-resizer0: =================  START STATUS  =================
> [  124.085234] isp-resizer0: ==================  END STATUS  ==================
> Pad 0x01000008   : 1: Source
>            Link 0x02000023: to remote pad 0x1000010 of entity 'isp-cap0' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev1 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev1: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev2:
>
> Driver Info:
>          Driver version   : 6.11.0
> [  124.130974] isp-resizer1: =================  START STATUS  =================
> [  124.131838] isp-resizer1: ==================  END STATUS  ==================
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000045
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000009 (9)
>          Name             : isp-resizer1
>          Function         : Video Scaler
>          Pad 0x0100000a   : 0: Sink
>            Link 0x02000029: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          Pad 0x0100000b   : 1: Source
>            Link 0x02000027: to remote pad 0x1000014 of entity 'isp-cap1' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev2 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test V[  124.177400] isp-resizer2: =================  START STATUS  =================
> [  124.178270] isp-resizer2: ==================  END STATUS  ==================
> IDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev2: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev3:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000047
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x0000000c (12)
>          Name             : isp-resizer2
>          Function         : Video Scaler
>          Pad 0x0100000d   : 0: Sink
>            Link 0x0200002d: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          Pad 0x0100000e   : 1: Source
>            Link 0x0200002b: to remote pad 0x1000018 of entity 'isp-cap2' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev3 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK  124.223764] mipi-adapter: =================  START STATUS  =================
> [  124.224637] mipi-adapter: ==================  END STATUS  ==================
> m (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev3: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for device /dev/v4l-subdev4:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev4 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, Warnings: 0
> ---------------------------[  124.269696] mipi-csi2: =================  START STATUS  =================
> [  124.270587] mipi-csi2: ==================  END STATUS  ==================
> -----------------------------------------------------
> Compliance test for device /dev/v4l-subdev5:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_Q[  124.273752] imx290 2-001a: =================  START STATUS  =================
> [  124.274678] imx290 2-001a: ==================  END STATUS  ==================
> UERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev5 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev5: 43, Succeeded: 43, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for device /dev/v4l-subdev6:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev6 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 12 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev6: 43, Succeeded: 43, Failed: 0, Warnings: 0
>
> Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, Failed: 9, Warnings: 0
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
> Changes in v2:
> - Modify coding format of the YAML files.
> - Replace dev_err and return with dev_err_probe in probe function.
> - Change clock[] to clocks[] in struct c3_xxx_info.
> - Change clock_rate[] to clock_rates[] in struct c3_xxx_info.
> - Change clock[] to clks[] in struct xxx_device.
> - Link to v1: https://lore.kernel.org/r/20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com
>
> ---
> Keke Li (9):
>        dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
>        media: platform: Add c3 mipi csi2 driver
>        dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
>        media: platform: Add c3 mipi adapter driver
>        dt-bindings: media: Add amlogic,c3-isp.yaml
>        media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
>        media: platform: Add c3 ISP driver
>        Documentation: media: add documentation file metafmt-c3-isp.rst
>        Documentation: media: add documentation file c3-isp.rst
>
>   Documentation/admin-guide/media/c3-isp.dot         |  26 +
>   Documentation/admin-guide/media/c3-isp.rst         |  96 +++
>   Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
>   .../devicetree/bindings/media/amlogic,c3-isp.yaml  |  98 +++
>   .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 108 +++
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 124 +++
>   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>   .../userspace-api/media/v4l/metafmt-c3-isp.rst     |  39 +
>   MAINTAINERS                                        |  24 +
>   drivers/media/platform/amlogic/Kconfig             |   3 +
>   drivers/media/platform/amlogic/Makefile            |   4 +
>   drivers/media/platform/amlogic/c3-isp/Kconfig      |  17 +
>   drivers/media/platform/amlogic/c3-isp/Makefile     |  10 +
>   .../media/platform/amlogic/c3-isp/c3-isp-capture.c | 788 +++++++++++++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-common.h  | 327 +++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-core.c    | 696 +++++++++++++++
>   drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c | 486 +++++++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-params.c  | 888 +++++++++++++++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-regs.h    | 683 +++++++++++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-resizer.c | 778 +++++++++++++++++
>   .../media/platform/amlogic/c3-isp/c3-isp-stats.c   | 491 +++++++++++
>   .../amlogic/c3-isp/include/uapi/c3-isp-config.h    | 537 ++++++++++++
>   .../media/platform/amlogic/c3-mipi-adapter/Kconfig |  16 +
>   .../platform/amlogic/c3-mipi-adapter/Makefile      |   3 +
>   .../amlogic/c3-mipi-adapter/c3-mipi-adap.c         | 949 +++++++++++++++++++++
>   .../media/platform/amlogic/c3-mipi-csi2/Kconfig    |  16 +
>   .../media/platform/amlogic/c3-mipi-csi2/Makefile   |   3 +
>   .../platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c   | 937 ++++++++++++++++++++
>   drivers/media/v4l2-core/v4l2-ioctl.c               |   2 +
>   include/uapi/linux/videodev2.h                     |   4 +
>   30 files changed, 8155 insertions(+)
> ---
> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> change-id: 20240903-c3isp-7cfe70bb2583
>
> Best regards,

