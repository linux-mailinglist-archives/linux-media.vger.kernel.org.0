Return-Path: <linux-media+bounces-43100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417AB9C748
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 01:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E721C2E80F1
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 23:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3766F27FB3A;
	Wed, 24 Sep 2025 23:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V65CUG4R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA31DC9B1
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755755; cv=none; b=Gt4DkbqzW1fs0coeJqh/9zkja/+ecpZJXRlJCcJ9KNh93W1ooE++IGsZfvPRKqWow4LO1DhK7AtmX5zgHW5GtxBc4+0R27XUlUXNyDE96FqG3DLcPrlWPSuZlJlBt0H1Fy2Wd89+mKRjjsu32RMBfJTJszmEotH9fdNPFIScDSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755755; c=relaxed/simple;
	bh=f6cimjGDZ1pPzNhy2DV7xzi+VCcNPtWlyHkX3aYsdEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rYYteh8V5FicMNNGtok16Qiswv+sxumWskGkWUnowjR2DkvMdqVRE+VpkF39D13YzbUn+GsIG3guiwY2E3SBh2lSntNAtrGTMi25UcROSZ5rL1FIRiEhpNi+yuEP0MxWfKY7Mv/roJNOd7ckD+GzRFC+P3ijB0N2/q+zcsUxNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V65CUG4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFqKN018751
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SPvpXaISO63jT2DTQT3mA/
	VjDRrfmmeSe45BDjWM+7M=; b=V65CUG4RyKx3xhQF7CY5H8ATlsJGj+X5toreEW
	7MKWjCm73UrtACXIiUaT7tIHzTwxK82LOdaBQi6PzDMDk4Ke6TZM40dsJBnusX0o
	zzaXcy7pYjTzNoWhrQXHa4VjTsfcpDLYR+AGgoCuu7eZVDWE2DDAeKag2bakvAuD
	7qnfquI46D02aZnH1jSEUQ0xIV8FvuDzhwZVxW6ayf1KcyTY/NYDf2lSX+XZBmW8
	CrBDfsejYLNgoPOmpT3gL2PJnRCrnk5/A7zIXLgNbAuHwcCitLBsVJKGb33FFdRY
	+anxU7pb4j6aau43zOjZ3Xp0dD2XXI5JU1XvRmqPC4LYHzLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyb5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:15:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269a2b255aaso5460435ad.3
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755752; x=1759360552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPvpXaISO63jT2DTQT3mA/VjDRrfmmeSe45BDjWM+7M=;
        b=MP+QieEY6H7ZyxfHTgNoPGP0cr3LSVpABcKuQAL5zdHEdhnhZ7aCm69FiyzIGjLPQr
         cSD7fBeEwlk3NZqB0MtblBJXebhf9Mkxf0SR/Ef3kOQS+PF+8g1HuRlS6/k2HtqPu1e4
         vFkR3aZsGdRHvFHO+n4XWvr83B2p97cNxETN2R8qKWjKowOdHXBm32cxseV6p5nzemfZ
         iMtx1QVlIe/RDcxsoyquMYp1VXwW0yw7+rJfnnkcKyR09SwEtHnK8bS+Xk5oj79oUxUs
         xizU4ctrbty9WtkidqOKN3EtpYxYWZ3TlWtGbeFXbVkL8oHR+4M/EELagw6MrH6ts7wk
         b72g==
X-Forwarded-Encrypted: i=1; AJvYcCWvqleawuAZJgfrIJ3DrtxS3fO546P5dNX544PL+k53psQtv1M7yvgNxwMH7bOy8potEmKiYuBhSUFuug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8p3Tq/xMtpjAySc6su7oMlIVMirgynkoSHZZR5zAoZHnD2CWF
	dBnw/gk243Z2XIpeyu8Yt8Sgm6spwpxfg/fmPuK/90Bs2TPjxRrePNeM178xEZbmR3S050NWEWb
	IYGqIBkdXMpeoywGS1qBkLOkiMdydSxzSLor0aEkkOIVDlkI4WGT7heIAp7yL12vsjg==
X-Gm-Gg: ASbGncs+iM4p1hnmeYLE+6QVUaxqTUw4oeDFpVdE8aCD9jM01WhA2HSnt7+Ly0Th/UK
	rn1wub/R5DEoKcubdneDYRr6wHTCVGrg8TR1qJdIQpQzjxtpEP3wnfZONy6BkVHZEDifCPzfC1E
	xA2/3soOcGw9wxvrkPDA8DYKbAONJQEdtI1qANCghMujqr1WUM2SyVrpHbarL2p0E8ETxptzw3A
	qcTwB7viU666LgQwQ4/MW7z5hU8DY0m/+IZ+ewpXT4XDduqqbQqWMEjC2fP5c4R2WwiZnCiJgN3
	ZVK103h6DSCWkUb/QRNJgW4vmMT1YCyQ6FoaiWP5SjXqpVcjEralJ0XTvTpYkvOnNos3e6ZlbIs
	=
X-Received: by 2002:a17:903:46c7:b0:273:1516:3ed2 with SMTP id d9443c01a7336-27ed4a6f1b7mr11644335ad.50.1758755751751;
        Wed, 24 Sep 2025 16:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazNtyy6E27oeqHSvhrRe+jnJILZtWb2issOq/mykdP10vQarJo6Z5mgPF7OigjIjPwpYckQ==
