Return-Path: <linux-media+bounces-25915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3BA2ED31
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EC707A286D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1CB223327;
	Mon, 10 Feb 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Ooe0Gh4e"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B181741;
	Mon, 10 Feb 2025 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192763; cv=pass; b=iXfePgTbEtxFtB423gU5qmrGFVQwLXZrz2nu4XpHA0krACc10EZaovSbGzQHFuN6D3h7FCA3ETDsb4c/SUuZI0uftSdaByTwmEEBc9iDRrn5RYpSAtvSInGRCgMbtOpRHZOYiDS7HCGRnBI9wVWbAjF4U+meMZvcWZVzkGRPakI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192763; c=relaxed/simple;
	bh=OByTPNxsEOx0L9iMx8bos6NtR6iRU4/WVyv4zFVfi3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awMQC1jenzPk45+kg1463YQrsEcgmRA3LFB8cmRItvT6D4gY47DSEUHuDdy5Qtg1FGizHeK90KUEEjdpXucQcxDakjqyrK0ZBzt6boAIrp8sinMYKJ1ZDbsNqoNu3nQtVXboDAr8Eo13e9YwnkmVeBZScnblXv8MlWGuKeS0P58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Ooe0Gh4e; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739192740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VTPHMNWIdF9izM25KwJlvIebvcLRaFsQn5BUthOTsPWIsSOiWbW6KBWsaa/mJqmIAuB2wyyOITIOTn98FvrN9Zlz21DEHUCpPgzh9o8w9xa0tUgDYqRBWR+b5we5OjGnELrBqhpcgXGntzsqxBUwxlvCi2mqx6Gd4uOMu5+d5QM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739192740; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YyG5VuAJC2LtIBfs2QjnYJLPl/fi/spmTvP/iTxiZdo=; 
	b=HKH6RISGA/V5GRfeVa62j0BmBIVpmSOq03dE0AaAJ88B2tXVe9TPFozI5vl53dY/mYplll9C+YYDKiFGGaHJmF+LemQN6YvaVIwGn+e0S8t0nzuJb9lYi7TfSzQ00Kf4TRGjLsfRAHsMNLRu9DuuISGOaqwwsa3uivNpi2wsqcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739192740;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=YyG5VuAJC2LtIBfs2QjnYJLPl/fi/spmTvP/iTxiZdo=;
	b=Ooe0Gh4eFXUvpc7IbN8CBJup5yR3IwZgsgZB6toYkBYVSK2hSMqs8rLf5WjwoOzk
	9dLi4xcVt2uIrriiuDKXbYitItkpYJ8ueSxa+8ai7x/HWq/oCvAqRawzjPK7ky2Nne6
	Yml+4EJVC4TWXxK7lNddgP82VMzIzntHExrz1/4o=
Received: by mx.zohomail.com with SMTPS id 1739192736915734.7741264034747;
	Mon, 10 Feb 2025 05:05:36 -0800 (PST)
Date: Mon, 10 Feb 2025 14:05:27 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH 0/8] Add support for Wave6 video codec driver
Message-ID: <20250210130527.7wm5an4sfxzca7ra@basti-TUXEDO-Book-XA1510>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
X-ZohoMailClient: External

Hey Nas,

On 10.02.2025 18:07, Nas Chung wrote:
>This patch series introduces support for the Chips&Media Wave6 video
>codec IP, a completely different hardware architecture compared to Wave5.
>
>The wave6 driver is a M2M stateful encoder/decoder driver.
>It supports various video formats, including H.264 and H.265,
>for both encoding and decoding.

Sounds like the hardware supports more formats.
What are the other video formats?

Regards,
Sebastian

