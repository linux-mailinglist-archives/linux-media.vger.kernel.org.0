Return-Path: <linux-media+bounces-18822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7698A1BC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC318285DF5
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C5319F106;
	Mon, 30 Sep 2024 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cIUNiTwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346718F2D3
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697914; cv=none; b=LPM2EJnngs4IDL9EX8YfuFgjbRDCaj+ysS9CXEqbM1+D61yGR6Rt/ryiFdKER3IFm2AVSZfgIEnvOICZQQrOTJg4jaTmih5GiFoY8+9Syp1lbOd+x661FuHIkGoNrhMTaeHgnpLsBrbj1+jvKawnMOFXlZZlnRNeCl8u3D+u/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697914; c=relaxed/simple;
	bh=+YlokRj+2d48flI/asuiz7UPyCUXWUPJX4RPdyyncNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqZ3JEcB0aCI1nfPfz0/8wQ8Ug6lrKT8DQ+YFR0RtuLXIi5kXWJ3lajbjC3Wem/Dds8XZ9X1MwWKWJNZuOvaiHVK3uVVTI4iGB4q1crS1ktqftFv6tsmHnSXecVqeWdw7RRxN1U29i/jIJ82eres2Cb4gGssxgZsKUfAJvoi5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cIUNiTwZ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb37b34a87so30620086d6.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697912; x=1728302712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=cIUNiTwZDTVuYA8XlHrGclClligLiL4c/1ChJxBs/vsVqmMgKiYApCoQ9lCXmY1oa2
         mKM/d9qLTUp6lgPBzw2EDfimXYRWGPi0PQ1HQZL7+SdGry0dC5mrAhVPJLqh9dTPMw/B
         LAwCYXzpqEuUvJxMjPQykUnkNnWT0coW0BpZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697912; x=1728302712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=N5U6XR7BEoTzTafEAtUcN4/kwBLkeVvowJeg0/XuR6BJnWYlSG6mheia9Wz3V8wCQb
         y7Gi2e3nHbaDDfXWMOjA1VPKAW4ikvXLlFOPzIz/iV1ZDU0j4Vm47lQFsWwqGSSpGnLc
         teqo012Flj07ewskkwe716ct24Ey3inpe3EztDCRfWQQpZ3Fj9nZtjkGDzg8uxqdru4O
         oWmjA4psSJfCQSlazjKBxYOxfmVtAFxkQdlnV8zzPVEGDuLyiBypfgBsso/B9r0Esu8o
         GbwjbOZNgMv5o+RkUqVYMMb8lcTeTQDeb87LWu8UpZVoHBwI8DHvv5/zIB1TLt0MMMnt
         l0Cw==
X-Gm-Message-State: AOJu0YwA+vzh1ENf02E5kF23rGkOX7q5tSBc0UUoSGfazvKEHhf889+R
	UXWbfC3rCjxyUKD6a2DiMS27YpV4XQS0TmBK7UiarFRPJQqe4wvHYQluYXqecw==
X-Google-Smtp-Source: AGHT+IEeEfZlZQBmO8RZI8xNY8EgNRIjUt1ZXgq35BOYTCkW0tdPK9t40pOtA1wbfy30W9apcgwPGQ==
X-Received: by 2002:a05:6214:4198:b0:6cb:6655:e02d with SMTP id 6a1803df08f44-6cb6655e354mr40552846d6.3.1727697912026;
        Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:29 +0000
Subject: [PATCH 34/45] media: i2c: tda1997x: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-34-81e137456ce0@chromium.org>
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
drivers/media/i2c/tda1997x.c:1976:4-29: opportunity for str_yes_no(tda1997x_detect_tx_5v ( sd ))
drivers/media/i2c/tda1997x.c:1978:4-30: opportunity for str_yes_no(tda1997x_detect_tx_hpd ( sd ))
drivers/media/i2c/tda1997x.c:1972:37-56: opportunity for str_yes_no(state -> edid . present)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tda1997x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..867c635fa37f 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1969,13 +1969,13 @@ static int tda1997x_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Chip status-----\n");
 	v4l2_info(sd, "Chip: %s N%d\n", state->info->name,
 		  state->chip_revision + 1);
-	v4l2_info(sd, "EDID Enabled: %s\n", state->edid.present ? "yes" : "no");
+	v4l2_info(sd, "EDID Enabled: %s\n", str_yes_no(state->edid.present));
 
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-		  tda1997x_detect_tx_5v(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_5v(sd)));
 	v4l2_info(sd, "HPD detected: %s\n",
-		  tda1997x_detect_tx_hpd(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_hpd(sd)));
 
 	v4l2_info(sd, "-----Video Timings-----\n");
 	switch (tda1997x_detect_std(state, &timings)) {

-- 
2.46.1.824.gd892dcdcdd-goog


