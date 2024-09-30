Return-Path: <linux-media+bounces-18801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF498A186
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C536E1C2101A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55316194083;
	Mon, 30 Sep 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OTaMhIgK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E119309E
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697873; cv=none; b=jKek3zwssVItqsny8aRNh9V7tGoJ4DPQ6qpW2C1zcH0ks8Y6P5yLdlON+XxiUShfs57j4k0wWTxy1QPEiCDqUOsy7sBJguYH3/24Im8+2B5oyoz6hPLLQjzzR1wD8Vp4svzQ99CADu7Nec1qTCQhTdxfYdv6F0loW1qJfRuc0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697873; c=relaxed/simple;
	bh=DXbs9QPlePnBVeLrKJEDP1GA5dj6+5qFRZdN94gi/X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKB0nobMaahg7SG43oSxtukrxFz72hIgTEavaEi58zHxx2k+MA5mEnwqIk+gRiPY62tv9YLxc90ectlXM1P7w9JHnAzz2lHQBbMA49T0hSp8HCnwMEgr9zhjfVAT6a5AD234yh/qKPYhzsCuPsdh6TqiDafu63HdYeXXX8oL9Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OTaMhIgK; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb2824ddc2so34590556d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697871; x=1728302671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6BDeL6BkIVVZoPxqWDi9XtO0jTRkjdLrjdq1Zl6PH8=;
        b=OTaMhIgKK+LaZu3Z6xZCo2Ek6kiWKxhLebHPdxU/nhUcbaNxmotaDXnt0dkYcR3DGQ
         GQcgHH2czUe3WQbg316sxKPFHfxwxdM0CP36r6NLPBsGN6ktgSxaal3R6dam458i6G7l
         v8zUel+qXWFbKHxob2O6lMA4jHwLKpSN55SrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697871; x=1728302671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6BDeL6BkIVVZoPxqWDi9XtO0jTRkjdLrjdq1Zl6PH8=;
        b=mt2awTDXVLAJbynCLyndZt1lwPK2CmRG+MVFFSllkQi7ebRtDOywpNScou5QQAT3ZU
         QqB6QHokYmbcuIkicVSaWbHX23DzjTGBtoVk+S5OdDM9jqym1V8fOYbyIUq+MZ6xsUXl
         w891FAFa1UkyRzuGYJvC/B0WHgfNNbwXUrMtPjZ6bg+lu5yuavagZ35gTVzDAJFpwN6o
         YpRMYPyV1YByA4b+Ddv4ql/ADOo5FqVjrOrnFjslNp3Rspc3BqZy+mZ/1dEARfcmmd4a
         nKPN+9kJFss/Cvo6i3pnDwnl3i3Yg+h+bWGajeQ8Plwwb4Kc85ic4t9WJnyWbYyNx4jC
         +JiQ==
X-Gm-Message-State: AOJu0YzEWHPhK7jJmttDPJ5IgWUnF8vvp/sCgodsYVZoYB83IHEkB7e0
	hCz/iexlQwvWIw8zfwxicrYZVKePLP9b/75Z4p0i1Ipnk3OTNpUnfzhGUR6X1w==
X-Google-Smtp-Source: AGHT+IFuhFd9qljS0j0XzT5b/G60bcWwlJPplwUn5ky0BXy/Gr7Rfi8yUN7cisKQypEqCOJiTUFoZA==
X-Received: by 2002:a05:6214:448c:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6cb3b5da202mr213208266d6.17.1727697870958;
        Mon, 30 Sep 2024 05:04:30 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:08 +0000
Subject: [PATCH 13/45] media: pci: cx23885: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-13-81e137456ce0@chromium.org>
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
drivers/media/pci/cx23885/altera-ci.c:285:3-9: opportunity for str_read_write(( read ))
drivers/media/pci/cx23885/cimax2.c:227:3-9: opportunity for str_read_write(( read ))
drivers/media/pci/cx23885/cx23888-ir.c:996:4-9: opportunity for str_enabled_disabled(filtr)
drivers/media/pci/cx23885/cx23888-ir.c:935:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_DMD)
drivers/media/pci/cx23885/cx23888-ir.c:1020:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_MOD)
drivers/media/pci/cx23885/cx23888-ir.c:937:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_RFE)
drivers/media/pci/cx23885/cx23888-ir.c:1022:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_TFE)
drivers/media/pci/cx23885/cx23888-ir.c:1008:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_ROE)
drivers/media/pci/cx23885/cx23888-ir.c:1014:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RSE)
drivers/media/pci/cx23885/cx23888-ir.c:1004:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RTE)
drivers/media/pci/cx23885/cx23888-ir.c:1044:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_TSE)
drivers/media/pci/cx23885/cx23888-ir.c:1026:4-21: opportunity for str_yes_no(cntrl & CNTRL_IVO)
drivers/media/pci/cx23885/cx23888-ir.c:933:4-21: opportunity for str_yes_no(cntrl & CNTRL_RXE)
drivers/media/pci/cx23885/cx23888-ir.c:1018:4-21: opportunity for str_yes_no(cntrl & CNTRL_TXE)
drivers/media/pci/cx23885/cx23888-ir.c:1010:4-21: opportunity for str_yes_no(stats & STATS_RBY)
drivers/media/pci/cx23885/cx23888-ir.c:1006:4-21: opportunity for str_yes_no(stats & STATS_ROR)
drivers/media/pci/cx23885/cx23888-ir.c:1012:4-21: opportunity for str_yes_no(stats & STATS_RSR)
drivers/media/pci/cx23885/cx23888-ir.c:1002:4-21: opportunity for str_yes_no(stats & STATS_RTO)
drivers/media/pci/cx23885/cx23888-ir.c:1040:4-21: opportunity for str_yes_no(stats & STATS_TBY)
drivers/media/pci/cx23885/cx23888-ir.c:1042:4-21: opportunity for str_yes_no(stats & STATS_TSR)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx23885/altera-ci.c  |  2 +-
 drivers/media/pci/cx23885/cimax2.c     |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c | 36 +++++++++++++++++-----------------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 0dc348215b72..e154a39d86ef 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -282,7 +282,7 @@ static int altera_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 	mutex_unlock(&inter->fpga_mutex);
 
 	ci_dbg_print("%s: %s: addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", addr,
+			str_read_write(read), addr,
 			(flag == NETUP_CI_FLG_CTL) ? "ctl" : "mem",
 			(read) ? mem : val);
 
diff --git a/drivers/media/pci/cx23885/cimax2.c b/drivers/media/pci/cx23885/cimax2.c
index 06e41f92092d..458fa779274a 100644
--- a/drivers/media/pci/cx23885/cimax2.c
+++ b/drivers/media/pci/cx23885/cimax2.c
@@ -224,7 +224,7 @@ static int netup_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 			return -EREMOTEIO;
 
 	ci_dbg_print("%s: %s: chipaddr=[0x%x] addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", state->ci_i2c_addr, addr,
+			str_read_write(read), state->ci_i2c_addr, addr,
 			(flag == NETUP_CI_CTL) ? "ctl" : "mem",
 			(read) ? mem : data);
 
diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index 222d04421468..85ca564fd3ab 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -930,11 +930,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -993,37 +993,37 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tOutput pin level inversion         %s\n",
-		  cntrl & CNTRL_IVO ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_IVO));
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
 		  cntrl & CNTRL_CPL ? "space:burst mark:noburst"
 				    : "space:noburst mark:burst");
@@ -1037,11 +1037,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog


