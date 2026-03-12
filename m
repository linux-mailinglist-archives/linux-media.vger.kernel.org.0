Return-Path: <linux-media+bounces-55549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMoECRAys2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E427A188
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FAF631EA92C
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7F13F0A87;
	Thu, 12 Mar 2026 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="PWV/Rx6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DB3EFD19
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351344; cv=none; b=rVcqWUimBPQNTfrZNptCvH9QMptWgx12KOccySwQqaSxHWVDF0tcMJO9iuViJNXrd0Ryc75ntDNioMhSI0L+9LINi1uTlav8tN2KAnN+aef60g3Hz8dhvA7SR+da1q8tTd6k3q0wz/erCYL8IkqMb7TM9AUHA0qt/59IkbBr0XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351344; c=relaxed/simple;
	bh=jwiMCyz9bRa9kU1m3GQZcazNnhdmSdRB8WEIC2jK4SU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xy3an6OGJGAQD3Aef0Em9FeMZ8h5HeBZ+BnhRGlGprXKhJsD/kHO4H8m7Z2Uwb9wHbdbEnoz7rnpE2LpfQyZ7PPJ3b28V7WwM1ZvfufAQX/HsbDtcRIvEuQDQ0+4xvMjgZbVuxpUYt7vlL1ApoDB1/kLmDcXJ/NsXd3qAqTaLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=PWV/Rx6m; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-466ec4c6852so949496b6e.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351342; x=1773956142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksacN+8/hBlN3EbhhVExKkp62ahGfR5APrW7Z2gouoQ=;
        b=PWV/Rx6mYwCZlaaO0Ugs/dcnaxJnlllL88WSTJFKJj2pkS9EtfkCEs4fqXG6SOLYuE
         1i65Qe/YI1aWIfvP6/Hhr4p5vkY/8OgX+4xVwBzoo3rvYrzKRSab0FI3/+Y3BXXy1o/k
         QkUEYBQatsR+cX++OTWEzwp2AWQfW3Y3/LNvQOlI6kREQHYLBLfl0YmQV9+9Nr4qBPSJ
         RVoK3L9NRlErmQeKMAh4QY2sGyVKL6iOmWDxE21dWLCOsZbHJMlSnakr/XVblkzK0Oho
         j6YT1sPrEOLMg7nWtPMRstea5mFNoAbDaWSEbW5YUFRUdXTASWFi1pokWwivmucZ7h9L
         n18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351342; x=1773956142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksacN+8/hBlN3EbhhVExKkp62ahGfR5APrW7Z2gouoQ=;
        b=b+RC0YnL6c0z9c+BK8yQfOf1vlvWr9Ipwm36jsnTeKBVujRM5gy63jgrDknM7hvOgO
         EQxYmTZslsBTVzZpvK7aXgYY0t5TqRHXk7CHBwC/SxS7zSRCy0e2rXj9acjipYjB32bV
         M4auY9IJMyJCUJ0SLO7hgpCFvj0TcfRvs1mxD4l4lpxG0L+NHluzQK4IW3GH4FbFnso1
         mUXUzAfj7khWlU0BL8oG5KyR9CJYdmau8dF0vOrOASoBSObvysRS7YFRCrb/o/aa48r+
         PKObKB2iYp986jGyJPHgNpSvHw4HGL4yNx1OmSIEdoqEgHBBwUcFr6VaIuIeXo2C5DV0
         AGIg==
X-Gm-Message-State: AOJu0YyA8a2pRFZsrQ/BaEXPnZT44hMgDV/ZOgTdqcm+ycuQ8HiYpoKU
	lZE1WPZzV1Ta//ss6GDjmKxyDzPoPAhTjCsq6ar0taBC2/+d5qsUnyzFQdlmR0+UGV7VJeCn0+D
	+815zT1U=
