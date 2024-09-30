Return-Path: <linux-media+bounces-18833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2B98A1E3
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A567283347
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034DF1A2860;
	Mon, 30 Sep 2024 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G/x1deI8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078BE18FC92
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697933; cv=none; b=eZrX9JPbEXb3/ChZ1RANlovu8W/s7DkTHjiuCkEXPuYUvzoqzJ6rB9lOc/52hQU2PbtTgQkmZQPBqFKavulkJUQaHFGDtuHZ75xmf3trMwGUfPCklLfhDLIye5SqNJzihOZ5AZR7d/SueBQTwuCTjsTLETjT08x2F8VihTd4JG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697933; c=relaxed/simple;
	bh=jY1WzcwZ9RpRPpmgPFLEyMqg1JCaHzSShjO6IWqlOD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obEJypVf+0YD/imvY0oe1uUitmnzC6TbkCf8+OY7SDVOY/UTIv6oj+psJaKqo6Q7m0o5JW8UrQ5iq/jXXYgNHD0Zydk7pUMisgFFfpK+VzWpu/KcsIbHmBkNBKQxRRk8h36K2vv4mHOgO+35jM/sCjSnQxjSzXEswVeOZdzADYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G/x1deI8; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-709346604a7so2210834a34.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697931; x=1728302731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4CZBI+n6IjdrtDGuJsp4m8Z3nCdNkGXw0PtmNPGNzY=;
        b=G/x1deI8uE6uFMiFiTTRc7a0Q/1HECCL5g+Igr/mfo9wAzrWfcV8nnEY6F4RpdxvsE
         dfRf+LePQlEBSbkzLkn8L06/0dSteMEI3uEReEVGHAjoLYpZ79lDYjLWTn1Uo/atA33k
         wkMWza2EHWoFH2xAH4ja10bgIIPubHPECaOeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697931; x=1728302731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4CZBI+n6IjdrtDGuJsp4m8Z3nCdNkGXw0PtmNPGNzY=;
        b=cHYevGOQ0NQOS7to2jEWBUIB6x9JoySrf0nLhhFpocYvplBh+gEsTt4fXqPZR6NapU
         7DvAH9caQ+MoJQ+AFZCvPfRfdnopiA60EBq8vICn/KhllLak9m0woOJL+xqVJZwnbAry
         RGp4k3xmHc2zs15kL0I8X8u6F2iQKZZbCrFd5c2nikd+0nhoq4v6Gu24x+4/02mK7FpK
         nDuTkSCZ6PLWSpl3EoaNpncnEPAJyYh7kMz1M7Lc/HtCtGHAxdv3OyU+SgxQxpx/SIe4
         a0O0orRDAstaAxVOzeu2oSrSkDVU5YCdMgwAjo0FDUbOOtyfSmH2PbmPWV3/48G8szHO
         CfSQ==
X-Gm-Message-State: AOJu0YywD4CQBgI22xnHlY5C0tsszA8e+7l0KehlogYbNMo17Pj8TWqU
	HTRE4Dla/jdewnNVUZDigZ9I0oWQBOK8W+FGgwy6MriVgwd446NwHhNCGtd5Dg==
X-Google-Smtp-Source: AGHT+IF0K+EHYN7PignB/8NYu53YVj7j++O0mwk1W5RBN0+QHuQojpzGFveGrxjlPlRfoI1UafopSQ==
X-Received: by 2002:a05:6358:2c8e:b0:1b5:c4f3:faec with SMTP id e5c5f4694b2df-1becbb585e8mr274204655d.4.1727697931042;
        Mon, 30 Sep 2024 05:05:31 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:40 +0000
Subject: [PATCH 45/45] media: i2c: adv7511: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-45-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/i2c/adv7511-v4l2.c:873:46-52: opportunity for str_enable_disable(enable)
drivers/media/i2c/adv7511-v4l2.c:620:28-51: opportunity for str_enabled_disabled(state -> cec_enabled_adap)
drivers/media/i2c/adv7511-v4l2.c:642:52-54: opportunity for str_on_off(on)
drivers/media/i2c/adv7511-v4l2.c:568:29-44: opportunity for str_on_off(state -> power_on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index e9406d552699..d9af81015e72 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -565,7 +565,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 		"9", "A", "B", "C", "D", "E", "F"
 	};
 
-	v4l2_info(sd, "power %s\n", state->power_on ? "on" : "off");
+	v4l2_info(sd, "power %s\n", str_on_off(state->power_on));
 	v4l2_info(sd, "%s hotplug, %s Rx Sense, %s EDID (%d block(s))\n",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT) ? "detected" : "no",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_MSEN_DETECT) ? "detected" : "no",
@@ -617,8 +617,8 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "i2c cec addr: 0x%x\n", state->i2c_cec_addr);
 
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n",
+		  str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		for (i = 0; i < ADV7511_MAX_ADDRS; i++) {
 			bool is_valid = state->cec_valid_addrs & (1 << i);
@@ -639,7 +639,7 @@ static int adv7511_s_power(struct v4l2_subdev *sd, int on)
 	const int retries = 20;
 	int i;
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 
@@ -870,7 +870,8 @@ static void adv7511_set_isr(struct v4l2_subdev *sd, bool enable)
 	u8 irqs_rd;
 	int retries = 100;
 
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ? "enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__,
+		 str_enable_disable(enable));
 
 	if (state->enabled_irq == enable)
 		return;

-- 
2.46.1.824.gd892dcdcdd-goog


