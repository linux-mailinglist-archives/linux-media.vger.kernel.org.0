Return-Path: <linux-media+bounces-58848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NwAACdv4GkwgwAAu9opvQ
	(envelope-from <linux-media+bounces-58848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:09:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 610ED40A43A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E9E330BF066
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 05:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44EF31E82A;
	Thu, 16 Apr 2026 05:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ctQj1vcK"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FE248F64;
	Thu, 16 Apr 2026 05:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776316172; cv=none; b=WtiWoFbNbq6985M0RUIKQu950Uqtf4ZLpqK52BYEJzA51rwruavrK7JxSdRFUTvMMbLgryk6QTPQOsCT94ucz/uaOsXtO6FHh7PWJ+Lb6pYMVrkYpbAeuNdyMfQL4X2yFy5n8kYLJroxtF791PHF6d1n3FExqjIXPEGBoPDb6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776316172; c=relaxed/simple;
	bh=K2+eWhmsz6XkqUJ3kBQrQxkdOCZGt514d3VW85S9m6s=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=JZbbsD8G3JPh1BMH4RYnH5LzZfDciRp73TgaqO1JPh7ESj2KPEB3L2IShN6zqoQuXZdQ7pB0aZgD1P2bV0aUtVEB5KmktuwW60kLNmQ5Lq+PollV5EG5VZu4WZ9DNzmH4ZyXgkYcsMI9JtWcxSCghA3vKHqxD5iwfsVMkfubUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ctQj1vcK; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1776316167; bh=FGTfg4NiKI2H3h/+oS/GRddK+k+Bt3Pm4LLw7vzDQC0=;
	h=From:To:Cc:Subject:Date;
	b=ctQj1vcK54hWBtHzwR4JY07/IuRQR96NWxIxK4biTGiVsTv6cYTTJr53VbMKSvlUf
	 4fHayvboDbFjnTceigGPO9GLRx/7+2tcsmPT/oy0lJR9yN3MPp8dXyc/p+BnMZiBzU
	 LMSj8opVcE6Z8ERMYHLyDuY8M3qZLh9Ndi8KYFBU=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 20F90A74; Thu, 16 Apr 2026 13:08:15 +0800
X-QQ-mid: xmsmtpt1776316095tgsp45xcx
Message-ID: <tencent_2F5A25B0AB50C4D77CFB3DDEA852BEBE6509@qq.com>
X-QQ-XMAILINFO: MeRnHSrEJzCrpeipDw3Yrs3N3QlXzgBXbd8YQp/ZtiEll22Dpp2ubyPRbCpXhz
	 uP+mRULiKHLRCaeisIu/sdUXKeZ/7+J5cN/DcwqGbtRH/LJAtuilxGDMYG0B3yC78Ig8E9v2Gnqu
	 igXre64np8j4KRABZcxcKvSekRL+/1g22g5ZNGUZa4f0tBpoO4KpZYTxTsUXINN0zEEph09t06AB
	 llcWYovNpY/n3NA7wOsm8yduwli+xcHoi1HtpGb4ZVr2oJPBClje3FqLFugXxZL6i3sK2xRudGU4
	 rcQGGtMBeEkRutJ8SkMsb150F/xg15MS3Dh8DiTpSHUTksx9EXQt5QmRO9HfUOviNJ+JvvOtNdwh
	 5hsq/Tn0+l7nHhkfFg8pqGoXr8qxq9jt7LAVFixSgYyG7yEWU/ClhpQ9CDXmYuk9txq1BCudB+K+
	 ZkPClmC0fHF5iDppWnqslI190D7p8HrpzZdQKJal8T+tW8E5JMYQgGu+jbOx0jPr3YZyIUgFy91F
	 BCcSaHqIgk7xNoK7CyLDcwrq69hvR+yv1+KiVl7EISzqm37Ads6epOkWGy1JfUp4liAglifLcPoH
	 k9+VI9tXBU0WqTabSx7DJs0hGINgm1KL1gR3ecm4dFWbRC1/YSsb3s3vuvDM0lwbIkDCdhCBx5Px
	 /OI8TjO98+Dhcyqzi7TGR6BwN+cA4vzMS5uMV/YoVaBCntc/oPNc6Nq7TMtdAfzTYRw+/yjMOw2d
	 uTDAp+AkDd0DTZ8IRIC50oa0ssHkLv9wftaJWxkZNenRXPXrk1nop0jB1I5/tBVbVYQERoyHP7uj
	 eR0uMo9anD7XL594IkSQaXsr981VOgPaVY7cofje4d8cgHw7J+5yD8BgZsyU2qhX/eoTEqKepn7j
	 m8ko0DpM98dEJjsj2dn0MQspGRbLQ1dXBrpMR2yYMhWMNKxaaUgD0scfr2t67UYuWZIok0RfVjOy
	 IoFS9ck2fbaPOVh/4VjNhPNDTqbSovDpsr75AzaHST7Yf2omQ3V7CoagqdKQwz+xyURseqMgS9v4
	 g/kxAWyEUeOAovzwLpH37kXPwwMqf8APKDW4iCsffmr12CGFNL
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	23120469@bjtu.edu.cn,
	gszhai@bjtu.edu.cn,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH v2] media: dm1105: fix missing error check for dma_alloc_coherent
Date: Thu, 16 Apr 2026 05:07:39 +0000
X-OQ-MSGID: <20260416050739.19902-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_FROM(0.00)[bounces-58848-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qq.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bjtu.edu.cn,qq.com];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:email,qq.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 610ED40A43A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The return value of dm1105_dma_map(), which handles DMA memory allocation,
is ignored in dm1105_hw_init(). If dma_alloc_coherent() fails, the driver
will proceed using a NULL pointer for DMA transfers, leading to a kernel
oops or invalid hardware access.

Fix this by checking the return value and propagating -ENOMEM on failure.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
v2:
- Remove series numbering.
---
 drivers/media/pci/dm1105/dm1105.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index 9e9c7c071acc..c881802423f5 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -767,6 +767,8 @@ static void dm1105_ir_exit(struct dm1105_dev *dm1105)
 
 static int dm1105_hw_init(struct dm1105_dev *dev)
 {
+	int ret;
+
 	dm1105_disable_irqs(dev);
 
 	dm_writeb(DM1105_HOST_CTR, 0);
@@ -777,7 +779,10 @@ static int dm1105_hw_init(struct dm1105_dev *dev)
 	dm_writew(DM1105_TSCTR, 0xc10a);
 
 	/* map DMA and set address */
-	dm1105_dma_map(dev);
+	ret = dm1105_dma_map(dev);
+	if (ret)
+		return -ENOMEM;
+
 	dm1105_set_dma_addr(dev);
 	/* big buffer */
 	dm_writel(DM1105_RLEN, 5 * DM1105_DMA_BYTES);
-- 
2.34.1


