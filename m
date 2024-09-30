Return-Path: <linux-media+bounces-18812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FEC98A1A6
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E36281526
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2487F19ABD4;
	Mon, 30 Sep 2024 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AfeE7a3X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C48199FD7
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697897; cv=none; b=EPJirbS3Ajsh2i/3jME9L8lbY5lEAX1riU/JV6FfT9dVemOfgc8NLmv0gQawq+0Y+u8txJHPMgF4RQSEpmTE1gShfp7nIV7h2ygIADhROqTavj5oTHbPO/BeDxyS+lSDEIMqw4+vL3PW3LWAmA8ryN0ZQ3kyJq1L1a6I8AxpXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697897; c=relaxed/simple;
	bh=Wy7Skzwx1Of9aMKIpNRDdVVt/EfLoQQHwwrlTgvOSQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjPDiS952zwmFNlGi7tvjnvppsGrtdd/BvTAnKQJ2OaD6VKO3Xtz71EkS8/NMULxUY2mLCMs8hkTZ5HdW4Tcg2d8QfrGCtBU0gN+7zfTY+2xqjCK2bJCLoVemjUwqXCRUXXpK3uKynwnNM8zehE8kKz92qT8I7D+PBcjlZsVAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AfeE7a3X; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb3d2ce75eso26371236d6.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697894; x=1728302694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=AfeE7a3XyFPb8Bz1cI5NNHGjjE6S8KKmgQUyp7nzBvDtpTjH0lydDc05M28du/KS4Y
         EQvcedSccCsZ9hpKreCXtOiKxRaeQAeqv5vbB8TszPITXUNuUMxWDBdULcp+SuZTvOZW
         4UIFCkb3esnlFkMwPtFzbTn80Lx3iQX3c+SMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697894; x=1728302694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=LKGSsZ9wcWWUnVfgWs5WFBxox62qeRE1ommMv66UgfVvfw6Ocq4bGchIGlb/VqRY2Y
         SE9ZGP7vyYEwi1ox6JHwHIaUgxgLRVqpuhFK4lmGouSZDyN1QB4ehyEcRjxs7XHexTlT
         Jt1G9zsEq+pCxBso5ERvslSWq14Pspi3gh7qkjT4Jvjwvj/xH9stbs2uDc1hQBxTw23K
         UI61WQZ334ZOCHNxLJCXCvrCbzBWt/ioz5r9Rxdy0gB6IjmsyOG6nWyQQmjd0M78lEmS
         atQg6QjlVxcKbDs8iVwAR+cF2JnwiUuJYYkcxT9SR+1YnAWyH5VFASfthy1gJGMATpQ6
         2cpg==
X-Gm-Message-State: AOJu0Yx7/aHnNVEEwiS1CZ7+QceTnwD6ovAshLjNux4m0es2n5fu6V6h
	U6mw6wM4GkzncgGmXPfQn/hfITC9O2xGL8nvp+ieCwY4MZShD8mf8N8wYgjgVA==
X-Google-Smtp-Source: AGHT+IHvTtSCRFSBPeJou8A8lJWRExB8EwT4CA/+ss3rMSh3j0C8PX4s4DLpZYrCskrdUJWUEmVJfQ==
X-Received: by 2002:a05:6214:489:b0:6cb:2de5:d7a1 with SMTP id 6a1803df08f44-6cb2f270becmr284661826d6.8.1727697893842;
        Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:19 +0000
Subject: [PATCH 24/45] media: cx18: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-24-81e137456ce0@chromium.org>
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
drivers/media/pci/cx18/cx18-av-core.c:1013:40-46: opportunity for str_enable_disable(enable)
drivers/media/pci/cx18/cx18-av-core.c:1118:8-24: opportunity for str_yes_no(( mute_ctl & 0x2 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-av-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786..5701abdf9427 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -1010,7 +1010,7 @@ static int cx18_av_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
 
-	CX18_DEBUG_INFO_DEV(sd, "%s output\n", enable ? "enable" : "disable");
+	CX18_DEBUG_INFO_DEV(sd, "%s output\n", str_enable_disable(enable));
 	if (enable) {
 		cx18_av_write(cx, 0x115, 0x8c);
 		cx18_av_write(cx, 0x116, 0x07);
@@ -1115,7 +1115,7 @@ static void log_audio_status(struct cx18 *cx)
 	}
 	CX18_INFO_DEV(sd, "Detected audio standard:   %s\n", p);
 	CX18_INFO_DEV(sd, "Audio muted:               %s\n",
-		      (mute_ctl & 0x2) ? "yes" : "no");
+		      str_yes_no(mute_ctl & 0x2));
 	CX18_INFO_DEV(sd, "Audio microcontroller:     %s\n",
 		      (download_ctl & 0x10) ? "running" : "stopped");
 

-- 
2.46.1.824.gd892dcdcdd-goog


