Return-Path: <linux-media+bounces-16884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9B9606B1
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1C21C22473
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006B619DF9D;
	Tue, 27 Aug 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azXfcVy5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459BC2FB2;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753194; cv=none; b=fl5xc4abjDfqmovk2V/Ce9rL4Q4kigcd4kfibSF9irqKCtdgjijgzhH1Svd1eLqbRTWMzFQFZJBZC2U/FyAsalhQ4tia3IFFGipfkc1ORhw7xWqN4jrX03SfZkw3RytTdGfS+sz1ZPD7XQEh6t3otCEojD5DBNxgn58aabcqlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753194; c=relaxed/simple;
	bh=B9gT5+IWI9RnpgWZ28NpoIq4XigLKDYfLa8semxQ1L0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mDxLbTaHZAl1ALE8YKffwoY2zFU6MIK/K1etMZo42FkXwUzn3PQ1NQU0OP2W7l0xibUA9Z/VOgwHAaar/YGR8YjQXwxL059/ZDQ5yUAiwEnSytns4+FnN4ydiI24srfQtLqpVGbDsSf22wyZ5NKoUIavZgJLcCdCzcdgE05qjYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azXfcVy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15B6FC8B7D7;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724753194;
	bh=B9gT5+IWI9RnpgWZ28NpoIq4XigLKDYfLa8semxQ1L0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=azXfcVy5OVzUgRTU02Afa13CThJlpvGLi/vburFjzujv/FVqm/qDIu2KP0bs0CB9C
	 us9M5CjsRXqjtzMU5+7uAfVOXN25dRSlu8YCtGYQ66ir63ORbdA+UhtpyccKo7XGW9
	 cFTmSQJ8rbQh1rjEUBAHvO1ueUCfYbynGoCMaM4hoQKb27ZhK8XGna1TMAWoEIRcK+
	 eTFf8YRt0mqQyem7KPwd/ErmjMg5QWHRYJrQVWSaiOSs0pd7rMKLDsE2IwnKyrh9Rf
	 IfelcFVxbZMbgAlPB91aJvKLIVmsbvDuNW1eMSgv4YJzU4T9oWiZrCt/gYR/Na9tkU
	 npSiWCg1pa+pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E4FC5320E;
	Tue, 27 Aug 2024 10:06:34 +0000 (UTC)
From: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>
Subject: [PATCH v3 00/29] Qualcomm iris video decoder driver
Date: Tue, 27 Aug 2024 15:35:25 +0530
Message-Id: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWkzWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNz3cyizOL4MmNdkyRjg1RLM0ODVPM0JaDqgqLUtMwKsEnRsbW1AOh
 V/gtZAAAA
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724753190; l=23046;
 i=quic_dikshita@quicinc.com; s=20240826; h=from:subject:message-id;
 bh=B9gT5+IWI9RnpgWZ28NpoIq4XigLKDYfLa8semxQ1L0=;
 b=NPly0gi/qpJeCsgwaXgEuqFMO4TBaWRUZbb1LXdCHvEC4MK3OWTPGCKmABnx1cInIbBzHKzWH
 jg4BuQpQkdrC2FbpsaaFTDjrip5hSjc5HMMS7rMf63d+12e9X05+h89
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=+c7562uu1Y968VTv9z59ch2v3jmlO2Qv3uX7srN3LJY=
X-Endpoint-Received: by B4 Relay for quic_dikshita@quicinc.com/20240826
 with auth_id=199
X-Original-From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reply-To: quic_dikshita@quicinc.com

Introduce support for Qualcomm new video acceleration hardware i.e. IRIS, used
for video stream decoding.

Iris is a multi pipe based hardware that offloads video stream decoding from the
application processor (AP). It supports H.264 decoding.  The AP communicates
with hardware through a well defined protocol, called as host firmware interface
(HFI), which provides fine-grained and asynchronous control over individual
hardware features.

This driver implements upgraded HFI gen2 to communicate with firmware. It
supports SM8550 which is based out of HFI gen 2. It also supports SM8250 which
is based out of HFI gen1.

This driver comes with below capabilities:
- V4L2 complaint video driver with M2M and STREAMING capability.
- Supports H264 decoder.

This driver comes with below features:
- Centralized resource management.
- Centralized management of core and instance states.
- Defines platform specific capabilities and features. As a results, it provides
  a single point of control to enable/disable a given feature depending on
  specific platform capabilities.
- Handles various video recommended sequences, like DRC, Drain, Seek, EOS.
- Implements asynchronous communication with hardware to achieve better
  experience in low latency usecases.
- Output and capture planes are controlled independently. Thereby providing a
  way to reconfigure individual plane.
- Native hardware support of LAST flag which is mandatory to align with port
  reconfiguration and DRAIN sequence as per V4L guidelines.

