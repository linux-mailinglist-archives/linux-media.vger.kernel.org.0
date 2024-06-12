Return-Path: <linux-media+bounces-13121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF387905EDF
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52BBBB21C4E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F129012C80F;
	Wed, 12 Jun 2024 22:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YW3Y7PjC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1763028385;
	Wed, 12 Jun 2024 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718233114; cv=none; b=QHziIrvuIHTJOaDZkBqLBCPDugMttCsZXHrKLBx442R7cdZPL+WJfQK5lVmj4nsCNvPRv0WQoYYyRG9u6nmoUh+BKUGJYGaeJBIjTiCuuiCACcS7OV9E0Sj42WGS1SWSvllkiI4z2jUem7n9kc5iTCCxxV2IvYbFfuwVwAY+pvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718233114; c=relaxed/simple;
	bh=kBo3PrZiEdUdqC/4BbLA7KGTFYsksjNhvJlPCWpd8U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=X5YQ5/zW7WdJnekWX1+LegSv1EzHgCS9mCkMNOgEJfRZ+9aP+sSVRBMXR9VlY9cST1w26+8otBnhnFLM5ePEtXRtd96HS8KyAQ6sDuxqSKd/G6y1RRDlWYueitui+F7KyYbv7iEVTvtkwIiAiA64BKjqI/XKwHeqplL6sDPJcNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YW3Y7PjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKnNOC022525;
	Wed, 12 Jun 2024 22:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KVruShR2VdwkCpzyg19f+X
	RXwOT8ljeHnXvU1gTxSnw=; b=YW3Y7PjCFNWgGtpVXutUr9enKD6MYiUSW031XH
	wius+sEmZ0byo4wS4py7gx12lEG4dsE5De2VD4q8ip3I+zFZsuur5AlaxfJADB/f
	xFN4F35FScJLmm/PQisgEEdnPAu6TVB1UUxqY1GVn1I9v41S+xQXabQvQZqor+4/
	TEpljxYmTbTzJ4PYo11hwTb+oePylvN2EqRbr18gnWACYxLnAz6ods4ybm19a6K9
	fX1NvW8CcBOrw8QY8om1wvnqcICqPorAkfayxk9n4uMw0lhQ9ykEY/HooE54G3ze
	A6Wkp/CimF04e46ePmYfNyZSp43LlFOzgX64XpVdAeGB3YHg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8jqh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 22:58:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CMwRnD028747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 22:58:27 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 15:58:26 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 15:58:25 -0700
Subject: [PATCH] media: rc: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-rc-v1-1-3c3458bb73e8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABAoamYC/x3M0QrCMAyF4VcZuTawVinoq4gXWZu5gK2S6BiMv
 fsyLz8O51/BWIUNbt0KyrOYvJsjnDrIE7UnoxQ3xD5e+hQi1oJFZWY1rFyEUDOGq09jSvmcEvj
 zozzK8q/eH+6BjHFQank6Wi9pvwUr2ZcVtm0HzskoFoQAAAA=
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QQIRi8NXxO5Y2mMnDx-rjRb8chdcF3R5
X-Proofpoint-ORIG-GUID: QQIRi8NXxO5Y2mMnDx-rjRb8chdcF3R5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=941 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120164

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/rc/rc-main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 6bdad6341844..a4c539b17cf3 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -2092,4 +2092,5 @@ subsys_initcall(rc_core_init);
 module_exit(rc_core_exit);
 
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Remote Controller core module");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-rc-19061f66c366


