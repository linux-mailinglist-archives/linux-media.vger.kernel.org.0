Return-Path: <linux-media+bounces-18793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697198A16B
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B591F2131D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D497019005E;
	Mon, 30 Sep 2024 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LD92e8ti"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B218FDAE
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697856; cv=none; b=bOBXmqg1pQo3iu3cDSsLnrcP/EXbLRkgsRRcesZixufw3Z+NuHieIxSviLIpKThUNRiaAovk3UMgeBmaTEeNf03qJ6U7geA7YHwb1kGfWSJIQ2O53simjEpkBf5fnqIMGruELvzRc0sH1zlJZ0dFU6BfMKatXbcmxsfJk2JIQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697856; c=relaxed/simple;
	bh=4EPc3t0RKZkMLoHchmo/OHohT6ryeJ4Oca6zFWLr0gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQuWHlVHwGOaynai+cQtTlJVGP71M9gu8AIh5CUlaFtrNJ55YPF4K/zFfV665Y3WcoOnSi0ruf5S1XdkUphUiDrhKEHV40kFPy46ZfROsD3CfaCLas54wbjVtoFWEdAUkK37S6BpmkJwWIGNk6UiwEcg3GKr7xwq5bSkDzzJU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LD92e8ti; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a9af813f6cso405562585a.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697853; x=1728302653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vb+rHfycpw6eqzxAcjL5Q/NM2Cf8FBszS0leZkajSd4=;
        b=LD92e8tiOi3A/pPzDiFdg1/Opt+a/tsnz8qR3HAFjeIXJnrdQ8Gi6L7RzzXfsg63EM
         V7NXoW8DxafsQXYNaR7qkr/qtQh31VmirgHdYZgGayf2LJoHvkJDHxsA806DHAjqzqiW
         9f6kF0v7Oi+UpLv57sb4BksbvA/rabiLOgRUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697853; x=1728302653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vb+rHfycpw6eqzxAcjL5Q/NM2Cf8FBszS0leZkajSd4=;
        b=rMeUN4lZAHpuJZ4k+cNX+b4lMLTGUN9hOjUvVgfmNatvMd/e27ubSUKryiIGs9FcMT
         jbkIYPeDQJk9+9PoR7GscI7alNX3Ov9VoEocYWYgjrBrEMzrRSiB1nlttZDD+hck6s6E
         YL7KgIUUukXDyUdcvnfg22XayWKgDJ61KbpSWsuUo6pcnL0g1TaKrN4tBxORg3nofGmd
         Rc/gezrVSxuGiExfcF2c8rT64EWSFwiPZk3oscPd8Q4yNhRfx5s0ZFaDNklD6JiFoJMT
         VVc5HEZHQGWnn8IdnWECyZnxM09pT7TFYFtnOTO+knTL4P8nfjZW4fEyAdGEb4A0T9gz
         AB4w==
X-Gm-Message-State: AOJu0Yz+4OrV7voeDy49aSqWfHiVTVfZG+bbGwiOemUeoPpCQE13GDhr
	EaHj5xAmQCLsHcCH8yQF7S0u9HGy6cOcMsL/HxSqtQcfVoI4hq9fgdIOTBW90g==
X-Google-Smtp-Source: AGHT+IERK7kGfru4Q7d82RuyPjgoS6CBbu4N/h9Q+YkCupy/y3EuDtqtjn9iCQgLe1Tq04yD8BYOEQ==
X-Received: by 2002:a05:6214:4a8e:b0:6c5:5418:a055 with SMTP id 6a1803df08f44-6cb3b5f2781mr194666026d6.30.1727697853291;
        Mon, 30 Sep 2024 05:04:13 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:00 +0000
