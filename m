Return-Path: <linux-media+bounces-43235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F9BA2CEE
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 09:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0000916F37B
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 07:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DF2287271;
	Fri, 26 Sep 2025 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAmdy4Ow"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041101EDA02
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872069; cv=none; b=gEhyIqzQ2tq+TSlyEGFnRIjNTHNgK86CWW+RNs/LIYppiWVICLgaUpOI+GUZpdcmd4nn2YjrHhcYIG4MCWkqw0PIk1ZaxLCvv4yRUOKQpHvuSUIYmjMzrb13csRspxxa4vzY8AeYdhzOQxQ/0g6vMhiVi0+W0/BOKnhXBgb3HOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872069; c=relaxed/simple;
	bh=tH/fmHTHKtpiZPgxd23mL3FYB4RPL/6kSFORiYPqjJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H7Czda1XIotFVZwy8o0kzYSKqKCicXGgGh9wXZWzs0F3nVPfId4fFEug5mKo7KLCmXba1TkQwyZaSqr3VBsDV6FD1Uvb/JJdogr1MhsHJctcG3zzgSVPuvunI57GBGkqkWLAeirp6LBLPBXYPjz3cGKG11J3PF3E5DLFZVjcUEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAmdy4Ow; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q76S6p014635
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rDpPSTtRfF/pp2z68r5zbxqSEeHk9miGKGF
	7Ub20r70=; b=IAmdy4OwxZqkGzrq3+yChbcPoWo9Ss95WfJJRYM/RrHqxoHPWk+
	+f8sjc0KR3/Az0txXyfzocZvDyr8HCOMC2D47VCRX0ZePaDl1tgDk+N1W8jGisa1
	fm8arKUzImXIwlZjzglCq8DBRZ7wq1hnXrHdGt0Uj0RjRAj/rLGp/7dTsQRcz0DT
	6KbFNuTpYTQ50rY57pGBnMub9V0HaYtEohmnhkIJ7CH1QE9ovapOla72AzfLPfBt
	EfrGdd3w+qRhLWpofIC64CxJsMslHpeOu4QSEDhILYoUd6ZAz0keq8BIoZHfW+O9
	AOXTyJN8et5OygnlL97TNhIcnGeZG/RkFOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rhx13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:34:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d602229d20so33111081cf.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 00:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872066; x=1759476866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDpPSTtRfF/pp2z68r5zbxqSEeHk9miGKGF7Ub20r70=;
        b=Y5Z0p7avNZ7PPLV+SbEYjh3cYOZ09pStqktOVdvxdMqOLgbo9j0Z6Dm6asq0d1htvL
         AMQ7dWJ97Vsg2f9Aw2Y3IT4x8p5m8u/qIuTkCle7ceTMBNbleMJzkGbYnrQStU+8iyci
         KtMKUeDuC31CmRXRcHkNPDWsNYBwtErj8C/DqD9phF8ehP1kaDaMj5yEk2jsXQvJiB7E
         qe7lwaB3ZNyBG2TdW6VCWT9MaM8cG2DRLbWNT0voV1NcRXMCd4FZMVSAYlFk2/z6XfS4
         aU76qKadlVLrCZwCIcrpyQfLNj1HfzAt8IJEy0LQBMp8FBFAtGkeiL6EWn4dTWbbM/3l
         TN5g==
X-Forwarded-Encrypted: i=1; AJvYcCW5L4T8OOoe1J4hl8bXf27ZfJDfjhIbdjzOknYDiSFoamn0BtHK0flrAxHpOWUk053xMALuLr9J3clNZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTP7KEw6cEU4PeNdS5alCParv9X6dv565XdCNaMHSasTPNwii
	M7iMaaj5rHMZmfg29FNnmn2BcPVJ0L8DeC/iq98R2T1b0md6oAwiOFx5eYkTmRxMblXoBXXx5yN
	nEGyyYfCmFF9SIN3/1Qgn3+Iw2YTedSxdFjONuj09q6dd6y827AYINlUtGLyg/4Ro5g==
