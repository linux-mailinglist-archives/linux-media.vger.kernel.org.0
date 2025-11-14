Return-Path: <linux-media+bounces-47035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF9C5B12B
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 01A9D4E7447
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57A22550D7;
	Fri, 14 Nov 2025 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZx2m55V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bu5mV7vy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258E24C68B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089866; cv=none; b=ls5LVSiBoS73afLdBG8IvfCSYrQ2CvggxZ07KGY2lTLwem4B1seNfZ4rXqOMeo4n0AlVvmXruvuR1A/p1OL3SuZqzTWWoJT9rGfmj7VheLz7ZAIW67qpq+GtI3td/ia4gKNdCR8OLYk0CUHHlRl9Awl2YTy36J630b3u2KmVofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089866; c=relaxed/simple;
	bh=NOAKe9H87v6o0ZDOTIQWFJS7H3k/6Y6Utoj63gWOneI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b4CVbc9+rSyoc21HMjdel7Qka97vP45zVoeyLNawzW7V9IX1JDw7nQiQzJa4r/+G272IXH09wzG3Gg1KDnGh1VuDZcAz+4oBdmcF34jmcM+OVhWyV8M7dSCmJlAy8+QwN92AWZ7K53l1PBbIJ0+34HhHfmCewwXAp/4zhAtShZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZx2m55V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bu5mV7vy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaobB1629664
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U317h5HoLWt7juAHdJnCKI
	DwmUGXYFH0EJIwfSTUTgI=; b=kZx2m55VAShMsCuNpSlua/0lplE0N/23aLlLd9
	D/A4u1TF4phdRcI+59heuhNIXb35yNmffpRv1u7NUgVvwJjxIyTouNMYS+UsZ1Bf
	n+3gPz4Rw2xxeIGYsjEKt5+tP7uNnaLD2317K9G1mDxv8BRjep7jcg58uF/03fQM
	KDxeIFU2M2dfwX62MywHy/Yaw1lJiNNM7id153J868FRCsvBpRyx+wHct4pSzV7k
	2mP7oldBbNGZhOFxpyGUMO+8j7xBI5qLefxPFyv7hU1b+lRkTR4gAV+c0oGvv6lZ
	bD/bUHSmRsG0DntSg1e8FEpgus9N38mLUg4hG3Qbu2u0asBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d8mt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a43210187cso1454095b3a.3
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089862; x=1763694662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U317h5HoLWt7juAHdJnCKIDwmUGXYFH0EJIwfSTUTgI=;
        b=bu5mV7vyynK9v+dmK/cC0WIsny3zykoxkp/LeLc8Mu7aRxj0JMekccErYrXOxyNwsL
         cjbSbtdlEtR0gTFTp4A1XhwLqqjdT1mKRlYDo1FuKuYnUrBNRPO+NdmpVnGeBvA7ba4e
         jbyxvObTcZeqgkQisgiG90NJfGuYjnsuJqHiBdkT0dP6kEjFzVwQEGqNtrWd+WGdzv+k
         fNONbhJicefdpvmcXAdRgwADekqqSwGIju4Twy8EeyLznqfZ/JShsOVYBQSLAWaEpMq4
         5tvFQVg1yF7ISZ31ntbrwVO0KzVqSDkeZZ6wYxIKnDEmJY4UHi8xrtak9oYOcf083Hii
         1YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089862; x=1763694662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U317h5HoLWt7juAHdJnCKIDwmUGXYFH0EJIwfSTUTgI=;
        b=LycADfWQQCu/plNY7vAkIa4uvCjJ7jawYjutN12hb6dSHjMQ/QA2rHn30Ypv0h4cZf
         K7OtOo5H36q0GqBe9PrzXbAqp/ArR2B5xZEznCsimH7PtyAgVuARh2JY4p+DTS4KCWhs
         3zBj+fLs2VGt9cAmhjuPIsAzrrtqr17wilxxbEG3DZNHfI92tAspWzOclD+1BUHfWR1G
         MT3W9DE7Bi5PFXYJ5FU0U58QyP0eGazD74C0aOWAblhQmuDXUWGuh0uBgShpIiv/TXZ1
         vZ+MTheXkETWrXKE64yGxZRzX4oQLRpDV8bKy/rg8cCc5pzsfFx4mioaSsztO0X393V0
         3L9Q==
X-Gm-Message-State: AOJu0Yyob0iDnCbYhvTNo+8RvvVO5cL5v/Zud+/M0iszLKp9hfdKzxkL
	g+kDPsCCkEVSI1UkUUs8Ws2YTt2NPW1Ji37sUpLbejB3RmH+ufc35wf7VoiNA2Kk4Pd5XWLssdE
	/j+m3KN+lbu4oPTPjUZzd1LjA7MW4lQS/e1zaqZffB12tWVGaLI9GcGCu8qQMQ6EYtQ==
