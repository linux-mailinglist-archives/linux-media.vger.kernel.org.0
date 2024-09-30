Return-Path: <linux-media+bounces-18807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D198A1C3
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65335B28EAF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164EE198A08;
	Mon, 30 Sep 2024 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KhC5w88C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094511990C3
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697886; cv=none; b=JGFYmme0JiMzOYBMxgaQAQTOw070yrHJdh1SOZyvNsd2dcMzP7/tS5Cq5qIe55qvChgPXXAxLtvdvGV/9tLv2Wz2qP+b9SdKRA4jSgaycLchUc/cNsFhFa0G0507o362+l4pyvWL5qUjMRzxwwLsYF92BZ07wNqBC4jfWbwQeZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697886; c=relaxed/simple;
	bh=wO32bcNT3LvCUpFUE8spFFSYHTYoba2s3UV9j7voxsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhEQGgfzpwnw+uFbtbk/A5HSuBRkHdFleGMAOSJVa3HSAk/erPa3YeAV1vsla8lpOgY/qb5tQXWhHBIBuKyW3A2cmuooB9Wt8utHqmn/e8S40tFHuiofiouq17Z6WiDvtykuSRd3JFoxvcAsyDa5W++X0sw+sgnLUJADxEtNW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KhC5w88C; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb2dffcdbbso37871066d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697884; x=1728302684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+1PZUGpVB6A0qj8dhi+z1VPBRWAZJyLXCCfSc2+bXs=;
        b=KhC5w88CtXPFsIB2n84YMCvLm2h6osRr7DtJCJZzhKSESJlUqH2KqhNLuArd9GE9lh
         +gLEpomrL24vZOel/ff8uGR/TbwemMkLFVzj3jT58wz+VkIjbHUZ+4Qyj1m43dTgoKwp
         jlrPeLjMTA3HuemNVJQ5iLixteQoDLc8G7zw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697884; x=1728302684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+1PZUGpVB6A0qj8dhi+z1VPBRWAZJyLXCCfSc2+bXs=;
        b=ZsSuQIEMx9lES5byUlcK+SR0sr5VFaMbxfi5Im/TGfJSxNizrnCE6ZD7daTWODfE92
         pixXQ4PWRLkq6URGVpaOZLbQ2tsqvzDfJXN/ouwkaJcFNRH5bFylOtUCSKlLseKm88Bb
         7Sh01VeXw4v2w6jgBAwwPywbzlZt+VE0mQr1csyC3Zgfy2r0+85m8CZ717Ljnyu8yfkS
         LaK59Gzf3wj30nTm0Fki6KPpR0kNg7wlPaP7/NUf3mZSqfB3n/rIak2pRYF7zvAAd8me
         ROSp7nzxHGwsotW/W8LtcfokAtu0tsU9sVEkS9QsNJW20bHSVMutWp1ZQUqhzYDkS5aR
         zB8w==
X-Gm-Message-State: AOJu0YwAUOL+tiNUV1tHgXL2BJx9lhar1jG5j6VyecyJWtbiLk50aqMr
	DFUiZ6XSdrSUY0K5JSzTadS1jgU0KS2SXt9BqGjG4j+xtZdsq+IBnun3Lax+Og==
X-Google-Smtp-Source: AGHT+IGmAxnIT189WVUBwg+x/R9UvWvqRDVNzUhwwxur3BAKszcZq3coNxLRGmF9WP2isGNKo1o/8A==
X-Received: by 2002:a05:6214:5706:b0:6bf:7bcd:78e3 with SMTP id 6a1803df08f44-6cb3b643feamr164774016d6.29.1727697883855;
        Mon, 30 Sep 2024 05:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:14 +0000
Subject: [PATCH 19/45] media: platform: ti: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-19-81e137456ce0@chromium.org>
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
drivers/media/platform/ti/omap3isp/ispstat.c:771:21-27: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/omap3isp/ispstat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index 359a846205b0..603439afe582 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -768,7 +768,7 @@ int omap3isp_stat_enable(struct ispstat *stat, u8 enable)
 	unsigned long irqflags;
 
 	dev_dbg(stat->isp->dev, "%s: user wants to %s module.\n",
-		stat->subdev.name, enable ? "enable" : "disable");
+		stat->subdev.name, str_enable_disable(enable));
 
 	/* Prevent enabling while configuring */
 	mutex_lock(&stat->ioctl_lock);

-- 
2.46.1.824.gd892dcdcdd-goog


