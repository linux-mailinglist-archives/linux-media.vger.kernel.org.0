Return-Path: <linux-media+bounces-44557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0BCBDDCA7
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21BD04F9591
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DD631AF1D;
	Wed, 15 Oct 2025 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTJegPWn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D831A067
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520645; cv=none; b=O9bL1FsQaPK8LWXxV9+NTkSEBJ0txwm9k7M/aS/7E5GbcqNe2uo2/zmCR9av0S3sPJJmDlF/BKpva2CI77/W1oNCPWTgIWoGv1xiUmHz8X9G3Ochh4ouPGpfTutsPvV4TNQNzG8EK3bYfIn8ZVOZA5n2T1x/FFIIv5fcHauHFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520645; c=relaxed/simple;
	bh=dw9IOAxXiKH06QEs7NqrxYEDucN/Ro5oz2UlCKXmf4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RebkVQOfz+MLLT/02790kFkypvVwDy+Cm9HN37xe/3+siqTErwnoMoY3XrhBP4R6+FJvn3GGlXradPwyGbBe27w8zQelIs1GFVbrj6W+0CWE7xkg85EQVhdncuPchcEA7ptL5oUV7JOZESH/h0qFl2CME0t/BLnFvLAl+TLk2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTJegPWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7EV015154
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+AWRZ6RLy3xxCfI3F19y7lYWJu1FbqYUaJ9
	EwUpZFIM=; b=fTJegPWnx+sklxzEiLhikRdD14rpA3fmsuXk6ZUnaug1FhPHNEh
	ZHz/ATske9zhEsSsrsqSbt1/L0fFmKzGH+/TAdK6z38MNAR+EaTnTfsiyitEQv2M
	BSg7IkZOJggDheLfrbDlI7kk4ck55MbuL6ZdJAlbqzLXA7ufb3Rvxq31FOv4JAq1
	sDMjBbEUwlVAV46etHE47lQBQVOBhtg8FVG/DO2OVAg6Gh4ljAwhBsUn+l5T3QuI
	nwDYWuqdvTuTyNI9lVOqa8us/IOI9jbNawNs4lzia3RLDUytzNaBUCn99ZwssouF
	9hauaPPamSzilzA6woZDPlnSTjiz3+KNPMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5m01f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78117b8e49fso18371333b3a.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520641; x=1761125441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AWRZ6RLy3xxCfI3F19y7lYWJu1FbqYUaJ9EwUpZFIM=;
        b=eZ9ztEeDPgqkuiTvCPS1rZ9bqt0VTTomfeW8mn5nYdqUFTqvtGPxgsfJlgQV1YcaDK
         YN1vMdewufCJuF5U/aDNVp4zRUDX3f6fRyabiTW6LIgPQxOY+kxpz8dDjf9v3vyEfNeo
         36TAxeChiQx5WOA9VyiLwOvw8un0SLEMtEUtq0Umq8WKQ1Qfqi0OwC5cg8yVGczHjvZ6
         oGWiDdCuYI2Jbpc9airvDjVrkYr0qhgLnW9kyiGhAIKY0FcWg+n9Wtg43kgLVyKjbrEy
         +ifx9zwVCDFVXd1uMSZM3XnsGlXp2fLC5e4tW/qgxkcqpRr5FECBjpT7QDiAs0COgoZK
         gBLQ==
X-Gm-Message-State: AOJu0YzQtedEjVXDbksHZ4sHg6xvTXbStqIMl/FqbBMDeaedOXPcZwwb
	SYoPjx5ik8jcXrmfDfKGzAhDHdx9B/JfVwJEcc1ZwnEPs/XqojHw5gtHqktF1ym0k5dHz6wt/Un
	5hmFfNrXY9E+QAwvzkLdC2zlKImoBU2STgSPLjVqP2u8rzml5sXPnljRcLO1l3D7nng==
X-Gm-Gg: ASbGncv5cBSmblAo0oZTorN+d7TFx88vFCEsJD/pFdk8WmhZDtg1fP8mQCrfqh3ZG/x
	UYgTqVygNreWnt1YtVieKnKjbuMTvnzDkKaToSCxFGvf34XqWy9QaeNNokVmyUZaidOawsRGEyl
	2W9tOwmuYp1+/jvHfVv+PE301eYpOeuTOUvII7xHno3A3+3VMjVk5bgD5m38OW8GWtwmMWL73ak
	/8aWC3yGSC9kPH3VaV6Z3dztW5fqBNkIvjUe3RDzo/PmnhE5GH3M51nD9vofXL7OU/a+lfTmOvE
	RvXWIC3lEwzi/90Dv+xk3Stn/cYwsJpON3xyA0/o7VHIfsgHRPUSQYRIkYh39za9ADLAL/3H5cE
	BqqfQ9/qXjlgngjA/0JLwZVBnVx3E2i8/570=
X-Received: by 2002:a05:6a20:914c:b0:32d:b999:921c with SMTP id adf61e73a8af0-32db999930fmr32130291637.37.1760520641306;
        Wed, 15 Oct 2025 02:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMhwB2deHN7pDz6zm5FfsvDZ8EQgexzrZZItel8sWW1KNljElO+YphSBrPetaVabec54B8Bw==
X-Received: by 2002:a05:6a20:914c:b0:32d:b999:921c with SMTP id adf61e73a8af0-32db999930fmr32130247637.37.1760520640805;
        Wed, 15 Oct 2025 02:30:40 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm17946745b3a.39.2025.10.15.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:30:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1 0/4] media: qcom: iris: encoder feature enhancements
Date: Wed, 15 Oct 2025 17:27:04 +0800
Message-ID: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XUq3AHkSjK6H7v8wfn67bfLuFYNCc0jW
X-Proofpoint-ORIG-GUID: XUq3AHkSjK6H7v8wfn67bfLuFYNCc0jW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX2eblQh4KjIQh
 hij6eOBsEEuMtOXiWyv8bkAwqDM0Ug9lJ4Mo4aYcVz0NbsYd3Dlr58LhCoDm9L5HxjUYk1Fu9O6
 4A3urxBknl/tztM+rNRXJxCbrnU7B5GFUbEle4qAsaR+yaiRVgrNjZUovPsfbk3xtqj+GxZfZkM
 VS55r0g8AuioM7zZgK1SILURypoSTbhXZMUNa3gTuzH4sp/hf5w788huO0fDngsluVR5BmeJDip
 d4wu3tkEUlCoKrCWxzmydFAh5G2xrklntuuqm44FooQhrsxTBsQxSRqwLJjSU6qUrZH6p+p48zR
 oIlYHgfPGNXHbSAUb5xm/yEvcloUo8B0yDxWQ55prUqk+lduFMinNmSEcnSN1jb0DvoCdlnPvoN
 Yat5ef6KFo78zZKVnLUCHkrNZc1STg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef69c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=KV4SbAjlYjHBkhW3RxIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance, v4l2-ctl and 
on QCS8300 for encoder.

Commands used for V4l2-ctl validation:

Scale:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=width=1280,height=720,pixelformat=H264 \
--stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/scale_720p_output.h264

Flip:
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/vertical_flip.h264 \
--set-ctrl vertical_flip=1

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/horizontal_flip.h264 \
--set-ctrl horizontal_flip=1

Rotate: 
v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate90.h264 \
--set-ctrl rotate=90

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate180.h264 \
--set-ctrl rotate=180

v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/rotate270.h264 \
--set-ctrl rotate=270

Intra Refresh:
Testing of this feature requires the use of this application.
https://github.com/quic/v4l-video-test-app

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5378, 64 bits, 64-bit time_t
v4l2-compliance SHA: 2ed8da243dd1 2025-06-30 08:18:40

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.17.0
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
        Standard Controls: 43 Private Controls: 0

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

Wangao Wang (4):
  media: qcom: iris: Add support for scale and improve format alignment
  media: qcom: iris: Add rotation support for encoder
  media: qcom: iris: Add flip support for encoder
  media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c | 94 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h |  3 +
 .../qcom/iris/iris_hfi_gen2_command.c         | 26 +++--
 .../qcom/iris/iris_hfi_gen2_defines.h         | 19 ++++
 .../qcom/iris/iris_hfi_gen2_response.c        |  2 +
 .../media/platform/qcom/iris/iris_instance.h  |  8 ++
 .../platform/qcom/iris/iris_platform_common.h |  5 +
 .../platform/qcom/iris/iris_platform_gen2.c   | 61 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c  | 28 +++++-
 .../platform/qcom/iris/iris_vpu_buffer.c      | 52 +++++-----
 12 files changed, 273 insertions(+), 32 deletions(-)

-- 
2.43.0


