Return-Path: <linux-media+bounces-13099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E33905C40
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 21:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3061F228BB
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4904284A46;
	Wed, 12 Jun 2024 19:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l581TawO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611902F50;
	Wed, 12 Jun 2024 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718221656; cv=none; b=SmCvLgnawZVBrEz2/WKz2SqqHNtDUyFktbiEV83vwestkQHi3Flzk0tmko+En/HDtuk2ylIDmcodxq+BUg10Rt1aGxrthQwaZ3gkvgBBfOYOS9w96igV/sUjgikfRKGd0dh47hsMHNI2vqd4rBX5PhCRtt1DRtVo/g9ycmDltds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718221656; c=relaxed/simple;
	bh=iXYrYf6E3VhpKvW64KtUd6Z5LCbXkEegDMyJGiIA/oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jCZwzpXL9k0Wi54FNIvws7CHHf1Zlg8M1/genKadDa/I7p0S/XbCfMm1xB88dtDY8V9Apgb4gDs/I0qxrCrlJz5iofvIRoH0iLFG7Os2jQ21eOAlvSgTTgCXeJQvGG7Q5pJfCywV+hzu0AQ1AsJhzBO+Gr2wfmfKJITHx0z6eKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l581TawO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CHW7Hh001183;
	Wed, 12 Jun 2024 19:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ww4DJkpHpVwnOLvPdxsLkl
	dRNeezNP3rbu3LoE38HcI=; b=l581TawOjWicNLrKoJrF24VSEq2R3amStx/Npb
	C3wE1b7Q63BlcoZfismcGZ6jTX2hcSk5YrnffH3H6dGxXw4IzBI+A1+mFyOeHmc3
	N/yl291mqYr1uWADrg7Oxvk/9ex10CJPHSgzh0Pa/Omc4XzCKitMoOqHc5wzCR0y
	eaeleQhOsTC0WtkZY3SN65pIXpWjoNoVXLurTFlkmnZC/Y9fqf48fsLFawShiCbg
	UI3WuJpNIavce3Pal1sZU1YI+9ABN8Y6N/X32D3sHIdnUD4lJDce8Lw9k5bs/lHH
	baURJHjeBM4zghiaxHYwPfSwXhdiAj1BU0Hcy4cD3zGPxsQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87vgs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:47:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJlU5c025453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:47:31 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:47:30 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 12:47:29 -0700
Subject: [PATCH] media: tda9887: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-tuners-v1-1-7ea6440d766c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFD7aWYC/x3MwQqDMAyA4VeRnBeo0vWwVxk7xDadgbUbiYogv
 rt1x+/w/zsYq7DBo9tBeRWTb23obx3EieqbUVIzDG7wLvQDloRJZWU1LJyEcF7qBbpnTzGz8yF
 Aq3/KWbb/+flqHskYR6Uap+v3kbpsWMhmVjiOE2VC9GGIAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -520wfINMfu24n5CnOh1Ujuy0MvHfMZl
X-Proofpoint-ORIG-GUID: -520wfINMfu24n5CnOh1Ujuy0MvHfMZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=910 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120140

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/tuners/tda9887.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/tuners/tda9887.c b/drivers/media/tuners/tda9887.c
index dca2fc776e44..b2f7054c1832 100644
--- a/drivers/media/tuners/tda9887.c
+++ b/drivers/media/tuners/tda9887.c
@@ -707,4 +707,5 @@ struct dvb_frontend *tda9887_attach(struct dvb_frontend *fe,
 }
 EXPORT_SYMBOL_GPL(tda9887_attach);
 
+MODULE_DESCRIPTION("NXP TDA9885/6/7 analog IF demodulator driver");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-tuners-a5f4acfe0466


