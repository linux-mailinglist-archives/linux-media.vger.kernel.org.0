Return-Path: <linux-media+bounces-43898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B4BC3517
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EEBC3C878D
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893C02C08DC;
	Wed,  8 Oct 2025 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLH7/0GW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427B62BEC52
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898008; cv=none; b=OhGwjZgeWARPjqW6X8valyNTTxAGl0U96pWktnCFTdf122gp6iTquj5v4KPbYgre6UzdgkiFsECnslX/0qEMcrxAuVcbaeKLYxYzhFcG6jYrKKnXmlwDWi9Dx2gr7ZJJht+meLsxYaA1i/rloPxVap0hqTQwwnvCS3JdeeuxHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898008; c=relaxed/simple;
	bh=I4dDFo0IzxPriZN7knT5nIhKZ7qkayg76Lj+xM8mgJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBLeMxsjEKiXTy9fdRdxsvVtcQ+3hAWElmwRACZkGD2oXO64h+ZyLNXPXQ1w4PIEUUieXkgx4/0CCTBCkj0raS20tDcuu8u8yYHoquvW3Su9DLlBgprkuoYFwfaMbv2HH5hvT3zUnfTtc2OhmPil8Q5JivdTNvU8AZR2/7E9N5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLH7/0GW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803ZhO028262
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 04:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkpGC3QKPB6IOx3Ma4I/10f0rxAG2IWVMaxvxoJMBGU=; b=CLH7/0GWHqEYGtuF
	3LAesdETOq7vS7zmDkVlcq+8Iow43Wfk347zzRhgXrs1+QTTYBIisoCaSQVZbFbD
	09L1oND2xFAFAB1sEYBcONWRo4PVpawYbThTgqR2h0R00IpCimJiKFFQxW2uJNh1
	ht86pXltU5mbfS35EdEx74vR1htU/F8OByXW6/yMpSFaQoCuIbgGruu5CCJWrrq3
	jxXoFqqwuKg1Kevobf01r5cJAzt+iv5+gH7Sa1YLpkxI8g7VbmI2hkJTtR19iXtD
	0Am+0q64rp33W+/RqiMV5Pdwpddqi+fip5d5xZ4YRKDxAC+HW0L/4AOLgIS9/bCL
	e2qtDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkssn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 04:33:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de53348322so279558771cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 21:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898004; x=1760502804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkpGC3QKPB6IOx3Ma4I/10f0rxAG2IWVMaxvxoJMBGU=;
        b=JJ6G6DPBFJsaQAl5yCkfZi8i5UEyliPlxNT5Dg4RiX2EkRLNuZDyeytjKl0rO07YO4
         bQ17B/0Lx8L7dCmywNK+TZbfsahRNUt4OUL0FmyoQ49M1TtsT/LF5O5DytIkY7qlKf5V
         0sicpm7QpNfgDUK6J/PY51dVa0aiZWY/Exp2izOLO7MYUc0aWx2qPiW2ir25KV0F41vJ
         o9r9kxxS/BCYBSfbLeHZtdWTTqUSpZD0mag6OnGoo/DAwr1j3/8sGnCHNrjkMb5dciRZ
         LsySKnvGUBtIhh860iYtbJ+WBt298Kq6ZbvG8J89qDLuFImjmLas2iEhOpxKjT2Wprwu
         xlsA==
X-Gm-Message-State: AOJu0YyPA/q8haRCCUJgundHVxHLq/7mtF8QTBoSG5i6ZybPW0tVSncE
	aLQmDa8/mnR7XpDKbcn8ALLK65UVk6S4CwtNmilqYfRWF+GK6/rVKw2BJvEoZgAjURfSEZdLNMq
	1ieX2MnOOWyL3+NSdAGUJD3cTL8aMCZsaWNulRH9JA77sd7125Bf3RpthoJRrk9bO0g==
