Return-Path: <linux-media+bounces-43941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCBBC434F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C591A19E107E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B89A2F3622;
	Wed,  8 Oct 2025 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN4O+3jH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00E2F3625
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917166; cv=none; b=uxFPp2VZ8t/opxIgocedweF8nTL41qL5XiaOyvZY+Y2Y0k8mfVOoMrY8XKucR12LxDBxVNG60uztvEnZLZlmaCmA52dIj96D7cguMOpeQfp7/DG7SXjWhmyGJ0iAPIcu8kh86eMMm0iTrI3RXJHIygxeJr041cHw6Wv+WW5Rhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917166; c=relaxed/simple;
	bh=dVxH7am5NpfR2SKXOMgeyYYUDDszpYOsvQGpJZvlHu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZQVCS7wnBrNWFhXpCGSyXTfQnZ439T1yXyoVgxjJyV+/H8QKcYFcT8XlEutJkApuhgz/ukiR6B0oKluc2AUNI/19blwHxm2tOytOoiTu0lyHqgHSGpTxrMlzh5bRCFIv1glwssxVm4Fdy3w1lLkxZzfYRybvsS+jeBxOOBU8t0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN4O+3jH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890P8L014216
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q3OaqN90CD+hRsZWsAs1tR
	oSX142LTSoO103+LCQM0k=; b=lN4O+3jHGZaOMSvzRNAtSRTPZLkKHw4ijArMpU
	EKRZEAw64Uhz1Icl49LlJOtmcPfCudytB22cyfEVbC1uIqQ+6PTQrZVp74JoPE0z
	NY4aPYleRgfyU0s/sufbgalIC9aVJg/hIoMg26dvxzMUzj9YaVW2KmublTNVwK9A
	EqHFQ+zDTmpfi+Huo9bP4PitOD8c4p8pu9XzxzLY/0K1by2DY5S3f0vwUqDhhLlS
	Pa6clFv+h6PxvqM/Xrn7NaeeyzOaAT2vbdbEvgfFilT0FsHixVCWZET9mc6QdcFj
	6z5QuuX8UH7zyI/T2gp0uLnV9myF20AISYWdHZRye48mSTnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0nrbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 09:52:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so5336788a91.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917162; x=1760521962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3OaqN90CD+hRsZWsAs1tRoSX142LTSoO103+LCQM0k=;
        b=MCZrjA6kaYnzwweSaRehluqChmP9p55iuQzAREUpHqvvizpgv7IgHBoXF4CfyZeHTA
         WytBtX1+6/jbk4BYMIrb4Hx7WonPy6RHoA1LMaO9bnRz7dMLd9U+T/56PQPj00TegRTy
         jCvy5RYR0OlT58mZQWGaObzYqykmP+RMfrukPTPnIV35yyDecTQi7RELGo36fXINN72A
         CgN4xugW6+PkEPZXTivAuQuAn4g+PZ1a40a8cPkvRvLZ/LQe7MNWBqW/QKmUKTPg22GM
         eeGs0rrsPymDy6WYVHKKG0crYCFY/Xh0oELBog1/UzUOEfQ/L1PMAs+kqR1p16K111fP
         uz+Q==
X-Gm-Message-State: AOJu0YyXHh4hrK60wz/TZw82R7+3Fytp9VBKEQWJ+T8+Qx9KqS53plpx
	ZfcadXwzqDcGzOzNVwAYWeEeKuQwP5W/yMCmoFC7IWu590eV8kzEEm//HJyOMM+Mb6AplsTRZw1
	0cImAiJlSxo1gZFMSiApOm4bO+HuMYOUqDz1dzNup8CqvSIOCbczhUu8Jox+jUtKQ7Q==
X-Gm-Gg: ASbGnctnfe7GUC9SHqAcQHgKw5PVc06AMWYjf75ntcBp+/CaeS2ACAnY42/HZjM4rdJ
	mgsual3o/G1cR+qmZb54o79xayvOMQswSQFH5ZQ3bbP7BZtjHz9ATykw253kt60OmiNYZ7COMoL
	GpCpVPVrWPIcCWEZIUjcaMyk8gkua3bINK7KbFsVPFOAv0RxgC9T5zbJEEmLBRdE+vKRSDue0io
	P2Da9FstLd692i29eOhGiNBB9urF0hwLtIjwauzcPFVbeWd5Zp2gzDq6/5YpbK8a57RdxQ2lTch
	q4+ZBNz96RGa/NKO+xXDqWSrUFlrz1HCtlGp32p0lgv8WQKYUJSCwvqa2P8zRHd8Hjuq7/UI9qf
	Vo9M9B7M=
