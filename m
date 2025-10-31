Return-Path: <linux-media+bounces-46058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE4C24443
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E2818934A6
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB85A334361;
	Fri, 31 Oct 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YI39iptD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm3YNsQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB472EC55C
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904299; cv=none; b=MbISPtts4s7YqtuDb/VqK/qVqVfV2M6yTr2c1fNHUKxQD5GKp5L4e65zTWVl70chYVCZWEjpMOFuCNL5MbjGE/m1lEckAE2G+jpmttRLwi257Vzm6EznAhtb7tlFtsnAViuFjEixj9dmm+KB8jtdWqs5/i48DC/s9TMopnU9Q3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904299; c=relaxed/simple;
	bh=uu6BvBgDKdk3DvJj0RhTRpn5FkC4omi8Urpgz+bx1f0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tvQAWmWx0cXGZ+pRAFVooBg3Lcxjn3Ot1gGgzvFVuukYKhySHkDKdNvlNe6Pey+XbL1klY/bsWUa2Xu5ZLHqj/bcr9KGmz3+d6M7CcQIYj4WY0xsHvvO+Y+aH31+LEGAj7HwFkwDcpqxmWJACdw5HcJ0FGP2mXOf5v1G8+tNVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YI39iptD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm3YNsQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jQsM2471250
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqFEbeJq6GScjHMAKO8+Ce
	PE7fzJfPt+6jZwFmFI5fE=; b=YI39iptD0Cl1jo6yQFoEDUDim4H5Cdssu4oJOM
	zOlKANglzz02IS1EocqqiFEdeIxttUDKbiLVg10lSaYCo9696DqQ0cZuNi9thjWC
	dKMwnoIBXuKpyCE7fOYlTOxkaxygYUFpHkqn9ekAmD0vay+cLR5a0SB+cNutT+jr
	bIBmCZ/7b5xqIVrzyXU6sVzQsE15HTalp8gOBysgzrwGux1OmRkEm5ftYdXHvFyX
	0d/qIrxOZHq3/lPuKc0Uyci+U03qJpsHeJ5zMkfDDOi6Kq3gYNVKwXyHCioSJ3h/
	nTz0fcWf8mWlnPzqffLR4gAVwqjsStX+choYUWQwVmyRZqeA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4trv00mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29523ed27e0so6458725ad.1
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904296; x=1762509096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqFEbeJq6GScjHMAKO8+CePE7fzJfPt+6jZwFmFI5fE=;
        b=cm3YNsQJfKKLAu40I3qPP6Pbe50ZuTrOWLLqo5wUdWMphcrpITif5u7fQ8vd7yF/PF
         mOcb+qi7M31Z7mtyY0glKdoML6Wt2ZciSdoCISla4zxmNIiaar3HQSrP4QSuR9wDZ59N
         x85kOiD/KeXjoyoYTNVxOp3MutpkKQoysxw4QAUGShgoG/nm3U57kFPprKEosKyxsMz0
         yT/RrkcWh0TStbwWvnHsT1NeggGmMG/qZ8LSlhMjQ3ET/F3Pfk1frx9yl5GgvFo8A0Uy
         MQC6cCKMXjQTEswkGXcTl93BLEGIE1ih/Sb/n7HWhhSe2Ns8PTEzv6suavmUbqW1KXqf
         QAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904296; x=1762509096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqFEbeJq6GScjHMAKO8+CePE7fzJfPt+6jZwFmFI5fE=;
        b=PFYDSIBSmTqBR6k8SPlt6kVoTilwAyJgYQL/aPzZ49Ec7NptHpNtxNWixcMNHMfVBn
         BK9iQNTbY3j9CkgX3cQxgVcMIL6EIh9LtPID0ElKcemnSDj8sxscs3nkjY40xxMC+pGz
         NU2q33GEvQxyz5pqFNB/UH6+hvXgoEI2LSEy74QonLK8+YqeG1yH76ntMR4kDpL23OGS
         3PvDKao8IanXIL7Pu2aXKDwh+jWHmUNmNPJX8W8IIGhUs0y0GIm8JkVXRPrS8qOXO3R1
         8hn/7mIG2tssYFIEvxpu9NvnnLyO1K8e0YAyo3RjLZ8r4oYX69ratnNMf+zqC5wRyL9J
         FM/g==
X-Gm-Message-State: AOJu0Yy1hhnk0akErMyF19sWLd1/C7M6vO2qawqedzaXFq5d8uvDZXDq
	SoEVPbWFO+rkUAxjgORgmjguyWNK6fAAAysiww/FiVHY/5qc1aiHY0eQI1rCDQzVApe1f40lTwQ
	5i+ZneBGJXtrLyKinEJ1Pl0flHzB9Up8xzVO+vEBT4ICfWAWZ1C3ahVXFT+hTL/chJg==
X-Gm-Gg: ASbGncu0g3ejHtdryHvYiN9oGZ3CKS21kGOvX1Nul7utGYRjHbRMUzwfwrGNfDAae+d
	qLZJd5lmthxvrulFInWQuXa+msDOQ7F0RYCUjhI1PtzvJ7XleBrVSCgfEx4YwUOC28YOWcXrzsJ
	mZTE0WMoSI9ePgi7A3M13P0MBiWfu99gRB2bynaFYLFOWqNWGmigWUwNBzYV0bmM/O7y3UXN6GN
	ijQzeC6gREI0y5Kbhi4FY6ZfCUSJZ6HNLKf2wGaeJMz+jeOR4sws3ia2sMdCDJ7t2z2k8wUzVe3
	5T/7gJ3DfBNy1Z8//iZV5Bsq9ERfC0OEzduiGQHazjmeoehY2UvbUUpMb+SDyegP0JmwpBdJ5qF
	R1kewq2rm8ClFB00JoxpiX5XuctSKh11wGVucIOdgzvgrQMVeRVYkfJer/RdDNT5kbwodfeegFQ
	==
X-Received: by 2002:a17:903:11cd:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2951a587e32mr40120635ad.41.1761904295762;
        Fri, 31 Oct 2025 02:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXqLhZxEhUnQS6CvU91Ivkdda7SP24H60mihMkCpSCFNshEqaSeNb9cbGYg5QYxhjuh8VD8g==
X-Received: by 2002:a17:903:11cd:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2951a587e32mr40120285ad.41.1761904295167;
        Fri, 31 Oct 2025 02:51:35 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:34 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: qcom: iris: encoder feature enhancements
Date: Fri, 31 Oct 2025 17:50:38 +0800
Message-Id: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG6GBGkC/zWNwQ6CMBBEf4X0bJu2BGs9+R+GGCyLbCKtdhE1h
 H93IfEyk7fZmZkFQUYgcSxmkWFCwhQZ7K4QoW/iDSS2zMJqWxltnMSMdIEYUguZnX8CDBBHkp1
 tjd+7q/WdF5x/ZOjws3Wfa+YeaUz5u01NZr3+WyvtrdMHVTpdSiPfvNsktdopEannq7mHNAyKR
 dTLsvwA+OoCPbYAAAA=
X-Change-ID: 20251017-iris_encoder_enhancements-f2d1967b29f9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=8557;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=uu6BvBgDKdk3DvJj0RhTRpn5FkC4omi8Urpgz+bx1f0=;
 b=ymtGxTkvbaFnp1ZTPCVzQEEgx/c5uDmoGi/zpWC4PGVh6FO8VptbIacNs9qOI5u6vF5aPQZ0d
 A8WfXj8G9CcBwrgjE8F1q6wVsP6eyeWL1JW2HQe5jAO4DplSyDPnAFV
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: ajm2mu5DxcJXdBaft5AdpVK7gOQ3uRhx
X-Proofpoint-GUID: ajm2mu5DxcJXdBaft5AdpVK7gOQ3uRhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OCBTYWx0ZWRfXz6a1d0pnrP8C
 KLcWexxMzXyc/QP/GnB3oNOpYIXX6yzGSi+vinZu3shEf+nlOcaQXEa2AryvQpTdmg9yiT35wQj
 0U3kfQxLaYlE6WJ9B5oRXXXFMYSIEN+GcRffzKpg88gFrptCKjfqjVjrYwjU9ptrE8RgbLzqSis
 CHgk/ieXegMDET2XXARkOpqcyOPMAO21CBPyYq8zVwUIpt6HfrrlkAf2escrqIvnJsNxUj64rRJ
 9JThSAUOar8+ItHD/6l3y44Y6QixdfnS8BDUY+8J81kl0owalXGjGWJKk8P15b7fXjWt52mExPZ
 mMFwO1wL9PS3bdrTYPBalQTaLURrKFQwWKdmixVrqCJJAyMkIW8M+kzl3T5cLmXgtnKmRKEyOOa
 46KEbg2DREO8ECe4w9i/+72WspXaUg==
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=690486a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dRbC0bwBXVP-Wn5h6LwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310088

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

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Split ‘improve alignment’ and ‘enable scale’ into two patches.(bod)
- HFI_PROP_RAW_RESOLUTION uses the actual YUV
  resolution.(Vikash,Dikshita)
- Rename enc_bitstream_* to enc_scale_*.(Dikshita)
- Add comment for scale case.(Dikshita)
- Make the resolution assignment into an inline function.(bod)
- Shorten the long chain that checks whether scaling is enabled.(bod)
- Correct the handling of rotation in crop offsets.(Dikshita)
- Move VPSS buffer things into scale patch.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251015092708.3703-1-wangao.wang@oss.qualcomm.com

---
Wangao Wang (5):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 94 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 51 +++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 19 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  8 ++
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 63 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c       | 33 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 55 ++++++++-----
 12 files changed, 302 insertions(+), 38 deletions(-)
---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


