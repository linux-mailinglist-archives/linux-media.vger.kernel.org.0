Return-Path: <linux-media+bounces-44276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4169BD3632
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B803C631F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8CE3081AD;
	Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgAZ0gvM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A089526560A
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364896; cv=none; b=SwVyOI2FYJjxrWrSLxgQZ2SApV+cx4VKwssHb1EfuRaKjZNdzuyr163vpNA6HT8GExlRiAJQmE4b3zetvWtrsIhWjTsjli5nvUS1FkTJauktKVt2BIjZ/uCw8MxC/020P9AGtlz1xp1fSn5Zoa0Cwd7JBRb86RQc/GCG5sEqMRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364896; c=relaxed/simple;
	bh=L4Qw/JWLTT0dmHppUcAHgP693zq94oqrBxXz4v7GMl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARluemX5i+BLlrN9AJPS4Dh1mjwizvVP2dFqNw7v5ohjGkGiuFPSiOuMBqB/AAQ8EB5tXtfBmhMjMXmGXzXRIW1Zs7aPq63QweztUZvW/6hpejU/OSSGX54FeQfUx3Ye2qpoK5luDmVoDcmmVEIHVoIIu4iv/Px/eFsGCItTiIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NgAZ0gvM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294419e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=NgAZ0gvMQr7mfoyTPzzReUMoF0Hpjr5XCfsqa+JU8aYmztaJMLVui81N9rOUW23l9d
         h6JpM/j3VkWEgHBHtLrDMbWDsu9g4FNTZIqymAwAKHsXWiDQidcZcK+6uJAuMdhL3Hxv
         LUxkyp+FPtZLXrLeSP4s8EVkp6W2QBqC4rwLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=s/dQGqJl2CDastmw7cx9ZXhJTumTmR5Tl3LdyhfTK4GNlOxrf1rKSDA4XE4GCk/nnY
         KSiWvjr6XlTPtLXO6cgYm5oILCZTd4/IcN262SWF5P7gmEt2n7O+WCjg3Guxa+vKUFWP
         TVdaYroJF+dv78fX4VxiKbwHg+wufm/nub+uXnVrmktquUK6SN4BXjAO7I+UjAG6Ac4E
         0ocCE/sPpMbXxAH2n0PvAdgfKW7Qh/LlFXzojDRMnlZZ7ALz6ihR4F9xOXKlRhjGpyAT
         F36JxZF913NYYMrYrACaRJ09cnYqppnrXgcYvhqMwddwdv0qH8UcUADzQUC4FSwujpC6
         kEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiAYjVF5mOm3IVWMgCj13xaaOME02wzu3MEACvLXzVt6Jq0Q8Extyo8eU+C4ZHmZkIFjSeoYYhZpcEgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLJZdFtg8z8IS/imC2M3T1v7Hm9eDuPrIb9Woq2ZOAf0Ur+SI
	LcRzMUP2NWYmQ/RuxV5bOJmsj0lF5iA4pkz+yedzRYfUB/i0MOSkE8T6WsWaye50Pw==
X-Gm-Gg: ASbGnctSghKzK7XUHdCEgmUCOZS4vs0PgDz7eP37gu0s4Jlk0qF1aV95+GBv0jepGjs
	I5G/BAmhb/OLf4PaPLi7Ulk4UGjdPshfJpYUDeIpxWk9vWUG5u2qZph1zUtU8xWpmthAj/xC5RW
	AIQNtU1YB6flNHqrRS80k9fJQ3TLkOFz0MGBHj/H4+nAi8Gv5bpnJizpWHOj0YKpG8wi4ie1+M8
	4epn/a/l1tXWqkoTwbFDR3B0dBC6Bh/wx7rGoMclE4EozS0ZbQLVrjxekwYm+3M0TcGCiWnnA/c
	p3tSF8uVobnnCXhVesLssDW/0RDZvf1i1qjyqStoIE9ma2BIBLYTO+eJaNFX370zNYos0uBgMzL
	XOHVZIjN3Z+2LtWaOPRWBmcXjJd3UfW8O6gDkd1gKlvyjBxKEAGsTY4QfEaV/LD4EcTx3NkjZqi
	DoH92ejMr20ixqCm02K8m6BhHvK95/
X-Google-Smtp-Source: AGHT+IG5qmXDx4UbLHB42EHlB1t6C5RYlcWqyFNneQm/x2WKvXaXI+FP3no4d6C9H/LUJRdom0BMRw==
X-Received: by 2002:a05:6512:12c9:b0:57b:c798:9edf with SMTP id 2adb3069b0e04-5906dfa81aemr5323251e87.56.1760364891242;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:42 +0000
Subject: [PATCH 02/32] media: dvbdev: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-2-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716aec54bab7fde2c94ac030696fe25f..8b980d371a45e4fec5368a7e90d4c42518b72e72 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -571,8 +571,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
-		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
-		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
+		       __func__, adap->num, dnames[type], id, clsdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);

-- 
2.51.0.760.g7b8bcc2412-goog


