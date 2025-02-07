Return-Path: <linux-media+bounces-25747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E111A2B820
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5285D3A7F23
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51A014D43D;
	Fri,  7 Feb 2025 01:39:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93618DB25;
	Fri,  7 Feb 2025 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892398; cv=none; b=XsxcmzMzBN2saovaw4301z/73NrutyoUIPPS+q1oYNV6drkhjONewwO/5ingxoOADxNDA51KUXhESggxqu8Re/Bvq2Je/JHBMuBuM5HslvYCFNPw35vtlelZppxc9xhfmG8B6diFXhcFdJ/qWeiavG3zXKcyjm1lQS9sd3QwnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892398; c=relaxed/simple;
	bh=FJLMbXk2KC0si+MELnXdP1nMRRU5eMmkQQBTJn9ojhM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fn+060kgBqQMiWc5YpkXvcpdlpylZOzz9qbXYMrXNu7a4YBVb+RtFroEw03Fyzt3iTeRSILq9KXkrR28OPQXQomuFIwgLN9m3WJ70cL/WzZerTLNzY9JFvW9CmeMU/C9ieWJJiTVUAch6Ltvvb4MWxO4HOVM+hKk6MCtckdb8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YpxQL3PL4zbnrS;
	Fri,  7 Feb 2025 09:36:26 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E410140156;
	Fri,  7 Feb 2025 09:39:53 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:51 +0800
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
Subject: [PATCH 7/9] net: dsa: hellcreek: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:15 +0800
Message-ID: <20250207013117.104205-8-zhangzekun11@huawei.com>
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
 drivers/net/dsa/hirschmann/hellcreek_ptp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek_ptp.c b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
index bfe21f9f7dcd..360ceb6831ed 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_ptp.c
+++ b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
@@ -307,8 +307,7 @@ static int hellcreek_led_setup(struct hellcreek *hellcreek)
 	const char *label;
 	int ret = -EINVAL;
 
-	of_node_get(hellcreek->dev->of_node);
-	leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
+	leds = of_find_node_by_name_balanced(hellcreek->dev->of_node, "leds");
 	if (!leds) {
 		dev_err(hellcreek->dev, "No LEDs specified in device tree!\n");
 		return ret;
-- 
2.22.0


