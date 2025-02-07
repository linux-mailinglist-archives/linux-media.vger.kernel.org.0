Return-Path: <linux-media+bounces-25741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEAA2B80B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1EB3A7BED
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F9A186E58;
	Fri,  7 Feb 2025 01:39:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9A13C80C;
	Fri,  7 Feb 2025 01:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892387; cv=none; b=IV+24djcLCYnt1dYAgejZjQHiiwQ4fXpvgY8JEFh4rtBJ61MQnq+zO1mRRljKBz8mMvBHG4keIlJeprEMkNmLzFnZ0xy/XNzbEl4G/mBMQnDS3FH2/XwaBbmQhuf1EjxXVjF2+eU26GMNcMyk1TeaGgox6ia5lhpKB5hnV3ienU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892387; c=relaxed/simple;
	bh=o0VB9aCkXoeWVuLjjF+y87XwF4Mnfj+g+UOEQ1+cBOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8b3aJVv+akL5vuKD1nBOvxw3ccqdDD5dNauGM3dbZltHsp4rwRkx84SOSjcmyKcim3mqf6IzYZxQnB6XjWe2AcYVbbFLf7LtboRhx6EM0SQqNHabWQVhfpVGqJvzYgoZc3GGXFtKvJY/JCnR8V4+yQb0JGIeHjiqsFLWh5PGbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YpxSG4vYwzrT0J;
	Fri,  7 Feb 2025 09:38:06 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EC5F1400DD;
	Fri,  7 Feb 2025 09:39:42 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:40 +0800
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
Subject: [PATCH 1/9] of: Add warpper function of_find_node_by_name_balanced()
Date: Fri, 7 Feb 2025 09:31:09 +0800
Message-ID: <20250207013117.104205-2-zhangzekun11@huawei.com>
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

There are many drivers use of_find_node_by_name() with a not-NULL
device_node pointer, and a number of callers would require a call to
of_node_get() before using it. There are also some drivers who forget
to call of_node_get() which would cause a ref count leak[1]. So, Add a
wraper function for of_find_node_by_name(), drivers may use this function
to call of_find_node_by_name() with the refcount already balanced.

[1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..b7c6d7ff278c 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -268,6 +268,11 @@ static inline const char *of_node_full_name(const struct device_node *np)
 #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
 extern struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name);
+static inline struct device_node *of_find_node_by_name_balanced(struct device_node *from,
+								const char *name)
+{
+	return of_find_node_by_name(of_node_get(from), name);
+}
 extern struct device_node *of_find_node_by_type(struct device_node *from,
 	const char *type);
 extern struct device_node *of_find_compatible_node(struct device_node *from,
-- 
2.22.0


