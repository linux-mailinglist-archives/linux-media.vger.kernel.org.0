Return-Path: <linux-media+bounces-12791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491890185F
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 23:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A81728116C
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 21:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4756B54662;
	Sun,  9 Jun 2024 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N1qgJlIg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5415B3;
	Sun,  9 Jun 2024 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717970303; cv=none; b=g81efY0jfeeTmL1g2J2i4uZNOwLw7E73a/osyXehJCU8IUXMxuiw4WZAn9l7/+hB0dxBtYYX6BJmKU2NS8CGcYpCBYL+9vgly11jo60gnl4YW2jH9c2eSJ2q3WtXiobKmH92z5fOMFabtdadBBue9OgdD6ajuyTIdHp0ukas8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717970303; c=relaxed/simple;
	bh=wrmf7nQafpJR6HI3SMheOheaSImeKAI4rYO9BfKRNks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uK8rMOwipgmsWkg+xvh+djTm+ZWJgVmoDPS0Nc8P0cHo+RdTwat0uFRxsbxT/vJ+kC701M8kB3wxf97IJ95PCBBYUvXAD3s9i7lOsRPvJhQW8x0gE/Wf6V81VhB/bB8vEgqdNsf09IDajGEC0MEFJQT0i4ifcfPhwzimXOLRMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N1qgJlIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459Ki6XT027125;
	Sun, 9 Jun 2024 21:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Geie8OwuMJG6PiGVP/N7mQ
	scxmIur4X/0gDMW8lBPF4=; b=N1qgJlIgiTvcnqT5xg5WONCGeKQCtcAywAo/uu
	5mX/eNouVBXmjbd8jq6uL9PfkTITsL7CaPc6v7svyth9DOz7vHG1p8wKlB+zyzMU
	bywxS7viixThqLGUVminDyZ25ZuBVwuoNXbFv60QLmA+js1/YneFN4PoY4iE5NHm
	vd3hiR+aL9E8Ey8i/0YFTGmLL5er6TFDyqhl9Cke+vzCK6FqXBN8w72qB007N2F2
	zKCWfOYzG8FeSyOQ2Tjg6ygBlwX354q7umxBEUL/lMUEBPTpMTXRVyISE4/IoAA/
	44ZLcF8FnW3uZA+OxJiO9+XVuSEL8eKtCMYAzBjjh85nfHIg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh32gpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 21:58:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459LwEAU019770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 21:58:14 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 14:58:07 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 14:58:06 -0700
Subject: [PATCH] media: saa7134: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-media-pci-saa7134-v1-1-ec0a8b70b404@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAG0lZmYC/x3MTQqDMBBA4avIrDuQaPp7Felikox1oKYy04og3
 r1p4W2+zdvAWIUNbs0GyouYvEqFPzSQRioPRsnV0Lo2uJO74pQxqyyshhNnIZyToBGdfRdwiF2
 uHS/BJ6iLWXmQ9b/v79WRjDEqlTT+pk8pnxUnsjcr7PsXMtnhfo0AAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hJO0-AEjbSVkOx5IN1rs0t8rjTY9y5CY
X-Proofpoint-GUID: hJO0-AEjbSVkOx5IN1rs0t8rjTY9y5CY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_17,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=807 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090173

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-empress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-go7007.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-alsa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-dvb.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/pci/saa7134/saa7134-alsa.c    | 1 +
 drivers/media/pci/saa7134/saa7134-dvb.c     | 1 +
 drivers/media/pci/saa7134/saa7134-empress.c | 1 +
 drivers/media/pci/saa7134/saa7134-go7007.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index dd2236c5c4a1..f86a44dfe6e3 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1254,5 +1254,6 @@ static void saa7134_alsa_exit(void)
 /* We initialize this late, to make sure the sound system is up and running */
 late_initcall(saa7134_alsa_init);
 module_exit(saa7134_alsa_exit);
+MODULE_DESCRIPTION("Philips SAA7134 DMA audio support");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ricardo Cerqueira");
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index 9c6cfef03331..555d2eff9370 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -52,6 +52,7 @@
 #include "s5h1411.h"
 
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
+MODULE_DESCRIPTION("DVB/ATSC Support for saa7134 based TV cards");
 MODULE_LICENSE("GPL");
 
 static unsigned int antenna_pwr;
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 434fa1ee1c33..bbf480ab31ca 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -19,6 +19,7 @@
 /* ------------------------------------------------------------------ */
 
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
+MODULE_DESCRIPTION("Philips SAA7134 empress support");
 MODULE_LICENSE("GPL");
 
 static unsigned int empress_nr[] = {[0 ... (SAA7134_MAXBOARDS - 1)] = UNSET };
diff --git a/drivers/media/pci/saa7134/saa7134-go7007.c b/drivers/media/pci/saa7134/saa7134-go7007.c
index da83893ffee9..bd37db5ce363 100644
--- a/drivers/media/pci/saa7134/saa7134-go7007.c
+++ b/drivers/media/pci/saa7134/saa7134-go7007.c
@@ -516,4 +516,5 @@ static void __exit saa7134_go7007_mod_cleanup(void)
 module_init(saa7134_go7007_mod_init);
 module_exit(saa7134_go7007_mod_cleanup);
 
+MODULE_DESCRIPTION("go7007 support for saa7134 based TV cards");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-media-pci-saa7134-fb3db3d5841c


