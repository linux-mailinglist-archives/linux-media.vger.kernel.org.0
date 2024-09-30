Return-Path: <linux-media+bounces-18830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D698A203
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB9A8B2AE26
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A801A2544;
	Mon, 30 Sep 2024 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FKOmd7nu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525DD1A0AF0
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697927; cv=none; b=m8543mxo1A/dSsOtYtXP0VhcwY6uvrLgog9WIpTzcqBGJBBs/fIGHIbHaeYCCNtG3ZYJZPUn5oVIKf1gNadhVJTjlxIWB15iZfA5nYaqmzWEfG85AJtFH3WrcrxTCyycRSC41u/2oVehPfjxGRgRX3UQsTKyO3tJY6qYP8KejBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697927; c=relaxed/simple;
	bh=DU6huE3ypM4gV1uvRmGnz4MowVjE75GaWBSN46h3an4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6nmNkMYc2MxY8hG4IAzr6LDTpeZqLk/mHarx5aBruNB+H04vWFBaJ/Ys9pCfZ1uhflu3Rm+NbMQEkkROOZK9wyAGgitOT5YnWZUu2YcbdfrDEpLq9wxuwKoIohhfAApN6Go83B8DxHGz+fWmyDD2HCZEmbOwxdaqhdCN0bnR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FKOmd7nu; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a99e8ad977so359374085a.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697925; x=1728302725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=FKOmd7nuv4SBvCZKq8mSzQW8h85ZWYnjn9FNwMz8nMyOQrx3e25qZ+2vjhc8Nno9O7
         SEw2/Yw46VRl7HrO9V/b7tgqfkWnrfzTjeSZLb1nqC8gDpHM4X4+AivkxoD95U7yP+jx
         FrSE+S1tUyttAFkof6PMDbslRDuT1ZK/0TiGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697925; x=1728302725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=dYKS/16a9KoEonrm4M1t8gHML6L6fpG5QLhJ/u2Hr3DFCj3vJ/LFWHWbWuE5Ig44d0
         xMwLWpHEro14rPVLY4R3fWDhhOmU5nbD8Aaw87edr2jNPhFAcHgq0X5ZEmkREg1VX34c
         R4Kc0C7W+7ZTO0ivGu4J+h2L3+WuSHkYI2srJUJNBDfQQW1QWlJYiUZ3oafScZbvG1nm
         WqYux7DKaIO5BgcnhaJ1yIduAAi5SUCkfDibiPdXnJHnziGVF+erY7X1TZ3h6M+/+hBR
         KOv15pjCtVfCraM/xAmzembO0O4jTUp32LYJ/hhUYXnn4/qLV150UxSHhVVDvkEdr5J8
         7V0g==
X-Gm-Message-State: AOJu0YxIk/ZgM2B+TgcbRCQjmopHcTXDMKkk5SEz1AFFAbyp0RNBt+ay
	2qlLnWJAflZEkKiufvpDAKHcp9bcKA0AQ+NkTk+XPWhFt2K8dcCb7Xq516F1Lw==
X-Google-Smtp-Source: AGHT+IH+OoBvU1VpQTPHiaktqSzIksNgZvG/jG37uysXmmuE+j75SqTMgbPUwFz7aDU3AoUz/9R6MA==
X-Received: by 2002:a05:6214:450a:b0:6c5:60a1:d99d with SMTP id 6a1803df08f44-6cb3b64c714mr169599236d6.47.1727697925305;
        Mon, 30 Sep 2024 05:05:25 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:37 +0000
Subject: [PATCH 42/45] media: i2c: saa7110: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-42-81e137456ce0@chromium.org>
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

The following cocci warning is fixed
drivers/media/i2c/saa7110.c:313:37-43: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 942aeeb40c52..15134ac706d7 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -310,7 +310,7 @@ static int saa7110_s_stream(struct v4l2_subdev *sd, int enable)
 	if (decoder->enable != enable) {
 		decoder->enable = enable;
 		saa7110_write(sd, 0x0E, enable ? 0x18 : 0x80);
-		v4l2_dbg(1, debug, sd, "YUV %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "YUV %s\n", str_on_off(enable));
 	}
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog


