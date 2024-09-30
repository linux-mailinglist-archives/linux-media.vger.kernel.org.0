Return-Path: <linux-media+bounces-18825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEC98A1E6
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4243DB24DF3
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4625119FA9C;
	Mon, 30 Sep 2024 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ddnBEYSY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1567118F2DF
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697919; cv=none; b=JCweGFb2B+uMwl1ddAwNLqlffdYOmffr2fvau+GmxqyssGp35RnuLzbB67/fxJubtCvrtQAVnc9V3/LNyw3WC8oIrhbx+YZx1FlGrhsqgERc1C2OnJggx7LoUQxA26BVB9a0pP+QN6SvN9LaKbxxnSod5NXYPcCLQazcWSy6LK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697919; c=relaxed/simple;
	bh=seoZG/qn3lQcbBj3ynNAVC3sP37LRPVbxYubokeh8WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MArP2BSCtlrP5NyXUUVp+6tJXwiN6130c8JYr5UlobsIPmTh2CeRx4Gtg1cRKE9MUwPFmdEKYeM/MZsVd9+1lWYwhLc8FootkmLOxg3pOKv6MiCfsLiAM1qqj0mIAN6Rhaf9KdaLe113MVMBaOs5MehU5G6DQChqr/sImrUD2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ddnBEYSY; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-709346604a7so2210568a34.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697917; x=1728302717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=ddnBEYSYm6sHMJ5ysJVhgEqK5j1hVnIKj2EOGuUj0jLTrmWVlmPFwF5OJQD0guWAyl
         JOonTZi5w826g3PDijE0KCPI79qFneXzA37KyDIV+6OvtrsqD2/gYSIO+/2xLozGi7Ge
         PclVryg7W2OTDDjO1ij9uQw0LThRtY0CQIFzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697917; x=1728302717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=DJhti4IsLyZJMeiOK1ruKDvC3Z59QB1RN3EQrGbO3iLPaZBYBBd4ZlPAM7RDkyGsiy
         EPQrxxczVzIsJpytC6mn2+Spd6EG84XV+6Itq28Wbh/QwT+wkJ5FF0pKe2l+BSguaV6A
         NxHWuYvSoW7q5lsCnYh2ZI1R/KNdpNrLQo2lkvWFPW8+pbQ4rJewrstUHUIFE1UElVEb
         QkkyuugnWoUlXqMYkuFPj+Cf7iMogh1chYL/9lLbPD1lEirp+9mPJWEH2iq+0x+VR2KQ
         wv9wJ1gVyBHsaOszoUgvv++4mYCEPNGQ5EzMyqMeFfsSGX+irXFBHHeAKm9KsapbEK4Q
         BVlg==
X-Gm-Message-State: AOJu0YwvlnHIi13O7IbggqM1+dvE/cok08EGVst1uWqXbijcXO6QgiBp
	EA4pcaFjG4/yqMigkjGlbZWDRglVJlBBksoQuFRTnzav+fk57mxP8K/waye4SQ==
X-Google-Smtp-Source: AGHT+IEsGDncZXqIOKaIooO2hw5tICb0OJqubpFFkQiHlkBn39PImu6hgDgqbreQ/CasmuZpa2D32A==
X-Received: by 2002:a05:6358:5288:b0:1ba:580e:dea2 with SMTP id e5c5f4694b2df-1becbc86414mr292235955d.17.1727697917163;
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:32 +0000
Subject: [PATCH 37/45] media: i2c: msp3400: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-37-81e137456ce0@chromium.org>
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
drivers/media/i2c/msp3400-driver.c:341:4-21: opportunity for str_on_off(state -> muted -> val)
drivers/media/i2c/msp3400-driver.c:342:4-27: opportunity for str_yes_no(state -> scan_in_progress)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/msp3400-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..c7807b17add9 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -338,8 +338,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);

-- 
2.46.1.824.gd892dcdcdd-goog


