Return-Path: <linux-media+bounces-12971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9239047F4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 02:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0D01C21DE8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 00:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FEC139F;
	Wed, 12 Jun 2024 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PAyJ1lYt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAD19E;
	Wed, 12 Jun 2024 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718151278; cv=none; b=jMtZYDDHi7yOEGUkyauk3KdeFB8MIpS0gyCqtdwQtxhdpE75pAxJCekP9Hl/S5/7QGHdNwikAm2XlBsn14aYfFYNO6NsY1X64jfpiW7sIjQOjsBRFiyxh/ix3qwwYjeNxzvY306vbIjRfiw6HZADBVlIV/RNKO5RM7ltHr9yInc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718151278; c=relaxed/simple;
	bh=IZr7QRveOKL3tu6IoV0AklDzz44bddBBRIe7BITpl10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Vml/33PYQANXlvo/E8K60XiZMjhBLN6mL9teE8Ar4SNFzQXolvRvuLcKlTjwI5eciwN0k/6TXtBOSDKb6XZq3KnlhRHMUaSBq++2VOCkeiRXmlVJyA8vDZl6MdpKhJzpJzI8/Q2n52ZB3tbZ64njKMgrvf12S6HZwCD2TW9Y0TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PAyJ1lYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BKCWq0016951;
	Wed, 12 Jun 2024 00:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/jea14BomjzvVQ6nDe5eKZ
	4w53YtJ0scYOqNjbRi+ig=; b=PAyJ1lYtwHMHjnxRkMfjDtVoTvTk3sfgF3mpXO
	XB48WMkACkPFX98fmB1DK0aQtSYZWEMn3NS5uDzYFFDoznoMl0JT/IoS3idaQFjX
	5u3BW98WPWIsfk9sQULRCFjZiiH2NGwpQ9fzNFjm/2YtFl8Htwl156hNBGDSgfRV
	UQ7rtGcZia6YBLiAocvRCYGLU3LIkzvLxwfNQnZEeBGoXJFvK4SaiPLk7SksD6KS
	ORjKXtBJfGyY1VchUgj+n78uBmGdat9h54HcIq0zVRenB6xHrWqTCXPYHSP6FBBr
	1Lm/VcilpKWGYdd91wBo+c0LLtrSQ1KUZDksz/g4KonyyvpQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjasws4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 00:14:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C0EV05032148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 00:14:32 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 17:14:31 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 17:14:30 -0700
Subject: [PATCH] media: pci: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-media-pci-v1-1-724e946158e4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGboaGYC/x3MwQqDMAyA4VeRnBew1U3Yq4wd0jbOgO0kcSKI7
 75ux+/w/wcYq7DBvTlAeROTd6lwlwbiROXFKKkafOv79uYc5oRJZWM1zJyEcImCXTdevY+hT0O
 Ami7Ko+z/7eNZHcgYg1KJ0282S/nsmMlWVjjPL4IGIwqFAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls
	<awalls@md.metrocast.net>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TXrVzJdcY7HehLRhe3wFGyxLdWvFnTcK
X-Proofpoint-ORIG-GUID: TXrVzJdcY7HehLRhe3wFGyxLdWvFnTcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_12,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=993
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110164

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/bt8xx/bt878.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ivtv/ivtvfb.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/pci/bt8xx/bt878.c       | 1 +
 drivers/media/pci/ivtv/ivtvfb.c       | 1 +
 drivers/media/pci/ttpci/budget-core.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 90972d6952f1..5c9ba4bfc1be 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -563,4 +563,5 @@ static void __exit bt878_cleanup_module(void)
 module_init(bt878_init_module);
 module_exit(bt878_cleanup_module);
 
+MODULE_DESCRIPTION("DVB/ATSC Support for bt878 based TV cards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 410477e3e621..f71a5914e042 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -104,6 +104,7 @@ MODULE_PARM_DESC(osd_xres,
 		 "\t\t\tdefault 640");
 
 MODULE_AUTHOR("Kevin Thayer, Chris Kennedy, Hans Verkuil, John Harvey, Ian Armstrong");
+MODULE_DESCRIPTION("Conexant cx23415 framebuffer support");
 MODULE_LICENSE("GPL");
 
 /* --------------------------------------------------------------------- */
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index d33adeca196f..6d41fc997655 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -602,4 +602,5 @@ void ttpci_budget_set_video_port(struct saa7146_dev *dev, int video_port)
 }
 EXPORT_SYMBOL_GPL(ttpci_budget_set_video_port);
 
+MODULE_DESCRIPTION("base driver for the SAA7146 based Budget DVB cards");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-md-drivers-media-pci-33f522cb4d7b


