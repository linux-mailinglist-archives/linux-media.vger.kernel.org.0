Return-Path: <linux-media+bounces-25740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAAA2B80A
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 02:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03FCA7A354E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 01:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B8317D346;
	Fri,  7 Feb 2025 01:39:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606C155345;
	Fri,  7 Feb 2025 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892386; cv=none; b=Rnmm1GYUJIFao3Ea0jaK43jWCPFKeG41ndTBHAgEN1Sajz+GhDv1jJ8+Wsxph5O2vrnzlu+JqLqEHK1p8j7Kmeexe7KM8OObDT7ZRmrj8xpU11pKcAf+zsuJfeXqqaZMZ8WrwEy1BElL2Qj3HlJAT8MiZLnE1cT+hbj8A9gasb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892386; c=relaxed/simple;
	bh=p8oqDDtgBzQVcYulMD+72DyGGgTem1qPlS+4hciKRvc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GPEkUkJcQ9qodV8Xbd748UUcVpJqJjzPwNfTFORdlgx1K+CAu2kS6VCPwLRIeA7hNPyS0I2Ujcmr1m1CJCRbj7MkNioeKzc+OGXRlBVLMk2Nnn14Gd1B4dOWnFkSjknrfmnr2hrQ5tDvp8ZTp6/v+bdJXeDabBfX+hVjscxP2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YpxSb3dxzz1JJdX;
	Fri,  7 Feb 2025 09:38:23 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id C4B5D1400CA;
	Fri,  7 Feb 2025 09:39:40 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:38 +0800
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
Subject: [PATCH 0/9] Add wrapper function of_find_node_by_name_balanced()
Date: Fri, 7 Feb 2025 09:31:08 +0800
Message-ID: <20250207013117.104205-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
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

Add wrapper function of_find_node_by_name_balanced() for drivers who
want to call of_find_node_by_name() and have to blance the ref count
by calling of_node_get(). For drivers who forget to call of_node_get(),
can also utilizing of_find_node_by_name_balanced() to fix a refcount
leak.

Zhang Zekun (9):
  of: Add warpper function of_find_node_by_name_balanced()
  net: bcmasp: Add missing of_node_get() before of_find_node_by_name()
  net: pse-pd: Add missing of_node_get() before of_find_node_by_name()
  media: max9286: Use of_find_node_by_name_balanced() to find
    device_node
  powerpc: Use of_find_node_by_name_balanced() to find device_node
  net: dsa: Use of_find_node_by_name_balanced() to find device_node
  net: dsa: hellcreek: Use of_find_node_by_name_balanced() to find
    device_node
  net: prestera: Use of_find_node_by_name_balanced() to find device_node
  regulator: scmi: Use of_find_node_by_name_balanced() to find
    device_node

 arch/powerpc/platforms/powermac/pic.c                 | 4 +---
 drivers/media/i2c/max9286.c                           | 4 +---
 drivers/net/dsa/bcm_sf2.c                             | 4 +---
 drivers/net/dsa/hirschmann/hellcreek_ptp.c            | 3 +--
 drivers/net/ethernet/broadcom/asp2/bcmasp.c           | 2 +-
 drivers/net/ethernet/marvell/prestera/prestera_main.c | 3 +--
 drivers/net/pse-pd/tps23881.c                         | 2 +-
 drivers/regulator/scmi-regulator.c                    | 3 +--
 include/linux/of.h                                    | 5 +++++
 9 files changed, 13 insertions(+), 17 deletions(-)

-- 
2.22.0