>
>On NXP i.MX SoCs, the Wave6 IP functionality is split between two devices:
>VPU Control Device, Manages shared resources such as firmware access and
>power domains.
>VPU Device, Provides encoding and decoding capabilities.
>The VPU device cannot operate independently without the VPU control device.
>
>This driver has been tested with GStreamer on:
>- NXP i.MX95 board
>- pre-silicon FPGA environment
>
>Test results for decoder fluster:
>- JVT-AVC_V1, Ran 77/135 tests successfully              in 35.929 secs
>- JVT-FR-EXT, Ran 25/69 tests successfully               in 17.717 secs
>- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.568 secs
>- All failures are due to unsupported hardware features:
>-- 10bit, Resolutions higher than 4K, FMO, MBAFF
>-- Extended profile, Field encoding and High422 sreams.
>
>Test results for v4l2-compliance:
>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
>v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
>
>Compliance test for wave6-dec device /dev/video0:
>
>Driver Info:
>        Driver name      : wave6-dec
>        Card type        : wave6-dec
>        Bus info         : platform:wave6-dec
>        Driver version   : 6.9.2
>        Capabilities     : 0x84204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>                Device Capabilities
>        Device Caps      : 0x04204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>        Detected Stateful Decoder
>
>Required ioctls:
>        test VIDIOC_QUERYCAP: OK
>        test invalid ioctls: OK
>
>Allow for multiple opens:
>        test second /dev/video0 open: OK
>        test VIDIOC_QUERYCAP: OK
>        test VIDIOC_G/S_PRIORITY: OK
>        test for unlimited opens: OK
>
>Debug ioctls:
>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>
>Input ioctls:
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>
>Output ioctls:
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>
>Input/Output configuration ioctls:
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>        test VIDIOC_G/S_EDID: OK (Not Supported)
>
>Control ioctls:
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>        test VIDIOC_QUERYCTRL: OK
>        test VIDIOC_G/S_CTRL: OK
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180): !have_source_change || !have_eos
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>        Standard Controls: 7 Private Controls: 1
>
>Format ioctls:
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>        test VIDIOC_G/S_PARM: OK (Not Supported)
>        test VIDIOC_G_FBUF: OK (Not Supported)
>        test VIDIOC_G_FMT: OK
>        test VIDIOC_TRY_FMT: OK
>        test VIDIOC_S_FMT: OK
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>        test Cropping: OK
>        test Composing: OK
>        test Scaling: OK (Not Supported)
>
>Codec ioctls:
>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>        test VIDIOC_(TRY_)DECODER_CMD: OK
>
>Buffer ioctls:
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>        test CREATE_BUFS maximum buffers: OK
>        test VIDIOC_REMOVE_BUFS: OK
>        test VIDIOC_EXPBUF: OK
>        test Requests: OK (Not Supported)
>        test blocking wait: OK
>
>Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0
>
>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
>v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
>
>Compliance test for wave6-enc device /dev/video1:
>
>Driver Info:
>        Driver name      : wave6-enc
>        Card type        : wave6-enc
>        Bus info         : platform:wave6-enc
>        Driver version   : 6.9.2
>        Capabilities     : 0x84204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>                Device Capabilities
>        Device Caps      : 0x04204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>        Detected Stateful Encoder
>
>Required ioctls:
>        test VIDIOC_QUERYCAP: OK
>        test invalid ioctls: OK
>
>Allow for multiple opens:
>        test second /dev/video1 open: OK
>        test VIDIOC_QUERYCAP: OK
>        test VIDIOC_G/S_PRIORITY: OK
>        test for unlimited opens: OK
>
>Debug ioctls:
>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>
>Input ioctls:
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>
>Output ioctls:
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>
>Input/Output configuration ioctls:
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>        test VIDIOC_G/S_EDID: OK (Not Supported)
>
>Control ioctls:
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>        test VIDIOC_QUERYCTRL: OK
>        test VIDIOC_G/S_CTRL: OK
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>        Standard Controls: 53 Private Controls: 0
>
>Format ioctls:
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>        test VIDIOC_G/S_PARM: OK
>        test VIDIOC_G_FBUF: OK (Not Supported)
>        test VIDIOC_G_FMT: OK
>        test VIDIOC_TRY_FMT: OK
>        test VIDIOC_S_FMT: OK
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>        test Cropping: OK
>        test Composing: OK (Not Supported)
>        test Scaling: OK (Not Supported)
>
>Codec ioctls:
>        test VIDIOC_(TRY_)ENCODER_CMD: OK
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
>Buffer ioctls:
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>        test CREATE_BUFS maximum buffers: OK
>        test VIDIOC_REMOVE_BUFS: OK
>        test VIDIOC_EXPBUF: OK
>        test Requests: OK (Not Supported)
>        test blocking wait: OK
>
>Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
>
>Nas Chung (8):
>  media: platform: chips-media: wave5: Rename Kconfig parameter
>  media: v4l2-common: Add YUV24 format info
>  dt-bindings: media: nxp: Add Wave6 video codec device
>  media: chips-media: wave6: Add Wave6 codec driver
>  media: chips-media: wave6: Add v4l2 m2m driver
>  media: chips-media: wave6: Add Wave6 vpu interface
>  media: chips-media: wave6: Add Wave6 control driver
>  media: chips-media: wave6: Improve debugging capabilities
>
> .../bindings/media/nxp,wave633c.yaml          |  202 ++
> MAINTAINERS                                   |    8 +
> arch/arm64/configs/defconfig                  |    2 +-
> drivers/media/platform/chips-media/Kconfig    |    1 +
> drivers/media/platform/chips-media/Makefile   |    1 +
> .../media/platform/chips-media/wave5/Kconfig  |    6 +-
> .../media/platform/chips-media/wave5/Makefile |    2 +-
> .../media/platform/chips-media/wave6/Kconfig  |   26 +
> .../media/platform/chips-media/wave6/Makefile |   17 +
> .../platform/chips-media/wave6/wave6-hw.c     | 3113 +++++++++++++++++
> .../platform/chips-media/wave6/wave6-hw.h     |   69 +
> .../chips-media/wave6/wave6-regdefine.h       |  675 ++++
> .../platform/chips-media/wave6/wave6-trace.h  |  336 ++
> .../platform/chips-media/wave6/wave6-vdi.c    |   52 +
> .../platform/chips-media/wave6/wave6-vdi.h    |   59 +
> .../chips-media/wave6/wave6-vpu-ctrl.c        | 1020 ++++++
> .../chips-media/wave6/wave6-vpu-ctrl.h        |   38 +
> .../chips-media/wave6/wave6-vpu-dbg.c         |  230 ++
> .../chips-media/wave6/wave6-vpu-dbg.h         |   22 +
> .../chips-media/wave6/wave6-vpu-dec.c         | 1883 ++++++++++
> .../chips-media/wave6/wave6-vpu-enc.c         | 2698 ++++++++++++++
> .../chips-media/wave6/wave6-vpu-v4l2.c        |  381 ++
> .../platform/chips-media/wave6/wave6-vpu.c    |  487 +++
> .../platform/chips-media/wave6/wave6-vpu.h    |  106 +
> .../platform/chips-media/wave6/wave6-vpuapi.c | 1001 ++++++
> .../platform/chips-media/wave6/wave6-vpuapi.h |  993 ++++++
> .../chips-media/wave6/wave6-vpuconfig.h       |   80 +
> .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
> drivers/media/v4l2-core/v4l2-common.c         |    1 +
> 29 files changed, 13766 insertions(+), 5 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
> create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
>
>-- 
>2.31.1
>