X-Gm-Gg: ASbGncuS04v82KQnf0HYQIUH2GqgoRsAjvEL1XzMCzxfNLGwJl1rfnvFBmAVNbqitBn
	8cYIEM/Rou0XnToUJE6LTm1qP1QbDq1z/aOCvRl1PJb1lt3HbmHhaRBK4uMkY2+mhynzIbNLOib
	FAIbP8ZvgVV5SqPMAz601wZDKUFjHg3v3zAftxPHy+dLDGIJAK/ZaTr7/v99K+rejm1AM3M1kWv
	GBoTgY6qT9CXr2Whz8r1aClbeYYPsm3ZF84aip5VviYaAgmRhEDzOVtAKmmXTc5kULVkz1Deel9
	EfctBLiBuip+crb6dOUh5x23ia3EG+HCs/0JgLjiJ1pGXH1r0cXmJlmzlZTVcMKZddKvsHob/Eg
	6K0fwOmX2Zs1fRJ3g6BQFCOpYK3oJdROq9/IyofB+avsBxkBsqhGLVfH/D/W9VcNhK+AWAKS9xH
	6O0iAeQ4qc
X-Received: by 2002:a05:6a00:c91:b0:7ba:13f4:a985 with SMTP id d2e1a72fcca58-7ba3b0aea0bmr1596276b3a.23.1763089862307;
        Thu, 13 Nov 2025 19:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6Sk3gRuddix6BnhQy/SIP6MtxsL7v/cY5YklRK3nPTMC3W908EvS7AWE82rVOPAN7FjQ7bw==
X-Received: by 2002:a05:6a00:c91:b0:7ba:13f4:a985 with SMTP id d2e1a72fcca58-7ba3b0aea0bmr1596246b3a.23.1763089861721;
        Thu, 13 Nov 2025 19:11:01 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:01 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
Date: Fri, 14 Nov 2025 11:08:57 +0800
Message-Id: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmdFmkC/33PS07DMBAG4KtUXuPI42fNintUCMUvaonEYLcBV
 OXuTCohsiDZePRbnm/GN9JizbGRx8ON1DjllsuIQT8ciD/342ukOWAmnHEFDAzNNbeXOPoSYsW
 Kb3wc4nhpNPEAVhvHbbIE+99rTPnrbp+eMZ9zu5T6fR81wXL7qypmuWHHThgmKNBPnNuXbilPp
 bXu49q/+TIMHR5kkSa+6haws9PEKaMCrA9Geeek2gDFHwhM7oECQS0c81KAk4FtgHIN6j1QIqi
 C9ilZLRK4DVCtQGB7oEIQgnNgrT668N+X53n+ATMA9D76AQAA
X-Change-ID: 20251017-iris_encoder_enhancements-f2d1967b29f9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=9625;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=NOAKe9H87v6o0ZDOTIQWFJS7H3k/6Y6Utoj63gWOneI=;
 b=jhafJgvuy0pKWH20MGa7r2Ov/5+ED5RhzMRFl/4rCyOPOA7Wr5pyQXOMXAY4GaV1R8jWTrR9n
 tnqpBaCcO0pCD1zw9T3+SU+wsSsW2YKFpq+Sc8ldsUPfa3A2uQSBHiK
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: TiBntcpUaGFrO70cI8o7VyaIBKgH3-3l
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69169dc7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uW5hs7etCHDVNyUx15YA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: TiBntcpUaGFrO70cI8o7VyaIBKgH3-3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfX7OpFq3oE1cKn
 I7XLxXU5GPKyBLtSI+8+ba4hTycpjQzmMvNgonm+XR9ic/Fo04y+meYlo6Voto8aRxbPKsuC+0d
 JGBtW3X7URT3GtC5eD0xZG2zfdaHa5vXnXIS6MZpQETdqQe1W/slpZkp6/YCewiLZWLzp7Nn9IC
 +1XVSR7EKqSIcgjCD2U6wvVD11jpG32RD6QE0Cr83Mf/HXzh8v8rNp1S2RVjk9tdNN7iykStUuD
 SddGx7yDLRNj8I/bKAF+I1d7Ulj3I3OVvRi1NWnCjN3utgeHBp0i6H/hTC6dWJDdRGxsdKPEHtI
 di0vHaTI5sv22DHkV7qEf/YDJ4LzN4XXxu8+yTZCpBQvIJQG/611Hm52IbL/yC29mwpHo9u8RLP
 OaNhhZPtE+CLVDCYVY5FcWoSVN9ZkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140022

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance and v4l2-ctl on
QCS8300, QCS8550 and QCS9100 for encoder.

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
Changes in v6:
- Define ROI in 2nd patch's commit log.(bod)
- Rebase.(bod)
- Link to v5: https://lore.kernel.org/r/20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com

Changes in v5:
- Move crop_offset modification to 2nd patch.(Dikshita)
- Fix missing braces.(Dikshita)
- Link to v4: https://lore.kernel.org/r/20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com

Changes in v4:
- Split 'improve alignment' and 'crop offset' into two patches.(bod)
- Modify the comments for the enc_raw_* variables.(Vikash)
- Link to v3: https://lore.kernel.org/r/20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com

Changes in v3:
- Restore crop offset support for the input port.(Dikshita)
- Set the output port's left and top offset directly to 0.(Dikshita)
- fix the issue in iris_vpu_enc_line_size.(Neil Armstrong)
- Link to v2: https://lore.kernel.org/r/20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com

Changes in v2:
- Split 'improve alignment' and 'enable scale' into two patches.(bod)
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
Wangao Wang (6):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Improve crop_offset handling for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 95 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 56 ++++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 19 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  8 ++
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 63 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_venc.c       | 33 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 60 ++++++++------
 12 files changed, 310 insertions(+), 41 deletions(-)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251017-iris_encoder_enhancements-f2d1967b29f9

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


