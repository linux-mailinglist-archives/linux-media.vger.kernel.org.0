Return-Path: <linux-media+bounces-18792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FF98A168
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46EE3284503
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207A018F2F8;
	Mon, 30 Sep 2024 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b+faV4xW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DFB18EFF1
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697853; cv=none; b=hfed/HtF6McTDTz1cDG79F9zGrIYWj68PwuYSGPzZNQvx0IcVhMbwPUJG5ToTYtBkepyl7OtI7qWOkkTQI0SWCDkBtY5LPdHw49ERfR+QdLVZ8+L+U5Vv7D0kXy1LiIxOKNZqGNle8bPA8m4C2gyJJiUKEB1L4tQlZX55SghAD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697853; c=relaxed/simple;
	bh=TBylZ8SaoziYjUVhpT7D5LPjCQTvsm3WiWvgxJj6GRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHjdUBFHFtXxncjt9//p+vl/nl/1PWgy1vc7PZQjW6FsI/SDmmk4K99db+iXvIOTXN9qqUUThS6+aM2L97WF1cytaCtXj1mPwCWPKZANhkBO+aOwtIKaTTBOAuJzlX09CtPnXbBW0ycqjUm6YA9k/+RgOg/jRGNEPZOYofAG2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b+faV4xW; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb35f2aec1so29784586d6.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697851; x=1728302651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=b+faV4xWXP7Cr0WlJo5PeXgDQs3HyfIxDyyKSUAFfFJ4c8V8pr1kUHaaw0vgKc0wWY
         pKe8DHQ3IuuPVIPdk9rpQK2bN92jJM+CJdvqedGxAEsvRjUUuYS5QwcNs5Ey2X3ybn/V
         QJGHSIq1S3BwTIJh/C9QRW2LF+l3ioBnEiR2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697851; x=1728302651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=BzDCI/3ApCp4qH+JxjGM1lXPhKWfqBxmoex2ipeQHeTs4FYhkn1BIAK817zi1rEodL
         E84d4kOEAkCJVYea/IQ93Qqi4TBTQJwo7+LsyxjUlVhCYR8C5hLg5r9siu3BZRKMHhjQ
         PQ1Cw69DW6E2IGxUUX0/BWkaZ/gVbyRePFC/WUIuFpvxb1MeZsRj0f3p0zcNnjTgaMcC
         9xDkLa6Zv7nQr3yXz5A0gZ6a1R121WGb5LHzCQsZtVc6qTwHirnSgtvH2vsy7jgiHohE
         qmhPjLXKsmxtsbWwgqBn2Owur+c3Uouyj9n3B0JCfDuF9vPt3+U/X9GGP5k0JYV/V4xe
         Arsw==
X-Gm-Message-State: AOJu0YxHbPF/EqwY3cmpJ9s8zwSOlkTMcPHJqBhJr/aMvJxq+Sk4wzFg
	JwxA4PMdtCGDoV91mGLi6ovK8M+N04W9YHA6GbOAVkZikwt6ifycBR1CKAZiOQ==
X-Google-Smtp-Source: AGHT+IEk2U+7gH+P0zkQD3jLvaacsDuUtudGo2qx4V1eWgV4awKOL7SjyupKFoxi8Ld99dzK+gKdEQ==
X-Received: by 2002:a05:6214:4a89:b0:6cb:2adf:751e with SMTP id 6a1803df08f44-6cb3b646986mr155979836d6.31.1727697850717;
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:59 +0000
Subject: [PATCH 04/45] media: pwc-ctl: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-4-81e137456ce0@chromium.org>
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
drivers/media/usb/pwc/pwc-ctrl.c:492:5-10: opportunity for str_on_off(power)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
index cff64d872058..a1b4eeb41cfe 100644
--- a/drivers/media/usb/pwc/pwc-ctrl.c
+++ b/drivers/media/usb/pwc/pwc-ctrl.c
@@ -489,7 +489,7 @@ void pwc_camera_power(struct pwc_device *pdev, int power)
 		SET_POWER_SAVE_MODE_FORMATTER, pdev->ctrl_buf, 1);
 	if (r < 0)
 		PWC_ERROR("Failed to power %s camera (%d)\n",
-			  power ? "on" : "off", r);
+			  str_on_off(power), r);
 }
 
 int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)

-- 
2.46.1.824.gd892dcdcdd-goog