X-Received: by 2002:a17:903:46c7:b0:273:1516:3ed2 with SMTP id d9443c01a7336-27ed4a6f1b7mr11644185ad.50.1758755751263;
        Wed, 24 Sep 2025 16:15:51 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:15:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
Date: Thu, 25 Sep 2025 04:44:38 +0530
Message-Id: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF571GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3ey8gviyzJTUfN3ExDSTZBODpFRzE3MloPqCotS0zAqwWdGxtbU
 AwiGYplsAAAA=
X-Change-ID: 20250924-knp_video-aaf4c40be747
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=14821;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=f6cimjGDZ1pPzNhy2DV7xzi+VCcNPtWlyHkX3aYsdEU=;
 b=jHyYDR8974QOtdWKOTA9f1uHKSzriiNqyflVF2R7DD+0GOCpZrzjgvaiysxs6omn3t+bR5935
 y9UquTdRvtgDKO1deY0CstNJAvSljkHk63yT/N7MvzpijMNCRNIMAQ8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: pXxIZZ8lUr8dzGpRmLoafmpz1T5TCo3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX746aPW6VmLpF
 kHpgQdAsP0J34JQ5d2PYhmzaTmtLvpKOZtHOcWpP5sMsI640DmmaphMQQLwxTcnzWpQ4fn1xzDC
 UwThTqu0PKj/Y8EQFA4eo4FKqZ6O0qCf6peVRiC7TEHWGShH7hsS3D3RASr73GMAxa352roe/cB
 Wjfh05rzBuoeDw6H3W2fYyEoKPaj53sWvV4PhqcJZNfkazcaqMHFcoBkeS9170CMZyLKfLGEdTa
 DHDrLGIyhXDHyBaSKfinIg7SDyP1UeOE7zH986pDcJoFstbBIRuMKxNgK5X+qAPOuJIPTQ0WaEO
 +daXZTmeWFTkrj8XLRGmcw3H1fK3UP19pWS0BqTXee58u3iQXFNRAVnCqaulMhuTgQHMkqaALO1
 Zc3TPPzq
X-Proofpoint-GUID: pXxIZZ8lUr8dzGpRmLoafmpz1T5TCo3H
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d47ba8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tihS8n33TGUsbNSyN08A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Qualcomm kaanapali platform have a newer generation of video IP, iris4 
or vpu4. The hardware have evolved mostly w.r.t higher number of power 
domains as well as multiple clock sources. It has support for new 
codec(apv), when compared to prior generation.

The series describes the binding interfaces of the hardware, buffer 
calculation and power sequence for vpu4, and add the platform data at 
the end.

Please review and share your comments.

Following are the compliance and functional validation reports

v4l2-compliance report, for decoder followed by encoder, including 
streaming tests:

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
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
        Standard Controls: 10 Private Controls: 0

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
[  203.872137] qcom-iris 2000000.video-codec: invalid plane
[  207.884764] qcom-iris 2000000.video-codec: invalid plane
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 21481 buffers
[  224.319929] qcom-iris 2000000.video-codec: invalid plane
[  224.328671] qcom-iris 2000000.video-codec: invalid plane
[  224.343830] qcom-iris 2000000.video-codec: invalid plane
[  224.351449] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  237.021615] qcom-iris 2000000.video-codec: invalid plane
[  237.030479] qcom-iris 2000000.video-codec: invalid plane
[  237.042185] qcom-iris 2000000.video-codec: invalid plane
[  237.049218] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  249.686832] qcom-iris 2000000.video-codec: invalid plane
[  249.695908] qcom-iris 2000000.video-codec: invalid plane
[  249.707621] qcom-iris 2000000.video-codec: invalid plane
[  249.714680] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  262.228427] qcom-iris 2000000.video-codec: invalid plane
[  262.237075] qcom-iris 2000000.video-codec: invalid plane
[  262.248750] qcom-iris 2000000.video-codec: invalid plane
[  262.255771] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
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
        Standard Controls: 38 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

gstreamer test:
Decoders validated with below commands, codec specific:
gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 ! 
parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 ! 
parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 ! 
parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Encoders validated with below commands:
gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.h264>

gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.hevc>

ffmpeg test:
Decoders validated with below commands:
ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0 
output_file.yuv -y

v4l2-ctl test
Decoders validated with below commands:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.h264> --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=input_file.bit --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from-hdr=input_file.hdr  --stream-mmap 
--stream-to=<output_file.yuv>

Encoders validated with below commands:
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d 
/dev/video1
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d 
/dev/video1

Note: there is a crash observed while performing below sequence
rmmod qcom-iris
modprobe qcom-iris
The crash is not seen if ".skip_retention_level = true" is added to 
mmcx and mmcx_ao power domains in rpmhpd.c. This is under debug with 
rpmh module owner to conclude if it to be fixed differently.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Vikash Garodia (8):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ CP configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks
      media: iris: Add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  23 +-
 .../platform/qcom/iris/iris_platform_common.h      |  12 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 119 ++++++-
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  63 ++++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  21 +-
 drivers/media/platform/qcom/iris/iris_power.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  24 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 195 +----------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 367 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 289 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 168 ++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  29 ++
 18 files changed, 1321 insertions(+), 255 deletions(-)
---
base-commit: f215d17ddbe8502804ae65d8f855100daf347061
change-id: 20250924-knp_video-aaf4c40be747

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