X-Gm-Gg: ATEYQzx+GcOnvVF5RxXNH/AlX/J4cSGMnhn4IJSsjXraPvDVmwv3/qVYNJuICN4gKlK
	HhR2gKYmC1j4C6gdrKjrLf8ZcmOlW9cz4Sl4xtfr+PQKMxsCmEIxM50tlUwo8D9VyO+knRn498P
	C/ZhIFBT2ip1mdIeFzRaWvEmYRlmKbPuJce3iUR0biEMB4OhlAqdo/1Ei0TASg/iEvRPDI/Dozg
	JAveveuIz28vuAHCNgYKix24aRvi/UG6RmKTERWT6RlucLz89KrONCaC+H+I/c8jX95GiVUi064
	WUEa56QxTeryPs8CY/2O3CJq2KY7jbAMWzKmjB0LD/X/q5XxWjFmo4GCV+HeyoxNvWHURUQ1q98
	JhB1Z4C033EaKkby3Jpfzdr90tBSw5/9+PbuhoM6nCJXzrMguimk7WWuEQFAL3uehhxiutK/3Cf
	0umU1ozRd16oV7c5S0xLyQ5qGE4/w1u/kgJKtNPAvYsd72NvqSYhP/Frx154dVYQnQfc7g0IO8H
	bpAaqLeWREvmlte+yc=
X-Received: by 2002:a05:6808:5241:b0:467:1e5:6756 with SMTP id 5614622812f47-467575c2326mr443711b6e.46.1773351341903;
        Thu, 12 Mar 2026 14:35:41 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:41 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 09/11] au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
Date: Thu, 12 Mar 2026 16:35:30 -0500
Message-Id: <20260312213532.2907276-10-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55549-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 872E427A188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

New HVR1265 and ImpactVCB-e devices are PCIe baords
with USB controller and essentially embedded
Hauppauge 950Q.

HVR1265 - digital+analog TV, S-Video, and audio inputs
ImpactVCB-e - Composite, S-Video, and audio inputs

This also fixes AU8522_COMPOSITE_CH4, which was missing
from video routing.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/dvb-frontends/au8522_decoder.c |  1 +
 drivers/media/usb/au0828/au0828-cards.c      | 50 ++++++++++++++++++++
 drivers/media/usb/au0828/au0828-cards.h      |  2 +
 drivers/media/usb/au0828/au0828-dvb.c        |  1 +
 drivers/media/usb/au0828/au0828-input.c      |  1 +
 5 files changed, 55 insertions(+)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index 58c4c489bf97..58b959b272c6 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -567,6 +567,7 @@ static int au8522_s_video_routing(struct v4l2_subdev *sd,
 	case AU8522_COMPOSITE_CH1:
 	case AU8522_SVIDEO_CH13:
 	case AU8522_COMPOSITE_CH4_SIF:
+	case AU8522_COMPOSITE_CH4:
 		state->vid_input = input;
 		break;
 	default:
diff --git a/drivers/media/usb/au0828/au0828-cards.c b/drivers/media/usb/au0828/au0828-cards.c
index 9ee21f8bf6fa..9929ce5dcdcd 100644
--- a/drivers/media/usb/au0828/au0828-cards.c
+++ b/drivers/media/usb/au0828/au0828-cards.c
@@ -105,6 +105,46 @@ struct au0828_board au0828_boards[] = {
 		.tuner_addr = 0x60,
 		.i2c_clk_divider = AU0828_I2C_CLK_250KHZ,
 	},
+	[AU0828_BOARD_HAUPPAUGE_IMPACTVCBE] = {
+		.name	= "Hauppauge Impact VCB-e",
+		.tuner_type = TUNER_ABSENT,
+		.i2c_clk_divider = AU0828_I2C_CLK_250KHZ,
+		.input = {
+			{
+				.type = AU0828_VMUX_COMPOSITE,
+				.vmux = AU8522_COMPOSITE_CH4,
+				.amux = AU8522_AUDIO_NONE,
+				.audio_setup = hvr950q_cs5340_audio,
+			},
+			{
+				.type = AU0828_VMUX_SVIDEO,
+				.vmux = AU8522_SVIDEO_CH13,
+				.amux = AU8522_AUDIO_NONE,
+				.audio_setup = hvr950q_cs5340_audio,
+			},
+		},
+	},
+	[AU0828_BOARD_HAUPPAUGE_HVR1265] = {
+		.name	= "Hauppauge HVR1265",
+		.tuner_type = TUNER_XC5000,
+		.tuner_addr = 0x61,
+		.has_ir_i2c = 1,
+		.has_analog = 1,
+		.i2c_clk_divider = AU0828_I2C_CLK_250KHZ,
+		.input = {
+			{
+				.type = AU0828_VMUX_TELEVISION,
+				.vmux = AU8522_COMPOSITE_CH4_SIF,
+				.amux = AU8522_AUDIO_SIF,
+			},
+			{
+				.type = AU0828_VMUX_SVIDEO,
+				.vmux = AU8522_SVIDEO_CH13,
+				.amux = AU8522_AUDIO_NONE,
+				.audio_setup = hvr950q_cs5340_audio,
+			},
+		},
+	},
 };
 
 /* Tuner callback function for au0828 boards. Currently only needed
@@ -120,6 +160,8 @@ int au0828_tuner_callback(void *priv, int component, int command, int arg)
 	case AU0828_BOARD_HAUPPAUGE_HVR850:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL:
+	case AU0828_BOARD_HAUPPAUGE_HVR1265:
+	case AU0828_BOARD_HAUPPAUGE_IMPACTVCBE:
 	case AU0828_BOARD_DVICO_FUSIONHDTV7:
 		if (command == 0) {
 			/* Tuner Reset Command from xc5000 */
@@ -190,6 +232,8 @@ void au0828_card_setup(struct au0828_dev *dev)
 	case AU0828_BOARD_HAUPPAUGE_HVR850:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL:
+	case AU0828_BOARD_HAUPPAUGE_HVR1265:
+	case AU0828_BOARD_HAUPPAUGE_IMPACTVCBE:
 	case AU0828_BOARD_HAUPPAUGE_WOODBURY:
 		if (dev->i2c_rc == 0)
 			hauppauge_eeprom(dev, eeprom+0xa0);
@@ -248,6 +292,8 @@ void au0828_gpio_setup(struct au0828_dev *dev)
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL:
 	case AU0828_BOARD_HAUPPAUGE_WOODBURY:
+	case AU0828_BOARD_HAUPPAUGE_HVR1265:
+	case AU0828_BOARD_HAUPPAUGE_IMPACTVCBE:
 		/* GPIO's
 		 * 4 - CS5340
 		 * 5 - AU8522 Demodulator
@@ -340,6 +386,10 @@ struct usb_device_id au0828_usb_id_table[] = {
 		.driver_info = AU0828_BOARD_HAUPPAUGE_HVR950Q },
 	{ USB_DEVICE(0x2040, 0x7270),
 		.driver_info = AU0828_BOARD_HAUPPAUGE_HVR950Q },
+	{ USB_DEVICE(0x2040, 0x72b0),
+		.driver_info = AU0828_BOARD_HAUPPAUGE_IMPACTVCBE },
+	{ USB_DEVICE(0x2040, 0x72a0),
+		.driver_info = AU0828_BOARD_HAUPPAUGE_HVR1265 },
 	{ },
 };
 
diff --git a/drivers/media/usb/au0828/au0828-cards.h b/drivers/media/usb/au0828/au0828-cards.h
index a9cdf85f98f5..a438aeb334a0 100644
--- a/drivers/media/usb/au0828/au0828-cards.h
+++ b/drivers/media/usb/au0828/au0828-cards.h
@@ -11,3 +11,5 @@
 #define AU0828_BOARD_DVICO_FUSIONHDTV7	3
 #define AU0828_BOARD_HAUPPAUGE_HVR950Q_MXL	4
 #define AU0828_BOARD_HAUPPAUGE_WOODBURY	5
+#define AU0828_BOARD_HAUPPAUGE_IMPACTVCBE	6
+#define AU0828_BOARD_HAUPPAUGE_HVR1265		7
diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828/au0828-dvb.c
index 5d0447ff7d06..31123e6f9fc3 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -571,6 +571,7 @@ int au0828_dvb_register(struct au0828_dev *dev)
 	switch (dev->boardnr) {
 	case AU0828_BOARD_HAUPPAUGE_HVR850:
 	case AU0828_BOARD_HAUPPAUGE_HVR950Q:
+	case AU0828_BOARD_HAUPPAUGE_HVR1265:
 		dvb->frontend = dvb_attach(au8522_attach,
 				&hauppauge_hvr950q_config,
 				&dev->i2c_adap);
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 7dec1a360da6..319be7509c82 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -300,6 +300,7 @@ int au0828_rc_register(struct au0828_dev *dev)
 	if (dev->board.has_ir_i2c) {	/* external i2c device */
 		switch (dev->boardnr) {
 		case AU0828_BOARD_HAUPPAUGE_HVR950Q:
+		case AU0828_BOARD_HAUPPAUGE_HVR1265:
 			rc->map_name = RC_MAP_HAUPPAUGE;
 			ir->get_key_i2c = au0828_get_key_au8522;
 			break;
-- 
2.35.1


