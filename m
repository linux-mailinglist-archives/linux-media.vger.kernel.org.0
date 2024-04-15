Return-Path: <linux-media+bounces-9447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6238A5B2F
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85965B247DD
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0451635C0;
	Mon, 15 Apr 2024 19:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bPga3VYY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586571635AC
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209704; cv=none; b=tameRnw+B51pw+1OhmjdLhOZdoztvaScpyy2yZit+A+qr3j7xux2BptSZZcswwbo+Lo/QzqsVTP4UlFM3NrdxB+BxlHHFZsGuABDsJAM/uzGoxwxgmYEHqxXEIhGJ9tkDqorb7RhNnHEGnbH+OO7rD9XAoyOmWPrQ/IWtq/LGLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209704; c=relaxed/simple;
	bh=As2d8puekv3wE81Lbh8pk0aXTZ4wR0q1+eriDu5asDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiOo1P+nn0NgwXnqfU2ZQjPSw/QE1pw9yU7ZLU+rxyxWdmL0zXU0utaSvf05j8FeE0YlW5YlzrbHn9oJ1DWzLi9PvdxSOMLUSAH0kjnGGObrFPVI2GwrAXmw8n0puDOvLA9jq00fyESkw2vpVEJq79sRzvVnWR3Fju9C+8i4ROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bPga3VYY; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c711afcd43so424333b6e.1
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209699; x=1713814499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=bPga3VYYQw063FYKul6YD4eTUmZWCCY5ZUdwfw1E6NdvIzHf/djDUQcdYByjL6b4YG
         YWMTTmVH6b7t33hrqhkuA8HXaHdiJ8zPsDMPocraVwS2P12jEFEYCpDsOIUWjddfLLD4
         L+FQ02dy550HTIpo2KGgkFok9XBIt4tyDHGbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209699; x=1713814499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=XNjdQWXKVUxRWrdm2j9c23T5C1qoQv0zPUeOO7Un3KqLM3Hj5fIAexP65X6WI3jp+O
         jjRhQ5EB1dLupSSbagzrCQbTcz/432SKKWbH7Hd9DpXmDp/mRLVs/EwmyC9qTNyOaZ17
         43r/FA4yJBY0vKU+/bAXR0Bo8AyG4JZWNnFZg/v1fcYv8Y2GK2twIGC0GlCztaG5wYlJ
         hfw/3d+xrYdV1dwH7li9khv5xyi5f2KDW0jlB0xIwiWv9RGQ0n8qWDDj82TiVJWnqtrB
         hZb1VgLsXmJ9EBOrfWkSHnyyTx3GYmeBMHN3yhok5P0jcP8IdPYWa9zQscO5d9+WFVyx
         YtQw==
X-Gm-Message-State: AOJu0Yw7AlYrKOG4RzbI2dSqhe7wGXsLmlz3ikkQ7z6+bl7l0igwebE5
	luFQnWA35/p6MO4SFgKNBYV7vFmV1AXome3dZqfOXIncEP2dCUM6xREWURPxmg==
X-Google-Smtp-Source: AGHT+IFB7ej7jQ6Y7TTKmDCBXS4WSfTxH8KcZpQzoboVm109oqWmXInnRELaaHMlCW17SN5elKNPwg==
X-Received: by 2002:a54:480c:0:b0:3c7:c12:e2fb with SMTP id j12-20020a54480c000000b003c70c12e2fbmr5150205oij.56.1713209699409;
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:45 +0000
Subject: [PATCH 28/35] media: usb: cx231xx: Refator return path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-28-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This is a nop, but let cocci now that this is not a good candidate for
min()

rivers/media/usb/cx231xx/cx231xx-video.c:1282:12-13: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-video.c:1328:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 8f347bbeeb32..bbe207d72427 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1279,7 +1279,10 @@ int cx231xx_g_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 int cx231xx_s_register(struct file *file, void *priv,
@@ -1325,7 +1328,10 @@ int cx231xx_s_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 #endif
 

-- 
2.44.0.683.g7961c838ac-goog


