Return-Path: <linux-media+bounces-29466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC1A7D86B
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256B7188A49F
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 08:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F19211460;
	Mon,  7 Apr 2025 08:48:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274C1494CF;
	Mon,  7 Apr 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015729; cv=none; b=ec8uL3qvRs/1cBnFtI2ChMBjr1RTNNrxhWMWMdYQHdZwuiiTUFz1RliHQ4ufNDZK4MFFx+z1ADIw8d2a3NkkRrO49tRQpIuE974HvkR4ZHF54x/BCYqYfYr7UGkebwWRao0tZR1I5hy9VSCqAkGUj0FZimzGjzPrZDxh7AvO1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015729; c=relaxed/simple;
	bh=luREjr45DmDHTSqV9QeUeah3Z+3Q/L6fbDvsf7+D8ZE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YP+3LdUKW4j2iomQMYBF9pWcNnqHu3DvCMLgTXmGmoJej1yLbJ+/1gOx28p/6R30fjmtxpLQGbLrAj9ydQrS2bjOy9NjhjsZgG+wOuUP8YMg6ySYR8TTlWdrNhp8LBZnbXIyBajE/zRaBZ1sEybgQxImNh1stUFO5bPTFjlUDG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201606.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202504071648320168;
        Mon, 07 Apr 2025 16:48:32 +0800
Received: from locahost.localdomain.com (10.94.5.217) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.39; Mon, 7 Apr 2025 16:48:32 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <ming.qian@nxp.com>, <eagle.zhou@nxp.com>, <mchehab@kernel.org>,
	<hverkuil@xs4all.nl>, <shijie.qin@nxp.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] media: amphion: fix potential NULL deref in vpu_core_parse_dt
Date: Mon, 7 Apr 2025 16:48:29 +0800
Message-ID: <20250407084829.5755-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 2025407164832fcf69a48f1761b365315a19c3c557e9b
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

memremap()  may return a NULL pointer, dereferencing it
without NULL check may lead to NULL dereference.
Add a NULL check for core->fw.virt and core->rpc.virt.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/media/platform/amphion/vpu_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 8df85c14ab3f..7ad27051aaa9 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -587,6 +587,16 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 
 	core->fw.virt = memremap(core->fw.phys, core->fw.length, MEMREMAP_WC);
 	core->rpc.virt = memremap(core->rpc.phys, core->rpc.length, MEMREMAP_WC);
+	if (!core->fw.virt || !core->rpc.virt) {
+		dev_err(core->dev, "memremap error\n");
+		if (core->fw.virt)
+			memunmap(core->fw.virt);
+		if (core->rpc.virt)
+			memunmap(core->rpc.virt);
+		of_node_put(node);
+		return -ENOMEM;
+	}
+
 	memset(core->rpc.virt, 0, core->rpc.length);
 
 	ret = vpu_iface_check_memory_region(core, core->rpc.phys, core->rpc.length);
-- 
2.43.0


