Return-Path: <linux-media+bounces-18794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA298A16C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00DE81C212F1
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE0019048D;
	Mon, 30 Sep 2024 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LHWSx42g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C719004D
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697858; cv=none; b=WJn6KKDakGOUBOttQKWPSWEwfwntm5udo9HDtWONBEMnm2ApzQDlKMZLqRwRDo6mmJq6ux67lVxl4RYGFM/AlUwa1CKxN4KLHBEgWNvvVHK8P/z27fuTQwbKNZcjuiFrOpuiLC8+/G7P9U+NPLjGYhiDmeC5x9OpYeaE3wmWFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697858; c=relaxed/simple;
	bh=8MgT7dP1g3olMOrBUhOPMpyuDlnQim8dCackH8O66yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cu5CG5uUPW/Fap+N5j+GpfbPvajankZTPtVBvnaoqfGDYV0zfoLJMZ3cp3Vu661G2OOU0Uc3Az8h/zJjJM1NUlYiI/3pO4c5OoSfiRUq88MotohzD2dTK4XBZIgi7mvN39uOOYa+4HjCrT8XDxQg8jQi+wFvV/IIbSw9XqXSyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LHWSx42g; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9ab8e5f96so363332985a.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697855; x=1728302655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=LHWSx42gHLyIoNq1Nq4L0T5kCtrw0pSICn0ZBXx8RVumloDR6XiFiWuz95phtw/bZ8
         k9h2WyNsmAZdkvIvNcwG22zjtxc8tBIxeJlTgskfef66cP1dnRuCgIfQeOerwWMqYMPg
         3r08jmYD7mv9jYUZir9NRaSGfR89IJ+LSmaAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697855; x=1728302655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=E7jT2+dxAn05Xe5prASwNZTKqqcRzjkI1Q4couUi07dXZGcCyBXHBjhkDPR+WbvB4r
         vkU7lotOwqPr0qdGT1VXqdhNkqMTviJj8yVScvAO5sIir5DZNTz+DTy4SsysUjZOjN3k
         B6mtvCLN2rXPDaSTy66bNOSLnbUk4jwsztXl+TnI2ExzUdGX8DzbW2bPislXyyTR1odF
         UZ+YbwfHqRHgQN09olQwhxLv2L6ct/GEBwVwU0qKU4TQDWwkJNpQ6c15Yw3aAmmEMdMl
         cIYgBQt6lx2xQ8cgTVTOz2UZuw4dH6TiGvyXBkQhuVn70gq6N4nuUTw51HJlJ1HnBjJC
         YgYg==
X-Gm-Message-State: AOJu0YzRFEz52XAG+3kCCHC1IpIX0EEBiYAQxyg2tA6cKmgj9Gyo8To5
	aMwZiFqltCj4KX5nSeNeLEApkZg1DK1cd8O1lAql+rDJ8rUymXFFa2SyDsaikw==
X-Google-Smtp-Source: AGHT+IGbIk2oHMQ7FRb0GeJel1Jh9P6FVq0oOGmExjq89yc9rCz3p632i5Dvmp6LRIkRrX30gKUAOQ==
X-Received: by 2002:a05:6214:5990:b0:6cb:3925:ec95 with SMTP id 6a1803df08f44-6cb3b66d1a1mr155459916d6.53.1727697855060;
        Mon, 30 Sep 2024 05:04:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:01 +0000
Subject: [PATCH 06/45] media: em28xx: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-6-81e137456ce0@chromium.org>
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
drivers/media/usb/em28xx/em28xx-i2c.c:579:3-29: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-i2c.c:590:2-28: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-video.c:941:4-9: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/em28xx/em28xx-i2c.c   | 4 ++--
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb34..62fe49876a32 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -576,7 +576,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			goto error;
 
 		dprintk(2, "%s %s addr=%02x len=%d: %*ph\n",
-			(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			str_read_write(msgs[i].flags & I2C_M_RD),
 			i == num - 1 ? "stop" : "nonstop",
 			addr, msgs[i].len,
 			msgs[i].len, msgs[i].buf);
@@ -587,7 +587,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 error:
 	dprintk(2, "%s %s addr=%02x len=%d: %sERROR: %i\n",
-		(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+		str_read_write(msgs[i].flags & I2C_M_RD),
 		i == num - 1 ? "stop" : "nonstop",
 		addr, msgs[i].len,
 		(rc == -ENODEV) ? "no device " : "",
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4aef584e21da..ff017c187aff 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -938,7 +938,7 @@ static int em28xx_enable_analog_tuner(struct em28xx *dev)
 			dev_err(&dev->intf->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog


