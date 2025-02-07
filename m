Return-Path: <linux-media+bounces-25742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC85A2B80E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7A1C188961B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A506188A0C;
	Fri,  7 Feb 2025 01:39:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E101632F3;
	Fri,  7 Feb 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892390; cv=none; b=V5aiWpqZTf34JflZPfINgBczuJBtomXMy6iltSmyxOW6K9yc38ie6A+qfc5stP4+Trj7aAbO+iEqc54MYSaycV+BfsFHYUn03nvegI5bwz4eUFoK6u4+0QNSESE1635kTbjC8vIfjdbCBe+BmuQplV4jzcbJgZU6GLa2VbVl8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892390; c=relaxed/simple;
	bh=DGDeZI5Y519XLRmyvGBhMCPLk42GyCZ5Apcu0CIUCNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bC++Mcffn/h7M6PCtK0KuiMtv1FVBdQMBC1DhrVb/D+/C2HLODKGZcI30v0mSBW7ah1slAWlN9Rv1fmRZYcjhfEFFoxUwZNnxG6A6u6AiuDabKsg8F5PkVhhq5FfqbJ7xmo0xeyjRgkEH3ZWVk0jwqx+QDvqeKHgS+A268p0/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YpxPx2CKLz2Fd0Z;
	Fri,  7 Feb 2025 09:36:05 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 579D2180216;
	Fri,  7 Feb 2025 09:39:44 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:42 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH 2/9] net: bcmasp: Add missing of_node_get() before of_find_node_by_name()
Date: Fri, 7 Feb 2025 09:31:10 +0800
Message-ID: <20250207013117.104205-3-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250207013117.104205-1-zhangzekun11@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

of_find_node_by_name() will decrease the refcount of the device_node.
So, get the device_node before passing to it.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index a68fab1b05f0..093c8ea72af9 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1367,7 +1367,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 	bcmasp_core_init(priv);
 	bcmasp_core_init_filters(priv);
 
-	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
+	ports_node = of_find_node_by_name_balanced(dev->of_node, "ethernet-ports");
 	if (!ports_node) {
 		dev_warn(dev, "No ports found\n");
 		return -EINVAL;
-- 
2.22.0


