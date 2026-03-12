Return-Path: <linux-media+bounces-55553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFLKH/pCs2l6TgAAu9opvQ
	(envelope-from <linux-media+bounces-55553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AF27B1C6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A473193933
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF6A3264D2;
	Thu, 12 Mar 2026 22:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="jmBlt7bo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70F21D00A
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355762; cv=none; b=CgbBwS0+UONemtTiJlPIi0JTQ5sOgDOTioF2XF1PAQLB6L9G5U4gm1wdNwhmfWX77hDHSLet5qud7grQ3CasTZ0KY375zvGMGqFpYuFnqyhoZfuz0QZy1AH5wzbSMUAqac+1M6u2/rKXZG4u/sCFLM/n1SH9x7uJ+nJnOcwi2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355762; c=relaxed/simple;
	bh=OokGcTCuTWxbo3BuB+1DUtRuCiOzd/Bl6cA2SswzZDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EA/eYSGcv9IW4IRcrmub+9FaVMRO8L8ydR18qyizlezoYVCL/j+7am2P3MTsWnFaUL3GuQGvKMWDWsyZu5AnJxHIPvi/qBJhZRwDqDmcJySfE8sUKrUdQtIBdD2SCDWChn/O0kgqgkjkJRr7CaUbhdKDIm3UvFJC7lINOmGU+wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=jmBlt7bo; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-41706b23543so1060919fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773355759; x=1773960559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaqcGMnm5L6V8vP5Tb8d5tbiTiLZK8DAe86J85epk6Q=;
        b=jmBlt7boBcq4894J2i6Zf/orQY7pgwuezN6OLCapBW7rGONLfz9csWce8R7rkXPheS
         rebygcmn/A1Y4M0LSvtaMRMs43gWqlBhpg2ZuUWEFWL6OcMlOqAE8yIXRGwLNMCG5eKC
         1EnTsIFga43G7TlR7N7eT+l7cSZZvJ9fFfHxfs6HQ6+Vw3xzMzNB83d8rAxLU26HXkmE
         vMggykBWr83JkRwBk2Q/QoI+zRjJSMh8+nz527xEQSHcqz1Lly64VVUlYpK/bhatOgn2
         Rl8MXn6cjXJdV9uQlae/4/QcTlFGSbusP3vYe1FgP6azwoHjdgNSjsvT+EWVsQGT59Oy
         zCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355759; x=1773960559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LaqcGMnm5L6V8vP5Tb8d5tbiTiLZK8DAe86J85epk6Q=;
        b=NoVstdFzwhhl2SPwVw6SnglTbGyzjO7/oEhUJVqQMqAZV+fGhAb+zgHCTjUjQjZMl/
         3XQO7LB0hUmeIzmRzI9J05O2yQQbvAG0eqqdfFw5KUYhlLT0Py3uVEK4SaE+zrcBz5kV
         e8K/jQnmV26ME8wyhxtMK70nYVNWnchAku065O9Qt+dGZfkECWiDSsoj2rOY7PRA0qkT
         D1yHo4HwwM0Q8yLzPM01RuYCvbBJDG6rBckbwSsmoLMoQyn6Dp7Phaj2i/A+/uzob7Pe
         iIWcCaaVv64cG7j3j4ZJ130wGjBpvBQJZmcs5ajkb9wVNUecuKpnX/9rjtjRL1krgqow
         Nqwg==
X-Gm-Message-State: AOJu0Yy0cM8ieeQOw3l7n61k6d/FQbTsohAV+fQHCrlz1OFI08J5qjPT
	CVq5Yt2I13IAQ1Oi4+duwzjsp7BzzsrPc65OVHQuBz/+Mq0qQXTSKvwsRotdLFd/xx/TGjuh/AX
	POneEu+0=
X-Gm-Gg: ATEYQzxdr9eBhE+OcU4xAQFlyBeEFLwGFi284ujo4+BmAZgipP6uAjbILMZtElrd5HT
	p7j7O2VtZc6Psp9hZkpIuhHW/O5Ll0eAmJJl5XHcqmmbZe0wVApEfA8SSA8yG16IPQ4oj47MJ9X
	GQVQ5+ekhkRjXXjTvsUEBn45KTXi6Lz062Ia3E0j6bukQvC5G3rpMS1qS8Hyb6UMwyfC+34ah6k
	jt/YkBlao8oIEtwMJucEAG0wWNBGQ0wTA7o5ehhpxTYxXUhqOVLesLp02gryULYXM1mgljsQLKJ
	Pb9R03+gW6XbRWhnVBo/6in2ypu6xNnqXeiH/xemT08SMu6iifw4V80kwzdsbgQBaAgH17QShtN
	ZGn94ZBXtTflKdePCtt4gjf7tn5Nl07//h79RTNL/UoGxsXjXyqGx1n1OGZDy7o6gX7DpKBLBx7
	nV44yspshfATJGC67cC5By066ZM5cpFkJsJEqnLhV6W17p0ZlgRcDJM5gmDnN/ql52ypcc0Bgox
	w3kA0pP3izl5PvrnsE=
X-Received: by 2002:a05:6871:8910:b0:40e:deac:4248 with SMTP id 586e51a60fabf-41798dfe0d9mr3071115fac.3.1773355759600;
        Thu, 12 Mar 2026 15:49:19 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e26e2c6sm6690125fac.7.2026.03.12.15.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 15:49:19 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 2/2] em28xx: Add Hauppauge USB Live2
Date: Thu, 12 Mar 2026 17:49:15 -0500
Message-Id: <20260312224915.2907539-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312224915.2907539-1-brad@nextdimension.cc>
References: <20260312224915.2907539-1-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55553-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E39AF27B1C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

New revision of Hauppauge USB Live2 switches from cx231xx usb bridge
to Empia em2828X bridge. Inputs for the USB Live2 remain the same:
- Composite video
- S-Video
- Analog stereo audio

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 20 ++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 67266bddb713..0c5851bf4ef0 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2623,6 +2623,23 @@ const struct em28xx_board em28xx_boards[] = {
 			.gpio     = mygica_utv3_tuner_audio_gpio,
 		} },
 	},
+	[EM2828X_BOARD_HAUPPAUGE_USB_LIVE2] = {
+		.name         = "Hauppauge USB Live2",
+		.vchannels    = 2,
+		.tuner_type   = TUNER_ABSENT,
+		.has_dvb      = 0,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = 0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = 1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		} },
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2770,6 +2787,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x846d),
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
+	{ USB_DEVICE(0x2040, 0xc220),
+			.driver_info = EM2828X_BOARD_HAUPPAUGE_USB_LIVE2 },
 	{ USB_DEVICE(0x0438, 0xb002),
 			.driver_info = EM2880_BOARD_AMD_ATI_TV_WONDER_HD_600 },
 	{ USB_DEVICE(0x2001, 0xf112),
@@ -3260,6 +3279,7 @@ static void em28xx_card_setup(struct em28xx *dev)
 	case EM2884_BOARD_HAUPPAUGE_WINTV_HVR_930C:
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB:
 	case EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595:
+	case EM2828X_BOARD_HAUPPAUGE_USB_LIVE2:
 	{
 		struct tveeprom tv;
 
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index b6b8c4ae93af..9fcaebd78bae 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -144,6 +144,7 @@
 #define EM2860_BOARD_MYGICA_IGRABBER              105
 #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
 #define EM2860_BOARD_MYGICA_UTV3                  107
+#define EM2828X_BOARD_HAUPPAUGE_USB_LIVE2         108
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.35.1