Changes since v2:
- introduced support for HFI gen1.
- deprecated Encoder and HEVC, VP9 codecs.
- removed custom vb2 mem ops and used standard framework instead.
- added support for mmap streaming mode.
- migrated all the buffer APIs to mem2mem helper functions.
- registered iris buffer with vb2 framework.
- migrated to clk_bulk, reset_bulk and icc_bulk APIs.
- used pm_domain_attach/detach_list APIs.
- migrated to read/writel and other available helpers for register access
  instead of custom wrappers.
- added documentation for various structures.
- addressed many other review comments from v2.

This series depends on [1] & [2]:

[1]: https://patchwork.linuxtv.org/project/linux-media/list/?series=13341 -
already applied in next-20240821 
[2]: https://patchwork.kernel.org/project/linux-clk/patch
/20240812134752.28031-1-quic_vnagar@quicinc.com/

Note: A harmless onetime error log "Lucid PLL latch failed. Output may
be unstable!" is seen during bootup. It doesn't impact any video usecase
and is currently under discussion.

Static tools like checkpatch, smatch, dt_binding_check, sparse and Coccinelle
run successfully with this driver.

The result of v4l2-compliance test on SM8550:

v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : iris_decoder
        Bus info         : platform:iris_icc
        Driver version   : 6.11.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
                fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(763): !ok
        test for unlimited opens: FAIL

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 3 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for iris_driver device /dev/video0: 47, Succeeded: 46, Failed: 1,
Warnings: 0

The result of v4l2-compliance test on SM8250:

v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : iris_decoder
        Bus info         : platform:iris_icc
        Driver version   : 6.11.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
                fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(763): !ok
        test for unlimited opens: FAIL

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for iris_driver device /dev/video0: 47, Succeeded: 46, Failed: 1,
Warnings: 0

Fluster score on SM8550:

77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding is 
  not supported in iris driver.
  Test Vectors:
        cabac_mot_fld0_full
        cabac_mot_mbaff0_full
        cabac_mot_picaff0_full
        CABREF3_Sand_D
        CAFI1_SVA_C
        CAMA1_Sony_C
        CAMA1_TOSHIBA_B
        cama1_vtc_c
        cama2_vtc_b
        CAMA3_Sand_E
        cama3_vtc_b
        CAMACI3_Sony_C
        CAMANL1_TOSHIBA_B
        CAMANL2_TOSHIBA_B
        CAMANL3_Sand_E
        CAMASL3_Sony_B
        CAMP_MOT_MBAFF_L30
        CAMP_MOT_MBAFF_L31
        CANLMA2_Sony_C
        CANLMA3_Sony_C
        CAPA1_TOSHIBA_B
        CAPAMA3_Sand_F
        cavlc_mot_fld0_full_B
        cavlc_mot_mbaff0_full_B
        cavlc_mot_picaff0_full_B
        CVCANLMA2_Sony_C
        CVFI1_Sony_D
        CVFI1_SVA_C
        CVFI2_Sony_H
        CVFI2_SVA_C
        CVMA1_Sony_D
        CVMA1_TOSHIBA_B
        CVMANL1_TOSHIBA_B
        CVMANL2_TOSHIBA_B
        CVMAPAQP3_Sony_E
        CVMAQP2_Sony_G
        CVMAQP3_Sony_D
        CVMP_MOT_FLD_L30_B
        CVNLFI1_Sony_C
        CVNLFI2_Sony_H
        CVPA1_TOSHIBA_B
        FI1_Sony_E
        MR6_BT_B
        MR7_BT_B
        MR8_BT_B
        MR9_BT_B
        Sharp_MP_Field_1_B
        Sharp_MP_Field_2_B
        Sharp_MP_Field_3_B
        Sharp_MP_PAFF_1r2
        Sharp_MP_PAFF_2r
        CVMP_MOT_FRM_L31_B
- 3 test vectors failed due to unsupported bitstream.
  num_slice_group_minus1 greater than zero is not supported by the hardware.
  Test Vectors:
        FM1_BT_B
        FM1_FT_E
        FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the hardware.
  Test Vectors:
        SP1_BT_A
        sp2_bt_b
- 1 test vector failed due to unsupported profile:
  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED is being deprecated from sm8550
  onwards due to hardware issues.
  Test Vectors:
        BA3_SVA_C

23/69 while testing JVT-FR-EXT with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
The failing tests are:
- 21 test vectors failed due to interlaced clips: Interlaced decoding is
  not supported in iris driver.
  Test Vectors:
        brcm_freh4
        brcm_freh5
        brcm_freh6
        brcm_freh10
        brcm_freh11
        freh7_b
        FREXT01_JVC_D
        FREXT02_JVC_C
        FRExt2_Panasonic_C
        FRExt4_Panasonic_B
        HCAFF1_HHI_B
        HCAMFF1_HHI_B
        HCHP3_HHI_A
        HPCAFL_BRCM_C
        HPCAFLNL_BRCM_C
        HVLCFI0_Sony_B
        HVLCMFF0_Sony_B
        HVLCPFF0_Sony_B
        HPCAMAPALQ_BRCM_B
        HPCVFL_BRCM_A
        HPCVFLNL_BRCM_A
- 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
  supported in iris driver
  Test Vectors:
        FREH10-1
        FREH10-2
- 21 test vectors failed due to unsupported profile:
  V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the hardware.
  Test Vectors:
        FREXT1_TANDBERG_A
        FREXT2_TANDBERG_A
        FREXT3_TANDBERG_A
        Hi422FR1_SONY_A
        Hi422FR2_SONY_A
        Hi422FR3_SONY_A
        Hi422FR4_SONY_A
        Hi422FR6_SONY_A
        Hi422FR7_SONY_A
        Hi422FR8_SONY_A
        Hi422FR9_SONY_A
        Hi422FR10_SONY_A
        Hi422FR11_SONY_A
        Hi422FR12_SONY_A
        Hi422FR13_SONY_A
        Hi422FR14_SONY_A
        Hi422FR15_SONY_A
        Hi422FREXT16_SONY_A
        Hi422FREXT17_SONY_A
        Hi422FREXT18_SONY_A
        Hi422FREXT19_SONY_A
- 2 test vectors failed due to unsupported bitstream.
  chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
  supported by the hardware.
  Test Vectors:
        HPCAMOLQ_BRCM_B
        HPCVMOLQ_BRCM_B

Fluster score on SM8250:

78/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding is not
  supported in iris driver.
  Test Vectors:
        cabac_mot_fld0_full
        cabac_mot_mbaff0_full
        cabac_mot_picaff0_full
        CABREF3_Sand_D
        CAFI1_SVA_C
        CAMA1_Sony_C
        CAMA1_TOSHIBA_B
        cama1_vtc_c
        cama2_vtc_b
        CAMA3_Sand_E
        cama3_vtc_b
        CAMACI3_Sony_C
        CAMANL1_TOSHIBA_B
        CAMANL2_TOSHIBA_B
        CAMANL3_Sand_E
        CAMASL3_Sony_B
        CAMP_MOT_MBAFF_L30
        CAMP_MOT_MBAFF_L31
        CANLMA2_Sony_C
        CANLMA3_Sony_C
        CAPA1_TOSHIBA_B
        CAPAMA3_Sand_F
        cavlc_mot_fld0_full_B
        cavlc_mot_mbaff0_full_B
        cavlc_mot_picaff0_full_B
        CVCANLMA2_Sony_C
        CVFI1_Sony_D
        CVFI1_SVA_C
        CVFI2_Sony_H
        CVFI2_SVA_C
        CVMA1_Sony_D
        CVMA1_TOSHIBA_B
        CVMANL1_TOSHIBA_B
        CVMANL2_TOSHIBA_B
        CVMAPAQP3_Sony_E
        CVMAQP2_Sony_G
        CVMAQP3_Sony_D
        CVMP_MOT_FLD_L30_B
        CVNLFI1_Sony_C
        CVNLFI2_Sony_H
        CVPA1_TOSHIBA_B
        FI1_Sony_E
        MR6_BT_B
        MR7_BT_B
        MR8_BT_B
        MR9_BT_B
        Sharp_MP_Field_1_B
        Sharp_MP_Field_2_B
        Sharp_MP_Field_3_B
        Sharp_MP_PAFF_1r2
        Sharp_MP_PAFF_2r
        CVMP_MOT_FRM_L31_B
- 3 test vectors failed due to unsupported bitstream.
  num_slice_group_minus1 greater than zero is not supported by the hardware.
  Test Vectors:
        FM1_BT_B
        FM1_FT_E
        FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the hardware.
  Test Vectors:
        SP1_BT_A
        sp2_bt_b

23/69 while testing JVT-FR-EXT with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
The failing tests are:
- 21 test vectors failed due to interlaced clips: Interlaced decoding is
  not supported in iris driver.
  Test Vectors:
        brcm_freh4
        brcm_freh5
        brcm_freh6
        brcm_freh10
        brcm_freh11
        freh7_b
        FREXT01_JVC_D
        FREXT02_JVC_C
        FRExt2_Panasonic_C
        FRExt4_Panasonic_B
        HCAFF1_HHI_B
        HCAMFF1_HHI_B
        HCHP3_HHI_A
        HPCAFL_BRCM_C
        HPCAFLNL_BRCM_C
        HVLCFI0_Sony_B
        HVLCMFF0_Sony_B
        HVLCPFF0_Sony_B
        HPCAMAPALQ_BRCM_B
        HPCVFL_BRCM_A
        HPCVFLNL_BRCM_A
- 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
  supported in iris driver
  Test Vectors:
        FREH10-1
        FREH10-2
- 21 test vectors failed due to unsupported profile:
  V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the hardware.
  Test Vectors:
        FREXT1_TANDBERG_A
        FREXT2_TANDBERG_A
        FREXT3_TANDBERG_A
        Hi422FR1_SONY_A
        Hi422FR2_SONY_A
        Hi422FR3_SONY_A
        Hi422FR4_SONY_A
        Hi422FR6_SONY_A
        Hi422FR7_SONY_A
        Hi422FR8_SONY_A
        Hi422FR9_SONY_A
        Hi422FR10_SONY_A
        Hi422FR11_SONY_A
        Hi422FR12_SONY_A
        Hi422FR13_SONY_A
        Hi422FR14_SONY_A
        Hi422FR15_SONY_A
        Hi422FREXT16_SONY_A
        Hi422FREXT17_SONY_A
        Hi422FREXT18_SONY_A
        Hi422FREXT19_SONY_A
- 2 test vectors failed due to unsupported bitstream.
  chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
  supported by the hardware.
  Test Vectors:
        HPCAMOLQ_BRCM_B
        HPCVMOLQ_BRCM_B

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (17):
      dt-bindings: media: Add sm8550 dt schema
      media: MAINTAINERS: Add Qualcomm Iris video accelerator driver
      media: iris: add platform driver for iris video device
      media: iris: initialize power resources
      media: iris: implement iris v4l2 file ops
      media: iris: introduce iris core state management with shared queues
      media: iris: implement video firmware load/unload
      media: iris: implement boot sequence of the firmware
      media: iris: introduce Host firmware interface with necessary hooks
      media: iris: implement power management
      media: iris: implement reqbuf ioctl with vb2_queue_setup
      media: iris: implement vb2 streaming ops
      media: iris: allocate, initialize and queue internal buffers
      media: iris: implement vb2 ops for buf_queue and firmware response
      media: iris: add support for dynamic resolution change
      media: iris: handle streamoff/on from client in dynamic resolution change
      media: iris: add support for drain sequence

Vedang Nagar (12):
      media: iris: implement s_fmt, g_fmt and try_fmt ioctls
      media: iris: implement g_selection ioctl
      media: iris: implement enum_fmt and enum_frameintervals ioctls
      media: iris: implement subscribe_event and unsubscribe_event ioctls
      media: iris: implement iris v4l2_ctrl_ops and prepare capabilities
      media: iris: implement query_cap, query_ctrl and query_menu ioctls
      media: iris: implement set properties to firmware during streamon
      media: iris: subscribe parameters and properties to firmware for hfi_gen2
      media: iris: add check whether the video session is supported or not
      media: iris: implement power scaling for vpu2 and vpu3
      media: iris: add allow checks for v4l2 ioctls
      media: iris: add check to allow sub states transitions

 .../bindings/media/qcom,sm8550-iris.yaml           |  162 ++++
 MAINTAINERS                                        |   11 +
 drivers/media/platform/qcom/Kconfig                |    1 +
 drivers/media/platform/qcom/Makefile               |    1 +
 drivers/media/platform/qcom/iris/Kconfig           |   13 +
 drivers/media/platform/qcom/iris/Makefile          |   27 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |  599 ++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  117 +++
 drivers/media/platform/qcom/iris/iris_core.c       |   99 ++
 drivers/media/platform/qcom/iris/iris_core.h       |  107 +++
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  296 ++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   22 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  151 +++
 drivers/media/platform/qcom/iris/iris_firmware.h   |   15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  222 +++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  155 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   16 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  834 ++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  448 +++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  658 +++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   41 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 1003 ++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  160 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  328 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  125 +++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  954 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  343 +++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  |  180 ++++
 drivers/media/platform/qcom/iris/iris_instance.h   |   73 ++
 .../platform/qcom/iris/iris_platform_common.h      |  195 ++++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  175 ++++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  310 ++++++
 drivers/media/platform/qcom/iris/iris_power.c      |  182 ++++
 drivers/media/platform/qcom/iris/iris_power.h      |   15 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  257 +++++
 drivers/media/platform/qcom/iris/iris_resources.c  |  338 +++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   27 +
 drivers/media/platform/qcom/iris/iris_state.c      |  338 +++++++
 drivers/media/platform/qcom/iris/iris_state.h      |  153 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |   96 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |   50 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  353 +++++++
 drivers/media/platform/qcom/iris/iris_vb2.h        |   17 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  693 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |   25 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  706 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.h       |   15 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   39 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  125 +++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  311 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   91 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  371 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   28 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   17 +
 54 files changed, 12088 insertions(+)
---
base-commit: 31aaa7d95e09892c81df0d7c49ae85640fa4e202
change-id: 20240827-iris_v3-4b30e9610e7f

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>



