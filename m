Return-Path: <linux-media+bounces-18789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB298A162
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836F01F21C58
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAE618E36E;
	Mon, 30 Sep 2024 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m6dDP3WG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3F918E35A
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697846; cv=none; b=KL6E2zyinOhZOsQL7JZPGngvOEd5gU8/mdoSD9m2XHPjWeaMOzHS6gOzHm4AUFnzWIK4Op+ObYNyjpTJq+NvkyQc8h0jNz+Wusq8f0g38GsWyA537KFV3jmsZglzNHgN58XLN4jw6R4atAW8GPhv5oBH2RSQrUhXbbb2qkgmwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697846; c=relaxed/simple;
	bh=5CcZFwY67VUyfBGEeXQ3+4Q+ziORs1PEInvOEq+lE04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lgbg7QnApfuRj+4uPm2jSynh4L8Gj7+0XUiBagOxp5Sa6ibnm+G9TCrg1yEDwzfmk+FAQY2ZPP3bChNnpkRQluEc5sKL9ceJ3vShuP15zHeh/4xFB0bQUFZ+WXQHcFf2ZHPshaQ3RPoeYBWEoY5jxRhjTaPod+/erMdyig41E9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m6dDP3WG; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e57b7cac4fso2522915eaf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697844; x=1728302644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=m6dDP3WGM4vZ+qk0Yz9e8TMJuuGi7OrqHQU/xWE6YZdY+8DuBntQU7HXBw1g/Jyhyi
         465bUUXm3+1XMzbbxNpaVBh4PM2WGcj0WoG8l2qAqUpQ1OMv4CI2qj4+tQWDXoYPf4GB
         LFQ7qkqMfU33Mtjklqyji8q9b6vCnlSBcDQDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697844; x=1728302644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=hR5MVcN/jvGf6YS37FeoF68SwLUxjFHDngnDm0yPx/aFZoZ41S3I5jhmJuODUhmI1o
         5TaFbK1fv05dE3uYLE6ofY0cAFasr5jzcMyMl12IZ9jhcllhkZFebQtwkweUPXWgSXB0
         JTZ4B/FBiGOwWdYfZNAUTZImSToJJoCcebzd3FvWUpI1hC3C/DfBdcCmlpqP3kqJLb8U
         EXZ9ByLcPiAnMEltZzq77kRTXaGxPkMSzF+4b0Fa0uHtW02kTu+Iugt52fEPgWLpSRXs
         GK/k5xAqNIh0uAuQqVomA7DOWC/t/viO9u9UpTSIHi3U0gjmMBf6LoNfI3CBp+DEKUsp
         T6dQ==
X-Gm-Message-State: AOJu0YyXGrFSBIEN+x7ijg2zKV08t0yTn884r6/zYFvsn0e6U/rYTax8
	FmbjzA5/PgCtszDa5UZrMnco+M1xa+ZhTpgZPrU/rCvmcK3LmZq35pmgxx5fHA==
X-Google-Smtp-Source: AGHT+IG/KAG5rLZearz2Wa+2ErVyBcttWaRGk175qbpKywxFfy3PRamVmOosYeNbd61Fqm2746wGGw==
X-Received: by 2002:a05:6358:4314:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1becbd0a143mr332064355d.17.1727697843926;
        Mon, 30 Sep 2024 05:04:03 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:56 +0000
Subject: [PATCH 01/45] media: staging: ipu3: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-1-81e137456ce0@chromium.org>
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
drivers/staging/media/ipu3/ipu3-v4l2.c:290:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)
drivers/staging/media/ipu3/ipu3-v4l2.c:305:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e7aee7e3db5b..443067ad0a50 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -287,7 +287,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +302,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog


