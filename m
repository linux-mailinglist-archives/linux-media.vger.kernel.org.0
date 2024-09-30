Return-Path: <linux-media+bounces-18817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F298A1B2
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C1C1C217AD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594B919D09F;
	Mon, 30 Sep 2024 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LvqPh815"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F519D065
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697905; cv=none; b=gL9f2GtcDgAvslhNG6uu9nvhRIgy0o+0phfX7G8MTgy55i5Ow4Q0KHT0qrCGdPNaXt9nMSz5aUFt9z24KudBf6V50bzEli+YY4GNjJ0SuRA6cIOrfl9KKlBk5Tfj27Cv8XremsSFgrKAdPj4MJpx1Ry6geW7tCR7yAt/kPu2hEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697905; c=relaxed/simple;
	bh=kKpr508Yau4A6DM1O58ZKid3P/LjCOEsyTEfHMo66Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3ykNfk/60qSy0CAxCP3Q/LGQEzbBt/R0W0QnBpXQ8oFfeZJjCurzfRUD8jtB9ZuOnSzPHYKrOF3mLFmEMyXAlufUXGGfSow90EMwtKDIawojVsYyRfPs6BxSrEa4KmEpEeosWvwIgMk7OZMOrHwzA8C+WolzGEBOHog2Z3NG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LvqPh815; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cb4c013b78so18083516d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697903; x=1728302703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=LvqPh815STRTQ3xkb4DKQP5IZ+kamJrP1pz3M7VXBfVwu/JTnMXpH11waRLQcTj3UQ
         tfXl8PwHBaVWhKYkl/zvkyhFJcnBPMgaeXxKM1wA6uJC917BkmJrcyrYRnYoGy5ooRPO
         HiQXvDOMILZ4IYF+CiOm1hAwfoU1ofe/Wl+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697903; x=1728302703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=BMnmKuQbhkl9eTg1H0DOezuQEOEcJbvnXSAUzhCEXd0x0SIB9GjGl0vCei+/QLzYG8
         Bkq0tj7lBqgOF7VIsnQ9pm96D8x9JD29FRO2x3qhRdmt50fEVg4b0f6oKLxARLdS9oeB
         +1l/ToxyfJfq7rk5KR3ay2+PIsFr1g0FBxGQIM4yO1YyAj1c9gmFWqA0fiJb1ulhLANf
         W8sxsb3u3fCxJPibBV+DnidMP1KImMSSy6lK8TbZ10c8pU8T1Be8wzQC6GFfx6fMlL4s
         w80BP0SymnB1ADSuhcz8tvz4cXiyZJuUp7ohOBOPwbkpWJh5r3XMG3SuX5wCgB7WW/wj
         gghQ==
X-Gm-Message-State: AOJu0Ywt/RnghbtPlplIVnAOe/9g/OLflOVpwEHkT0wNQRcy47X5eib/
	kixT5EfWrc6I+FMtylTWlwMLvTivmYRXzj08DuiAGy3gTGi9E9sxJBXGCcPEHQ==
X-Google-Smtp-Source: AGHT+IEAFwwRA71MkCRUwImfi9uBIeNCYwuxiEwHafmSSDdtTJviDnVg18iocWAWeF5m9aVEXLwnZA==
X-Received: by 2002:a05:6214:5a08:b0:6c5:b709:55c6 with SMTP id 6a1803df08f44-6cb3b63b3aamr219594876d6.42.1727697902571;
        Mon, 30 Sep 2024 05:05:02 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:24 +0000
Subject: [PATCH 29/45] media: siano: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-29-81e137456ce0@chromium.org>
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

The following cocci warning is fixed:
drivers/media/common/siano/sms-cards.c:329:36-41: opportunity for str_enabled_disabled(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/sms-cards.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/sms-cards.c b/drivers/media/common/siano/sms-cards.c
index d4a116ab6c88..e9aa95233ff1 100644
--- a/drivers/media/common/siano/sms-cards.c
+++ b/drivers/media/common/siano/sms-cards.c
@@ -8,6 +8,7 @@
 #include "sms-cards.h"
 #include "smsir.h"
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 static struct sms_board sms_boards[] = {
 	[SMS_BOARD_UNKNOWN] = {
@@ -326,7 +327,7 @@ int sms_board_lna_control(struct smscore_device_t *coredev, int onoff)
 	int board_id = smscore_get_board_id(coredev);
 	struct sms_board *board = sms_get_board(board_id);
 
-	pr_debug("%s: LNA %s\n", __func__, onoff ? "enabled" : "disabled");
+	pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
 
 	switch (board_id) {
 	case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2:

-- 
2.46.1.824.gd892dcdcdd-goog