X-Received: by 2002:a17:90b:1b42:b0:330:a228:d32 with SMTP id 98e67ed59e1d1-33b5111891emr3514626a91.10.1759917162094;
        Wed, 08 Oct 2025 02:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrHvQ5C6DuHSYon1yuEagBSjWu5msDds51jUihiW7AOho0r2ExmRh8FDxUoD9d0odO+4Yxg==
X-Received: by 2002:a17:90b:1b42:b0:330:a228:d32 with SMTP id 98e67ed59e1d1-33b5111891emr3514601a91.10.1759917161653;
        Wed, 08 Oct 2025 02:52:41 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91d4sm2763833a91.1.2025.10.08.02.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:52:41 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for QC08C format in iris driver
Date: Wed, 08 Oct 2025 15:22:24 +0530
Message-Id: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg05mgC/3WNwQ6CMBBEf4Xs2SVtgwqe/A/DobRb2QSotlI1h
 H+3knj0MsmbZN4sECkwRTgVCwRKHNlPGdSuANPr6UrINjMoofaikTUmtuSRA0ecu6dBmnQ3ENZ
 H0ubgKul0BXl8C+T4tYkvbeae48OH9/aT5Lf9KZt/yiRRoBDCSklWO1uffYzlfdaD8eNY5oB2X
 dcP8AFrNcMAAAA=
X-Change-ID: 20250918-video-iris-ubwc-enable-87eac6f41fa4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759917158; l=2450;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=dVxH7am5NpfR2SKXOMgeyYYUDDszpYOsvQGpJZvlHu0=;
 b=sISEYgomFBoqTELd5kLJQEAq4BxSDAxh+bkBabfEKbdPiB9PH/wv7h+DwBhmtWEgA3NvuFBYa
 qGtszB/Mcb7BQw5nW4/MpYiXGYpjhfbk4qbj7eAslloHyelxETUzAjF
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: WJOcNJ2M-TWJpQKvQk2Zt-GyYAZ7WAfz
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e6346b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tWxWURTORvhNpiqNSXYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WJOcNJ2M-TWJpQKvQk2Zt-GyYAZ7WAfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX9xZn16yi04n5
 EH2/Q0CCBs9h/1SLt2tys9ALDco/fHix77f8hSvofUXFizXkGHuG1VePCq/h6u82snWmRv2CZ/F
 vFW+Z1a6KWJP2lHMmO85DCW8XLjVYUK7Lzk6Ks90rGK/NvVR2yrWiazLjfkpQELPzjqXUgE5R4d
 U9K2l9+BbAveP7qMgT30anuQpV8UQ2/5RWMenj255MEvwk4DwetA6cJECR1CvEp/690JnXBOxPK
 12w4x6j95EA3ue5UoaK5g7G5+qTPgiHbn8KatXAH2u4SKM+azAgobTOOIkSM6cYF+UKjXD6HVND
 dLuwRkdfzzpcKIt90qQ14nBqE7vW60AlyqUkmzLFedhw8S/HLkO236vpUEwQXHDAcIZZohdUpxP
 psG/PQS2tr0v23k0XbwN9rvOZEKN8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

Add support for the QC08C color format in both the encoder and decoder 
paths of the iris driver. The changes include:

- Adding QC08C format handling in the driver for both encoding and 
decoding.
- Updating format enumeration to properly return supported formats.
- Ensuring the correct HFI format is set for firmware communication.
-Making all related changes required for seamless integration of QC08C 
support.

The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
Both GST and v4l2-ctl tests were performed using the NV12 format, as 
these clients do not support the QCOM-specific QC08C format, and all 
tests passed successfully.

During v4l2-ctl testing, a regression was observed when using the NV12 
color format after adding QC08C support. A fix for this regression has 
also been posted [1].

[1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u 

Changes in v2:
- Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
- Updated commit text to indicate QC08C is NV12 with UBWC compression (Bryan, Dmitry)
- Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (3):
      media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
      media: iris: Add support for QC08C format for decoder
      media: iris: Add support for QC08C format for encoder

 drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c       | 59 +++++++++++++++++----
 9 files changed, 152 insertions(+), 33 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


