Return-Path: <linux-media+bounces-53525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP5vFPxroGk3jgQAu9opvQ
	(envelope-from <linux-media+bounces-53525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 16:51:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F04451A91E7
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 16:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA67C315D116
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0098D40FDB7;
	Thu, 26 Feb 2026 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr/3mS0+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CFA40FD9A;
	Thu, 26 Feb 2026 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120269; cv=none; b=FAKEqA6N65KTc5v4SVxrU0LilLZkwh5LNlX/UY7m6Xe3MRHrJaK31cBFESPBaelt+4h8mkvVfCkLH6J+jPPGj5tMkAmbVVBzfSqBYftw6ligPmKhZad8VoiUJmZ4NkRx3diG8I2wtfFdR+7bKbYf7Qbb2w8xOPMOmZYUI4FtfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120269; c=relaxed/simple;
	bh=C9cutM8CujRzGryr0VhzDeF1Yuf3VLiPuRuXQp6148A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s3QokFoVPcacsLWCTQNzzpJDjokBKsu6bOrkmii0QXkoPeQj57XdAQ9vDNIOqu/818Gu65RDBJO6lAk5kc0ctA02JZAhEboFOOiNu4Jom22DNhzA9C6I1BZ+wnnbLyA+X0bb4wvFec/AGjC80udQ2dhxrPNyU+mpXuf/QI4zqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr/3mS0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056A3C116C6;
	Thu, 26 Feb 2026 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772120269;
	bh=C9cutM8CujRzGryr0VhzDeF1Yuf3VLiPuRuXQp6148A=;
	h=From:Date:Subject:To:Cc:From;
	b=pr/3mS0+1wpyS59808F9FGJo3pGGX6NY7VYGPTkIx37x6w+f9KYzzpGPP/9Yk5Nu4
	 y74uy4R4K2GKo32N69OM2MJ4ForrrJ/KB2w3XuHD3z4CZWe9nEV/phvBblkK545mey
	 8m6TYIOw3haoj3ceIa95UOQq89CssFe0E2NTw0omnP2C/NriG6bXm7WDBxQcc7ezQP
	 Ue6dxV+Wc4J+njnIfvN15JpvIcVSiDyECmmOM2n4XjtsWVOioxZVPDJATQME5wXugT
	 cCPJWun59WI9DmKgbxlmyejbnL5LsjvxL8Sn00PAwEAgQ0PAOFuC8c2/nee74LbVv7
	 GqXx+LAg+s05Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 15:37:36 +0000
Subject: [PATCH v2] media: synopsys: hdmirx: support use with sleeping
 GPIOs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-media-synopsys-hdmirx-fix-gpio-cansleep-v2-1-b3a7c627197d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL9ooGkC/5WOTQ6CMBBGr0K6dgzFgNWV9zAs+jPCKLakgwRCu
 LsFT+DyJS/f+xbBGAlZXLNFRByJKfgExSETttW+QSCXWBR5UeUyV/BGRxp49qHnmaF1b4oTPGi
 CpqcAVnvuEHtwF6tMWVRWGxRprY+YpL10r3/MH/NEO2zzm9ESDyHO+5VRbt7/1VGChFN5zkupn
 DLa3F4YPXbHEBtRr+v6BaJ2J0rxAAAA
X-Change-ID: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Aishwarya.TCV@arm.com, 
 Robin.Murphy@arm.com, linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719; i=broonie@kernel.org;
 h=from:subject:message-id; bh=C9cutM8CujRzGryr0VhzDeF1Yuf3VLiPuRuXQp6148A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoGjJhTk9oabCus+CEcFwpgFCuyT5cLjGB7Vpq
 xkMRlb0c8aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaBoyQAKCRAk1otyXVSH
 0IOBB/93d8A/eXXT1GE9eGwrocbAzdLZg3RJjdmCclITyilq9mkSv+yHtTwfeNW6X6YGdH+ei86
 dzbglctBP2G+Qtwh8b+xeMV3sOn75ngl3qrtA8jpDRA1GbfhI4TM3Wp9BWwKWHaDoJzGyGV3XCv
 pedgH8RogWhO+mo7GpY1LEELDQG4xPhQaxr0LmiGVJOrpFrNKa1PdR0Zqcf4u30MoC5DHZUmy/A
 /clOJYFHDPm/HUZkofSRDm88cq1EHObmFN4dTMnWGgDhbMW1tgTa7nELNqneG0JiySa8jcR2CVS
 D/jPJj6S4/IapdzfAECqgva8dG4+YK9n4hLpfoNkgYoWzEku
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53525-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sntech.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F04451A91E7
X-Rspamd-Action: no action

The recent change in 20cf2aed89ac (gpio: rockchip: mark the GPIO
controller as sleeping) to mark the rockchip GPIO driver as sleeping has
started triggering the warning at drivers/gpio/gpiolib.c:3523 indicating
that a sleepable GPIO was called via the non-sleeping APIs on the Rock 5B:

<4>[   14.699308] Call trace:
<4>[   14.699545]  gpiod_get_value+0x90/0x98 (P)
<4>[   14.699928]  tx_5v_power_present+0x44/0xd0 [synopsys_hdmirx]
<4>[   14.700446]  hdmirx_delayed_work_hotplug+0x34/0x128 [synopsys_hdmirx]
<4>[   14.701031]  process_one_work+0x14c/0x28c
<4>[   14.701405]  worker_thread+0x184/0x300
<4>[   14.701756]  kthread+0x11c/0x128
<4>[   14.702065]  ret_from_fork+0x10/0x20

Currently the active use of the GPIO is all done from process context so
can be simply converted to use gpiod_get_value_cansleep(). There is one use
of the GPIO from hard interrupt context but this is only done so the status
can be displayed in a debug print so can simply be deleted without any
functional effect.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rebase onto v7.0-rc1.
- Link to v1: https://patch.msgid.link/20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 9cceffa4ce25..61ad20b18b8d 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -232,7 +232,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 
 	for (i = 0; i < 10; i++) {
 		usleep_range(1000, 1100);
-		val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
+		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
 		if (val > 0)
 			cnt++;
 		if (cnt >= detection_threshold)
@@ -2252,10 +2252,6 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
-	u32 val;
-
-	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
-	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
 
 	queue_delayed_work(system_unbound_wq,
 			   &hdmirx_dev->delayed_work_hotplug,

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe

Best regards,
--  
Mark Brown <broonie@kernel.org>


