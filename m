Return-Path: <linux-media+bounces-66616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RrO3NnLnSWpt8QAAu9opvQ
	(envelope-from <linux-media+bounces-66616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 07:11:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB7708FE4
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 07:11:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=G7n219L7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66616-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66616-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEFDA3015880
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 05:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6897825B0BC;
	Sun,  5 Jul 2026 05:11:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5A433E9E;
	Sun,  5 Jul 2026 05:11:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783228261; cv=none; b=az4EAN4I5RPe46OGpMjU4IEBX5yUtPBkzT/LHh68TsZilFBwoKXWAwMjWME/7B01Muz/dL57NHbxIEpSLP4ZQ59X5KJSPaSh+jKiaUtEPprqzR5llRC1/8NXibQGXGYOVyT7y2htR4HQq8JCqlhkXEkMDKI3J+g/IIL6LDpQg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783228261; c=relaxed/simple;
	bh=riCM5RaRHkqP28zgfD4aY7+CD/6IsZuAEwvp3o7eq8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gMyHeRKMThlfCjaqBlijrghl7+hFq2NJsHl4ZuOwo8o/q7YOIu0diYxp/PPh54EoJq534oJQxm0J+kQEF4SgU2lptHiT/oBbVJIpSDoTgTePCr3/ptYLUc+8h/0LtAKGCXpjkNN96ScIrau3x/uUfh2NnZ46ndiIzffdvstMttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7n219L7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05940C2BCB8;
	Sun,  5 Jul 2026 05:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783228261;
	bh=riCM5RaRHkqP28zgfD4aY7+CD/6IsZuAEwvp3o7eq8g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G7n219L7UFhdv8tArAFBsjc1JWJHYRP3xJ+UbyttcLMYgVjyw16hmdEOtqzGdBeIq
	 MISUaV8RKSdrzvVpDHLVz0rRpXub6aFjHyVKrdpUEVQbthRfx/37a0RollgFRRzHnp
	 etNUK82w2ATg4U0s3DiFjQb9MbVwWgbnDKBilINiiyctoiCJ5SZ6F7MzqHk62/dedT
	 JRLhHYxD3D//g1Xbc/9A4F7HjebgLxosn+jSnEv3M6Crvs30g+JtpT0awHZZ3IDV9E
	 MkE/wgRY6fJBSjjCOJP0VM5nHPoltEqQi8ZCks3BxKf3ePPUlSE/7Z97miDi9j7qPM
	 ODZ4Q4ZD1tZOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32EDC43458;
	Sun,  5 Jul 2026 05:11:00 +0000 (UTC)
From: Joseph Breihan via B4 Relay <devnull+linux.josephbreihan.com@kernel.org>
Date: Sun, 05 Jul 2026 01:10:43 -0400
Subject: [PATCH] media: au0828: add support for Monoprice 106456 USB
 ATSC/QAM tuner
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-au0828-monoprice-v1-1-4b7bbfc2c7fe@josephbreihan.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0auQWZeEYpHaqxgXOB10mggEbNOk4
 e6iLt/i/wMKZaYCkzgg08aFY2joOwH4dOFBkudm0EqflVVGulWNepSvGGLKjCRnMm7A0wXt4KF
 lKZPn/be83v4u630hfH8/UOsHTHICeXQAAAA=
X-Change-ID: 20260705-au0828-monoprice-de5a4c39c74f
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Breihan <linux@josephbreihan.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783228260; l=3949;
 i=linux@josephbreihan.com; s=20260705; h=from:subject:message-id;
 bh=qzsjNKPfiuPaYgKyTwT9vKQKC+FWy25TYC/pfFwf62M=;
 b=tkJMuRdeJ0JBMz0r30KXKdMAMPRU4ZKAxSz0UXkjv8/AO6lBX8FGag+r7Q5gzeJfrqkBzRaEc
 WATF4fFYvYYBhzkyna+vQ3hLmFjIAqePTlcW/JnikLDvDDuw1jaEiTn
X-Developer-Key: i=linux@josephbreihan.com; a=ed25519;
 pk=EHopwlApUikmTLRFGCwX5XX8xai+qKAP4wXj4X4xXKM=
X-Endpoint-Received: by B4 Relay for linux@josephbreihan.com/20260705 with
 auth_id=851
X-Original-From: Joseph Breihan <linux@josephbreihan.com>
Reply-To: linux@josephbreihan.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66616-lists,linux-media=lfdr.de,linux.josephbreihan.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@josephbreihan.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[linux@josephbreihan.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,josephbreihan.com:replyto,josephbreihan.com:mid,josephbreihan.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35CB7708FE4

From: Joseph Breihan <linux@josephbreihan.com>

The Monoprice 106456 (board rev TV22AD-A, also sold as the AnyTV
AUTV002) is a USB ATSC/QAM tuner that enumerates as 05e1:0400 and
reports itself as a "Syntek Semiconductor USB 2.0 Video Capture
Controller". The hardware is an Auvitek AU0828A bridge with an AU8522
demodulator and an NXP TDA18271HDC2 tuner at I2C address 0x60 -- the
same demod/tuner combination as the existing Hauppauge Woodbury board.

Adds board profile and the USB ID so the device binds. The digital
frontend is electrically identical to the Woodbury, so share that
board's au8522/tda18271 configuration and attach path rather than
duplicating it. Tested with over-the-air 8VSB ATSC: it locks and
streams a live 720p transport stream.

Some 05e1:0400 units reportedly ship a Microtune MT2131 tuner with an
AU8502 demodulator instead. This patch does not handle that variant,
but it can't regress it either: 05e1:0400 matches no driver today, and
on the MT2131 units tda18271_attach() just fails, so no frontend is
registered.

Signed-off-by: Joseph Breihan <linux@josephbreihan.com>
---
 drivers/media/usb/au0828/au0828-cards.c | 14 ++++++++++++++
 drivers/media/usb/au0828/au0828-cards.h |  1 +
 drivers/media/usb/au0828/au0828-dvb.c   |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/media/usb/au0828/au0828-cards.c b/drivers/media/usb/au0828/au0828-cards.c
index 9929ce5dcdc..8ab100db01a 100644
--- a/drivers/media/usb/au0828/au0828-cards.c
+++ b/drivers/media/usb/au0828/au0828-cards.c
@@ -124,6 +124,17 @@ struct au0828_board au0828_boards[] = {
 			},
 		},
 	},
