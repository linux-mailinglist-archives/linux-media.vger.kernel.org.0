Return-Path: <linux-media+bounces-62629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOE/NbN6EGrdXwYAu9opvQ
	(envelope-from <linux-media+bounces-62629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:48:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB25B71F6
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F36D30793C5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 15:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F46747798C;
	Fri, 22 May 2026 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFXuh43R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66257477981;
	Fri, 22 May 2026 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463751; cv=none; b=EZLF/vWssHN8bp4qflYw+ywbtGkZKmNHhdKZCc6KWhXixVmb4wSg2GokkmINU0C5bZplewmGJSg274DG9WX6ROdGznym1IyXooGZKf4wj4IJChIHpPgOg6WhOZsaXRH7GVf8sllJfU7rv41TWpvNLtUCAICDqVojzvQLNBF5xLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463751; c=relaxed/simple;
	bh=PMJsP28V5hMlxYp4KcsWEmzsqIgDeoKx+jpa+dUb3Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SX5OtD5yfl7MbIBYYE/MLT/7bO/yLY4qcCkoxpOIgSbtsrU65CT8p04t3vxEP6jjoL3On6tS2aFiTdB0viI0C1B6T75s+IRZYNkaRUygYRqsVzqJhC0ciNsaOCjcpPEHsBu6g8co0L5PRbNYfiWWu8jfax0HHQXhEX3qEc4DMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFXuh43R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474A71F000E9;
	Fri, 22 May 2026 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779463748;
	bh=OFJS4E8ysH6VWoRSBHjAlfd82xpgU6b8hTLyq1WoytQ=;
	h=From:Date:Subject:To:Cc;
	b=JFXuh43RCVTyqtAbJLwWtRhXdlf4tNdvB981Iu34Wl9Fn8mrtL0eAASxRYj9Fji9i
	 bAeTmiIWZOy7TZqiw5hjnqSYaOL7ggNfbS2E/PzghqX2e+aY1Bpu7nfnKQMThkDXsF
	 CoCdJ1H1dS3wlA+t0QS3mznf9DzTHnsOgHCzdWMST4KEFE50gURlD94UU4AsNuRdzy
	 6InkLGsbNATFKAKI3/nNZFJThTZlQzaxrQM1AWmsix9uQHCglh9+vavtJfdAATbdme
	 uU8J18jlfpJs8pzhjwvdzAZ3iwqlkLOcPvaq7cey36rt3/p4YpuJ0TOWKWjXUtF+1H
	 Kmc1t83hkGsYg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Fri, 22 May 2026 18:28:50 +0300
Subject: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIADF2EGoC/2WNwQ6CMBAFf4Xs2RraWqic/A/DgZYVVoWSFomG8
 O+2ePQ4ybx5KwT0hAGqbAWPCwVyYwRxyMD2zdghozYyiFwUuRKcGTtMNA2ssKrUWEohzxaiPXm
 80XsvXesfh5e5o53TPBk9hdn5z3618OT9VxfOOJNoGq1brfOTujzQj/g8Ot9BvW3bFyy4khKxA
 AAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=PMJsP28V5hMlxYp4KcsWEmzsqIgDeoKx+jpa+dUb3Vs=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLIEyhxa7cVVn6y34sqx1F/sdioi/MbsV280nuwv3J7Mt
 LNi4lqXjlIWBjEuBlkxRZZqk3+1wv073E+6WqrAzGFlAhnCwMUpABOJO8LwT/3trrQvnHuWzS48
 GODw/mD3S2NRj6UtDq419Tu8nXPapjH8j5Yx3CnhHS314tncu8euGJ47/PLsB152u1qbVedXLNp
 mzwMA
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62629-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DDCB25B71F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When requesting log status, the block might be powered off, but registers
are being read.
Avoid reading the registers if the device is not resumed, thus also avoid
powering up the device just for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
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
 drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..93815b8ab930 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	if (!pm_runtime_get_if_active(unicam->dev)) {
+		dev_info(unicam->dev,
+			 "Live data N/A due to device inactive\n");
+		return 0;
+	}
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),
@@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
 	dev_info(unicam->dev, "Write pointer:       %08x\n",
 		 unicam_reg_read(unicam, UNICAM_IBWP));
 
+	pm_runtime_put(unicam->dev);
+
 	return 0;
 }
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


