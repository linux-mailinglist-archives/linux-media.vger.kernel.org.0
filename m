Return-Path: <linux-media+bounces-36765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B9AF8A12
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACCC5A0C9A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B2286408;
	Fri,  4 Jul 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CrJdBVSH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B32857FF;
	Fri,  4 Jul 2025 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615613; cv=none; b=GMoDpwuyVKPm9Ub0R+iZv3KT1BYU6fTOkmEhLanWPqiwy1ubC4FKxNYW+SipOrtoaSgmbo49VFiDqrPUzNhe/US9c+P2uhJ24m42CeRxpXyJkErEVcYRJ5ZQTEArmuG2RcxviU6spEl0qtwNt8ya1jPq31ZnqsVQMYEFqpFxpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615613; c=relaxed/simple;
	bh=DzdQXMWhyG9E4sVrJMYgGSMgTnQvBf+I5VypqOlvn5g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JhSo9PI738ZSCobuL0bIhimAmO23utDojs8RoP0s722WO2ohkgjgwQfWNsQkNKV9kKDhr4Dp0HPhe5ifO8EgOTIyDdPMLHjQ53BUmLWAk/0n0++oEN4cpEN7jZTL9NSc+4zdRzMYCDLRKux3y1eMGRGm5cpqoe8/CxPcXde9G8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CrJdBVSH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5643cRGL010767;
	Fri, 4 Jul 2025 07:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+wqbvG6u0UN4FRByDkxyHw
	dH3zFh7+u99HXn00gixFM=; b=CrJdBVSHnvO7h4DVZCKyOpRM0XkkN/ToAbyCaP
	bKGKHHb6zsLEg3JXX94XjKGR7F/pOMXO5du4bjNmGf0e8wNyszDmQEzf8YsDGEAV
	uDk8DwLTsQCM1hsw8/vNKLVnV526Kyx9NDKTntZMo/F+iDJJ1cEwUCtPZM88Wd2U
	6EIINUylloTN4lN9s/eAS16Y+1aGTu1TkYu/a+d1mexG80FvzLX7Q1L8V3BNo/D2
	Npr6ewgcxWl75b/a05jm5fEE0NPKIYEDHAdvwBwMV6X00/QxP5eJs0yTvl919CS7
	+DXWMQ7J3a/l9afXKb2mi3P9u/pobXy51dw+BJ+dGpB+pfIQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30g2s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rNox017215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:23 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:19 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH 00/25] Enable H.264/H.265 encoder support and fixes in
 common code
Date: Fri, 4 Jul 2025 13:23:00 +0530
Message-ID: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyIZ2gC/x3MQQqAIBBA0avIrBvQSqyuEi0sp5qNxggRhHdPW
 r7F/y9kEqYMk3pB6ObMKVaYRsF2+ngQcqiGVrdWO90jC2e8OVBCilsKJLiaseusXvvBeajhJbT
 z80/npZQPTqnzb2QAAAA=
X-Change-ID: 20250704-iris-video-encoder-b193350b487a
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=13073;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=DzdQXMWhyG9E4sVrJMYgGSMgTnQvBf+I5VypqOlvn5g=;
 b=j2qgJDjqM6mbua07B5cjmbuagl4Kgpnq0lICQj1uU2RiVajIb1WMOTEJ9OQxyynRn/SeBtBYv
 b9Zw2/uWJyQBi7rJqVAgGVPWS0x8pko0ZSF2SPXqjP2Udno6ynonHvz
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68678874 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=hE2_k2m4_orhzAUJXGEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PEfGj97Fyje_MEPp4HmHNjjl4JbziBWa
X-Proofpoint-GUID: PEfGj97Fyje_MEPp4HmHNjjl4JbziBWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXw+NzbD4rvmqF
 qUUQp1hUqyqsR8zf0VtUpeva+QAg2hj0lAfLgTJbjDr0KPHoR1ZUavHeOC3JVtw61+qMWK24fD1
 9TlWcsE+l8MEYsQJjqBTaBbIKeKFS+sD8eU1/WqjQIkFUsIVeJNKVWTVD6z7AJCIFzuQxsVZfcR
 2WlTsYAHAa6K9frGYK1IJL5EnkYIgTqtg5D9ZIEYCym24MngaWpcZycfy9qsdTsbiyDIZAWgP7D
 d/37gZPqTQQHvsF0dEBzAWPBfO2x3lODY7HFAC1qiqWKjMrrf54RNA9h9X/zKabDQPsc+yCNr9M
 HE3UArj7hB3CiwDpi+LPB34xCc3Xtd6uSRrd5f35SYa9jnRTxO6SGHNJ/5H+H7Qi43Zg0UEYfm8
 TecOByoqU9xQDs6BVk/nsrtRLD292yJ+Sb/Xb8woFotjbVmHVMwC0ib0E7KGFkaLT0sjQ1AL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040060

Hi All,

This patch series adds support for H.264 and H.265 encoder in iris 
driver and includes a few fixes and cleanup in the common code that were 
identified during encoder bring-up process.

The changes include:
- Enabling support for H.264 and H.265 encoding.
- Fixes and improvements in shared componenets used by both encoder and 
decoder paths.
- Ensuring compatibility and stability with the existing decoder flow.

All patches have been tested with v4l2-compliance, v4l2-ctl and 
Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured 
that the existing decoder functionality remains uneffected.

The result of v4l2-compliance on SM8550:
v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.16.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        Standard Controls: 37 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

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
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

The result of v4l2-compliance on SM8250:
v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.16.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        Standard Controls: 19 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

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
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Looking forward to your review and feedback.

Thanks,
Dikshita

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (25):
      media: iris: Fix buffer count reporting in internal buffer check
      media: iris: Report unreleased PERSIST buffers on session close
      media: iris: Fix memory leak by freeing untracked persist buffer
      media: iris: Fix buffer timestamp handling
      media: iris: Fix port streaming handling
      media: iris: Allow substate transition to load resources during output streaming
      media: iris: Always destroy internal buffers on firmware release response
      media: iris: Update vbuf flags before v4l2_m2m_buf_done
      media: iris: Allow stop on firmware only if start was issued.
      media: iris: Send dummy buffer address for all codecs during drain
      media: iris: Fix missing LAST flag handling during drain
      media: iris: Add support for video encoder device
      media: iris: Initialize and deinitialize encoder instance structure
      media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
      media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
      media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
      media: iris: Add encoder support for V4L2 event subscription
      media: iris: Add support for G/S_SELECTION for encoder video device
      media: iris: Add support for G/S_PARM for encoder video device
      media: iris: Add platform-specific capabilities for encoder video device
      media: iris: Add V4L2 streaming support for encoder video device
      media: iris: Set platform capabilities to firmware for encoder video device
      media: iris: Allocate and queue internal buffers for encoder video device
      media: iris: Add support for buffer management ioctls for encoder device
      media: iris: Add support for drain sequence in encoder video device

 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     | 226 ++++--
 drivers/media/platform/qcom/iris/iris_buffer.h     |   5 +-
 drivers/media/platform/qcom/iris/iris_common.c     | 233 ++++++
 drivers/media/platform/qcom/iris/iris_common.h     |  18 +
 drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 494 +++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 113 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  62 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 357 ++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
 .../platform/qcom/iris/iris_platform_common.h      |  73 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 502 +++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      | 245 +++++-
 drivers/media/platform/qcom/iris/iris_probe.c      |  39 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_state.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 249 +-----
 drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 298 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 846 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
 33 files changed, 4970 insertions(+), 714 deletions(-)
---
base-commit: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
change-id: 20250704-iris-video-encoder-b193350b487a

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