Subject: [PATCH 05/45] media: pvrusb2:Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-5-81e137456ce0@chromium.org>
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
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:341:11-14: opportunity for str_true_false(val)
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1727:6-17: opportunity for str_enable_disable(enable_flag)
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1663:6-14: opportunity for str_on_off(enablefl)
drivers/media/usb/pvrusb2/pvrusb2-encoder.c:265:8-29: opportunity for str_true_false(hdw -> state_encoder_ok)
drivers/media/usb/pvrusb2/pvrusb2-encoder.c:271:9-33: opportunity for str_true_false(hdw -> state_encoder_runok)
drivers/media/usb/pvrusb2/pvrusb2-ctrl.c:524:35-38: opportunity for str_true_false(val)
drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:475:11-37: opportunity for str_read_write(msgs [ idx ] . flags & I2C_M_RD)
drivers/media/usb/pvrusb2/pvrusb2-debugifc.c:151:4-31: opportunity for str_on_off(pvr2_hdw_get_streaming ( hdw ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c     | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c  | 5 ++---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c      | 6 +++---
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 3 +--
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
index 8ae3ad80cccb..b6c9bda214c8 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
@@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
 		*len = scnprintf(buf,maxlen,"%d",val);
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_bool) {
-		*len = scnprintf(buf,maxlen,"%s",val ? "true" : "false");
+		*len = scnprintf(buf, maxlen, "%s", str_true_false(val));
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_enum) {
 		const char * const *names;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
index 81d711269ab5..9e4eb03133c9 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include "pvrusb2-debugifc.h"
 #include "pvrusb2-hdw.h"
 #include "pvrusb2-debug.h"
@@ -148,7 +149,7 @@ int pvr2_debugifc_print_status(struct pvr2_hdw *hdw,
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 	ccnt = scnprintf(buf,acnt,"Streaming is %s\n",
-			 pvr2_hdw_get_streaming(hdw) ? "on" : "off");
+			 str_on_off(pvr2_hdw_get_streaming(hdw)));
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
index c8102772344b..8a2464744e5b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -262,14 +262,13 @@ rdData[0]);
 			pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 				   "state_encoder_ok",
-				   (hdw->state_encoder_ok ? "true" : "false"));
+				   str_true_false(hdw->state_encoder_ok));
 			if (hdw->state_encoder_runok) {
 				hdw->state_encoder_runok = 0;
 				pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 					   "state_encoder_runok",
-					   (hdw->state_encoder_runok ?
-					    "true" : "false"));
+					   str_true_false(hdw->state_encoder_runok));
 			}
 			pvr2_trace(
 				PVR2_TRACE_ERROR_LEGS,
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 29cc207194b9..761d718478ca 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
 {
 	pvr2_trace(PVR2_TRACE_STBITS,
 		   "State bit %s <-- %s",
-		   name,(val ? "true" : "false"));
+		   name, str_true_false(val));
 }
 
 static int ctrl_channelfreq_get(struct pvr2_ctrl *cptr,int *vp)
@@ -1660,7 +1660,7 @@ static int pvr2_decoder_enable(struct pvr2_hdw *hdw,int enablefl)
 	   anyway, just in case somebody else wants to hear the
 	   command... */
 	pvr2_trace(PVR2_TRACE_CHIPS, "subdev v4l2 stream=%s",
-		   (enablefl ? "on" : "off"));
+		   str_on_off(enablefl));
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, video, s_stream, enablefl);
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, audio, s_stream, enablefl);
 	if (hdw->decoder_client_id) {
@@ -1724,7 +1724,7 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
 		hdw->state_pipeline_req = enable_flag != 0;
 		pvr2_trace(PVR2_TRACE_START_STOP,
 			   "/*--TRACE_STREAM--*/ %s",
-			   enable_flag ? "enable" : "disable");
+			   str_enable_disable(enable_flag));
 	}
 	pvr2_hdw_state_sched(hdw);
 	LOCK_GIVE(hdw->big_lock);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
index 63db04fe12d3..60a0df018334 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -472,8 +472,7 @@ static int pvr2_i2c_xfer(struct i2c_adapter *i2c_adap,
 			       idx+1,num,
 			       msgs[idx].addr,
 			       cnt,
-			       (msgs[idx].flags & I2C_M_RD ?
-				"read" : "write"));
+			       str_read_write(msgs[idx].flags & I2C_M_RD));
 			if ((ret > 0) || !(msgs[idx].flags & I2C_M_RD)) {
 				if (cnt > 8) cnt = 8;
 				pr_cont(" [");

-- 
2.46.1.824.gd892dcdcdd-goog


