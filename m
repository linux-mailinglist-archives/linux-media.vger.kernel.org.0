Return-Path: <linux-media+bounces-18808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CD98A1A0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558E21C216AA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2770619992D;
	Mon, 30 Sep 2024 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZPAW74IP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BC1990C9
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697889; cv=none; b=g3HceeE+uMsOYBhabYM3f1Zq5C8+mQH3E4UsnuJTvEC+psEvkLHHg4oD5NU9ttIbgfTd+ImLbDlwlr0+6wWDLihXAxGMPIO/v3HWaidfmFpyOEM762NgJeg/AQDMfg3VO2GNJrSRkV1zTePd+x7BSyzrYgToAqNYJM/Lv59XlG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697889; c=relaxed/simple;
	bh=a+FiLOH14SS6a3AubkD6ERw5Y7LANHZ0RAc6/umufBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MR+mzmgzA5GKk7FVjqUs6nvShDXddGpk1HQHO+reqif/tUfNaAMZbut0p054hKBJ/Mipg795nBKeI92xjcpf8XNMNZa8SctuNrveng06H+/B4VM4T3IUMxeIYtJ2U9urDIg+HsPMiZjqlN0nyv8r6CR0MhBeVTluL53mnI1p1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZPAW74IP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cb3062d9a6so36154336d6.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697886; x=1728302686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=ZPAW74IPTnwUe9jCSQJK6ciKpCKopA09AgpWO2fi6Nkruq7u0Ydwcgltizt4ZsdCsp
         jhRUrz/OrjMCUQKmdmMbXqMjJzlEuDvHBH+yvc3+V9zeJOe6I9xJoLCgkhSdxkYZv3e0
         S440dCvm5egBM9FRWPu3D7OJy00X9G20cxDsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697886; x=1728302686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=lxPMF1rcSsLqCr2N3I5kAXvy5EPMTPASOu3mB39R4UCBYoRfaPTsOTw0Vs2u0rtRVT
         w2ty/mQZ4w5db1MIaER3/XATCMgdUM2gHStgt0VrIV4pOwvm1INtVLAOX/m9eHKp0NQ/
         pm7XPQC+aUKY3fH7AOdNAeYI4BLygUVkCj9W4gNOTtHOoGCGvdqC+dXJfS79ww5q/T6X
         g2yZI1Ezyc+XHARAYKiSsmY8P4pR083qieL83pQKS+colC9a1cipUDAmE9PVPws2t/qF
         LZJLH36lHxZZEkdK351KACWpoQAvokpBP85p+O1NAB9uOAiVkqsZ6w09Uu+LTqPHb+Jy
         IXRw==
X-Gm-Message-State: AOJu0YzE2x7ox6bRa1fEGdldASZyPtfphGaYfjM8sR8Amn2dZccaeFNp
	AxkEqCKApZgLqRPPcWF/pxVLZgdt2w9hjoBrYrnbdAQkRag8BmSyjlg3hWEmSg==
X-Google-Smtp-Source: AGHT+IG21mP+tUHPXSvJJJTKpKcZKw04O9Ig9Voo1lmCCA0A43eFT06NNMj2BNffGbxEca0hhvGjiw==
X-Received: by 2002:a05:6214:3a88:b0:6c5:b636:d737 with SMTP id 6a1803df08f44-6cb3b5b648amr195767466d6.2.1727697885829;
        Mon, 30 Sep 2024 05:04:45 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:15 +0000
Subject: [PATCH 20/45] media: st: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-20-81e137456ce0@chromium.org>
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
drivers/media/platform/st/sti/hva/hva-debugfs.c:74:9-22: opportunity for str_true_false(ctrls -> dct8x8)
drivers/media/platform/st/sti/hva/hva-debugfs.c:79:9-22: opportunity for str_true_false(ctrls -> sei_fp)
drivers/media/platform/st/sti/hva/hva-debugfs.c:77:9-23: opportunity for str_true_false(ctrls -> vui_sar)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/hva/hva-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
index a86a07b6fbc7..5e8c7dddbabf 100644
--- a/drivers/media/platform/st/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/st/sti/hva/hva-debugfs.c
@@ -71,12 +71,12 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 			      "  | |- SEI frame packing type=%s\n",
 			      v4l2_ctrl_get_menu(entropy)[ctrls->entropy_mode],
 			      ctrls->cpb_size,
-			      ctrls->dct8x8 ? "true" : "false",
+			      str_true_false(ctrls->dct8x8),
 			      ctrls->qpmin,
 			      ctrls->qpmax,
-			      ctrls->vui_sar ? "true" : "false",
+			      str_true_false(ctrls->vui_sar),
 			      v4l2_ctrl_get_menu(vui_sar)[ctrls->vui_sar_idc],
-			      ctrls->sei_fp ? "true" : "false",
+			      str_true_false(ctrls->sei_fp),
 			      v4l2_ctrl_get_menu(sei_fp)[ctrls->sei_fp_type]);
 	}
 

-- 
2.46.1.824.gd892dcdcdd-goog


