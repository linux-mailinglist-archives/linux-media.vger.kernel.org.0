Return-Path: <linux-media+bounces-12982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595090497F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64591F248FA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFCC25622;
	Wed, 12 Jun 2024 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kCpG9zIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234CF9F8;
	Wed, 12 Jun 2024 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162504; cv=none; b=YmKpWiesE6xZgoLSMDhjS/H1IXKN3j70LIEko8dLpgXuPcVKsFNQL3PTjmd6vzLrZkIl2BDFJ3YxzcK1PtSbV2cwGawjcXvJqaeLfON3nn/fx44GPK3/MrzlPRXa2BcmQGkk8xQvLVWpXBBLSKJofOzBuqLgN0h9t+7HjT0lzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162504; c=relaxed/simple;
	bh=uYJvhtf4v9hFR+ic3HylVrg5NhEao7IHYK2nQRrEZTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=LfEZVa8AxDd1aakSrBzNjQdAlZpG+OIZ2Ly5x3wyWigjaQkCAVKquFeCXyhj6VHxCk7XldzpD2w7lZoF/nVIXzmcfZFKzjBoDRJ6sNGyUoI2/RPjB37ErrkyUdf8r49hVmVraBoa9UawlKcMSX5awmNB6sTs2qe9ODApm/lX6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kCpG9zIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C316Kw011284;
	Wed, 12 Jun 2024 03:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gba0lVcv2ruGV764DaMHoG
	qg9+LsiuA8SeAPxsUY8NM=; b=kCpG9zIC9BTBZEiUQFThS8QIcJzFjjPzqdTdu6
	MAdlOT8Ep1YfNW0szaaskiz+n8F34nbUqCqTW4Lqpd48eycSDrAuXIULde8OvSzj
	B+A1cEGci6zhybdQdgZiMpbrkNuaMhrhC9+3t6DpC8YumoTrWXBrKJYP1H8HyraL
	1gIS0J5TrlWhCUqtzJFY7QzeYBll7TEBTbagCKIK1yQ/CcgeuGIiproUfw/IUv10
	UxZpO6N/MkhNxy3sTz7GSG1F8f0gvVOpmJ4Z1+GJQxWVAfhuUHSDaRv/4Fl6kpS9
	3ur16PpgxMgVFwM1/AN7G9mFI6GCuCIjRAGJ/COAJadvqy9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmyy71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 03:21:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C3LbHf011019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 03:21:37 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 20:21:37 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 20:21:34 -0700
Subject: [PATCH] media: dvb-frontends: add missing MODULE_DESCRIPTION()
 macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-media-dvb-frontends-v1-1-a378ed102f69@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD0UaWYC/x3NQQrCQAxA0auUrA20HavgVcTFdJLagJNKUodC6
 d0dXb7N/zs4m7DDrdnBuIjLohXdqYE0R30yClVD3/bn9tJ1mAnJpLA5ZiaJSGXEyRZdWcmRKQz
 X1IcpDQFq5G08yfYf3B/VY3TG0aKm+Zd9iX42zNFXNjiOL7cifYKPAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: brpsN2rayYQr0EnGDN2D2avuy-fbEV6A
X-Proofpoint-ORIG-GUID: brpsN2rayYQr0EnGDN2D2avuy-fbEV6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120022

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/dvb-frontends/au8522_decoder.c | 1 +
 drivers/media/dvb-frontends/mb86a16.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index acc27376c246..d02a92a81c60 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -25,6 +25,7 @@
 #include "au8522_priv.h"
 
 MODULE_AUTHOR("Devin Heitmueller");
+MODULE_DESCRIPTION("Auvitek AU8522 QAM/8VSB demodulator driver and video decoder");
 MODULE_LICENSE("GPL");
 
 static int au8522_analog_debug;
diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index 0fc45896e7b8..9033e39d75f4 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1854,5 +1854,6 @@ struct dvb_frontend *mb86a16_attach(const struct mb86a16_config *config,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(mb86a16_attach);
+MODULE_DESCRIPTION("Fujitsu MB86A16 DVB-S/DSS DC Receiver driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Manu Abraham");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-md-drivers-media-dvb-frontends-ed357c23fc53


