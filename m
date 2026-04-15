Return-Path: <linux-media+bounces-58822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBniNVum32miXAAAu9opvQ
	(envelope-from <linux-media+bounces-58822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:53:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE44058B5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E7B530D2C20
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D883D669F;
	Wed, 15 Apr 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="f+prQqq0"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C83A759E;
	Wed, 15 Apr 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264668; cv=none; b=LLhsK2rcapLNI5e4JGetKFvTxFoegWVDsH2Ui28/vkBTGEZs0QhhV2hWON/0vwQI1VnurJlAeGdsyxuuzBvQWBFEnAclH99HBxr1sxsUUtIl5DwaDGKJhPYABSb0/l605XIu1PiB8PoeIyexG5qj/B9wD/4K7kGYCs6Yi2iSpsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264668; c=relaxed/simple;
	bh=fbp5/keiovj/9xD/H+TTcsudSsltptN7IqfWBpWupMY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LRq/IBTti662BorKoLbZWje4YlTcjoB1N7NO/9cJngiFKyRps+oxgQYcqDJnOeds2+B6xq8ELKSaWhVShsXn2yGa9EZT9vJoWGxcG9gccZhKASLieuh3K7Yls61RHWsypgn9U6Jwjp2pd5Ek/p1wagmUEcY2zDUVNu+GuXk0Iyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=f+prQqq0; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1776264661; bh=z8Dvz5T3kUpp+yhU5o9z25OB6mynB3Denbc9oWW9cxs=;
	h=From:To:Cc:Subject:Date;
	b=f+prQqq0kqjQDZgIh9EMXCks2vBXOqK/0AX/MslWq6sbo8fUNF7B/ZOA0AVbcALgB
	 qmurawf6zxc/T2CSATsZKN9BbKvhl2lgHXiVt0IBwU+1t6mnM+soZ+VJdMyPmQ0b73
	 Un7y4i4Ng6tfl1CXDfYCFDsBbMDfQ9kXV37mYFio=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id C6E82AC8; Wed, 15 Apr 2026 22:49:46 +0800
X-QQ-mid: xmsmtpt1776264586tycy5xnqg
Message-ID: <tencent_FC6FCF5626EC3794CB35B87EAA37E614D107@qq.com>
X-QQ-XMAILINFO: NU1WwRH9AHfmX9Er4QddTnxkt4CTBRE6vMEcmGJDqtvIHOcR3ChNgdiP1qcIhk
	 X/E2XXKRvNV0bJYAIN4m64TfsUdjQU1O81zGa2fLaxIgu888Ur9n2NbFa4UZfVgxKha8+HD+HyBQ
	 57e/oehRcbEVNuRpWXeQPTculuvD+YrHqM+a9dOZTFz0iWsggWuqwG16lFQutifgfmpmg4ky8MWl
	 RfjGf0iEsGv/rZol2adNWCnhRKPM8Mbl6jkus5RXrtsJ7Fg3HEv7QobKdVOgx6qjplna76x8k0/m
	 iyRoc72p7N+NY0mgVLSR6gdnNQ3GgIDvuIYviCByEez2mWu+qnrww5aWb+l8CvSox0V1TTsuUgrH
	 nDcTxJCZcs9K3wxAzi585FyYrHBXQ/1rrgRxMKNFjCoSP8XWaDhSgTEHn/v+r30eoGTeb5F+LNrG
	 SLmEoGRV9KNh8GLlYG2Hutq18unwyFwXVIFVJRSM74ovwOw1F/CRyuDu6qMMc9uS3jL1RQAoNcij
	 QvmydqGuxIgY0kCdf+1T/kGv4BTGwtvPO/i+y1iXQKSUh5r/Q0cxC/8zI2IGPbNMbL93xMG7ic4u
	 4CAOL/M751sBBlCl3QmueSxwdo+YuicI3zbQdMENCrN94KujY8TbD3VaV3cgRTW6nN0bkTiQImL/
	 eB81+rmQcO+2cHMHoc0FZpsYJmp0iHRnuCrBbuhF0W5/LX8kmmH8o83jtMNGKO8TNVqV9/ndfGu2
	 0HKGNVVw9lUv320q431XFJ4odh+PKf4nVQZ9caIgeb39+SYHbGJJ1ePx0H3+V5axrDCAOULAbzsX
	 nkmI3/ijZB4rI46BOo/Ue26RNyU+dDiEHzczErTaXLJ+SJIKwkBI3VvgIXYUTMBbmXZwm6geTPXk
	 Tkqhuw0BkIUTgq/7oCU4hLOpOBd7B8Gv3x4/cuVZvR3bzDKlrWeprD32qVLEn9/r/qO9dxVcXUoD
	 Dl1bL5P/bc0IB/rP3w+cdo7RT9Z1XQH6tRXqmKuBITTze7TyGNtAK2yLtF4i6Zs/BgI/N25GpHHF
	 Wj40OsNVHSCtIkglAYrs4PhJf7dGtEtvXFriekZpsRVhtS1TSgAzFJ3d1NXMU=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhaoyang Yu <2426767509@qq.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	23120469@bjtu.edu.cn,
	gszhai@bjtu.edu.cn,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH 7/7] media: dm1105: fix missing error check for dma_alloc_coherent
Date: Wed, 15 Apr 2026 14:49:09 +0000
X-OQ-MSGID: <20260415144909.17143-1-2426767509@qq.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58822-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bjtu.edu.cn,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45DE44058B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The return value of dm1105_dma_map(), which handles DMA memory allocation,
is ignored in dm1105_hw_init(). If dma_alloc_coherent() fails, the driver
will proceed using a NULL pointer for DMA transfers, leading to a kernel
oops or invalid hardware access.

Fix this by checking the return value and propagating -ENOMEM on failure.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
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


