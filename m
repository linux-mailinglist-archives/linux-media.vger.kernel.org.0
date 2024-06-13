Return-Path: <linux-media+bounces-13148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED809062F1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 06:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3CDD1F22CDE
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 04:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C741132125;
	Thu, 13 Jun 2024 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YZmmFZhO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E20E446CF;
	Thu, 13 Jun 2024 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718251480; cv=none; b=lWhg8SaLltMoCPO+mK4Dy1P1n43aHQn41fmgglNkpVUAQyu69IBjioJk0UxzGzaUrvagM/X+Lm3/jOy/t6t0CIvkbE02208gN+AJr/NgIb+gveqZ0oJAyT79Roa4AEOlkKllKAiMINwTS54xU7qm05FHumA7Z83oWYl/ioQHPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718251480; c=relaxed/simple;
	bh=fItqccY2e+LX0/xef6qOrGcZXE8iCNnlc9p51+vfxf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=LK0IZziZt/5PokDEqZhUc36Dgetq1UpGYAjfS1qqFnNzG9pBlfAsoiYyTp5yG4giLenmbxNxNCAj23JkxTq/zfgZz0mbJ/Kj8ES1guQ1EaPhBEmqJ9dkDhtRLdqHIjwtowX1e01iPUa9WknUez686pctbIShVqhk3OdqqxT6Kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YZmmFZhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKnDag022998;
	Thu, 13 Jun 2024 04:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8UXXDwdj6KhWMtqkYrSrKw
	t/7aWzNHFkhU1nSbKWx6Q=; b=YZmmFZhO8kjVZMHR2nEVI+xlIEmgHy4uMzLPQ7
	yR4Nox685l4/pNYOsVRxG6Oa2TXJ+ltYmAyf6EaLmjJxJiIbax1iI0rcqgJJJKfM
	kdJEeqNpFSCI4RZOGAz1YmPpNGcoNEgA5+FWlqR9xr4k6vHiViqHmaLtivfJF5zq
	DUmwD0sYb4n5LWjlVEA0jIsqyNfqe9x8giijy6bBxjRHW0F92SydHaYm/y4SCKdB
	WnckxDbgLHgeBRtGR+foo57FOnZmFWBEZ8fB2ZlSlWXBWUsUmjPFotGhecTW95d0
	DQVMEgi+PQqB2oPghocCcv0DssDlfm7JBzkrYo/za4JscBsQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjawhum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 04:04:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45D44WVT024451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 04:04:32 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 21:04:31 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 21:04:30 -0700
Subject: [PATCH] media: dvb-usb: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-usb-dvb-usb-v1-1-bd185bf55cdc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM1vamYC/x3MwQrCMAyA4VcZORtIx5zgq4iHdokuYKskrgzG3
 t260893+TdwMRWHa7eBSVXXd2kIpw6mOZanoHIz9NQPNIYeMyObVjHHLKwRF0/INR09E1EgHod
 AF2iLj8lD12N/uzen6ILJYpnm//SlZVkxR/+Kwb7/AB0lWcqNAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HSU738p-PIs5TZzgz4v68mETA-FWNvn5
X-Proofpoint-ORIG-GUID: HSU738p-PIs5TZzgz4v68mETA-FWNvn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=618
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130026

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-mc-common.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/usb/dvb-usb/dibusb-common.c    | 1 +
 drivers/media/usb/dvb-usb/dibusb-mc-common.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dibusb-common.c b/drivers/media/usb/dvb-usb/dibusb-common.c
index aff60c10cb0b..20f1ef3393a5 100644
--- a/drivers/media/usb/dvb-usb/dibusb-common.c
+++ b/drivers/media/usb/dvb-usb/dibusb-common.c
@@ -14,6 +14,7 @@
 static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "set debugging level (1=info (|-able))." DVB_USB_DEBUG_STATUS);
+MODULE_DESCRIPTION("Common methods for dibusb-based receivers");
 MODULE_LICENSE("GPL");
 
 #define deb_info(args...) dprintk(debug,0x01,args)
diff --git a/drivers/media/usb/dvb-usb/dibusb-mc-common.c b/drivers/media/usb/dvb-usb/dibusb-mc-common.c
index b8cde4cded33..36bc7762acf4 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mc-common.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mc-common.c
@@ -8,6 +8,7 @@
 
 #include "dibusb.h"
 
+MODULE_DESCRIPTION("Common methods for DIB3000MC");
 MODULE_LICENSE("GPL");
 
 /* 3000MC/P stuff */

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-usb-dvb-usb-500010d64107


