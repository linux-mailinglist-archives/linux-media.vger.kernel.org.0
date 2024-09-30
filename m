Return-Path: <linux-media+bounces-18821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD698A1BA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47AA61C217AA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79467199EA1;
	Mon, 30 Sep 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AN+vkKa+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87C18F2CF
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697913; cv=none; b=QrfzKImZ8kI39PtPlBLqmdoxCOtPTTjxbZjJFPGFQyYVrW+8MCtc85V+Z7hCqvcsebYuBTdP9x0B0BR674skNEy5NUgBrWk96JAIot9eSIP9M5IPZiYxwsLNaMl94boDj7I9qLeG+Pq6ABG3LfCTpPvDX43LTQ8Kyen9aJV1EsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697913; c=relaxed/simple;
	bh=e8rYUX5LldEEYF8NKNEpIaRx2U0eGPd3BaBieyMSmPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUBCWDZHCUn3B2oVcEK99nB7wTfYCEEyaWsiuxt6VQ9ICJ3pDQ+L/RwKxIkef72bWkLuEqKejQLT9k6Ai+wGQMCcXeu5wEI9mvgMtxe3AX/KBA4378oA006Ks7Oftmw5BEmO0yTUCFqW5D38dRfgNSBcjuXc26wBrlRjCLkL1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AN+vkKa+; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb2d2a7d48so30200306d6.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697911; x=1728302711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=AN+vkKa+xQOGQ4EF7NFF9u9yARD/YoXqMSY1Dk6QtvqtYpTTzj5HmAWAj8PS+bHk8C
         36HPo2k8PDC35/Gae+RWHtRt9UzjNDuGmqvX9gKacCTBxxC4ogJfk0hZkz2KlRz6kwou
         Fuu3tuxtxCigG+uCcauChoS9CaaO2fhRM8YpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697911; x=1728302711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=KpI3428Wn01saStw2PNTEiGCk/XS7j35jAWuybu4yU5VEQYUKxdqkAVUdtGC5chwYQ
         AY4DXYBg2hXrPc2P+zHvfrbgm4CrCByemL+JX0duXQE6mvlJ8CcIRErgXjqKvTYC2FyO
         bytM/Dx6cSmRr50Q07Xreiyf7D999uFAPRqG7BsjFr5irr7KFJegL83gutrc69oKGFHU
         G8qHAHMhyT5IxSmkEXIyCRhHrqd0wCRLC+ZKia30BWNZEJtWS8XYvJugUk19WQCi/zrk
         CMR/rv79BRuaOVhZEyfqwVIuaxspstf0mWeEM/yopnJc3R503/WFmtFP/AJrJ65Vdp5V
         Brnw==
X-Gm-Message-State: AOJu0YxvxrH00c0iUVl2pB8qjX4MGfgNbDF0kBv+a5tvQHD9wG9waTpX
	3CWQjiRBZe8gBR3aoDtmzP9MO5dRRVQrcdfKcjGd44mOakjYVSXuCiZyCtkxJg==
X-Google-Smtp-Source: AGHT+IEpi/h9qBTzENrO9vK1BVrLpd+v0VWjCMyXcKhCb+KBXNEG/xGQiqpkb/xdSgfcL4ga0CqsLg==
X-Received: by 2002:a05:6214:2dc4:b0:6c5:5f04:3665 with SMTP id 6a1803df08f44-6cb3b6618e5mr175354206d6.48.1727697910946;
        Mon, 30 Sep 2024 05:05:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:28 +0000
Subject: [PATCH 33/45] media: i2c: ths8200: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-33-81e137456ce0@chromium.org>
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
drivers/media/i2c/ths8200.c:133:4-19: opportunity for str_enabled_disabled(( reg_03 & 0x20 ))
drivers/media/i2c/ths8200.c:149:52-54: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ths8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 686f10641c7a..a6d2fb64f563 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -130,7 +130,7 @@ static int ths8200_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "power: %s\n", (reg_03 & 0x0c) ? "off" : "on");
 	v4l2_info(sd, "reset: %s\n", (reg_03 & 0x01) ? "off" : "on");
 	v4l2_info(sd, "test pattern: %s\n",
-		  (reg_03 & 0x20) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_03 & 0x20));
 	v4l2_info(sd, "format: %ux%u\n",
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_MSB) * 256 +
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_LSB),
@@ -146,7 +146,7 @@ static int ths8200_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ths8200_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 

-- 
2.46.1.824.gd892dcdcdd-goog


