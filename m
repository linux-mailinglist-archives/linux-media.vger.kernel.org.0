Return-Path: <linux-media+bounces-19558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D699C4D1
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52A801C214DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7051D158853;
	Mon, 14 Oct 2024 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nBCvEOFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66ED14B08E;
	Mon, 14 Oct 2024 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896870; cv=none; b=tjoQkqHsZeqA+QTn6PSZQgjTgMV1FOrDtHcdTMeVQVPL+v5KZxzGmg+1C8dOwMaQhzSZu7E6Qyq0fHwWeegSlYdWu8T4Gj4NJ+O8Nn80gGN9BM4y37/G/XSvse5nIoGHCC6gg+J0OWy7ykJoVDhm964HnpHPYA3rE2Qo9KB2Okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896870; c=relaxed/simple;
	bh=RyYXMmmvS8RSgqvmM5g4M+uyO0PMFQLMJGg0LamN0z0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ov5j3VQ/gM1/LAjTf2oaF2mW7PyWuVp66KSfRBXcIU4yGw8j2LqMRGldslVvMXAr/WixJXtAXv0hfGyuTdsQMFWI01uRLtnoNEuH63ZU2qcQmv1fLCuj0ifqe71lg+1BnAra1dJKEQyMuzSwCGKYpmJTXjMiGB/ovavJwzKmS6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nBCvEOFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMmOqT001452;
	Mon, 14 Oct 2024 09:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JDxQlZKDnq31X4Q2jk+oCi
	zvZITCY65F56oPAwkwGtQ=; b=nBCvEOFTNcDqJ+/2nMfz31kbOK1vvw6HrsZ2Mb
	PYVWg3LxbfQhhppswTYr/WOCJUoV8eccg6AOYLpoibhtqmoGCkitBXSXpoFD9ezb
	3SETCFc29xKCCl5HCJQ5c1x0aRHfuDdOx8qAYy3t3/H425i+gNPHrg3Bd8xU2Dbj
	mElIMNOs33EwjAo+Glt95wi5rGZyKqjyMlxHSnGrUXRocGMXKyBil40BsUhboqkK
	+kTbKFAeNVJbNP8+C067R+kaZ29Atj2hnT/i15qMvsbuDZ0hyu+/IKbovdwU1tAS
	61/hAXNxB1Kiw8IzRbmeRv1aCW+ZInwQULUEpt0h27BlolyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfut6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:07:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E97dKs021904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:07:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:07:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v4 00/28] Qualcomm iris video decoder driver
Date: Mon, 14 Oct 2024 14:37:21 +0530
Message-ID: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnfDGcC/x3MQQqAIBBA0avErBswm6K6SrQQm2oWaSlIIN09a
 fkW/2eIHIQjTFWGwEmieFdAdQX2MG5nlLUYtNLUqIbwtv7EJCt7lCARE2HPuhva0W6kDJTwCrz
 J80/n5X0/T8k3YGQAAAA=
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896853; l=26965;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=RyYXMmmvS8RSgqvmM5g4M+uyO0PMFQLMJGg0LamN0z0=;
 b=h4Mhw5f5N4EjrEaZKrg7Z1MjNTFuFsqIJEH6P2a4nDVODDHTYZ10n7vrICND2P3y6s6xuPsuN
 iBuwDdqyEJdDa4j50QHUC5NWKBZfqXHuFbFjEFuOOivej9VAgIPo8gf
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 71U7QVvAyAmRC1J9mQga8rRU71_aEYxo
X-Proofpoint-ORIG-GUID: 71U7QVvAyAmRC1J9mQga8rRU71_aEYxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1011 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140066

Introduce support for Qualcomm new video acceleration hardware i.e.
iris, used for video stream decoding.

Iris is a multi pipe based hardware that offloads video stream decoding
from the application processor (AP). It supports H.264 decoding.
The AP communicates with hardware through a well defined protocol,
called as host firmware interface (HFI), which provides fine-grained
and asynchronous control over individual hardware features.

This driver implements upgraded HFI gen2 to communicate with firmware.
It supports SM8550 which is based out of HFI gen 2. It also supports
SM8250 which is based out of HFI gen1.

This driver comes with below capabilities:
- V4L2 complaint video driver with M2M and STREAMING capability.
- Supports H264 decoder.

This driver comes with below features:
- Centralized resource management.
- Centralized management of core and instance states.
- Defines platform specific capabilities and features. As a results, it
  provides a single point of control to enable/disable a given feature
  depending on specific platform capabilities.
- Handles various video recommended sequences, like DRC, Drain, Seek,
  EOS.
- Implements asynchronous communication with hardware to achieve better
  experience in low latency usecases.
- Output and capture planes are controlled independently. Thereby
  providing a way to reconfigure individual plane.
- Native hardware support of LAST flag which is mandatory to align with
  port reconfiguration and DRAIN sequence as per V4L guidelines.

Changes since v3:
- Fixed the style issues with dt binding (Krzysztof)
- Pushed  the patch to add maintainers to end of the series (Krzysztof,
  Dmitry)
- Moved the resource initialization next to probe in iris_probe.c and
  squashed the patch of probe and resource initialization (Krzysztof)
- Removed error prints from probe function (Krzysztof)
- Defined bit fields used for register read/write with macros for better
  context (Bryan)
- Converted if/else to switch/case wherever applicable (Bryan)
- Removed defensive NULL checks wherever not required (Bryan, Krzysztof)
- Removed core->state checks except for below scenarios (Bryan)
  - When reverse thread (firmware) can move the state of the core to
    error state.
  - When client can force close the driver and there are still pending
    firmware responses to be read from shared queues (msg and dbg)
  - For PM operations, since its a delayed autosuspend work and sys
    error handler from the reverse thread can move the state to core
    deinit state anytime.
- Acquiring core->lock only for below scenarios (Bryan)
  - Writing to registers.
  - Reading/Writing from/to shared queues.
  - Traversing the instance list of core.
  - To protect the core->state when it can changed by reverse thread.
- Acquiring inst->lock only for below scenario which is needed (Bryan)
  - Serializing the forward and reverse thread
  - To protect the inst structure where the values can be modified by
    firmware.
- Removed usage of core->power_enabled (Krzysztof, Bryan)
- Removed usage of mutex_is_locked  (Krzysztof, Bryan)
- Use C structure for instance caps (Dmitry)
- Split the ctrl ops patch by keeping only the defines, struct and caps
  needed to intialize the ctrl handler and to implement s/g_ctrl
  (Dmitry)
- Removed the instance state checks to allow v4l2-ctl, relying on
  standard vb2 checks instead. (Hans)
- Converted APIs to void wherever applicable except for below (Bryan)
  - iris_hfi_gen2_handle_session_error and
    iris_hfi_gen2_handle_session_property cannot be converted to void
    even though they always return 0.
    Because these are two of the handlers invoked from 
    iris_hfi_gen2_handle_session_response and are of
    iris_hfi_gen2_inst_hfi_range struct type, where same prototype is
    followed for all handlers and return type of all handers should be
    'int'.
    And we cannot have a switch case/if else to handle these
    responses from firmware because we need to parse the responses in a
    particular sequence.
    That's why we opted for this handler based design instead of
    introducing multiple for loop with code duplication.
- Fixed issues reported by kernel bot.
- Fixed v4l2 compliance issue reported with "-s" options based on the
  inputs from Hans.
- Addressed all other review comments and made some code improvements.

Changes since v2:
- introduced support for HFI gen1.
- deprecated Encoder and HEVC, VP9 codecs.
- removed custom vb2 mem ops and used standard framework instead.
- added support for mmap streaming mode.
- migrated all the buffer APIs to mem2mem helper functions.
- registered iris buffer with vb2 framework.
- migrated to clk_bulk, reset_bulk and icc_bulk APIs.
- used pm_domain_attach/detach_list APIs.
- migrated to read/writel and other available helpers for register
  access instead of custom wrappers.
- added documentation for various structures.
- addressed many other review comments from v2.

Note: A harmless onetime error log "Lucid PLL latch failed. Output may
be unstable!" is seen during bootup.  It doesn't impact any video
usecase and is currently under discussion.

Static tools like checkpatch, smatch, dt_binding_check, sparse and
Coccinelle run successfully with this driver.

This driver is tested with v4l2-ctl[1] and Gstreamer[2].

[1]: v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
--stream-from /media/FVDO_Freeway_720p.264 --stream-to out.NV12

[2]: gst-launch-1.0 filesrc location=/media/media/4k_decode_clip.264 !
h264parse ! v4l2h264dec capture-io-mode=dmabuf ! kmssink 

The result of v4l2-compliance test on SM8550:

v4l2-compliance --stream-from /media/FVDO_Freeway_720p.264 -s250

v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : iris_decoder
        Bus info         : platform:iris_icc
        Driver version   : 6.12.0
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
        test for unlimited opens: OK

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
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 14617 buffers
        test MMAP (select): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 14617 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0,
Warnings: 0

The result of v4l2-compliance test on SM8250:

v4l2-compliance --stream-from /media/FVDO_Freeway_720p.264 -s250
v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : iris_decoder
        Bus info         : platform:iris_icc
        Driver version   : 6.12.0
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
        test for unlimited opens: OK

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
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 7425 buffers
        test MMAP (select): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 7425 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0,
Warnings: 0

The result of fluster test on SM8550:

77/135 while testing JVT-AVC_V1 with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
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
  num_slice_group_minus1 greater than zero is not supported by the
hardware.
  Test Vectors:
        FM1_BT_B
        FM1_FT_E
        FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the
  hardware.
  Test Vectors:
        SP1_BT_A
        sp2_bt_b
- 1 test vector failed due to unsupported profile:
  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED is being deprecated from sm8550
  onwards due to hardware issues.
  Test Vectors:
        BA3_SVA_C

23/69 while testing JVT-FR-EXT with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
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
  V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the
hardware.
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

The result of fluster test on SM8250:

78/135 while testing JVT-AVC_V1 with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding is
  not
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
  num_slice_group_minus1 greater than zero is not supported by the
hardware.
  Test Vectors:
        FM1_BT_B
        FM1_FT_E
        FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the
  hardware.
  Test Vectors:
        SP1_BT_A
        sp2_bt_b

23/69 while testing JVT-FR-EXT with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
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
  V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the
hardware.
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
Dikshita Agarwal (18):
      dt-bindings: media: Add video support for QCOM SM8550 SoC
      media: iris: add platform driver for iris video device
      media: iris: implement iris v4l2 file ops
      media: iris: introduce iris core state management with shared queues
      media: iris: implement video firmware load/unload
      media: iris: implement boot sequence of the firmware
      media: iris: introduce host firmware interface with necessary hooks
      media: iris: implement power management
      media: iris: implement reqbuf ioctl with vb2_queue_setup
      media: iris: implement iris v4l2_ctrl_ops
      media: iris: implement vb2 streaming ops
      media: iris: allocate, initialize and queue internal buffers
      media: iris: implement vb2 ops for buf_queue and firmware response
      media: iris: add support for dynamic resolution change
      media: iris: handle streamoff/on from client in dynamic resolution change
      media: iris: add support for drain sequence
      media: iris: enable video driver probe of SM8250 SoC
      media: MAINTAINERS: add Qualcomm iris video accelerator driver

Vedang Nagar (10):
      media: iris: implement s_fmt, g_fmt and try_fmt ioctls
      media: iris: implement g_selection ioctl
      media: iris: implement enum_fmt and enum_frameintervals ioctls
      media: iris: implement subscribe_event and unsubscribe_event ioctls
      media: iris: implement query_cap, query_ctrl and query_menu ioctls
      media: iris: implement set properties to firmware during streamon
      media: iris: subscribe parameters and properties to firmware for hfi_gen2
      media: iris: add check whether the video session is supported or not
      media: iris: implement power scaling for vpu2 and vpu3
      media: iris: add check to allow sub states transitions

 .../bindings/media/qcom,sm8550-iris.yaml           | 158 ++++
 MAINTAINERS                                        |  10 +
 drivers/media/platform/qcom/Kconfig                |   1 +
 drivers/media/platform/qcom/Makefile               |   1 +
 drivers/media/platform/qcom/iris/Kconfig           |  13 +
 drivers/media/platform/qcom/iris/Makefile          |  27 +
 drivers/media/platform/qcom/iris/iris_buffer.c     | 625 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     | 117 +++
 drivers/media/platform/qcom/iris/iris_core.c       |  96 +++
 drivers/media/platform/qcom/iris/iris_core.h       | 111 +++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 284 ++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  22 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 113 +++
 drivers/media/platform/qcom/iris/iris_firmware.h   |  15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 176 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 155 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  16 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 826 ++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 448 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 657 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  41 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 957 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 160 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 292 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      | 125 +++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 922 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 314 +++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 180 ++++
 drivers/media/platform/qcom/iris/iris_instance.h   |  79 ++
 .../platform/qcom/iris/iris_platform_common.h      | 186 ++++
 .../platform/qcom/iris/iris_platform_sm8250.c      | 148 ++++
 .../platform/qcom/iris/iris_platform_sm8550.c      | 265 ++++++
 drivers/media/platform/qcom/iris/iris_power.c      | 140 +++
 drivers/media/platform/qcom/iris/iris_power.h      |  13 +
 drivers/media/platform/qcom/iris/iris_probe.c      | 348 ++++++++
 drivers/media/platform/qcom/iris/iris_resources.c  | 131 +++
 drivers/media/platform/qcom/iris/iris_resources.h  |  18 +
 drivers/media/platform/qcom/iris/iris_state.c      | 276 ++++++
 drivers/media/platform/qcom/iris/iris_state.h      | 144 ++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  89 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  57 ++
 drivers/media/platform/qcom/iris/iris_vb2.c        | 367 ++++++++
 drivers/media/platform/qcom/iris/iris_vb2.h        |  19 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 681 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  25 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 524 +++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.h       |  15 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  38 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 124 +++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 270 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  91 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 369 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  28 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  17 +
 54 files changed, 11324 insertions(+)
---
base-commit: 67cefecf2a039b9ed0030b9213ceafcd45e6f9e3
change-id: 20241014-qcom-video-iris-v4-6e25839cf40a

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


