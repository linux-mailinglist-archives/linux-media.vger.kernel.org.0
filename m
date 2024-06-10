Return-Path: <linux-media+bounces-12889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBCD9029B4
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 22:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA35285AC0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BC814F9CD;
	Mon, 10 Jun 2024 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ond31ySz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC71B812;
	Mon, 10 Jun 2024 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050123; cv=none; b=qgf6edIWa5nSEIfZa3PtviQV9MTvbo5s5tY92ZQbhdzYyruF+u4LFC5QC7mf7jnL0/ylnke3EqP1Re9vkQfIfw5278HiawiG/DjO0jVClv2KzC+ShM0uaIyjaJgwOsmdHYFGLnSBiA6WDPGfnfS3AFg5vPBVlmfZtp8J6oLpaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050123; c=relaxed/simple;
	bh=1gswl6hf4KHobVmATfrT2dR7m2dVBSRQN13oHELIETA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=YgwoAV7aHCLtqSLQqodcNzMottpH/2H9LRIdRSFBh+ToSmvvOAoe1Tzq5sYKKto0oYojy4jFriznuipSEro8TkXIQ6li0zrUoeWb4qn9hsr3vJSvMBRp3sDhePTV8cosqSQwBIQ3Ik7bLLzYX3+CJpgVbSkfqrRW8b8dKXvS/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ond31ySz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AFA5dr002816;
	Mon, 10 Jun 2024 20:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=buLfj6Ltji1S/aYhBziLxu
	GbOEFEO5iPEML74KGy2gc=; b=ond31ySz1HuKj+g4aQrtaMlziTBcV14tiHLn15
	ydupiJYKsU3JQsbdXTaQvAy3YUkagsDhB51dfnuMQzc3cD8KOwKJwihXBAx5En+I
	udh9gw8qCaM6sWFVjgCAgsqzu3M9jDHuYmO50dCyKyKQuxphHyy+bIXRe8I2DD0J
	mR9x0WMtTVRW5HKLYBi2qktvPqsSYPmnw8QssgiMVOdl5q/xDiZ/yL+6fAnWJmun
	22xSOvZUQU1TeR2I1iB5Jb37ab+urI6xgwD19F//Ts4ehuvHPpalC+TPT7cy97dK
	9fl3KUeSNmDi2zUqJwU7tcfuqE1BG1jeszQynDsBPeLkgBgw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8vn8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 20:08:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AK8bXZ031737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 20:08:37 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 13:08:37 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 10 Jun 2024 13:08:36 -0700
Subject: [PATCH] media: go7007: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240610-md-drivers-media-usb-go7007-v1-1-89f1087750af@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAENdZ2YC/x3MwQqDMAwA0F+RnBdodUy2Xxk7pG3UwFpHoiKI/
 75ux3d5BxirsMGjOUB5E5O5VPhLA3GiMjJKqobWtVd38w5zwqSysRpmTkK4WsBx7p3rsfMx0nA
 PXaAAdfgoD7L/9+erOpAxBqUSp9/5lrLumMkWVjjPL+rxnBGMAAAA
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yAodk-ZHKSt6IhEavRCceAi9tMa18nog
X-Proofpoint-ORIG-GUID: yAodk-ZHKSt6IhEavRCceAi9tMa18nog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=939 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100152

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/go7007/go7007.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/go7007/go7007-usb.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/usb/go7007/go7007-driver.c | 1 +
 drivers/media/usb/go7007/go7007-usb.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index eb03f98b2ef1..468406302cd5 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -736,4 +736,5 @@ void go7007_update_board(struct go7007 *go)
 }
 EXPORT_SYMBOL(go7007_update_board);
 
+MODULE_DESCRIPTION("WIS GO7007 MPEG encoder support");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index 762c13e49bfa..334cdde81a5c 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1352,4 +1352,5 @@ static struct usb_driver go7007_usb_driver = {
 };
 
 module_usb_driver(go7007_usb_driver);
+MODULE_DESCRIPTION("WIS GO7007 USB support");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240610-md-drivers-media-usb-go7007-31ccaf9b3bab


