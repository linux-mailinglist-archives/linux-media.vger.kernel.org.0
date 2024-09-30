Return-Path: <linux-media+bounces-18815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68F98A1AD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4343C1C21187
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C988819CC00;
	Mon, 30 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PdvlWjSF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176619B3C7
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697901; cv=none; b=FtrTIELjFt8GzWaA/ALeJjbMDx+//MmDWcxy8dS/o1XDADKgZcMDh+t9LiZBvjCJ0tvxF7DGoG6L6DsYoE6BBWpHYgjzEfwXp5ZCUigqKasgONvTeN2cR978821mtNWrrQmIiwMNmVBsyPwvlw7AUZp5MKBUcILamXwihoBkY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697901; c=relaxed/simple;
	bh=fSPAVO9ZDOlfM+yvKGofjzMlsnwmS7DOHpFwVZfy/5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpCKpzem5pYclZxkiKpikE8nxlX1XFYxF76u4U6DTBPowPdKcgW+JkFncuRlXSCNOEUnA9Nl9sD9In/+XHh/JeaX6PyPtCNvoi3yi2PxrVIQfWNczg8mZESkO737AkZs74vFUk9suRoLnFG8MnSSDuLu+oSRqaX/ZJpkU9Ob78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PdvlWjSF; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-710daaadd9bso2361163a34.2
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697898; x=1728302698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=PdvlWjSFSJNVSDkIb9GCm90Rq6o+Tr8hfTrWcM+2lwdXvtdnzW53rngmcPAy4YVhRk
         d9kprQChY1L0X7hhs14/3rMv//62rFb7YLV9lOOGDlKa+59HFItBR+5O64sIN4vR0HDy
         1Iwk1DANECTG2Rs1qpuGEHCsWT118O7KN9EgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697898; x=1728302698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=HJLb+G1uHX8sBupHBK7ebuuqDNt18jNnIV/OYZrzrNd5SIT2WXp0eL98YDma8gkAax
         ZRucGucM7pYVd8R157wEMKpPL5CCjiALNZ8pv035fQiuAbSYTjPN/COiBG99o+F1mh2a
         c1LmF7lYy0xvFELmXaRR8EvGjghU1hA32IMCOn32E68PjKFiHupk2mrvpenaC34YwiC4
         RZ3RuUBiewxid7AR4MZv4OTsBdEM04r1YefeWPcp2xde4N8Rb1QQLiDJgwric5VfnXoY
         K3sOWAGrSSsRrByJKJRfccHYVHkuAVfd39lQRStEdIgkGAbw73NS8pLWYu+JullaIc+D
         q1PA==
X-Gm-Message-State: AOJu0YzHVn/unDrF/ykudCrjlsVu/0kBLnDCtgv/69Ki/ot9NQsxxqSu
	25waUQC7g/gS1+Ifz/gGSoR871qvXW9LzcynZ+lpyNoUzNfL0I/dzMgLaluRRg==
X-Google-Smtp-Source: AGHT+IHpSAOikj0Pw9qUy/ufav5/H94vhYgLdOZ5ZWws6VuRg45Il/9rM3D70mqQT4nS8RcavrRJ/g==
X-Received: by 2002:a05:6358:7254:b0:1b8:322e:3db with SMTP id e5c5f4694b2df-1becbc887d8mr566945055d.14.1727697898629;
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:22 +0000
Subject: [PATCH 27/45] media: cec: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-27-81e137456ce0@chromium.org>
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
drivers/media/cec/usb/pulse8/pulse8-cec.c:698:2-9: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/usb/pulse8/pulse8-cec.c:705:4-11: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/platform/cec-gpio/cec-gpio.c:138:6-22: opportunity for str_high_low(cec -> hpd_is_high)
drivers/media/cec/platform/cec-gpio/cec-gpio.c:141:6-21: opportunity for str_high_low(cec -> v5_is_high)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 4 ++--
 drivers/media/cec/usb/pulse8/pulse8-cec.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 98dacb0919b6..49160a15272b 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -135,10 +135,10 @@ static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
 	seq_printf(file, "using irq: %d\n", cec->cec_irq);
 	if (cec->hpd_gpio)
 		seq_printf(file, "hpd: %s\n",
-			   cec->hpd_is_high ? "high" : "low");
+			   str_high_low(cec->hpd_is_high));
 	if (cec->v5_gpio)
 		seq_printf(file, "5V: %s\n",
-			   cec->v5_is_high ? "high" : "low");
+			   str_high_low(cec->v5_is_high));
 }
 
 static int cec_gpio_read_hpd(struct cec_adapter *adap)
diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index ba67587bd43e..0167f21cb116 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -695,14 +695,14 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 		return err;
 	pulse8->autonomous = data[0];
 	dev_dbg(pulse8->dev, "Autonomous mode: %s",
-		data[0] ? "on" : "off");
+		str_on_off(data[0]));
 
 	if (pulse8->vers >= 10) {
 		cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
 		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
 		if (!err)
 			dev_dbg(pulse8->dev, "Auto Power On: %s",
-				data[0] ? "on" : "off");
+				str_on_off(data[0]));
 	}
 
 	cmd[0] = MSGCODE_GET_DEVICE_TYPE;

-- 
2.46.1.824.gd892dcdcdd-goog


