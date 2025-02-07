Return-Path: <linux-media+bounces-25746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56EA2B81D
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F5C67A27BB
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239818E75A;
	Fri,  7 Feb 2025 01:39:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB818DB25;
	Fri,  7 Feb 2025 01:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892395; cv=none; b=B/r2Ws3NS4BQy6D+msH3NTo7YXre7Dct+cqZr3uJTdkpqMoWbXzPi04DOUP/tAhzjEJmRU/znHbdWKRePZ1KfkPKQmGC9pfrYVWVuYklw73/9uMjzIhMN/6/FOjeR5dwRvmBONrayfE7uLUYRRwYLq2oTCNZ22jW3paVCzKaT+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892395; c=relaxed/simple;
	bh=RWDji7nxI5rW0g6JRYSQfn0BHhu60fQJen2q52Cy7Qg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2GvVTK7BEW+1ZS1tgYsXWwJENmRau2ZgMUhwmBr/CLtAN/+NirjgTRJz/o9d0qd7Eq2vYYFr//tm0QbfTSsTbJDD+8x+5a5GwjxP8ZlnrDOe9HLD+eWAb2a2b0jaBq7mlbmU9MFtw+XAFFSrcgzcQd/1PwlcBME6eaPr2QbvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YpxQT1ty7zgcbJ;
	Fri,  7 Feb 2025 09:36:33 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 73B881400DD;
	Fri,  7 Feb 2025 09:39:51 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:49 +0800
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
Subject: [PATCH 6/9] net: dsa: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:14 +0800
Message-ID: <20250207013117.104205-7-zhangzekun11@huawei.com>
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

Instead of directly using of_node_get() before of_find_node_by_name()
to balance the refcount of the device_node, using wraper function
of_find_node_by_name_balanced() to make code logic a bit simplier.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/net/dsa/bcm_sf2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index fa2bf3fa9019..7567686317f1 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1435,9 +1435,7 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 	set_bit(0, priv->cfp.used);
 	set_bit(0, priv->cfp.unique);
 
-	/* Balance of_node_put() done by of_find_node_by_name() */
-	of_node_get(dn);
-	ports = of_find_node_by_name(dn, "ports");
+	ports = of_find_node_by_name_balanced(dn, "ports");
 	if (ports) {
 		bcm_sf2_identify_ports(priv, ports);
 		of_node_put(ports);
-- 
2.22.0


