Return-Path: <linux-media+bounces-39757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73150B2458A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7B61BC03E3
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269E22F0C74;
	Wed, 13 Aug 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QfN7p7cP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281C2EA47D;
	Wed, 13 Aug 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077911; cv=none; b=iols2RSaF3sP/z5l1W5PSYJ7LkOP5AIvUzJBmFw+M9quGn9SJofndlkF4PNZQ1LnHaWVPoJd5j0I7w+e+gSqNNeO3TWql5M4RHOR+4odgC6AOoU28rEea6A4DExp6IUxOdp2Hf39RxQyqp+9T7aXtzCjSdRU1zj5hgXwjZiaztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077911; c=relaxed/simple;
	bh=YLCnAto9lxjlb1FleikPRuJwGtAi6hamTiM+hzHW6oU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VfK7WhjLfcdXvGwv9a5chPl8Y2pJS3tSi8TETfxwg9R0GO2/6EH+LPlBtOk/cQbspM918ZmqdEUE0/QfaaqvOUdVKaquszKAIEmZupkfkWs7KciOYtB/1voThBh4JA2HkPMMwoVkOMSB8FJiTIp88C+YnkiRqSm+TPS+PB3KHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QfN7p7cP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mNYU008768;
	Wed, 13 Aug 2025 09:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MyLTisPZIoCY2FLdMf6R8g
	Iy3UGjR1zk3fhAFP5kIzE=; b=QfN7p7cPSLTmf4eTstfsHnlzvLtc8XIo8HNE0H
	ivc3TQjOTAwHbykokrCllwW1+lHUtFGbVdRZ4MTh8TTN+APu8K5mwjInkbxBqVad
	mm0w0bw/os6mGlztyYXm4Pc3CtWOtpdNAw9taHEuUps9jdumrDEWQl9xTySrog7+
	gy/Df/Vba5iyLQYs1lpoCfQkmIUZrKnscklcUYsjuszxBYP13ExZJAv6VvgC0Sjd
	j4NOzq6QhVosSnR8uHHEi22px+VwEFfKnootKOS+/oAOEZqiDbpJezfWO/aOCHSO
	PwjLnrMuoCKk4mo2GaLJXU4yXske4ZMDruMXxG2ccjkh0TPw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4f85t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cLuB019036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:21 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v2 00/24] Enable H.264/H.265 encoder support and fixes in
 common code
Date: Wed, 13 Aug 2025 15:07:50 +0530
Message-ID: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9cnGgC/32NQQ6CMBBFr0Jm7ZjSglVX3sOwoMMgs7DFVhsN4
 e5WDuDyveS/v0DiKJzgXC0QOUuS4AvoXQU09f7GKENh0Eq3yqoGJUrCLAMHZE9h4IiuPhnTKtc
 cbQ9lOEce5b1Fr13hSdIzxM/2keuf/ZvLNSp0B2LdsLaGxsvjJSSe9hTu0K3r+gVhDlTZtgAAA
 A==
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
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077895; l=14921;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=YLCnAto9lxjlb1FleikPRuJwGtAi6hamTiM+hzHW6oU=;
 b=YkMpNCqich5Y2Q3NRFGSqHlqgquLSoxhwbSDsc/oGeMisXgaHKomiO5I4A8G8I53M6neMYVUk
 tf3z50SdG9uAhS0GXH7AOgbOuhTqaJH3qIe/NQu4Gtg/fk8bDsgn0dT
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QRXMvNBoR8X-1R4ZFsLkVQDFOAUXJhrV
X-Proofpoint-ORIG-GUID: QRXMvNBoR8X-1R4ZFsLkVQDFOAUXJhrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6I7mkqNMcnKK
 yFItbcBVVK8vlw9jxFU7RwArCvpMkDNu29cvT74BGQO40rYln3ENemL2oSfF9Xej3kP1QdBFmA2
 elR67UvWGWyPdYbZizwQXVhYWNndm0t/XaSd1aVGVjeP9iWgHxfUu/t36Lp/Uky4uvyeQrGw97X
 iU2uCbGtEJpD1KkVzHAvoT+eMSDYyRccNf2ufwOIxn75jigdDBnSpqjr+MOA6mb51Po4/MkhqKm
 TJhDMcLcQcbgiO55HcnrG3yY016LORT/sqaEZPtGNY2p5nSh4DhJBzzYCC8zIUkWH9n50w4qmQH
 lqDvQuf2Ol2HLeCE3QuKwFyxNB603Ug0mQIQxFEfRLRm1j7/rHsa48eEKzSTCPv4X75uSIAgpGK
 ANNY/MQL
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c5d0e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=CDV9YodVZmp-j6WmXcwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Hi All,

This patch series adds support for H.264 and H.265 encoder in iris 
driver and includes a few fixes and cleanup in the common code that were 
identified during encoder bring-up process.

The changes include:
- Enabling support for H.264 and H.265 encoding.
- Fixes and improvements in shared componenets used by both encoder and 
decoder paths.
- Ensuring compatibility and stability with the existing decoder flow.

Changes in v2:
- Fixed sparse/coccinnelle issues.
- Fixed the kernel doc warning.
- Removed unsupported PEAK_BITRATE property from SM8250.
- Dropped patch 04/25 to fix quality issue with encoder.
- Enhanced command handling for encoder to allow start/stop commands.
- Expanded rate control condition checks to include additional rate
  control types for HFI Gen2.
- Updated default value to MAX_QP for all caps related to max QP settings.
- Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
- Link to v1: https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com

All patches have been tested with v4l2-compliance, v4l2-ctl and 
Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured 
that the existing decoder functionality remains uneffected.

Commands used for V4l2-ctl validation:

v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
--stream-from=/media/cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1

v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
--stream-from=/media/cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1

Commands used for GST validation:

gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
capture-io-mode=4 output-io-mode=4 ! filesink sync=true
location=/tmp/gst_cyclists_1280x720_92frames.h264

gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
capture-io-mode=4 output-io-mode=4 ! filesink sync=true
location=/tmp/gst_cyclists_1280x720_92frames.hevc

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
Dikshita Agarwal (24):
      media: iris: Fix buffer count reporting in internal buffer check
      media: iris: Report unreleased PERSIST buffers on session close
      media: iris: Fix memory leak by freeing untracked persist buffer
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
 drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
 drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
 drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
 drivers/media/platform/qcom/iris/iris_common.h     |  18 +
 drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 485 +++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 357 ++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
 .../platform/qcom/iris/iris_platform_common.h      |  74 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
 drivers/media/platform/qcom/iris/iris_probe.c      |  39 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_state.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 249 +-----
 drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
 33 files changed, 4970 insertions(+), 713 deletions(-)
---
base-commit: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
change-id: 20250704-iris-video-encoder-b193350b487a

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


