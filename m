Return-Path: <linux-media+bounces-18824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7098A208
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE0DB2AE03
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1B019FA60;
	Mon, 30 Sep 2024 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bONMhqxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE4919F41C
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697918; cv=none; b=SP6xAih7SbVrbT1eqDbMtgLWXBu2Y9nY6VZh95tspvjaJCCW79eDvBWqIWknqsMyxW/CZLFfhAeg1+aKXethMGlpOjOswDmHosRjuNnDmhEUVZVwSDXjXHyBmAiHNpR6L2J8xKj7aGFqY9BKNZNKeZilauJlT+TfN97uC5LP5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697918; c=relaxed/simple;
	bh=fxwhWvjSILXxCjv9CXZoVUVadgI45kHnpUpllcnsAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9c4ABLdMsQ/FB//+uKqX4JZZ+5AaBqHTSUDpAnIy+QQ+9KJu68GCGzAHOeEQwNzileIF7ptwJrmzCyrRuzUxabsEIjSiYIGRZc5MmTtbJuYoOllHN2wM38bLS8yfFzHGmn+zH0qcqomgde8xJ4qDByhiKFb1O+MRzDPzkfHYwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bONMhqxP; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb35f2aec1so29792006d6.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697916; x=1728302716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=bONMhqxPccKY2qTzSIJ0z9f/ZONmpbmTmvsW0zZ/CHeZQTFap15ZyVGz8DXiyvEw1t
         W/pN6y/ONhdeTh0q9oxvNuULMS2bRRQY4ruhFgVU8xJvr3Xy8EHUdl3/gKDyqfrCNOE1
         +nviEx+TjBhHHjos19H6qCa1HX82Z/wAtVKyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697916; x=1728302716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=TFvt4M3IDp88Xdd8kY0BRCfEWYtrse0fHgvt5jeis35SNy66HYD7sBruO8MeO34JRG
         w/1aEsf2WF8bcP2CqKr1zWVDIKygoaKDb60UKp54TDKFX6WvTYVe3/gIXaIfkDpwmi8o
         EHH7+lfVh27hSeEOHd9rSrLVNJ7wvnDCTNhPBaQXb5IFFmueWSrWWIDq+fEpzmIPXgry
         v2oaittXfNOgNDn9/quqH8ovz3HPDfu8pk1n57E9TqZPTXwYo4fql1cDzrJiT2W3/xDG
         Yd2uJ9C8FqsAg6S4OX1Fbcl6mCaY/0wlqfhienMLjkaa5SoDnBLUojCJFYq7L8L0v7fz
         ch2A==
X-Gm-Message-State: AOJu0YzaHB5qgoFyFILJibsKKw0v0omIh/zg7IukMRRYSHEPBRx52L7b
	vENmNMgmdC4f0IwJz8PJp+VqIsDjwAoe2pF/1EFYOEzI5zx1ZnGZvP48qWC59g==
X-Google-Smtp-Source: AGHT+IFHqIZOoSZ0SNoSJp6T9EpjigAIsbvAUF0oGwPlw/LLEGHSlB7PElYqfizjzUxKI+v34TuK6Q==
X-Received: by 2002:a05:6214:3c9a:b0:6c3:55f3:ed92 with SMTP id 6a1803df08f44-6cb3b5e7233mr204180416d6.2.1727697915550;
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:31 +0000
Subject: [PATCH 36/45] media: i2c: st-mipid02: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-36-81e137456ce0@chromium.org>
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
drivers/media/i2c/st-mipid02.c:552:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index b947a55281f0..70a691504eed 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -549,7 +549,7 @@ static int mipid02_s_stream(struct v4l2_subdev *sd, int enable)
 		       mipid02_stream_disable(bridge);
 	if (ret)
 		dev_err(&client->dev, "failed to stream %s (%d)\n",
-			enable ? "enable" : "disable", ret);
+			str_enable_disable(enable), ret);
 
 	return ret;
 }

-- 
2.46.1.824.gd892dcdcdd-goog


