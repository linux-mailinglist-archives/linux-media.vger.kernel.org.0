Return-Path: <linux-media+bounces-62706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NnXAJsWFGqFJgcAu9opvQ
	(envelope-from <linux-media+bounces-62706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:30:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB645C89BD
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A84D3022550
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1463E5EEF;
	Mon, 25 May 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AGjLrCBN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F902D77E6;
	Mon, 25 May 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701298; cv=none; b=Hr5VZbzjHoUegrhfEvcNh7CslMJSNPUl8iJPYg6ve67yZeyurJ88G9pqE4oJXa6PBJQb0dR5e9yWh2tAz88ojVDj/97kBEH5vZqKkYnO86ZFMAHl5KsImwq5ZMguBYjBcydJFYCbGoma89krT4kRueIWDbTGp4H2HziwHlmMkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701298; c=relaxed/simple;
	bh=MPo8QHjwE4jm7G3tCxLHiFaKJjtI78HznDljRZ/DBHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ech7W+aqg5adNI24V0WOs+dDNcwV9TLHFsJPEDvbv1pcqUvRjQkqVc/yDOpxJWSGuOfaK6RnDHd0QTQvuGmyBo8sIsHVvciVHdZnczQAEUOcu4WxilgbkU4i/fMkNt2osoorjR0HTmiaCRhgWtsOr/+/XKzwJFHI9rLwjSoclRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AGjLrCBN; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb4bd637;
	Mon, 25 May 2026 17:23:01 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: chehab@kernel.org
Cc: kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: mantis: fix memory leak in hopper_pci_probe()
Date: Mon, 25 May 2026 17:22:31 +0800
Message-Id: <20260525092231.815099-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e71dd0403a2kunme0340fb0a9b67
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaShhMVhkZSxlNHx1PTkhKGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=AGjLrCBN0A0C3TNaSEgzVtUepeIdMtjB8P1kxfcZ8aGRejXR7ESVDUgN1Ul7rEIjy4vILrT2s8pg7XtfJCDfiFRs0tJwiIAnCFKiLu3+1tEh3Rvlzzqu3fPi5z85MkYYeymyh+gnFT80jp8Js3Gq9DwP/l8cyUlJq1bHWcxuU7Y=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=rERlZ1mfSkCbBOzn0q/OTZ9yjJk5rhyqg8nOj0+onTE=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62706-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,seu.edu.cn:mid,seu.edu.cn:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2EB645C89BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In hopper_pci_probe(), two probe-error paths jump to the wrong cleanup
stage. If mantis_get_mac() fails after mantis_i2c_init() succeeds, the
function skips mantis_i2c_exit() and leaves the I2C adapter registered.
If mantis_stream_control() fails after mantis_pci_init() succeeds, the
function frees the mantis structure without undoing the PCI setup.

Route the affected error paths to the correct cleanup labels so that
hopper_pci_probe() releases resources in reverse order, matching the
cleanup flow already used by mantis_pci_probe().

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc5.

An x86_64 allyesconfig build showed no new warnings. As we do
not have a Twinhan VP-3028 DVB-T board to test with, no runtime
testing was able to be performed.

Fixes: b3b961448f702 ("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper devices into the PCI ID list")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/pci/mantis/hopper_cards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
index 050068308c10..b55543054727 100644
--- a/drivers/media/pci/mantis/hopper_cards.c
+++ b/drivers/media/pci/mantis/hopper_cards.c
@@ -175,7 +175,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	err = mantis_stream_control(mantis, STREAM_TO_HIF);
 	if (err < 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis stream control failed <%d>", err);
-		goto fail1;
+		goto fail2;
 	}
 
 	err = mantis_i2c_init(mantis);
@@ -187,7 +187,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	err = mantis_get_mac(mantis);
 	if (err < 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis MAC address read failed <%d>", err);
-		goto fail2;
+		goto fail3;
 	}
 
 	err = mantis_dma_init(mantis);
-- 
2.34.1


