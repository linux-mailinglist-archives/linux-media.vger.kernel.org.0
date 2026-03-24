Return-Path: <linux-media+bounces-56905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOc7ITLYwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:30:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1CE31ADD0
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3D4E3020672
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81DC37B400;
	Tue, 24 Mar 2026 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="c+DPrwU5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1B39F192
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376752; cv=none; b=DiV9oWJRdQQrPpuCqe7osdObbI6m4r89LkluDsqmB5UAreWK729V/557D1ZzuM+rX0M4MyCS9lqU+vB8PJZvcf4qFuC4nPy8y5tV380qiGcT5CBeq5GINQwuSU5XsY2WV/2cu+AsQY8vWBDJsj/8KQ/orv8fwkvGo7hye7KLS14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376752; c=relaxed/simple;
	bh=ifqPJuNGtd4VU4wZkEwv9nXV7kPNIvq2sABV1piCLtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QlGOlLNE88HaTI9typN2Zd8fwaWgUNikpoAEslT3vOTqYftioUBzchHtxwvfveQjX1mqxqx1uU0VtgbZue0oRvRCQxOCYdFuS1T/19lqxQ/8hNaaB8mZVd9d7FxW4Fxut3oxo8TPd3S72ZPkzv1LspJkbi7CaRwmEAAd5P1+L2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=c+DPrwU5; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64937edbc9eso4084415d50.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774376748; x=1774981548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lWQJl4QhbXSP+fz4R6+2AQVSaxWsFwGcFicRbnjO7M=;
        b=c+DPrwU5Uv/Fe7aGlIUmRcyxv9gT48Ldj8tALcR+YpXuNV099P6/4zXmqPc9mINgss
         ikZhDPEN29P0NQv/Fqzo2ZjHlJ/IbYNVF4Hy9Owx2KSviWvqC7T0963lDw6drrmR9Dao
         Cg7Pb5CatJwnWSIV2OvalsVxSW+oo09CyeAIp6ps5+VmilhvBRkN+3VJ15KRDW4pivWm
         Ik8ECSSkJD/kpeAtD80CyPMLT/7x4BjT0EouMiLQfpYmTkO/nJvkV4hiLMUyXPvBxXub
         TfGweZCISjeM+3ya9U4+RQ+kVsWJAFLWNqv2FcS8eyc7xOnfm6Wu7aDIXEOj3p0UfQdp
         GUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376748; x=1774981548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lWQJl4QhbXSP+fz4R6+2AQVSaxWsFwGcFicRbnjO7M=;
        b=jt7+lxknBCXw6ju0RscscN5UEuuCO/gIjAaK1SlI+huZA1gweaM5IG7VKZtepzdgCb
         YAFgYYfty72E7UiPwUk8aQj5PHBIFOrqG1u3T+KgWlD+No6un+lcyDDCY/8scRI6hgZY
         LI0q6z/jVngavmnUHOHvxAUtGH7oCJAh/O21d+26L9TkYOw/kHsWlbLDhaR+iYmIYTCL
         ueZ316JKxOQIFA43YXIleP/ZArWLUdeGEgkWgO+nxLqlnlA+iaEGUtu60Ca9J+0qYdYf
         QQYEWAJYKRrytInfocTq9xBUG07porXoOTEqO4tcKg5si4Nl7DzGqUVYXMztKywu3MLQ
         +7SA==
X-Gm-Message-State: AOJu0YzDxmmLLRsCrxPLXdNR/FqdZLxe5WWYRalNnTijFqyq5Bx6hH/J
	0fFBiM2hdCjCZXK9WvAVeChGejd6610djkeUL6tCy00bQCcmwyMQfvkGUwE1BuNJqyPoGttikTU
	VeahNKOY=
X-Gm-Gg: ATEYQzyWgpokXA+qH0L6IZ9LmKURrp8IPznMnLLiw05gtMXzs42ptt1Gj5cahdS5xuW
	L1gWnIk5d5HqwG50U6/DVjxCi5pFfTi7m32NNljHLguSpIWsuYZ5h/lWjsDulq3yHBO9VZP/2W2
	hiN5qoEobJdCIba03d8h8Uvxeafvz6svrOnfLgnTUZhTNb5hM0mKko5dlcFB566zmjq/KjQ1y+H
	JM2wwKJ28kCcBCaNvQXv1JRYxzUxbZeYYTvzvWWBsDUk6tUCE57a/G+ldmo8Gm2aUo5ofEY5BXT
	rXm9fR4DlkC3DldXlQ1TTpzMPbp1mZr2cZpMeFIrcJgFsPN7raHK+ws20U8XjMMiP9YLOpt+tAi
	89fHc85JcG4sEvMAoi6ajyLwwYWPkTFFwg/bNzDaQQW6s7RQwD9j5NpLjMGTXBI6X3u4qJvIe+N
	CcboWvQuXL09DYPFbpRMWsGfLdVWj9Nno76PKGDueRaNevTREgRviYW9QEyOjRDXmroB1qbey+x
	0su1myFI80vAbJsgks=
X-Received: by 2002:a53:c984:0:b0:64e:a213:90b0 with SMTP id 956f58d0204a3-64ee6167408mr432545d50.72.1774376747959;
        Tue, 24 Mar 2026 11:25:47 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm7943659d50.6.2026.03.24.11.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:25:47 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2 3/3] media: em28xx: Add Hauppauge em2828X based 9x5 revisions
Date: Tue, 24 Mar 2026 13:25:41 -0500
Message-Id: <20260324182541.3396944-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-4-brad@nextdimension.cc>
References: <20260317205042.3365469-4-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56905-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A1CE31ADD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Hauppauge HVR-935, HVR-955, and HVR-975 have moved
from cx231xx bridge to em2828x bridge.

The following USB device id's are new:
2040:0360 - HVR-935 ISOC transport
2040:8360 - HVR-935 Bulk transport
2040:0366 - HVR-955 ISOC transport
2040:8366 - HVR-955 Bulk transport
2040:036a - HVR-975 ISOC transport
2040:836a - HVR-975 Bulk transport

The devices all now utilize si2177 tuner. Capabilities are:
- Digital TV
- Composite video input
- S-Video input
- Analog stereo input

HVR-935 has DVB-C/T/T2 demod (si2168).
HVR-955 has ATSC/QAM demod (lgdt3306a).
HVR-975 has both ATSC/QAM and DVB-C/T/T2 demods.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
Changes since v1:
- Fix incorrect pid's in board profile descriptions
- Fix some variable names
- Include all usb vid:pid combos for the 9x5 devices
- Fixed listed demods in comment

 drivers/media/usb/em28xx/em28xx-cards.c | 157 ++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c   | 203 ++++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-video.c |  22 ++-
 drivers/media/usb/em28xx/em28xx.h       |   3 +
 4 files changed, 383 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 0c5851bf4ef0..b4bafd2fa482 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -553,6 +553,36 @@ static struct em28xx_reg_seq hauppauge_usb_quadhd_atsc_reg_seq[] = {
 	{EM2874_R5E_TS2_PKT_SIZE,      0x05, 0xff,     50},
 	{-1,                           -1,   -1,       -1},
 };
+/* Hauppauge HVR-935 \ HVR-955 / HVR-975 V2 */
+static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2[] = {
+	{EM2874_R80_GPIO_P0_CTRL,	0xdc,	0xff,	50},
+	{EM2874_R5F_TS_ENABLE,		0x00,	0xff,	50}, /* disable TS filters */
+	{EM2874_R5D_TS1_PKT_SIZE,	0x05,	0xff,	50},
+	{-1,				-1,	-1,	-1},
+};
+
+static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_comp[] = {
+	{0x0b,				0x00,	0xff,		100},
+	{0x0b,				0x96,	0xff,		100},
+	{0x0b,				0x00,	0xff,		100},
+	{EM2874_R80_GPIO_P0_CTRL,	0,	EM_GPIO_5,	10},
+	{-1,				-1,	-1,		-1},
+};
+
+static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_television[] = {
+	{0x0b,				0x00,		0xff,		100},
+	{0x0b,				0x96,		0xff,		100},
+	{0x0b,				0x00,		0xff,		100},
+	{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_5,	EM_GPIO_5,	10},
+	{-1,				-1,		-1,		-1},
+};
+
+static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_dvb[] = {
+	{0x0b,		0x80,	0xff,	100},
+	{0x0b,		0x96,	0xff,	100},
+	{0x0b,		0x80,	0xff,	100},
+	{-1,		-1,	-1,	-1},
+};
 
 /*
  * MyGica USB TV Box
@@ -689,6 +719,16 @@ static struct em28xx_led hauppauge_usb_quadhd_leds[] = {
 	{-1, 0, 0, 0},
 };
 
+static struct em28xx_led hauppauge_9x5_v2_leds[] = {
+	{
+		.role      = EM28XX_LED_DIGITAL_CAPTURING,
+		.gpio_reg  = EM2874_R80_GPIO_P0_CTRL,
+		.gpio_mask = EM_GPIO_0,
+		.inverted  = 0,
+	},
+	{-1, 0, 0, 0},
+};
+
 /*
  *  Board definitions
  */
@@ -2640,6 +2680,108 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	/* 2040:8360 Hauppauge HVR-935
+	 * Empia EM2828X, si2168 demod, si2177 tuner
+	 * Composite input, s-video input, analog TV, stereo audio input
+	 */
+	[EM2828X_BOARD_HAUPPAUGE_935_V2] = {
+		.name         = "Hauppauge WinTV-HVR-935",
+		.def_i2c_bus  = 1,
+		.has_dvb      = 1,
+		.vchannels    = 3,
+		.tuner_type   = TUNER_ABSENT,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.tuner_gpio   = hauppauge_hvr_9x5_v2,
+		.dvb_gpio     = hauppauge_hvr_9x5_v2_dvb,
+		.leds         = hauppauge_9x5_v2_leds,
+		.xclk         = 0x8f,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = 0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = 1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_TELEVISION,
+			.vmux     = 2,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_television,
+
+		} },
+	},
+	/* 2040:8366 Hauppauge HVR-955
+	 * Empia EM2828X, lgdt3306a demod, si2177 tuner
+	 * Composite input, s-video input, analog TV, stereo audio input
+	 */
+	[EM2828X_BOARD_HAUPPAUGE_955_V2] = {
+		.name         = "Hauppauge WinTV-HVR-955",
+		.def_i2c_bus  = 1,
+		.has_dvb      = 1,
+		.vchannels    = 3,
+		.tuner_type   = TUNER_ABSENT,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.tuner_gpio   = hauppauge_hvr_9x5_v2,
+		.dvb_gpio     = hauppauge_hvr_9x5_v2_dvb,
+		.leds         = hauppauge_9x5_v2_leds,
+		.xclk         = 0x8f,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = 0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = 1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_TELEVISION,
+			.vmux     = 2,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_television,
+
+		} },
+	},
+	/* 2040:836a Hauppauge HVR-975
+	 * Empia EM2828X, si2168 demod, lgdt3306a demod, si2177 tuner
+	 * Composite input, s-video input, analog TV, stereo audio input
+	 */
+	[EM2828X_BOARD_HAUPPAUGE_975_V2] = {
+		.name         = "Hauppauge WinTV-HVR-975",
+		.def_i2c_bus  = 1,
+		.has_dvb      = 1,
+		.vchannels    = 3,
+		.tuner_type   = TUNER_ABSENT,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.tuner_gpio   = hauppauge_hvr_9x5_v2,
+		.dvb_gpio     = hauppauge_hvr_9x5_v2_dvb,
+		.leds         = hauppauge_9x5_v2_leds,
+		.xclk         = 0x8f,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = 0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = 1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_comp,
+		}, {
+			.type     = EM28XX_VMUX_TELEVISION,
+			.vmux     = 2,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.gpio     = hauppauge_hvr_9x5_v2_television,
+
+		} },
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2789,6 +2931,18 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x2040, 0xc220),
 			.driver_info = EM2828X_BOARD_HAUPPAUGE_USB_LIVE2 },
+	{ USB_DEVICE(0x2040, 0x0360),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_935_V2 },
+	{ USB_DEVICE(0x2040, 0x8360),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_935_V2 },
+	{ USB_DEVICE(0x2040, 0x0366),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_955_V2 },
+	{ USB_DEVICE(0x2040, 0x8366),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_955_V2 },
+	{ USB_DEVICE(0x2040, 0x036a),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_975_V2 },
+	{ USB_DEVICE(0x2040, 0x836a),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_975_V2 },
 	{ USB_DEVICE(0x0438, 0xb002),
 			.driver_info = EM2880_BOARD_AMD_ATI_TV_WONDER_HD_600 },
 	{ USB_DEVICE(0x2001, 0xf112),
@@ -3280,6 +3434,9 @@ static void em28xx_card_setup(struct em28xx *dev)
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB:
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595:
 	case EM2828X_BOARD_HAUPPAUGE_USB_LIVE2:
+	case EM2828X_BOARD_HAUPPAUGE_935_V2:
+	case EM2828X_BOARD_HAUPPAUGE_955_V2:
+	case EM2828X_BOARD_HAUPPAUGE_975_V2:
 	{
 		struct tveeprom tv;
 
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 389c40a1ecdb..2f0972072a00 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1497,6 +1497,194 @@ static int em2874_dvb_init_hauppauge_usb_quadhd(struct em28xx *dev)
 	return 0;
 }
 
+static int em2828X_dvb_init_hauppauge_wintv_935_v2(struct em28xx *dev)
+{
+	struct em28xx_dvb *dvb = dev->dvb;
+	struct i2c_adapter *adapter;
+	struct si2168_config si2168_config = {};
+	struct si2157_config si2157_config = {};
+
+	/* Hauppauge HVR-9x5 V2 */
+	static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_init[] = {
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	0,		EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{0x90,				EM_GPIO_5,	EM_GPIO_5,	50},
+		{	-1,			-1,		-1,	-1},
+	};
+
+	em28xx_gpio_set(dev, hauppauge_hvr_9x5_v2_init);
+
+	/* attach demod */
+	si2168_config.i2c_adapter = &adapter;
+	si2168_config.fe = &dvb->fe[0];
+	si2168_config.ts_mode = SI2168_TS_SERIAL;
+	si2168_config.ts_clock_inv = true;
+
+	dvb->i2c_client_demod[0] = dvb_module_probe("si2168", NULL,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x64, &si2168_config);
+	if (!dvb->i2c_client_demod[0]) {
+		dev_err(&dev->intf->dev, "si2168 demod initialization failure\n");
+		return -ENODEV;
+	}
+
+	/* attach tuner */
+	si2157_config.fe = dvb->fe[0];
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	si2157_config.mdev = dev->media_dev;
+#endif
+	si2157_config.if_port = 0;
+	si2157_config.inversion = true;
+	si2157_config.dont_load_firmware = 1;
+
+	dvb->i2c_client_tuner = dvb_module_probe("si2157", "si2177",
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x60, &si2157_config);
+	if (!dvb->i2c_client_tuner) {
+		dev_err(&dev->intf->dev, "si2157 tuner initialization failure\n");
+		dvb_module_release(dvb->i2c_client_demod[0]);
+		return -ENODEV;
+	}
+
+	dev->em28xx_set_analog_freq = em28xx_set_analog_freq;
+
+	return 0;
+}
+
+static int em2828X_dvb_init_hauppauge_wintv_955_v2(struct em28xx *dev)
+{
+	struct em28xx_dvb *dvb = dev->dvb;
+	struct i2c_adapter *adapter;
+	struct lgdt3306a_config lgdt3306a_config = {};
+	struct si2157_config si2157_config = {};
+
+	/* Hauppauge HVR-9x5 V2 */
+	static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_init[] = {
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	0,		EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{0x90,				EM_GPIO_5,	EM_GPIO_5,	50},
+		{	-1,			-1,		-1,	-1},
+	};
+
+	em28xx_gpio_set(dev, hauppauge_hvr_9x5_v2_init);
+
+	/* attach demod */
+	lgdt3306a_config = hauppauge_01595_lgdt3306a_config;
+	lgdt3306a_config.fe = &dvb->fe[0];
+	lgdt3306a_config.i2c_adapter = &adapter;
+
+	dvb->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x59, &lgdt3306a_config);
+	if (!dvb->i2c_client_demod[0]) {
+		dev_err(&dev->intf->dev, "lgdt3306a demod initialization failure\n");
+		return -ENODEV;
+	}
+
+	/* attach tuner */
+	si2157_config.fe = dvb->fe[0];
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	si2157_config.mdev = dev->media_dev;
+#endif
+	si2157_config.if_port = 0;
+	si2157_config.inversion = true;
+	si2157_config.dont_load_firmware = 1;
+
+	dvb->i2c_client_tuner = dvb_module_probe("si2157", "si2177",
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x60, &si2157_config);
+	if (!dvb->i2c_client_tuner) {
+		dev_err(&dev->intf->dev, "si2157 tuner initialization failure\n");
+		dvb_module_release(dvb->i2c_client_demod[0]);
+		return -ENODEV;
+	}
+
+	dev->em28xx_set_analog_freq = em28xx_set_analog_freq;
+
+	return 0;
+}
+
+static int em2828X_dvb_init_hauppauge_wintv_975_v2(struct em28xx *dev)
+{
+	struct em28xx_dvb *dvb = dev->dvb;
+	struct i2c_adapter *adapter;
+	struct i2c_adapter *adapter2;
+	struct lgdt3306a_config lgdt3306a_config = {};
+	struct si2168_config si2168_config = {};
+	struct si2157_config si2157_config = {};
+
+	/* Hauppauge HVR-9x5 V2 */
+	static const struct em28xx_reg_seq hauppauge_hvr_9x5_v2_init[] = {
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	0,		EM_GPIO_6,	50},
+		{EM2874_R80_GPIO_P0_CTRL,	EM_GPIO_6,	EM_GPIO_6,	50},
+		{0x90,				EM_GPIO_5,	EM_GPIO_5,	50},
+		{-1,				-1,		-1,		-1},
+	};
+
+	em28xx_gpio_set(dev, hauppauge_hvr_9x5_v2_init);
+
+	/* attach demod */
+	lgdt3306a_config = hauppauge_01595_lgdt3306a_config;
+	lgdt3306a_config.fe = &dvb->fe[0];
+	lgdt3306a_config.i2c_adapter = &adapter;
+
+	dvb->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x59, &lgdt3306a_config);
+	if (!dvb->i2c_client_demod[0]) {
+		dev_err(&dev->intf->dev, "lgdt3306a demod initialization failure\n");
+		return -ENODEV;
+	}
+
+	/* attach demod */
+	si2168_config.i2c_adapter = &adapter2;
+	si2168_config.fe = &dvb->fe[1];
+	si2168_config.ts_mode = SI2168_TS_SERIAL;
+	si2168_config.ts_clock_inv = true;
+
+	dvb->i2c_client_demod[1] = dvb_module_probe("si2168", NULL,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x64, &si2168_config);
+	if (!dvb->i2c_client_demod[1]) {
+		dev_err(&dev->intf->dev, "si2168 demod initialization failure\n");
+		dvb_module_release(dvb->i2c_client_demod[0]);
+		return -ENODEV;
+	}
+
+	dvb->fe[1]->id = 1;
+
+	/* attach tuner */
+	si2157_config.fe = dvb->fe[0];
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	si2157_config.mdev = dev->media_dev;
+#endif
+	si2157_config.if_port = 0;
+	si2157_config.inversion = true;
+	si2157_config.dont_load_firmware = 1;
+
+	dvb->i2c_client_tuner = dvb_module_probe("si2157", "si2177",
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x60, &si2157_config);
+	if (!dvb->i2c_client_tuner) {
+		dev_err(&dev->intf->dev, "si2157 tuner initialization failure\n");
+		dvb_module_release(dvb->i2c_client_demod[1]);
+		dvb_module_release(dvb->i2c_client_demod[0]);
+		return -ENODEV;
+	}
+
+	dvb->fe[1]->tuner_priv = dvb->fe[0]->tuner_priv;
+
+	memcpy(&dvb->fe[1]->ops.tuner_ops,
+		&dvb->fe[0]->ops.tuner_ops, sizeof(struct dvb_tuner_ops));
+
+	dev->em28xx_set_analog_freq = em28xx_set_analog_freq;
+
+	return 0;
+}
+
 static int em28xx_dvb_init(struct em28xx *dev)
 {
 	int result = 0, dvb_alt = 0;
@@ -1990,6 +2178,21 @@ static int em28xx_dvb_init(struct em28xx *dev)
 		if (result)
 			goto out_free;
 		break;
+	case EM2828X_BOARD_HAUPPAUGE_935_V2:
+		result = em2828X_dvb_init_hauppauge_wintv_935_v2(dev);
+		if (result)
+			goto out_free;
+		break;
+	case EM2828X_BOARD_HAUPPAUGE_955_V2:
+		result = em2828X_dvb_init_hauppauge_wintv_955_v2(dev);
+		if (result)
+			goto out_free;
+		break;
+	case EM2828X_BOARD_HAUPPAUGE_975_V2:
+		result = em2828X_dvb_init_hauppauge_wintv_975_v2(dev);
+		if (result)
+			goto out_free;
+		break;
 	default:
 		dev_err(&dev->intf->dev,
 			"The frontend of your DVB/ATSC card isn't supported yet\n");
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 578ba3d88d01..a172cc1e2604 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -171,7 +171,14 @@ static int em28xx_vbi_supported(struct em28xx *dev)
 
 static int em28xx_analogtv_supported(struct em28xx *dev)
 {
-	return 0;
+	switch (dev->model) {
+	case EM2828X_BOARD_HAUPPAUGE_935_V2:
+	case EM2828X_BOARD_HAUPPAUGE_955_V2:
+	case EM2828X_BOARD_HAUPPAUGE_975_V2:
+		return 1;
+	default:
+		return 0;
+	};
 }
 
 /*
@@ -2061,7 +2068,18 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	if (f->tuner != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_frequency, f);
+	switch (dev->model) {
+	case EM2828X_BOARD_HAUPPAUGE_935_V2:
+	case EM2828X_BOARD_HAUPPAUGE_955_V2:
+	case EM2828X_BOARD_HAUPPAUGE_975_V2:
+		if (dev->em28xx_set_analog_freq)
+			dev->em28xx_set_analog_freq(dev, f->frequency);
+		break;
+	default:
+		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_frequency, f);
+		break;
+	}
+
 	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
 	v4l2->frequency = new_freq.frequency;
 
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 9fcaebd78bae..ae4010c55623 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -145,6 +145,9 @@
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
 #define EM2860_BOARD_MYGICA_UTV3                  107
 #define EM2828X_BOARD_HAUPPAUGE_USB_LIVE2         108
+#define EM2828X_BOARD_HAUPPAUGE_935_V2            109
+#define EM2828X_BOARD_HAUPPAUGE_955_V2            110
+#define EM2828X_BOARD_HAUPPAUGE_975_V2            111
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.35.1


