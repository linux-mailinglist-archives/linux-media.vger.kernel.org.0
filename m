Return-Path: <linux-media+bounces-54013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCopKq9npGlcfgUAu9opvQ
	(envelope-from <linux-media+bounces-54013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 17:22:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 495301D0996
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 17:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BAF1301DAF6
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 16:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A49932AADE;
	Sun,  1 Mar 2026 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="f6KVdx4g"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3835898;
	Sun,  1 Mar 2026 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772381946; cv=none; b=U0Li8vGTGVzbUrN0s+ZE2NkCYF5AnGE98SSZJM4wYuYl1+01EDoT67p6gaDwIHsFQs0LDuJFs3DMwbnvU+nwIFUOmp/SWJOq/Uti4kKnzuEGBM3mbT1xRdSkiflRGKoft62u2MBAG/G/pHygQ/GN3RHeL9l8psCVAEh+enmUtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772381946; c=relaxed/simple;
	bh=5yuS5D2GHI72hmBDy2FnZlO1xF2YklbN9kEZHI8kakU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XK6soICSwEjYf8bLXqt51RQa+Npn6cae9G4ZPk82OHGBDbzk+wiK5wQq1hf5bzYsBIxcO+sJpVM00IA+FBlfsU5wfXbKAXeLf+0t64PSgd1AfjBpcYPJuuPqEVu6bPSEX0I+8HsHVmodRqn2sNjEPaXMhp/4R13iX4gh+oO/Xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=f6KVdx4g; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772381939; bh=5liPz02K/lYoLFf1mUMxvj4T0v/e7rdsEUFCIuzEG0s=;
	h=From:To:Cc:Subject:Date;
	b=f6KVdx4gYAYfZLto6SEQyJam876MjZ7P4rbQnNNco/b7+2aDUlsyNMHDjBhVT6uQC
	 ecl7jArbOXRx1YbkaPXJdVc3u6tPXKBszw6JgsqWAQP/il7IVV+KRUe7lVAqcRFAjY
	 K0m8paZw6R8qXtWPDmDXNJPUtQeE56gw5PShOXRw=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 4B8274F8; Mon, 02 Mar 2026 00:18:56 +0800
X-QQ-mid: xmsmtpt1772381936tjjb1lzzu
Message-ID: <tencent_416C0B949035FA7EF2B7F614AFEFC0D64807@qq.com>
X-QQ-XMAILINFO: MJf32pulH481em/5h9D47rkL+37KUrbISGmIWj/owSIF7ixbNkHqy6/UnHNWk1
	 Br+U9A8s+islJ6EOlSu1DFZVDIb6i/0K8mWQBB5ekdU07rm01+5kUyhxYViVXUDIBGSm4+1HXPM+
	 ae0A/yQ0c8dX4ax2Rp7kLVtJxL0fPXIfiIhv/EEFBItEU/twF1XduH3h2Jbjwt/Ix8dN+lIXb94C
	 83tMcIFYiLtZBBIpsoNfaOzPw6iTdUQxddwxXhUXgq1ot8nrr98mtUkbXXXoODiElfHllPT7hfrj
	 nQ27loWW1tt3vHVpj8h59kjhMb5SEsj6LvyEAPMxuw9DKiWQz++3qlkuyDozp7X+XswqVLvTZ98b
	 mbZwyGRIMA+RazxIVqH3A46HY6R2UTZfU8MoveKodoCkCjp3PZGVgLvEy7L2NqvmLF6C2o95PS08
	 yaaEWMkMCWofzHuDpDYMAOskfQumWCvvWk63YVCx0fIez0JQj7yzid0K6w6+WawtZqtfWyCqPWuM
	 nn3mwCDX614jdYnGFprV8oepbHdVYguV3uF3O0MGJfrR2/6AXA0doGORRrO78PT4auWWzIbrdgtm
	 9lt65xqlVe6FNPB6Wh8J8yyx9tAQLFNxdsYvkZ0UvM6mRGI4a0V8cLXi0Yvru+hZA1bjRJZTjTQl
	 81DASkGyIJSOQGPYJfNfGLmgevfFWN+XSBTOog06GKqBoi6Eo4I/nIj9ZchxQmDw/Y+f1SH5NYqX
	 28tvnqLn8tjTbrFcyczZ2LSUtK752MWWKWOA/vQufofrM0AQLzytX2xieak9IsgzHEnz+Ebsa+3A
	 dCrX07gBjArMxbSfmDjNoqUIW6QgLTxozBrR5/X99igiAFGCFTQUCQzR7jHzkPFXd73tUj/gOhFN
	 JK0XoSfLUINLL874SRxOTaDw/P9pVn+kB903N2SmVq8xxS6v+z8/fO6WLyKq+lsfFDx3+0g8924n
	 LPFo+ThtvuOFGCxlqanCGVo6f19MW9DgW+DSBzSpKraX5/URwn+Fv004nqMxBSSJpFBCZgqpEUpl
	 9RcygpInzr1LQelPbtOIXmBTCH4qD980Xu4q6oj6+nW/GnvhHw4td0qllja+3nGF19c69cIg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zhaoyang Yu <2426767509@qq.com>
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] media: fimc: check return value of clk_enable in runtime_resume" -m "In fimc_runtime_resume(), the return value of clk_enable(fimc->clock[CLK_GATE]) was not checked. If enabling the clock fails, subsequent register accesses (fimc_hw_reset() and capture/m2m resume) may trigger a bus error or undefined behavior.
Date: Sun,  1 Mar 2026 16:18:54 +0000
X-OQ-MSGID: <20260301161854.266277-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.73 / 15.00];
	LONG_SUBJ(2.39)[319];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54013-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,vger.kernel.org,lists.infradead.org,qq.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qq.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[qq.com];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:mid,qq.com:dkim,qq.com:email]
X-Rspamd-Queue-Id: 495301D0996
X-Rspamd-Action: no action

Fix this by checking the return value. If clk_enable() fails, return the
error immediately, preventing unsafe hardware access.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 2c9edd0a559b..57e573949e54 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -1020,11 +1020,15 @@ static int fimc_probe(struct platform_device *pdev)
 static int fimc_runtime_resume(struct device *dev)
 {
 	struct fimc_dev *fimc =	dev_get_drvdata(dev);
+	int ret;
 
 	dbg("fimc%d: state: 0x%lx", fimc->id, fimc->state);
 
 	/* Enable clocks and perform basic initialization */
-	clk_enable(fimc->clock[CLK_GATE]);
+	ret = clk_enable(fimc->clock[CLK_GATE]);
+	if (ret)
+		return ret;
+
 	fimc_hw_reset(fimc);
 
 	/* Resume the capture or mem-to-mem device */
-- 
2.34.1