X-Gm-Gg: ASbGncsb2nGDbxp4+BfoKpDC2cIx1DOBjo06Wy8goaTy6NWvE3db6AId7QECuXjq/Sa
	UNrAeUGnbt0vqPe7usLG9ZHyIi3DCFbKUC9ycu0kmHwluNkvP02owNHnGu1DU8XcVYWWiBVFePY
	0WN8Zdikqd68YKEKYSOsr+d/yp8jo+lRdYeCbIPivNfCxI8bWGDdn0jvPpfCkAH0jcot+g/DK8r
	a2e1F+3YEvafvVAHxbr2PDRqROzpb05GERbapEHBHFvkty3Xoq+Qw9S66hZrGBvpkXIL2FNXJcI
	t1anNGnsYPIpFGq2OjwEpKTOmuxxWNBOGFFvZHQ2oNRoT9yw0omiZEE9BLLWkHNbE35mrDUSz3W
	AUfY5I0/JueQQg13opEs4ApNaub5W88lhMjyXHeIj+s4Y4Sj5szR4FMJSzw==
X-Received: by 2002:ac8:590c:0:b0:4e0:5cda:9ec6 with SMTP id d75a77b69052e-4e6ead91c12mr27068181cf.70.1759898004262;
        Tue, 07 Oct 2025 21:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8kM3Oryp3/2tw8jgZmztY0G7AFi+6cE/Qc5lYn5psXENVanRiu+Hhm5CHAlCXlL1gAxqVTw==
X-Received: by 2002:ac8:590c:0:b0:4e0:5cda:9ec6 with SMTP id d75a77b69052e-4e6ead91c12mr27067971cf.70.1759898003788;
        Tue, 07 Oct 2025 21:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:33:04 +0300
Subject: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I4dDFo0IzxPriZN7knT5nIhKZ7qkayg76Lj+xM8mgJ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emDHjUsiHFflcSEw1+UiRtQqy9E0yGxqmTqA
 kwhNWMOj0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpgwAKCRCLPIo+Aiko
 1bDXCACRECfYAltsL7sONUXIa5n0ZxrXgjkLfN5silrHFMw9KtoL4K1n8gFNsfen+1dqhTk2rGA
 5z+Z8xBegaaMfXqG0BD5v/cQDNU6O/pmyuPHPnpFJ+HXmkZUz1/FJ7AO1vtDJi/dgxWq47gjJbP
 Kd0RFrwRTXGrspxhO7ik2LLxqWjCiRXRc65H48JzplLRwl5HBjUCaTVgZuZYAcPk6X8iqcfSvb7
 iEXgMVSBiJsQLZp1qO5AGGOSLUM/mvfGfHAnLdaxXkm3erQTmTj3SvhcG85/cY570zJaraYXdEw
 ysRsNhzHkpcIqusnbos0bATGIdVVY+uM6VWSigOSC4gfbNlz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfXyMSRZC1hU4dS
 IFzZuCu8/Ekl9iXSLLlI+8gv+iNrQb8q/4eA5QVJ0Q1pgiJJtXEsfv5y7jKcZyQsVixdqr+f0AZ
 XHXk33QRZVJ1keNe0iCe3z7HpzwxH7fek1RsAjcB/B3/uRUb6Gx6NUjVan1m2sQI0As0+eD5ww1
 JWIS0jGoo1yVSDKUXVjJ7TnQtUn6i7xQ/X1obUkUV8HC2SUGktzhivwMktLeqlRiyaMvaBa5t6g
 JFaBOE9uUrY8ksJh2PLTBYJUrnRPeqUJjFZJ+I/mVrOuNMwX2NjPdsaZfQ77iEWTNFp15DGsoY/
 11ouwOg2SRtf0sbgWGzI1nP4IQELOps/XVqrdyq3es0Kd41efryMjoTBZP6fvtIMJKmQ5zyFHU/
 feaIw57rf3KRqtRDTxZL3NPtVX+Ezg==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e5e995 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HkNQTw2pqjE5wvlPL6tWxO0ZGu3HUWMk
X-Proofpoint-ORIG-GUID: HkNQTw2pqjE5wvlPL6tWxO0ZGu3HUWMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


