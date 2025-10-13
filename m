Return-Path: <linux-media+bounces-44283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136DBD3645
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70ED2189E748
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D627C309DCB;
	Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="izTUNuay"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18326056A
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364903; cv=none; b=YlegVpx+Ab5QGxzcVGNfz4bAyB2Ubw60WtQGxE+U4xMxEvLVk/8JL6fHsD8kPJWwLI5HmqE6ymMYPHGCufX4NJrvpJBIPoNedtDgWmG1Gt6hvh4K4IMdcgZjyuUo7vilkroWjLauiu0uFf2rGSX9GziFQZfm2R4JbVQidqUnC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364903; c=relaxed/simple;
	bh=+oAwKYsKZnmMRNeirjVFyUXif+/X/1l4gmdnVjVso4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egcd/ZQ9GFYqxblQWspNqOL298f6ukrZD67tNExcCdDj5OASMGjtQq3yt1AfBsH6r5zGab15H0RLtd3EpWaJUht72OTmvntc1StnbFFzE2UZtUrPC/ZIspYKY7akeAqqXzY5XeXwDBlEj6wCQJpLGVspVCSoTbusJdJBdJ0xFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=izTUNuay; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649634e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=izTUNuayAQ45sJgBQXb0nIli8DPefQgSO+xRgra5o4yjJ6Nz+NS35kd39st74oQW82
         oogcytQoWlc4+jWm0/3pG77HeR8v+K0uEPIVlBqnxkUvwmvT54rZDM2A/75TGymXZ9Mt
         E6Nv6WCwdpnhxJKw8IC6L4hwQ4VpKY3qQwTz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=j2FbqurgM3WWputlPqTqboQDElqiqlEqEbb8dS57PLP6paR0sKLgoR57CaIWcEJjFb
         8JhWMbXPbrYo4KNJO7CyatoI+4uJ9whqKLmHzagqQJg+JH8EJ95u/Nx2EC6JK0W9mB97
         1uVQHmFD8o1OWavF7IxHk7634AmJ7YxU+7PWrCjQLRijHTt2qa0zF4pT2yKzU8B4iAF2
         G5YI+xmj+DsAjB0WNeqVZNcxggoY+NYpcWaFEjjFYRCfJziIGw/i94j51bwv8xgnypMO
         r0T+6vnCVBjhxzlKC6Xcdu6U7ppIUxzYF+NmwW2kH49Tf6o/hqDBXPwz1+FT5NiNTly8
         yVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUsdbnss9JA61wexFHaYRK4fva7Mw/9bAIEDgs/sY8L1J6SjXipXy/wEeIBhWognDm+GZ4HuA8D+qPCbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzj7S1MWkfHWue1m1ujqc77CQgRuk+fio7kMq/xOsoaWPYJxB
	span/G+zx6SPryPzFBBQKAftyKZ9ru+cMkltqeONugyENgHuSpfTMRs9pb5XwPK9gQ==
X-Gm-Gg: ASbGnctPX0fkppxPlVkeY1J8s2QmXbPEPfMA5bf3OJHF0PnpMPthYf16xyo0jG4hDdb
	LVUYSEShhn6MmhdEprE2YwdhZPAtSt24FwlWzFGdD6JnpyGd4iZs4m3+j+QVHkKaw7rj11YhGA6
	G5pN04hf8JSOnnDlBHkwrO+ECNOl0if6MFY0zCRbuBDQEOq5VaRZ3rZehNiq4A8NiM1fCpLwUHb
	AoWdqB8q6LcFwAbEOb4qDjE0FARXsnMoXfeTkyfteseUlO/tel/I68hVLlecjUW75Gi5ZLXg9HO
	p+JuHaA/x1P52CY9xSHSQyembZewUPwDtpFECSvfhWmdqfQM5OutQTUFJWN9No8m5UNS0yghjGO
	dCvFYLdh/krka2ZDuncbQS8GpVwm5Xw/wurjk2C80S/JI676NAdZp2ddxhRdrveMbn73wqN8UIJ
	sNUbFG3uHnKNuXmXIzLw==
X-Google-Smtp-Source: AGHT+IHVv3VTrmCgUzT/cTkypfMtCAEj51jzL57PRvYw0rG8gIadeWnRbBvldcFvBGl05DoGVFZcMA==
X-Received: by 2002:ac2:4e0a:0:b0:55f:503c:d328 with SMTP id 2adb3069b0e04-5906d8edab9mr6287769e87.36.1760364897004;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:52 +0000
Subject: [PATCH 12/32] media: i2c: max9286: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
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
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c0961688d6173843f3ae846253d4a8669ae762b..e6e214f8294b83105be02f29966e1d3ed72f8dbe 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -751,8 +751,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 		mas = v4l2_async_nf_add_fwnode(&priv->notifier, source->fwnode,
 					       struct max9286_asd);
 		if (IS_ERR(mas)) {
-			dev_err(dev, "Failed to add subdev for source %u: %ld",
-				i, PTR_ERR(mas));
+			dev_err(dev, "Failed to add subdev for source %u: %pe",
+				i, mas);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(mas);
 		}

-- 
2.51.0.760.g7b8bcc2412-goog


