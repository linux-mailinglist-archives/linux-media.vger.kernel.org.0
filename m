Return-Path: <linux-media+bounces-40877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98075B33719
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704153B9809
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B252877DA;
	Mon, 25 Aug 2025 07:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AYhXTr2+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6213C28467B;
	Mon, 25 Aug 2025 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105261; cv=none; b=YeJKOzi8siqWZsJBMiHMAcp3k3loO00y0TYEOO8CxpbjvxHyoS7Cojlv6mWrAMRloPpAadYqd06biIHpT5rjO4PXZS89LBa5Lo5P0sfu44lxwe3tSTc7XiK8lOai+QSdm0P6plOrsESAOT+c02Z+RYM0yEd2bIsopmd6W3y2KM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105261; c=relaxed/simple;
	bh=kxY0+111hZ1cQywONlc1tfbsfcBNh9BkW4ikqSXEszs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TAP1pbUfoKxV+kW6tyoO/OTrzpKqzp8IFPN3ponI/2jMbPZTyN28ncCoOd5gwKVBGq5oiOwscykouEhPvFjw85zGLxWB5iDDhN6OO9spcYHU2yMvk7LdkuJulSOeZQ2A5wvvg89hW6F71FnyIjTWXX6+yozzFaypRTNoGDnzmgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AYhXTr2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMxEaL024639;
	Mon, 25 Aug 2025 07:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BiEjAMmJTMBA4Kcl4j2+qg
	opaKnrkzxSPvWn7mCcbLs=; b=AYhXTr2+MgvcUtZRW2nEbJ+JYC43iNORBAHPa0
	vWvkhDKpR7UANsxWnNIrLM1H7KX4BJ4HD/50VjJD3JYZVOdh+E3PQa2iF+TOBQMD
	jTIBh8/ozZE79XizDc4meG31SSeLGApm5Y0mRST44o0Hkpzacb8aIrpUEkBeWQvh
	vtaL16ejJtbRc6PxIBeFwZmbYMOl//7C1+k4HhBxxjLgFXXpHSQFHSTZX/WCtga4
	GH9X2Ofjw16BbKWn1twkadwMq6H8gtifxzMlKLuQ3WcntDuLduaTPiVrEK/Wm3LN
	NfbNM7aygdkc60kJ2muTPdBtkunbcI584Qdl8FiCfPQSwLZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615c1tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P70dM6002867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:39 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:00:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v4 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
Date: Mon, 25 Aug 2025 12:30:24 +0530
Message-ID: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgKrGgC/33NQQ7CIBCF4asY1mKmUAq68h7GRaFTOwuLghJN0
 7tLu1Fj4/J/yXwzsIiBMLLdamABE0XyfY5yvWKuq/sTcmpyMwFCgYaSU6DIEzXoOfbONxi4LbZ
 SKrCl0TXLh5eALT1m9HDM3VG8+fCcf6RiWv9yqeDAbeVQlCi0dO3+eidHvds4f2YTmMQbMYVcR
 ERGnBaqbSstQZtfRH4gAhYRmREDtQVbK2Nl842M4/gCC8tA1EABAAA=
X-Change-ID: 20250704-iris-video-encoder-b193350b487a
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=16034;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kxY0+111hZ1cQywONlc1tfbsfcBNh9BkW4ikqSXEszs=;
 b=H2rdie+KFUuF19oz5s8vQmxeysMbim/c7/kE13THp4lgfvWBSiqKS1ioknnSy2iDTBZ0cmwnp
 rPe5XIAcpRDDU27iEniuSfyheupyGQATwBNvIcevVGGI2kJ4MKXRxlW
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXxJJpkH/P71dy
 fTkM/SlHnnyfgFr6kb08M4NzdyTnr5OgUFJmMZU6wGaQM/i9zTkvIzTYuRJChx7ifgSnkTlEgen
 jwOO19Aq4ksXdx3+3QxX0eI+E/sZLb3K6XfYCfvvnyitrB5GE04LOOxNhd5yC7Ig2ZjikIHISGq
 aiJpWN6HNAq/swDzmkiFTxE21ezZ4aufdFSFzzSniaJEpQh83tTOWskbiLe+2Lvl0LJzdcALOsN
 Mk6rrzkolmSmcbxvWbJJUayiLegfBl4C7lq3zfusKsyeiuGAo40+Kkef5+S5jI9rgp2FFbjX8Rd
 qF/z2EunXr75yn3ff0ansGrI5l5o9QxwtNm4CKDrJryPY3tfYzAIquR3kHNVP6Lb3+XyMaq1uRp
 /Isa0CWX
X-Proofpoint-GUID: DKGgQ1q2y1knNDvxdtRwW97ruwJq3UA9
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac0a18 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EyxRolFhrdrs7oeD3u4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DKGgQ1q2y1knNDvxdtRwW97ruwJq3UA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Hi All,

This patch series adds support for H.264 and H.265 encoder in iris 
driver and includes a few fixes and cleanup in the common code that were 
identified during encoder bring-up process.

The changes include:
- Enabling support for H.264 and H.265 encoding.
- Fixes and improvements in shared componenets used by both encoder and 
decoder paths.
- Ensuring compatibility and stability with the existing decoder flow.

Changes in v4:
- Removed the fixes tag from patch 02/26 (Bryan)
- Fixed the non comv buffer size calculation.
- Link to v3: https://lore.kernel.org/r/20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com

Changes in v3:
- Fixed the log when destroying the interanl buffers (Jorge)
- Updated commit text with issue details in patch 05/25 (Krzysztof)
- Added a patch to simplify conditional logic in stop handling for hfi gen1 (Bryan)
- Reduced duplicate code while registering video devices (Bryan)
- Added a fix for try fmt handling in decoder (Self)
- Fixed the value of max core mbps for qcs8300 (Vikash)
- Simplied the frame rate handling in driver by using non q16 format and
converted to q16 when setting to firmware (Vikash)
- Fixed the issue with bitstream resolution setting to firmware (Neil)
- Addressed other review comments (Vikash, Bryan) 
- Link to v2: https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com

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
Dikshita Agarwal (26):
      media: iris: Fix buffer count reporting in internal buffer check
      media: iris: Report unreleased PERSIST buffers on session close
      media: iris: Fix memory leak by freeing untracked persist buffer
      media: iris: Fix port streaming handling
      media: iris: Allow substate transition to load resources during output streaming
      media: iris: Always destroy internal buffers on firmware release response
      media: iris: Update vbuf flags before v4l2_m2m_buf_done
      media: iris: Simplify session stop logic by relying on vb2 checks
      media: iris: Allow stop on firmware only if start was issued.
      media: iris: Send dummy buffer address for all codecs during drain
      media: iris: Fix missing LAST flag handling during drain
      media: iris: Fix format check for CAPTURE plane in try_fmt
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
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
 .../platform/qcom/iris/iris_platform_common.h      |  74 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
 drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_state.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
 drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
 drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 848 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  21 +
 33 files changed, 4966 insertions(+), 712 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250704-iris-video-encoder-b193350b487a

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