+	[AU0828_BOARD_MONOPRICE_106456] = {
+		/*
+		 * Monoprice 106456 USB ATSC/QAM tuner (board rev TV22AD-A),
+		 * a.k.a. AnyTV AUTV002, USB ID 05e1:0400. Same AU8522 demod +
+		 * NXP TDA18271HDC2 tuner @ 0x60 as the Hauppauge Woodbury.
+		 */
+		.name	= "Monoprice 106456 USB ATSC/QAM (TV22AD-A)",
+		.tuner_type = TUNER_NXP_TDA18271,
+		.tuner_addr = 0x60,
+		.i2c_clk_divider = AU0828_I2C_CLK_250KHZ,
+	},
 	[AU0828_BOARD_HAUPPAUGE_HVR1265] = {
 		.name	= "Hauppauge HVR1265",
 		.tuner_type = TUNER_XC5000,
@@ -294,6 +305,7 @@ void au0828_gpio_setup(struct au0828_dev *dev)
 	case AU0828_BOARD_HAUPPAUGE_WOODBURY:
 	case AU0828_BOARD_HAUPPAUGE_HVR1265:
 	case AU0828_BOARD_HAUPPAUGE_IMPACTVCBE:
+	case AU0828_BOARD_MONOPRICE_106456:
 		/* GPIO's
 		 * 4 - CS5340
 		 * 5 - AU8522 Demodulator
@@ -378,6 +390,8 @@ struct usb_device_id au0828_usb_id_table[] = {
 		.driver_info = AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL },
 	{ USB_DEVICE(0x05e1, 0x0480),
 		.driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
+	{ USB_DEVICE(0x05e1, 0x0400),
+		.driver_info = AU0828_BOARD_MONOPRICE_106456 },
 	{ USB_DEVICE(0x2040, 0x8200),
 		.driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
 	{ USB_DEVICE(0x2040, 0x7260),
diff --git a/drivers/media/usb/au0828/au0828-cards.h b/drivers/media/usb/au0828/au0828-cards.h
index a438aeb334a..a4a283731f7 100644
--- a/drivers/media/usb/au0828/au0828-cards.h
+++ b/drivers/media/usb/au0828/au0828-cards.h
@@ -13,3 +13,4 @@
 #define AU0828_BOARD_HAUPPAUGE_WOODBURY	5
 #define AU0828_BOARD_HAUPPAUGE_IMPACTVCBE	6
 #define AU0828_BOARD_HAUPPAUGE_HVR1265		7
+#define AU0828_BOARD_MONOPRICE_106456		8
diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828/au0828-dvb.c
index 31123e6f9fc..9c95b7ceaec 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -600,6 +600,7 @@ int au0828_dvb_register(struct au0828_dev *dev)
 				   &mxl5007t_hvr950q_config);
 		break;
 	case AU0828_BOARD_HAUPPAUGE_WOODBURY:
+	case AU0828_BOARD_MONOPRICE_106456:
 		dvb->frontend = dvb_attach(au8522_attach,
 				&hauppauge_woodbury_config,
 				&dev->i2c_adap);

---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260705-au0828-monoprice-de5a4c39c74f

Best regards,
--  
Joseph Breihan <linux@josephbreihan.com>



