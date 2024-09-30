Return-Path: <linux-media+bounces-18820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF798A1B9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569441C21792
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B983219DF99;
	Mon, 30 Sep 2024 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iei8hRIB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8919D8B3
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697911; cv=none; b=VsiVx/t5wFRazyYIRpAGRb8naTCScKgu4J+EFgufCP/l1wOH74fYPvm5qR79xezu3j2R0Ep3fSfd7PwYtobtARtysu9n6vuZjkuXBe5rGriVUdP6IKfk9Xmgl+zqza1Si2/rnS+Kp10O5wlMFKXsHK5DD5svbIrkIa5ySRwNl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697911; c=relaxed/simple;
	bh=4z/LssQ02GJNR8bA1yxT0qSzeZ6+9fo+8Pg8B3PGX2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpXXaJ0ODHoy+7v4kgQD09yQh+sB8RZ9/3nrQkREs0vNe7TOKAUX/6RaxoDKj9pblPjTqN2LuBEVgX8C3mxYxUyefT5AwWzj7R79lgcYQEJuFzOdvcrXo2jbfXZR5HLUhsrBqSMivPf5sZMaIDaZFFP9XQzjBYXgy7zlh+/GQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iei8hRIB; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cb2e136da3so29189776d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697907; x=1728302707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=iei8hRIBuqYg5AtI5xzN3CMe3vJsU/eee5asrgzGm3bYZl4xvfIUqZyJZre9wUKr3T
         akb9WaaPgkyyS+KWzMVU8f/Zex4AuUqNPBL1/QkuzLIdyuCNv/M9f1Dv7p9tqK3aC7c3
         kT2d06Vdz/dUMMwvS4UmTlKSTXFqNxmNOFupk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697907; x=1728302707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=t6FFn6wbl1fPj7G1BhOTb+v7GhH4dif0sNqsLTz1K7Flr99uhzL0qqbHPvIQx1gz38
         /xtOM1Y67EVt/Q7A7dzpHVRk+5ypsFf5KaYwOQJub1PETmRlXTXAkxW/TrNLE0vjv08X
         68ahbqcB3IMNEfABDbAN38cbHPuo3xQNfT3BA2QcTvEX4QhPoh4irVoMLY+PUBZ+Zn1M
         sTgo1KhtVUCqARj/WaRUinzRqCjhg9a1tz2AFiqi7uewmlgZN7BFPb6tmLLFXYno9QSY
         Yk8ty1WBxFgU90lPjh/MGcoo5dTF0U9T55TZYVg1T1jxZx47rWGGQdt+PW8T8LY+sqox
         r+3g==
X-Gm-Message-State: AOJu0Yy3+eTq9elUcRGjrzOwCkKq+l0vhf0bXLZEvn2YkRptzz8dHebB
	lUaFX2wtRBtX6Rr/Zlb0pgaQbTZwYffX/vuI/i8aqtOO6K8sVYqsagWSOBdZ9w==
X-Google-Smtp-Source: AGHT+IFyOtAPK8xGQ/QMRxJMYu6WDsr9USOQ8VSoGNgApI/9s4N+ulaKyT/ysJasxumVieqsjFFOrQ==
X-Received: by 2002:a05:6214:3f84:b0:6cb:455e:da5 with SMTP id 6a1803df08f44-6cb455e0e83mr174779006d6.45.1727697907195;
        Mon, 30 Sep 2024 05:05:07 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:26 +0000
Subject: [PATCH 31/45] media: i2c: vpx3220: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-31-81e137456ce0@chromium.org>
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
drivers/media/i2c/vpx3220.c:404:41-47: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/vpx3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 5f1a22284168..c5b031dd59e7 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -401,7 +401,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 
 static int vpx3220_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	v4l2_dbg(1, debug, sd, "s_stream %s\n", enable ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "s_stream %s\n", str_on_off(enable));
 
 	vpx3220_write(sd, 0xf2, (enable ? 0x1b : 0x00));
 	return 0;

-- 
2.46.1.824.gd892dcdcdd-goog


