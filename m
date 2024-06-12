Return-Path: <linux-media+bounces-13069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88A9059FA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EDF1F235F9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF3E1822D6;
	Wed, 12 Jun 2024 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TVXqOwN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68CEBB;
	Wed, 12 Jun 2024 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213536; cv=none; b=Zw4XV21M96seOQNjJWDA5oVScUo9ViE9hah8EFswaD3PzQLtktKCcbcwYSuX/cdeg2LDS6n0W49taX71E3uObRUscH81DBD0I9TT6lzXYIkyjmuVzx4314+WP0e8Qybvx1UpXSc+d/0j/Cku2mkg/+FAMUQCxvVzSfVSiCP95WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213536; c=relaxed/simple;
	bh=zjbHWafLDrLMhpm1Fx+WBUgHsZ4FyEYGnE5EXfFvuEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=VAfHVvB9E2bmjM5t/0GeTEKZEZ9PlindsaB3m1FKbl3HhJj2KA4ofmgJkSqPQbyiArd35YlOTVE8Zy780sXTJaDqSbT2RKT3gHZT+BClSejO0qwnNwnkbP3Zvv3QpbBrjrxeZWORYdW7nLnH3paimD8J+SCUL52B334h9cFISNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TVXqOwN2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CGP1DS001869;
	Wed, 12 Jun 2024 17:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0j+A7kVraJuYj0pACpPFgG
	KTDT6UcqwmtpQGUxRWGn0=; b=TVXqOwN2/Hl0W30DqUrFutO6/dKQoRAVF38vqn
	YcmeT9666RaLP98j8biow4aPxcmUq3IVCn36NaA7RcG2hkFfam+XVGvFtFdJEg5i
	TfbZzebsehN/d+kklSTOBIpCfQ0VdDIF8tfr+H1y2LDglUs5XH1bqXW2bgx/NefI
	PErIdUl1eRUjqSuEBSKLJN7gShEuCuznXnTfkfzzK+xKN1eCePr5gno73idsOwzN
	Ls82RVwobS8K3I+J/v1pTbDqe5igcnpQnIx3/LuceWVPu3IsLux6sHOnX9g4piyo
	nU2mGVq+N8OMEzhe0a1G2IMM5R2Ethxh+70A++PWiGYfDO4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqbfq8ffv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 17:32:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CHW93w028043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 17:32:09 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 10:32:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 10:32:07 -0700
Subject: [PATCH] media: si470x: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-radio-si470x-v1-1-1aa4b06b954a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJfbaWYC/x3MwQrCMAwA0F8ZORvoyljFXxEP7ZK5gO0kcaMw9
 u9Wj+/yDjBWYYNbd4DyLiZraegvHUxLLE9GoWbwzg9u7D1mQlLZWQ0zk0TUSLKiyRBcxdn3V09
 jcCERtOOtPEv9//dHc4rGmDSWafmtLylbxRztwwrn+QWd6aI1jgAAAA==
To: Hans Verkuil <hverkuil@xs4all.nl>,
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
X-Proofpoint-GUID: _-6xklLjt3-BDsOEKzcQjtNYIC18GNjp
X-Proofpoint-ORIG-GUID: _-6xklLjt3-BDsOEKzcQjtNYIC18GNjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120126

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/radio/si470x/radio-si470x-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/radio/si470x/radio-si470x-common.c b/drivers/media/radio/si470x/radio-si470x-common.c
index dc0c1d8d23f0..af0a70910099 100644
--- a/drivers/media/radio/si470x/radio-si470x-common.c
+++ b/drivers/media/radio/si470x/radio-si470x-common.c
@@ -790,4 +790,5 @@ const struct video_device si470x_viddev_template = {
 };
 EXPORT_SYMBOL_GPL(si470x_viddev_template);
 
+MODULE_DESCRIPTION("Core radio driver for Si470x FM Radio Receivers");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-radio-si470x-f2182d6707bd