X-Gm-Gg: ASbGncvngwgbeXlBTUbLvAOhMTTr8HMB4mhBkvIDd+T9b3Dvx7g0HTC4dJzIbhXv9jO
	/TWz9Inf5Za1tQoLWUrMbdExeAIQ+exRGxgGXsEQ20TdjnCyMX053bJLV2I9ovdRJfKrEoYcf9l
	7huP+atCrV6EyzWWCZU5OpfzkY7j8GXVpjV8OjTx9aY/9g2mTwHPfqXQbHUv4S17LNjuUrBmL/V
	2hRWeWx/Bg8VpqY70kEUHYkTYXyNepep1asu9zX1dRFNZQN55quN+8FXiUtx+nqeayJNMWYZCHV
	HFjd1vhKpVHXEnTobc4yCozHdkRTNhKYpDxZiI6GL2xci270BSjMgpV72GvaKguUptsFqIqHr8V
	1o4bck8y0wcqZ86nMro9HJGhkHfcq
X-Received: by 2002:a05:622a:4111:b0:4b7:5de3:3046 with SMTP id d75a77b69052e-4da4c58e4bcmr96856341cf.49.1758872065692;
        Fri, 26 Sep 2025 00:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNLKZ8N08VnGlADQnoyCs33b30ZXooqAF0DczpASrqYwdtS12FLQcBuHx8jXBCJ/uA2jWjQ==
X-Received: by 2002:a05:622a:4111:b0:4b7:5de3:3046 with SMTP id d75a77b69052e-4da4c58e4bcmr96856031cf.49.1758872065095;
        Fri, 26 Sep 2025 00:34:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: arm64: dts: qcom: qrb2210-rb1: Add Qualcomm RB1 Vision kit
Date: Fri, 26 Sep 2025 09:34:18 +0200
Message-Id: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d64203 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=o2Bc93RIdgAf-tJ6wAEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: IHrN2pOEdqkjynf9xWnyltfGF04zhSo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX76BzMksVB+X+
 Oc4RHvG/XuaxZhh+HpX+8BefieQ1kViiXyLDrk2Ytt8ISnXsPAaAc6QkR81PTrT9NO5sjUVCMSC
 N6v+sJddb8Ax/EkoPnzaIR2KoVrx+lSWmyyI7o6E/yAMB/Ea4VR78v2CcpYIb0y5v4c3fy7xgk8
 GHK6MjPz52Dbn0H/YbLFMI7uzc2gM6Si0w9XImnAoxjyBCU/H3bdNSRFqfdnNkjGn3m9Z/HOoSD
 QPOElAGNpqsAqPoYbY7fbCD0TRPjEBLJ54l48XAC8W6M5ulWqS8QYbpotuX8s+F4d4vAuJ7Jb/i
 kPzfyIpB2WW549pE9f6BSoYPcxraMRt2tw+koJClaaIU5RVKKLCHF99dpH7uJfkt6Ij1XSpS/6E
 2+Yh0AcK/vtFixUPmq2GNzHvD9r5OA==
X-Proofpoint-GUID: IHrN2pOEdqkjynf9xWnyltfGF04zhSo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

This series adds support for Qualcomm RB1 vision kit board/mezzanine.
-  Add support for the missing camera PMIC PM8008, which is present on
   the RB1 core kit.
- Fix the logical state handling of the reset pin in the PM8008 driver.
- Add the RB1 Vision Mezzanine device tree overlay to enable camera.

---
Changes in v2:
- Use correct reset gpio polarity (active-low)
- Remove unecessary pm8008 always-on props
- Address various nits
---

Loic Poulain (3):
  media: i2c: ov9282: Fix reset-gpio logical state
  arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
  arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      | 75 ++++++++++++++++++
 drivers/media/i2c/ov9282.c                    |  8 +-
 4 files changed, 160 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

-- 
2.34.1


