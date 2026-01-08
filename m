Return-Path: <linux-media+bounces-50252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E7D05FF4
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 21:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8338302A7AF
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 20:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E8232D42B;
	Thu,  8 Jan 2026 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNykH8i+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5843101BF;
	Thu,  8 Jan 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903056; cv=none; b=ff1lI40cmMUn9n0vBFiQ4evd8RjV9Wix5HtZhCSZhJpqCtgVivf5eXS+paDXRPFwu1N+/1V1xkhJPp9yCKDnVkwQu8BHI9+5edVHfXCD3gL6QyiqaBibqWKaIFdnwIpIkkDo6rbd34rwIDXD3ZlkiSL0Rz7z1KEVdFg+CezPjXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903056; c=relaxed/simple;
	bh=RMfV9b+DAX0amlCOIjcjIC2wo+5TdsJChTlPQU1feQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sh7eSlC8cSeCOmqEa4i+AWbIsGTky/50WlpHHa7679e/d72WPF9563j79z2q9qAQWPnA5uopvho9Ij9smc4PMwXRgdFfXEnftID9nzc89DXbAfLR15F+CFae7IrsMMMC16QW0SasU3zMj4uKs9vFmjMkU1d3Qg3XCvZYnjm4XeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNykH8i+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA49C16AAE;
	Thu,  8 Jan 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903056;
	bh=RMfV9b+DAX0amlCOIjcjIC2wo+5TdsJChTlPQU1feQo=;
	h=From:Date:Subject:To:Cc:From;
	b=hNykH8i+8fcVQ7HTWBcQR51XyTPW7BOEiNjrA5LJkNQWL6Ei0VIMHktv15MANNXK5
	 mmEn9xZfEB8zMiR9nGrA/vKe7ZCX234Tx0hPE5JdFC/h+lNINJDgix4R83ASo/oigT
	 9f+jlnGPh39onSOHT4GvAlVwySYSlCnlsw6PdEvJT2XtdEwOeCCvWKilHYYTG1Ilmn
	 l2DhrpRuhSZe0rnxh45T7C9O3x7278K81LjlSfTbCPzlLcouMZ5F3d2i+OFezNFaXu
	 738GuwtVd6toKHJVswlloCMjKFErXF/A0MIagFaUpmRXs0BJHSQDWjPVpyRZ1mc0Rv
	 9do6atueBVBfg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 08 Jan 2026 20:08:47 +0000
Subject: [PATCH] media: synopsys: hdmirx: support use with sleeping GPIOs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM8OYGkC/yXNQQrCMBCF4auUWTuQBizVq4iLZDJtR2wSMiotp
 Xdv1OUHj/9toFyEFa7NBoU/opJiRXtqgCYXR0YJ1WCN7Uxrepw5iENdY8q6Kk5hlrLgIAuOWRK
 Si/pkzhgu1Puz7ch5hlrLhevo93S7/61v/2B6ffOw7wfPmUsKiwAAAA==
X-Change-ID: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Aishwarya.TCV@arm.com, 
 Robin.Murphy@arm.com, linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RMfV9b+DAX0amlCOIjcjIC2wo+5TdsJChTlPQU1feQo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpYA9LqC9OFLEUSTbCmmCbzCXF/GM9xmmJWMckK
 5w2euJbRA+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaWAPSwAKCRAk1otyXVSH
 0FlsB/9KHcObLLrD8rcqnmlipdnzefg6yU7vjoSgc8i0CPAtK4nZ1ubKEgpwWcBEzdFDfcjGERZ
 dEnlVuWp4eQ5bLnb1wGjliS0FEjJiJG5Y8WIeJcTK0BXxxrcEFt03FQe8k5qTkjHAK6UR0Kv1+6
 UdU/CzmTdjYFCXNIMD3u1ssJml11zGpRTaI0fd0AhuLJ6mB5C7vx+yCdqmih+7wtViQK23O3j8a
 zf7yLGIqFYIuQQzDn9IfwGMI1Y+DCaPFZ//gcKxRxm/LIzoCoObR3AUcXcD9u3lOjOPjxuqMjAo
 o/Sm3GUN1ssLAnGaL/T6heYjg+VpXzDDMbXiSdoV1Yb8meWG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index c3007e09bc9f..1eaa25efee21 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -230,7 +230,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 
 	for (i = 0; i < 10; i++) {
 		usleep_range(1000, 1100);
-		val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
+		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
 		if (val > 0)
 			cnt++;
 		if (cnt >= detection_threshold)
@@ -2204,10 +2204,6 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
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
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe

Best regards,
--  
Mark Brown <broonie@kernel.org>


