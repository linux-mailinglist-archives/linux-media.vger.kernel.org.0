Return-Path: <linux-media+bounces-64529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PHGQGIZIKmrklgMAu9opvQ
	(envelope-from <linux-media+bounces-64529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:32:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E58FB66E9C2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a97rLwiS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64529-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64529-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDB53301DECA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 05:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31293438A0;
	Thu, 11 Jun 2026 05:30:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF630E82D;
	Thu, 11 Jun 2026 05:30:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155810; cv=none; b=tQ/3bjMERhQ4+PlbhUd/TCgQy5cNmdQLmZmX206z4GdoBQgwmbAcoH7XcxcRIqREgq5vvhJA7D+ZyckHzGsxdtny3FT9GHRrSlp/MLOA5UtzNZ00r8jYOGWhNJPqjW7loE7f4o5kbciCNgqtUMVGDaVg1q4IL1O+0cu6VmU7qN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155810; c=relaxed/simple;
	bh=zPyDYXa6zGSFKayiHQHtfIPXQU2y4Rco+w2TGKlmhLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VEai1ZoT7VdS+lRhkBga9DBoZ2zVdo0JIeK31KlO6nh67XsgS97VkJHNmc2NwzaRBjFAQ2CiZmxX6XKv1gH4il9qlGL/Hslr+HRlMxNIgXrisFu0YdauwZYtnf8dX0PpybCwKuR5AOTytqlN0B8PT0lCL4cEvllsFHaap6kiqio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a97rLwiS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87711F00899;
	Thu, 11 Jun 2026 05:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155805;
	bh=VlUmGwE0ILPgOg+KpZs1mxPqeBRs9I2PikBa8crC90o=;
	h=From:Date:Subject:To:Cc;
	b=a97rLwiSf/wopPh1XUAO3MQnqZCbyeIzz8OVwoND7Lc8TZ5X10f15Uo3QHpxuT51u
	 s9U2ngqpgeoHDKUK002wtev5CqIq+4nSyH3+9DEHicAuDpfpDY65zKy8EbeVOnarnM
	 N3keGgZZFd0VIBOyhxiVi58AEwER/T2GB/yh41r0b4XC69hra8gdTB1T4G66GOW7ZS
	 LVaAHlR3Frl2vHbgZGlDi0rSdwaV2L8kiV7NofRmTlFT+L/cMYbNiTM0MMsWPkEQdu
	 MEXUJR8F4iYCzV5SnN3wC/uqDSNb5/Jk2VM2RlLzFUtrPDJHpDPr820OJTtmxzFICo
	 3oDGQAMaXsWwg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 11 Jun 2026 08:29:55 +0300
Subject: [PATCH v3] media: bcm2835-unicam: Fix log status runtime access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-bcmpipm-v3-1-c609dacb029f@kernel.org>
X-B4-Tracking: v=1; b=H4sIANJHKmoC/2WNyw6CMBQFf4V0bU0fUgor/8O4aMsFqvJIi42G8
 O+2uFDjcpIzcxbkwVnwqMoW5CBYb8chAt9lyHRqaAHbOjJihAmSM4q16Sc79ViYvJBQcMZLg+J
 6ctDYx1Y6nd/s7/oCZk56WnTWz6N7bleBpt1/NVBMMQetpKylJIf8eAU3wG0/uhalbGDfIvuIL
 IqK10oIo03ZkB9xXdcXx/qyHuoAAAA=
X-Change-ID: 20260521-bcmpipm-6c578e73239c
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3216; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=zPyDYXa6zGSFKayiHQHtfIPXQU2y4Rco+w2TGKlmhLs=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK03K92NnL93fC/x8y3t8BrT+aUBxzszr8cWucYfPzqv
 K/Q58mkjlIWBjEuBlkxRZZqk3+1wv073E+6WqrAzGFlAhnCwMUpABO5nMHIsG7zoq2HxM0zDzxq
 eKjwSfnkpg3LNY/+L9yamZKwPdl7cQPDf3fVv0zP/h/9+bh7xaVJ18yDHLv8p6Ts7lH8duqSnVQ
 pLx8A
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:dave.stevenson@raspberrypi.com,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:jeanmichel.hautbois@yoseli.org,m:naush@raspberrypi.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-64529-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E58FB66E9C2

When requesting log status, the block might be powered off, but registers
are being read.
Avoid reading the registers if the device is not resumed, thus also avoid
powering up the device just for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
Changes in v3:
- Changed to check return value of pm_runtime_get_if_active() and only call
  pm_runtime_put() if the device is active.
- Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org

Changes in v2:
- changed to use pm_runtime_get_if_active()
- add corresponding put()
- Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org

To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..96b51e29bba4 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
 	struct unicam_node *node = video_drvdata(file);
 	struct unicam_device *unicam = node->dev;
 	u32 reg;
+	int pm_active;
 
 	/* status for sub devices */
 	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
@@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	pm_active = pm_runtime_get_if_active(unicam->dev);
+	if (!pm_active) {
+		dev_info(unicam->dev,
+			 "Live data N/A due to device inactive\n");
+		return 0;
+	}
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),
@@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
 	dev_info(unicam->dev, "Write pointer:       %08x\n",
 		 unicam_reg_read(unicam, UNICAM_IBWP));
 
+	if (pm_active == 1)
+		pm_runtime_put(unicam->dev);
+
 	return 0;
 }
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


