Return-Path: <linux-media+bounces-18819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7C98A1B6
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 169FC1C215CB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E6419DF66;
	Mon, 30 Sep 2024 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nfWGt05X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63F19DF44
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697910; cv=none; b=rObGCVAH+6UcK//anlmZIhs00j1L/RIrfaQ3MQCG+Kz5hP5pVS0DJhHZgVaI7e+skmRwv4mVHOZjqMXc76l3PCPEfK/eK/QwKUhoJYvr/K1nzwGEaUzo5N0n2yNxwzO+1YezBbIfXUqcswn8P+vru6vE2zwUICrYjPLFHDGj5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697910; c=relaxed/simple;
	bh=uih8QEqTTkP4DXsgDAU2UHGmO9M1hExX6/d1paS6Nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKPBvvkVlUEer7JvRoFt7jKXbNPCSywt7R4kCvFkdcoopMPK2P3eeWdq0r8h4bl7jY/Oh0/wWVJZWRy5varK5W0ifnnC3CW1oaFL+XIxiUQcKWqpg7n0OGYuEYiMJcPqU3HAGxYKVZEc13lZLyLg+tDJrL8qAtlLUGEvZ9gwK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nfWGt05X; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb2dffcdbbso37873846d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697908; x=1728302708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=nfWGt05XVrSbi5lofZ33E29UOKsmcef/WH9l77vFn3M2L1O8T26mX+qN7jX7csY+ew
         3itFAfh0AuE+N7b7lu0WM7YMQkDLNW5A/MY97MgKScezcs2bELouRtsYxEs2+2x+J7tR
         LUJuW9CXiuDdKEkjZ2hIutYGRtJGT/MNGbg8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697908; x=1728302708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=MG3fMHJD4UeOjZ8NBzhGZIgbfiZ1DFMkqGHC2GAQ1f5dkDtG09PGe8jqwDug7bwP8f
         qDhMC/Yys1LhVsHjuAdmjlQcwbU/19FJsKKUXqSg8yPumL3JUoDr9txuKWgiRCy3psKp
         8zwjZGnBpbwYd7EXLhMwWAivpIVJjk52jRc8Pucl9Unm7SMG76VkiT/7AvJtm6nqbNOE
         3jY8KxiJ8PyTYsE2H4PnjRPtWchxmdZ3j8ATGIQb+AuNSdyd/OnieGhkOY7p7hUc/Bbt
         QRFViIyy9eP8LIMVLu80KGeo8XGpdrASDjpkHRW/OPnsQoE3BjUgfERYKqMkrSWACpJt
         3hIA==
X-Gm-Message-State: AOJu0YynqquX01UvBb1RWyo1Wt1T1PZ2Gun09+CPnjDjtMm+4TE7RTZH
	uHdN/zdlYzk1mivyz6Z9TrUgk7iKNr1sKa8BNna42HE1HCQi3m0yMgA6+fTxZA==
X-Google-Smtp-Source: AGHT+IFjm/EtrgyOgYzJ6FCtv8A70AwY6h/u/nfabbLzk2VgNMjTcGoqCqNUVQwkIEHXuuvTS3xGsw==
X-Received: by 2002:a05:6214:4881:b0:6c7:c645:df60 with SMTP id 6a1803df08f44-6cb3b686f6cmr211008966d6.41.1727697908426;
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:27 +0000
Subject: [PATCH 32/45] media: i2c: tvp7002: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-32-81e137456ce0@chromium.org>
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
drivers/media/i2c/tvp7002.c:775:5-22: opportunity for str_yes_no(device -> streaming)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tvp7002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0..2acf93a90c34 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -772,7 +772,7 @@ static int tvp7002_log_status(struct v4l2_subdev *sd)
 				bt->width, bt->height);
 	}
 	v4l2_info(sd, "Streaming enabled: %s\n",
-					device->streaming ? "yes" : "no");
+					str_yes_no(device->streaming));
 
 	/* Print the current value of the gain control */
 	v4l2_ctrl_handler_log_status(&device->hdl, sd->name);

-- 
2.46.1.824.gd892dcdcdd-goog


