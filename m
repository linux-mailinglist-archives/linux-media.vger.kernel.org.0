Return-Path: <linux-media+bounces-42805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E25B8A623
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6323E1C816F8
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC86E31D738;
	Fri, 19 Sep 2025 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZYye9+P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C6D271
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296846; cv=none; b=GUc6KmZ0IPTUv799IiQFCrtKxtA7fBGVoMLNrYTDb98RWjYRzvjD4/jy4tqfSwbGtc09Ss4RImh2P2CBotzJ4beUQybIoX26NFXOVDMxj2ZDlCT7DYmhJfvYzsjMQshTvAS7ohcK34MO4ussb3tXXWFitXTobGxnKSVp4jWpTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296846; c=relaxed/simple;
	bh=Z6FgwU81RDmLwktIOUwsJhCbJ0jXwiGcGxLTvLDX+HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D6hNxO9fuJ1lQDtqRqvBysHuMHtB6Mju/dG7MGUvg8xL/l8eE2glZeEUhp9IkEhiAhcPyGocZL8xYZEg9k0bLCzMcZ+vk/pBBPEjCe/9EoU61cPG+/kIt9M5doyso4OpEdIf5Y842QUpuBTDbjXXoZUOFPjG6fJofDJAiwpDwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZYye9+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JFiGbY010746
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f5IZjZihMBMzwST8n68PWi
	/t6dztWGpRaZ8IqEGg2Po=; b=CZYye9+Pb49wLLIf6SMEQIT9aZQOEOP/MD1OI8
	wLzN7wH2GcH/kATEA6yHhYAhr0wRaOfPAy0ezGg2SlGNX0YsaQoe6n0bGL2d17IZ
	0DUdWjRqHRTgIJGupqooPG1EXW8jkv176yW6xCkTCWm4Rj9AuzkUIA2KQC1HMjPI
	3ZGz+jj15lsc8PvdiPdiivWSekzFU/UPHMDNuCQyowyJAmQPkVNZanqRiD6KJ9uN
	x1jvBIqtVj5nV3xdxA5wstfXBUvri70O7ZmQCsb8JODzAxK/Ft2n5VBmnDqT548u
	/KLxc7Y9QaNheipCxwW0WD78/5mT+ai+jrGKaHiNRpdCHufA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2wc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 15:47:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so824692b3a.0
        for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 08:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296842; x=1758901642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5IZjZihMBMzwST8n68PWi/t6dztWGpRaZ8IqEGg2Po=;
        b=bzAfEVyzLkjUPvQmYH5XcFnPfVftSFq+RYXnepDJuCmSqlDzQP3Se77gXTJaFv7/j8
         ZIAV8eHD5spmjDTKSvkqzH8NIDQqE6wpfiEvd0/tWuzgbdpeh78U26Sf/idvZ+vAI94a
         jIitBX5mR74n+LmYpkFbbr9S7buiBBDwYKkfQ2J22U+gLDoT/aOxYLKgSZ+yNVOAz4mk
         fJ6s0oiyStKYCVxKksggX7sri0srofTAJGEE4PXdOkuodfNffEFgYf9w5fYoUTEdgKcw
         /pmVcm5r3Cly782d3/dJ3vmx3L3g9QqT4W8Sh88K9G5NQWx9qfipBPF7pNO12dX99X4u
         56JA==
X-Gm-Message-State: AOJu0Yyw0CP7qO+V38Fhl5ukp35KNvPvU+h7EljtNLsnSvzJ5sHvJSQX
	Ilfp8byLn3ZC4BPi/T2qhE12+kd7I1og6QWLzkq1Q0dAfmDrYz2w4Dx32V3VB2fDvm1+QqpYttH
	ow06GTcybUiGaQfgPEkLJ4HbcKz9Rl1l37dRp5NlLnlXEjV0MNa6o4V8/8KX6DfORcA==
X-Gm-Gg: ASbGncsaL1tD1JvG2jMuSFG2jCig0FMd+ynm5RYkYsszR2hbXjFTuEn9CKxCvdrKFW7
	GZy1B+dKjEKVuSyzhejmgo2EitV8zoPBYgq/VVLA/jdh54JsMw5dwE2dW8GCuui6T06TG5Ev3Th
	RJvJ12C9UZuw1jymqIhjgCJX2B8A6IRjzrWvXQUR5hjg4CRKE2zzxyTuApVPgitY4krCVaZc/rz
	P0UCMph7wafoOa/1ms/ip5h1ck0rGTk5q8cBzE49ofk8XFsPFsQvUiGOjIrSURgwxSurWoVe/wZ
	Zye0DSnnEt7IJqxAxtK8j3x1SZK2oRqvXBioqxwpwdNQwjrdms9Luk00B6VN4pTz6jhMG1setWR
	4FQ==
X-Received: by 2002:a05:6a00:2196:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-77e4ecc2cdbmr4401570b3a.30.1758296842138;
        Fri, 19 Sep 2025 08:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+yk51eby4vIViBz1hHHz/Jp2vtK0V7tofw4pUoeiMpPq8lWAssXvf2irjZp4uaYpxiu/Mcg==
X-Received: by 2002:a05:6a00:2196:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-77e4ecc2cdbmr4401542b3a.30.1758296841539;
        Fri, 19 Sep 2025 08:47:21 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm5706653b3a.36.2025.09.19.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:47:20 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for QC08C format in iris driver
Date: Fri, 19 Sep 2025 21:17:15 +0530
Message-Id: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAN7zWgC/x3MSQqAMBAF0atIr20w4nwVcRHjjzZIlAQHEO9uc
 PkWVQ8FeEGgLnnI45Qgm4tQaUJm0W4GyxRNeZaXWasaPmXCxuIl8DFehuH0uIKbGtpUtlBWFxT
 j3cPK/Y/74X0/yIW/jmgAAAA=
X-Change-ID: 20250918-video-iris-ubwc-enable-87eac6f41fa4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758296838; l=2036;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Z6FgwU81RDmLwktIOUwsJhCbJ0jXwiGcGxLTvLDX+HA=;
 b=g7ozL1iwLNp7t/Ze9vXUFdfksEfaCuT8urcXbUxwIAnFimMFl3f6j/5Py7IQgKajRVKsCefzh
 5MPCRF1eFTfB+OwebiAy1kq9f4V4WI4GqlHu3tRftWzA0enc/z01xVe
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1lIaJu7yR3oK
 8aOcoXOMcm8lsBCTxOeA7SMa/IJCJbGKPFxIGNXciE4QxzthG0vTL/+J+zrjQ8lRY5Y67fY6IQY
 jQ/KerloMqTk+CQHPPnROjfVwjRxRDPLxIVP0Bkmy7MByGjnfq/LFcq5WGTPN3ZFRNybvm3UMGx
 7Cd88a18fwxbfIUX4GPAz+AtJ3khDER0HXwJbEKosR+hU6oTmV+BubEX5+gVh7XDgA3VKr5QZvF
 YLiI6lxi29kUpTk9GiO80fWyz06Do9r4pKGaybzlwNOIlLrqMyyS2BljP4H2RpavRHPQ8XQpHJ6
 n4FCSqqhwlKf4EfdeDnz2pT/A10CQUCTT5vufvamo43FpJWPnz728g4cjsny3lijVB8GkWk2kSW
 45mVR8sZ
X-Proofpoint-ORIG-GUID: D9f19qf34wnD5sphVMCGLX9sY2gtddYd
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd7b0c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8fPvZrEDet3th6y22BEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: D9f19qf34wnD5sphVMCGLX9sY2gtddYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

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

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (2):
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


