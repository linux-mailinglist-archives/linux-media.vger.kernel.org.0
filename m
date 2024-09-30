Return-Path: <linux-media+bounces-18796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711698A175
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59D0280EFC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BEE191F9B;
	Mon, 30 Sep 2024 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ezr5xw2N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31321917D2
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697862; cv=none; b=nPxQyWelSfDqGu3yGkuehn/If1iHfx8KuwuFOO0e7OjFMTrIV7QEYeCRdzfgCZepavYo2bh7Qn9UW1e5xt5GpmfyNL+u4LZVFYTX0fgWRYflgqBLId+gd7XcbBdzL9mhzVleuJwSSJcxeya01NgvSFJM/2zdn12gFeuCk0pHVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697862; c=relaxed/simple;
	bh=BvA7+CDkEDbwQNrCD6szhKebs9WzOh0Xxj8N0zINlEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNCknhFT/Uq/ph2aiDV+egrc7+EgiRFs1fS1y8A+mRpXuDU6vWt49nCsTugo1pzkYo2nBP+h0j8ypvPw4ULv3+TLRFGvXWuEvEqx7ysn1nawfboYDfuQHO+yk9buUcJ9YnoaMV8T0PpAzJS5IrB7yYRrGnhKaOrP+F3+qEccGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ezr5xw2N; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71100987d1cso2585602a34.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697860; x=1728302660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyq88t8pWb3nvRMsH4SWW8lN0+v/o8BALR3Lyr5Ymdo=;
        b=Ezr5xw2NNr0mkx4s8kIeMgeMjmlN7uJcaf+p8U9LSSwIHDAhndTlItmY6WLsoVPNA9
         s5eFp6sLrkykK96ox089oGwa9Z9cTKYeavL4rVB6ZY5UQUBsK52HwBvW0hmlrsZUTX2y
         5XFlfFpgZLrXxjYtJDnfb1gWmRXoWxdlI/dUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697860; x=1728302660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyq88t8pWb3nvRMsH4SWW8lN0+v/o8BALR3Lyr5Ymdo=;
        b=Il+mfYAQLyoEqJDwuZFP+hhKZma0WwpsDUMeXPk4w6zFaALDtWwoSuPwCIwYdE9HA2
         SZsUxbP6+tUINOuofHzyWDRWuS5xBkyCaru9TYjg6AvIClozBtkcd3mFiLP7Y2F9V1jq
         tU5UhZxeymbzxQENO8+BATXT05MB52cifqsACu4Uuu+A3TTP/Pk16pR+Eq5CNPLBla6C
         LYDELoJ+UhEQ+h/l7pGDZlovofujxmcbMzxl8H8cJT12j667vsolBnORYaarSpN1Eh/m
         EZVivBUDH8JWqEpdET34q9UY2MaMDj1lVniuhJMORpI/c0djzvIlyBpUqePMVEdbQctM
         ezGg==
X-Gm-Message-State: AOJu0YytCKnZOQJkAgs+JWMwy3Uomm3Nj3/DkmFEOFyX7y4tsMA31tfy
	qEv7iYxPRAUgh1bU0HV3v1yI65oV/G7QhjbVfjkpf3kCpfeoXXnKFNtI0lbg5g==
X-Google-Smtp-Source: AGHT+IGlFIIrabSCXdg/bJ9e3MVgi6gfLFZpzZGyv3CgenARKjE0A4bquSvob8woJ1CdObZm4BjrEg==
X-Received: by 2002:a05:6359:8488:b0:1bc:d1ba:225 with SMTP id e5c5f4694b2df-1becbb8fbe2mr306353155d.10.1727697859596;
        Mon, 30 Sep 2024 05:04:19 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:03 +0000
Subject: [PATCH 08/45] media: dvb-usb-v2: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-8-81e137456ce0@chromium.org>
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
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:250:3-22: opportunity for str_yes_no(adap -> pid_filtering)
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:337:3-22: opportunity for str_yes_no(adap -> pid_filtering)
drivers/media/usb/dvb-usb-v2/az6007.c:82:32-38: opportunity for str_enable_disable(enable)
drivers/media/usb/dvb-usb-v2/az6007.c:192:32-37: opportunity for str_enable_disable(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/dvb-usb-v2/az6007.c       | 4 ++--
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 2410054ddb2c..1e9f946193a6 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -79,7 +79,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 	struct dvb_usb_adapter *adap = fe->sec_priv;
 	int status = 0;
 
-	pr_debug("%s: %s\n", __func__, enable ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(enable));
 
 	if (!adap || !st)
 		return -EINVAL;
@@ -189,7 +189,7 @@ static int az6007_streaming_ctrl(struct dvb_frontend *fe, int onoff)
 {
 	struct dvb_usb_device *d = fe_to_d(fe);
 
-	pr_debug("%s: %s\n", __func__, onoff ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(onoff));
 
 	return az6007_write(d, 0xbc, onoff, 0, NULL, 0);
 }
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..c0a40112d043 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -247,7 +247,7 @@ static int dvb_usb_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	/* wait init is done */
@@ -334,7 +334,7 @@ static int dvb_usb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	if (adap->active_fe == -1)

-- 
2.46.1.824.gd892dcdcdd-goog


