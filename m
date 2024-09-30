Return-Path: <linux-media+bounces-18802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16A98A188
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9484B1F21552
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686A2194AEF;
	Mon, 30 Sep 2024 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ols8EebM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5019342B
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697875; cv=none; b=qAV6mG31IaC3Ft0ktZ9TnIV68yImv0TtpNaFbT7kZVYZ/WO0q7ycFScRg201CfGUIJqYAVXdK8LQdihizSbb75vOiF8rRzoy77/bPoAfBVyeN8lsHniJiQ78TA1AM3bp6DHLG0hVbg7WwlnA+CGqXIxkwIFUzSSxsPozS3AjCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697875; c=relaxed/simple;
	bh=SCFl1C9z2VTb+qQWM91xmVqiVRgT9zj6Mxth/Q7JwNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afViCGIyG+o8FX8jIIqUJHtk88X2FZlhBBkSDDKAawP069uTZl8T6yFV0xurDLm0xkcxL6dVy6HdrcwrN+3k2DTcWzcCRt7pV17sfO9524sep7/4HMBOOOcFwBynAYI+avcLd7XEugF+MKhSj/VNHVrzBCwKNTyRfJKNK7V2NSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ols8EebM; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb25aad5dfso40846986d6.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697873; x=1728302673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=Ols8EebMX+E/NCKSQSRG6DwGiD+ouoQ4JCvLn5hSTpfWWjNGcEYlYHrhxFYecaJypD
         87goGNb2GOg/XogendbMguvtAXmcPUN8kvrTX2GlAXOrdLBtcykxXteoKpQ80P8ZZC2W
         qnZl7rIQTLaxlOIbbvdGiHkXw6y3ZKEYQw9pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697873; x=1728302673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=cBUQntoMf71VySuSVteN2xlTMk6f7htL6wFjYTZeBdurrjIPwEMmZoJgiTK+cXKVTC
         Q4l0gc3aygUbNmoXIg1T4I735DWFVGQBolR1XsQQh4EYuO+rfEEacuxz1YS6NpxXw3pE
         JEIHewNMTmuYGy0dzs0vyc18dITHbKJ2o7IsXvHJKbN1Azb5q2ZMlm4Q48EWJ3StW4Pv
         2eYlVLmNzy/gvonNT7YCHGNEBQJM5AfvoB9UrASW//iU8awmcKbjHxWf9gbBS4RYqJpo
         /btG7aeJ/RQCZsvJ7+sCNLYL/6Yc6s49kZKOnsgVLVCxmVDyGABEX+9ulemAv9nC0OWw
         Anpg==
X-Gm-Message-State: AOJu0YwceYDRIKBGAl+waeDO9T/Ex1L6citFhhqeTCKvmsQE6TAuL/8B
	xNzo79ex50DQ84LLVLdLxW/hgCdQtvPZLcFOFra1PqsOYtuoY3K6FAMzUYZtLw==
X-Google-Smtp-Source: AGHT+IGlpLvOiABRGPfPC5tWhysrrPiJ2yte8Y1JxuD34Gtndo3CQ3SWzVD7Qrk2mRRfbUS2vxDpnw==
X-Received: by 2002:a05:6214:458d:b0:6c7:c63f:b414 with SMTP id 6a1803df08f44-6cb3b6407b6mr208576446d6.33.1727697872928;
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:09 +0000
Subject: [PATCH 14/45] media: saa7134: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-14-81e137456ce0@chromium.org>
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
drivers/media/pci/saa7134/saa7134-cards.c:7984:7-16: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-dvb.c:93:31-33: opportunity for str_on_off(ok)
drivers/media/pci/saa7134/saa7134-input.c:919:3-12: opportunity for str_yes_no(( rc == 1 ))
drivers/media/pci/saa7134/saa7134-input.c:898:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-input.c:934:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-video.c:622:10-15: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/saa7134/saa7134-cards.c | 2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c   | 2 +-
 drivers/media/pci/saa7134/saa7134-input.c | 6 +++---
 drivers/media/pci/saa7134/saa7134-video.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index e80fb4ebfda6..79cd61fb0205 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 			rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
 			pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
 				   dev->name, msg.addr,
-				   (1 == rc) ? "yes" : "no");
+				   str_yes_no(rc == 1));
 			if (rc == 1)
 				dev->has_remote = SAA7134_REMOTE_I2C;
 		}
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index 6de8a02314af..d0e58a0156f7 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -90,7 +90,7 @@ static int pinnacle_antenna_pwr(struct saa7134_dev *dev, int on)
 	saa_setl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 28));
 	udelay(10);
 	ok = saa_readl(SAA7134_GPIO_GPSTATUS0) & (1 << 27);
-	pr_debug("%s %s\n", __func__, ok ? "on" : "off");
+	pr_debug("%s %s\n", __func__, str_on_off(ok));
 
 	if (!ok)
 		saa_clearl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 26));
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 8610eb473b39..239f0b9d080a 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
 		dev->init_data.name = "SnaZio* TVPVR PRO";
@@ -916,7 +916,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(rc == 1) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_KWORLD_PC150U:
 		/* copied and modified from MSI TV@nywhere Plus */
@@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_HAUPPAUGE_HVR1110:
 		dev->init_data.name = saa7134_boards[dev->board].name;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 56b4481a40e6..1c02fb04abdf 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -619,7 +619,7 @@ static int saa7134_enable_analog_tuner(struct saa7134_dev *dev)
 		if (ret) {
 			pr_err("Couldn't change link %s->%s to %s. Error %d\n",
 			       source->name, sink->name,
-			       flags ? "enabled" : "disabled",
+			       str_enabled_disabled(flags),
 			       ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog


