Return-Path: <linux-media+bounces-50344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E6D0DB80
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C88F83038898
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7F226C39E;
	Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7k0IuTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WY42a1Ne"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7D1C6FEC
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073881; cv=none; b=K3uy3WXEB5HCteHYEtbvyuR8szbqwTKdmr+TY+Szn3sw+57QefZQ2wPABGM57F0Vh8cqSORqKujB7OWDCo8m7xvczPlWw7bYSMRt9Vws1PRMuw53v0gaFoUtbPU+1VAFh9udn9BoBkZPRkeSiBA9uIauu+zWi10VHrLICxcSKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073881; c=relaxed/simple;
	bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hhk/8FNvbp/TVV7x5srg53cpSwsNZVWCL4hFXhj7zb2w/GEH/l8dOu+OcqvudZj5Zak7BerWZNsqSPck7KG/vorxOTXQ52xl5BpuccahJIQz7O38nT3zZB1B3S8xPg36z1j60+bzuRbwu56U09vyJdqn9PTpnDHyJTdXBeCRkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7k0IuTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WY42a1Ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AAJTJk3986973
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yuz5Lly3tjYhnq/oakT1C1
	zb0K36bzeIIake9asJ7G4=; b=Q7k0IuTt0bgs+1wxYDvIkBRI3uhXRA8Pnf+mMl
	kfjoas8A5lFet0DZ5Gdyq1fP+KTvc+znxbnqheYWYwLTbY166jzO8ByQg7SZW+CG
	z9njqtC87FI9/b57paRf78O9bSIsT0pBICirj2ImuF5szM2NWnw5m5js8Jh7zPSG
	piu8sNp92/XgtCOu26zMDwflIoyW/ZjckQzPU9t2g96M33pMzvJojbjc7ci3ystx
	7zQuenkCCUzDnNzW5kLEA9vL5mskEPasPNHkQ9EBrXPzuJslq9UgiMwNk8PrQStJ
	/cDQG0sdidsvbx8tNel8brs1TnEW+V0ScrkIAcECCKjixihQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhah3ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1287244285a.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073878; x=1768678678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
        b=WY42a1NeCLu+lYUfx0DZ4l+d6yMbiD7/HrRdngQCdC1eM+1aOdVf1e/KjAAFNet7dX
         8gd9KkaXeftyt75D+ryI4kzXqiNt4J3hO80FrkPGDQ7T2E3T/UtWM1Sn5lA2g2Z/4ln7
         QEoergX3EsXIcLbtRG3I3NingMD1wrYd2TmLohzkpJIowCmR5gF2P7XBlIL2AS4K4CJV
         babilF3x/GZlGQTrQnLkPA6ecpJE8v7/MkE3Gh2UZ8qW3JWCPyyyn5VhpIr9EEDvVi4+
         igRn42UXOSZMF2Sc++2C64nt30bV2un8eSAT6ZvczuM6UX8/s2b32a5NOp1w52RTRUgN
         U8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073878; x=1768678678;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
        b=m3jOgDxg7508rDCvfoUwXejBtZ8M4wRG0JVjomg/cOedDL1mzWk+Oxc7KhLqo5pexv
         Jy/hoPBedQ5DhYTfK0XL9njSQi02He/Jvyll+J1LZxrJw4fgxffL/laccO1IahpS/2Ia
         J9rAQ+x3rMJTYjJOxQr2Kk9ZS4bhpZiUqZH/d58fAxUxHnwWV8JaJPt6ayN9wZUCiGoC
         tFXICaCtIwj6a/1cy5lm4Tpwx0nTay+Xdnq8G4OjeprrY79/+4yo32Q5yRPzYbzoWAln
         rzp3zUWX3gblPsZ+VXkineLI0q/16hAYnjKcmSt2ac+KGSQQu2Zdn51nYNEv4lhwHFl+
         pQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW4XwHllOSxjfhmds9Yl4bhVH2at9vkV9BXWAxjcmsApfsukKiMX0LJNFo4Td0+/IAayXWM/tmZWJgCgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8xA8DbD44k4GIDSTq7lRiKoldURlXKjM2SPKAquBjCr+DzAQ
	SYkfQ5YXKGZS3VSbjnuMj6fpWTK7PerDne+bJOEWg/iCk33//AwokGrfwHZ24F0p50zGzZkKYyb
	GoznOoEoGJw4KSVg8eHWiyAo3PIc0PD7eIHjdeLBL0Mr8XwjY7lpsu+3PlxuJ0v0oPg==
X-Gm-Gg: AY/fxX5zkLg4Q77+VqrgBONr4rTW+DXq7AA6eSv2L/FGgR9Rf6PUSo477i6JDRb3j4j
	hARkwQB93GctQbvaa11lSBywo8klVVHGtALty1K0/u+dh6uPlRINrMBD7YelIdtVUckKXtiBSmt
	jSLPzZPtC0Ui+Av6mKv9ahrUYTYPEafZqBsRDCZ6Ml207YT2MYZrv6rAZqcvEtahYO2kGl+Pw8+
	Un0TwWqE2rEQhy/ZlTW+kwFp15BbtFNxlqz2C+79p8mWimKBX096XK6Lkd044uzwqYgp5+SkIlz
	XL/chOM7x3pgPWDlcb+IvzRhbAUhBxrCF5jQdyrCoGXMVPVgRM9bv/Z3OkxVXLHaKkyN6nYd6VQ
	JsfWF3tJnp2pOzvQu0jebOxqN+YL/Hss6aWilvXANsUokLfo+aB+bhA+R5VschCJOsf4+vh4DGA
	39qEihxnUBIalaQ3JckgrDd1c=
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8c389421d1emr1753485485a.82.1768073878423;
        Sat, 10 Jan 2026 11:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH//Jvdv/1iDO7XXudCXmktmxjLEGbaUM5VpCobiCP3qcmln8zrFrWKnWb1Z3o0q5G1d6WtXg==
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8c389421d1emr1753482085a.82.1768073877982;
        Sat, 10 Jan 2026 11:37:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:37:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] media: iris: migrate to using global UBWC config
Date: Sat, 10 Jan 2026 21:37:52 +0200
Message-Id: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCqYmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MD3cyizGLd0qTyZF0DszQzk+SkJGPDxFQloPqCotS0zAqwWdGxtbU
 ADnX8sFsAAAA=
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSYXXJp+CINOgQyxIC8KNSqNqPLA1uV+wmA
 TBShj2YlOKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1X6xCACQkrwtfDBCLgeJWHdhLUmz7ViXaWlVL0txKsubcrgrqF3essnxA5RKl4ftlpb07gWfkgD
 mxXSxRsuQlaa1gJ/QtpVHdwP4fFZmEZ68pQs/+3TrbYz3ifw9Jze5a3U4yqx3d3xxQgreC4++Gn
 X55d2kJq/5G3Ojqsm+cTR5V8JuWIcECgDWdy78/IkG5vTtUyePREAmTO3H3Hxpv7b0TMzpay6xW
 +NWN/n2lm2avE+UOZNsbuODMTNVWIRHyeMbKiHdQnpm5QzEyHnU/9HfHmNyPubK8hu2wt0FGxue
 bfOCrPiMS2X1QR38X0/pJYtbbi6Lu4Dtmecy3g06bBuaRaNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cWVKCxn2o_GgZBQljAo48UEQVKW54ncv
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6962aa97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cWVKCxn2o_GgZBQljAo48UEQVKW54ncv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX6u1I3qxbPU9L
 6gu5t/InnFrPN/6NxlWDXe8u64AYkh0iuFIsSpnvsW03PNyRdIpm4YZN8pHZIaeYY588I4qzm3N
 AerqGa/Sk3sWo9KHoet01bLrzFX/3wRc5UwCIzKbICdp4LE1tHWHZkeZc5PfJs5mHti0hiaMjuC
 HNOokPmAFEzz2LYn07f1vFtKzekMt/Aga/FVuj0Te3TOjFDTATtSpuVl/UApy8tZVb0lnulrEFq
 +H5wbxyhld3tKI/jC07DhDJbhg9r4PILTc37Mk/MqmDnMHMOucffM9+LHCtvEFPwmpl2P+E0a5I
 B9BIM0fxQ/CG0bJcZNIsFSANafJLxXxr2vTimO8gy/m9CgOrGFrWIVqH3PNzJ5c89lcW20zQipq
 uEna4Gy6GHVFf1r/AiKwGH8VX1ZCAgQsgiXkdr4fu/ZgAcbQDkfWdwWprZx763QipkP5W0+sndC
 Tj4w3ACGTiRiYb1WE6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (11):
      soc: qcom: ubwc: add missing include
      soc: qcom: ubwc: add helper to get min_acc length
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/a6xx: use new helper to set min_acc length

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                   |  5 ++---
 drivers/gpu/drm/msm/msm_mdss.c                          |  6 ++----
 drivers/media/platform/qcom/iris/Kconfig                |  1 +
 drivers/media/platform/qcom/iris/iris_core.h            |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 17 ++++++++++-------
 drivers/media/platform/qcom/iris/iris_platform_common.h | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c           |  5 +++++
 include/linux/soc/qcom/ubwc.h                           |  8 ++++++++
 9 files changed, 32 insertions(+), 39 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


