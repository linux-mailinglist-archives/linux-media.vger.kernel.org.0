Return-Path: <linux-media+bounces-54108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP2TIorApWknFgAAu9opvQ
	(envelope-from <linux-media+bounces-54108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:53:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F11DD48C
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2F5E306E160
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 16:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28082FE58F;
	Mon,  2 Mar 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR7nYK4+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5D2E6CAB;
	Mon,  2 Mar 2026 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469160; cv=none; b=cDH8ydv3Pj2l8UaEdVSqFWpfZxh9p22sDmB7OLwa0VwShLeTxBSnuTlcfdvNrjAgmbvsQX71VH8mDXF/rV2vQwSwMzIZDXc6+1yFAJ5SKMcSzg4OR4Bvb+HLrcaObO+9fKnaeBMNDsGnQwg1IxA/IObA42Sr8JtCZkVCg335X3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469160; c=relaxed/simple;
	bh=uIsEMsjITYaavmQlYPfoJndu6G4JapEyVrRuWlfgfMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T+tQRpO5lKeXc2SHKU4cXQg2hVEtQGQvh0xP6kVkD6A3sXKLXi8EJ2FMkAB/J+92sfp0AfP7XBvyex7y4a2nnFVeva6lqQX+hPD2LPBvukoKeGzlU8NdvNtXUkMe1PCvlg5OT2VxOhtift/LkczmNnBOfEZI0ROfUvAc8Y+fCCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR7nYK4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80E5C2BC86;
	Mon,  2 Mar 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469159;
	bh=uIsEMsjITYaavmQlYPfoJndu6G4JapEyVrRuWlfgfMc=;
	h=From:Date:Subject:To:Cc:From;
	b=LR7nYK4+fRNhsJKs5LeM+3RU59/2/PbjXM2Re44Hp0DApKc+nvdqJOyAVmMIQ1oiM
	 UxJrKZf/P62OZiTi8iiJiUcgNKlHgy9WYxU1m8G0AFV2vT5Cu8ugfVeg3UfADm2vAb
	 a01en7/qu386r/4CeMRROIvtXFwwMaASqIF4sVuHhgS0fez/trHIciOcOwKP2IJbYN
	 4n3rGXS75r2h5qRhilSobQo++j35GRv5FWP7qXh2iewSOZ3q8fe/ll1QuIyFuozFtk
	 HVY1nxVG+T208DEjdsrdLVutG0m06HIsP0FOCeCqfntcxVSN+HNUjWJnZPIXLK6mhp
	 5ZS/8XTvwNumA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 16:32:18 +0000
Subject: [PATCH v3] media: synopsys: hdmirx: support use with sleeping
 GPIOs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-media-synopsys-hdmirx-fix-gpio-cansleep-v3-1-e4c3dbc19039@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJG7pWkC/5WOOQ7CMBBFrxK5ZlDsKBsV90AUXoZkWOzIAxERy
 t1xoEB0UD7p673/EIyRkMUme4iIIzEFn6BYZcL22ncI5BILlasql3kDF3SkgScfBp4YeneheIc
 D3aEbKIDVns+IA7jWNqZUldUGRbINEdPoVdrt38w3c0R7XfTLoie+hji9roxy2f1fHSVIKMo6L
 2XjGqPN9oTR43kdYieW7Kg+YqWq38UqiU2ha1upWra1+xLP8/wEJOmtvUoBAAA=
X-Change-ID: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Aishwarya.TCV@arm.com, 
 Robin.Murphy@arm.com, linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uIsEMsjITYaavmQlYPfoJndu6G4JapEyVrRuWlfgfMc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBppbukib7br87CPIge9smQWnSeuxora9M0FHXn6
 g8bR4MpnYeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaW7pAAKCRAk1otyXVSH
 0JlnB/0YnOXdQaq4HEkPKsifbzv0XmuLlxVSxxPsgVF4cGnc12a7Qa1GtTPYbVk/GIb5CWwVWA/
 A1N6IVQMnkcXAHSQ46becouoD8Y98/T5a6EwxMhEJRI45Hle4NPYvNopT4BFESC6pYcZWKjbYT5
 Q9vnf+pLI/P1PChjo+/o62BhnqHHLSUWhPon/82lOkqIw22U5ZPnpCatT13rMJAmPSu5pixlGxq
 rSBnGElKNQtErcAK8qmCj4bOyT4m0cIIt/AVHULAOktCDUSpdO6JfX6bV67nKYxN2C8GFj76vTx
 TxExZbOnPD0Onac9HgjWxqDt6Ej9WjEEEXdAvNhdA8KCIbfu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 650F11DD48C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54108-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email,msgid.link:url]
X-Rspamd-Action: no action

The recent change in commit 20cf2aed89ac ("gpio: rockchip: mark the GPIO
controller as sleeping") to mark the rockchip GPIO driver as sleeping
has started triggering the warning at drivers/gpio/gpiolib.c:3523
indicating that a sleepable GPIO was called via the non-sleeping APIs on
the Rock 5B:

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
Changes in v3:
- Shut up broken checkpatch noise in cover letter.
- Link to v2: https://patch.msgid.link/20260226-media-synopsys-hdmirx-fix-gpio-cansleep-v2-1-b3a7c627197d@kernel.org

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


