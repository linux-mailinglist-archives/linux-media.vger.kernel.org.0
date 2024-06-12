Return-Path: <linux-media+bounces-13078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A4905AA4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0464D1C21AA0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA0840867;
	Wed, 12 Jun 2024 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pzHI3nyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EB3B78D;
	Wed, 12 Jun 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216396; cv=none; b=POo9F9VGIE4ALREqIj2rkrGaDhH8wgRUiFsa+oM+2ANTpQel6nFRqqVDn86RYOGJHmAQd/hVkOecc9SlmbEZyIS6exn0HOvency9gBN1FbxGjJ1Q7vggE/Ph1H71gkhjGeKMYcAY0EqXpF2pABTR7NJT3feT1bdTFB82vmf8Mzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216396; c=relaxed/simple;
	bh=nPimuZQ0UWcYvonaJlq2ON6+IH0LRCu0HdaiWnuUcr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=nKaLM1VzORhI+1koyN8GJPu8kfOuGswagYOjs7rikr3T4dtkFQzElj6W7B4InpPnliHkzgi4MB47zHGa6J2mYdVfJ3+YXlxjDDRF1nEtKWrAQbyrSguWuV9ne/5AhTIA683g0AbqVr6oHHUu/L/5mkoYvtcW61p7SSvvnvQ0H0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pzHI3nyz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CGOUAx004125;
	Wed, 12 Jun 2024 18:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ab6Gj3VvvSTzRxsA4sQ8ni
	k250uuwROQA7dFhi+go1U=; b=pzHI3nyzFkKdbwk0Glw2Uvs50vC+g3a1FvrvY+
	qdWtuT9V2emoawDRVx1uqX0Rm5AyT4tXRYnu3i/TQ/Fa6uZKy9s9v12EKu09m3QJ
	c3yHKvEOAH0HIPWfT1JgSzZs+x5o+7IwlKkqBs8JLynqatldLOFlarLClZiCo3xp
	EoDdT0ghRl+xUP0gS3yVWYYLfcoPrlWs+ufQWQY9+WdHewtehn+XttalpJgnGaGy
	hxgjhfgdsUlNoG7K7DrRzGZ5pODzD7v/Cw5IANP+2R7OgxxHHvCstvOEhd4op9z4
	IlgrtVVnI2U2El5EIgMZgI8UsDLrl0NBsyIoORDT1RUSXlpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ype914rmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:19:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIJoOS012193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:19:50 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 11:19:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 11:19:49 -0700
Subject: [PATCH] media: uda1342: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-i2c-v1-1-7011b578a07c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMTmaWYC/x3MwQ6CMAyA4VchPdtkDALqqxgP3ValiZumRUJCe
 Hemx+/w/xsYq7DBtdlAeRGTd6loTw3EicqTUVI1eOd7N7Qec8KksrAaZk5CKD5ix2dHw9jFyxi
 gph/lh6z/7e1eHcgYg1KJ02/2kvJdMZPNrLDvB6VeZcKFAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fj63BiEZwCoXJGP7lB9ZEsrL4wpYmWCt
X-Proofpoint-ORIG-GUID: fj63BiEZwCoXJGP7lB9ZEsrL4wpYmWCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=798 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120130

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/i2c/uda1342.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
index da7bc4700bed..abd052a44bd7 100644
--- a/drivers/media/i2c/uda1342.c
+++ b/drivers/media/i2c/uda1342.c
@@ -95,4 +95,5 @@ static struct i2c_driver uda1342_driver = {
 
 module_i2c_driver(uda1342_driver);
 
+MODULE_DESCRIPTION("Philips UDA1342 audio codec driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-i2c-3e80a673c97b


