Return-Path: <linux-media+bounces-25744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BAA2B815
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2B73A7C49
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8229418DB08;
	Fri,  7 Feb 2025 01:39:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B20155321;
	Fri,  7 Feb 2025 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892392; cv=none; b=FeQ46u+pH1JvmynyKho+1iBAPfhIUFjfiEoLXF/IEWxiXH9dm4k5wf6bMZQO80O86KlwNGSnXF9PKf9w7v17Z5BLzFTcCG+X/ofUt1PpQO8GFyT8bRSX2WGTBIwJjoOCh4HE19Rllj9QzDxoDsKEqQxFbOGxs7VetrvsgtV+UJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892392; c=relaxed/simple;
	bh=/GGtANNd5cLzkvKIyvN1qLWSDZMS54/eXiq311p8y3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6gNpi+PyeOGYfeVWusZFL+CjJ7bC4yH0/DykDfVXHlD2im3GZSqazDtc8kD6Rfw0K3wRiO4iuHEsKxQ0jgoWR+BuH/cepkKWSk9Ab8KGtZzSDFxh3gssjPMy3L9TD5+Mq12AaQcdnZscAj1JZAbkdYXoM8Fw1bhILthpD0XgYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YpxQ10YRMz1l0lp;
	Fri,  7 Feb 2025 09:36:09 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id E03DE1A0188;
	Fri,  7 Feb 2025 09:39:47 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:45 +0800
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
Subject: [PATCH 4/9] media: max9286: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:12 +0800
Message-ID: <20250207013117.104205-5-zhangzekun11@huawei.com>
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
 drivers/media/i2c/max9286.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273..0299d08a7196 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1399,9 +1399,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	u32 i2c_clk_freq = 105000;
 	unsigned int i;
 
-	/* Balance the of_node_put() performed by of_find_node_by_name(). */
-	of_node_get(dev->of_node);
-	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
+	i2c_mux = of_find_node_by_name_balanced(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
 		return -EINVAL;
-- 
2.22.0


