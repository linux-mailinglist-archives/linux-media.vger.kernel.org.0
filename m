Return-Path: <linux-media+bounces-65923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9BixGEVbQmpc5QkAu9opvQ
	(envelope-from <linux-media+bounces-65923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:47:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0D6D99CD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:47:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=GGBgxMf1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65923-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65923-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C0FF30EF501
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88845402BB8;
	Mon, 29 Jun 2026 11:31:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201640149E
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732659; cv=none; b=EeV6IhzmietOqUDZyXQgOATTbAFjmqb8QtKKSHfLYY2/cZQGEk7WRFosexc5MoCDvREYEJ6lQQZfs2QH+LzBwqj2eO+KVLr7sPH/FoGsx5GqPuOVLUygaSkZv43GO/F1Wrh2tnY/EpNXY+l04AakMXkx6ozUY3o/WAjRCuc8VuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732659; c=relaxed/simple;
	bh=aGuMKUQmxb48Y5Tzunx5RYEssJcocgsBIKxGX87PXRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkgbkzbYgfyyQIFw6C3oWx3+kbpPyHZ6yEw6CQ7YDJpG/s4DvjGz+3FSTluBZl4VjUWgjt3fC4tHrM6py/fsc6ME0iVElQbUHJi+ow6B/tcOtObZ26TkUFFSVSpr5LvGRvDbLOw5TWg0hqksfRmGzdlclK6KRRZFH0Nnt4FibIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGBgxMf1; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3995e22ef81so33840991fa.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732656; x=1783337456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTtLPL74GADi3kWDd9SrAAeq3VH8vL4XzQwNytgsK20=;
        b=GGBgxMf1KYW4Yum3WaMJEoNVkGvwckLbfYMmqJBATiqyzwUboSjkc3uo4BYvTOUMFo
         XT1fhrNkc4VlKVD5Az5YD+1XVciKjsXco296yeQNmNKl53Glv2Hh2p0awTblhR4Lgf6i
         acRplIK3zVkAuVnKKPE+K5TC46s3tbETiVkvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732656; x=1783337456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTtLPL74GADi3kWDd9SrAAeq3VH8vL4XzQwNytgsK20=;
        b=Px1wUKcBaxHJ2aTdCSiPyBTNvGgREhFg3MobQXnr6S8d1/0clpPJeqgyp2REWOVozr
         JDpmvJAdBbtGzAj96zC3MKV15bkEY6TcswtlGwH6YbogURmnl7pL9lnWprZZEIjI9S/9
         RniZEAeqEs83Soj+twWEWmj93+U67NiBnb10WAY3LaNfhudqle5rzrLgSbGns7NV9O5G
         jrKdUTD4jHyfo4bumFsu5cMESglbiybZgj1F9zupMw35Ws2jbta+REgFv0k0I3CVyqiy
         5Pkhft43AkPjwWSb8CsnGKElapKFI9wVuONwCF7sRiNk7XaEg+mD3HYYPDvyFIJfBEMx
         eKZg==
X-Gm-Message-State: AOJu0YxjWSnpLlgazt+r36fJKFnhOJu7uDeEVh0/D/LOVv/wJ0AZNNcU
	V7z0SbpKtI/EK+gZscx6bEdvgGKLblsy5f6F6e2cT9Q4uov+KJV3xsZ6vSR6Q38Ipw==
X-Gm-Gg: AfdE7ckofjySywGuy7gY54ITyHYAQzaFvRN7xIPSLEL+FS9CtoEpt11ktCOqhjsdnAD
	y2OJQo1Ms4ng+hyYw7SaVKlQLHpmW4ad75q3Q1UdUJ9FEU+6jHEMRCL5cJy0dRsLcYM75A2Qk/O
	TV6g7eT4W4cM/ntzzZwDnWI7OcZXmnaMBpF5xlU9EMQy7IsJ64QO1+Wm/KXZyIzUSLVRTx9c799
	KJ0fLguS1tjHNIH7n4e1fg8TRfq3TdE9k13axx9DQ3uhzg9i/V/4aIfbwAE+lONo2UgKmZGJ1Y/
	5kvbsqe6hc49u5R+Ffsd9asOnxy/by9Ag0kISKVumCRrSK5BPowbyrtXX8hOWWT6cabSpHFX71V
	/ADpY58M0VWXr9n5ol/MQD6Y6TpMLtjPFbk11Evv772vsRaugRISR3AWBCKI1TvFLHplPEdNb6C
	Adn397mn0u6VNG60/Xv3yojcIc/43AfOet1kcigDMU38yu4zUvhIzO4f7xsKZ61usO8YVt
X-Received: by 2002:a05:6512:1092:b0:5ae:b62b:68b2 with SMTP id 2adb3069b0e04-5aeb62b6bcemr1256585e87.2.1782732656034;
        Mon, 29 Jun 2026 04:30:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:47 +0000
Subject: [PATCH 6/9] media: dvb-frontends/helene: Rename priv variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-6-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65923-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6F0D6D99CD

Coccinelle triggers a false positive where it thinks that the priv
variable in helene_attach_s and helene_attach is the same variable as
helene_probe. This is due to a bad heuristic in cocci.

We have reported it to cocci, but until/if this is fixed, renaming a
local variable is a good compromise to fix this warning:

./dvb-frontends/helene.c:1049:2-7: WARNING: invalid free of devm_ allocated data
./dvb-frontends/helene.c:1013:2-7: WARNING: invalid free of devm_ allocated data

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/helene.c | 56 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 993280fefc2c..5fbb466cc8af 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -995,22 +995,22 @@ struct dvb_frontend *helene_attach_s(struct dvb_frontend *fe,
 		const struct helene_config *config,
 		struct i2c_adapter *i2c)
 {
-	struct helene_priv *priv = NULL;
+	struct helene_priv *pr = NULL;
 
-	priv = kzalloc_obj(struct helene_priv);
-	if (priv == NULL)
+	pr = kzalloc_obj(struct helene_priv);
+	if (!pr)
 		return NULL;
-	priv->i2c_address = (config->i2c_address >> 1);
-	priv->i2c = i2c;
-	priv->set_tuner_data = config->set_tuner_priv;
-	priv->set_tuner = config->set_tuner_callback;
-	priv->xtal = config->xtal;
+	pr->i2c_address = (config->i2c_address >> 1);
+	pr->i2c = i2c;
+	pr->set_tuner_data = config->set_tuner_priv;
+	pr->set_tuner = config->set_tuner_callback;
+	pr->xtal = config->xtal;
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 
-	if (helene_x_pon(priv) != 0) {
-		kfree(priv);
+	if (helene_x_pon(pr) != 0) {
+		kfree(pr);
 		return NULL;
 	}
 
@@ -1019,10 +1019,10 @@ struct dvb_frontend *helene_attach_s(struct dvb_frontend *fe,
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops_s,
 			sizeof(struct dvb_tuner_ops));
-	fe->tuner_priv = priv;
-	dev_info(&priv->i2c->dev,
-			"Sony HELENE Sat attached on addr=%x at I2C adapter %p\n",
-			priv->i2c_address, priv->i2c);
+	fe->tuner_priv = pr;
+	dev_info(&pr->i2c->dev,
+		 "Sony HELENE Sat attached on addr=%x at I2C adapter %p\n",
+		 pr->i2c_address, pr->i2c);
 	return fe;
 }
 EXPORT_SYMBOL_GPL(helene_attach_s);
@@ -1031,22 +1031,22 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 		const struct helene_config *config,
 		struct i2c_adapter *i2c)
 {
-	struct helene_priv *priv = NULL;
+	struct helene_priv *pr = NULL;
 
-	priv = kzalloc_obj(struct helene_priv);
-	if (priv == NULL)
+	pr = kzalloc_obj(struct helene_priv);
+	if (!pr)
 		return NULL;
-	priv->i2c_address = (config->i2c_address >> 1);
-	priv->i2c = i2c;
-	priv->set_tuner_data = config->set_tuner_priv;
-	priv->set_tuner = config->set_tuner_callback;
-	priv->xtal = config->xtal;
+	pr->i2c_address = (config->i2c_address >> 1);
+	pr->i2c = i2c;
+	pr->set_tuner_data = config->set_tuner_priv;
+	pr->set_tuner = config->set_tuner_callback;
+	pr->xtal = config->xtal;
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
 
-	if (helene_x_pon(priv) != 0) {
-		kfree(priv);
+	if (helene_x_pon(pr) != 0) {
+		kfree(pr);
 		return NULL;
 	}
 
@@ -1055,10 +1055,10 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops_t,
 			sizeof(struct dvb_tuner_ops));
-	fe->tuner_priv = priv;
-	dev_info(&priv->i2c->dev,
-			"Sony HELENE Ter attached on addr=%x at I2C adapter %p\n",
-			priv->i2c_address, priv->i2c);
+	fe->tuner_priv = pr;
+	dev_info(&pr->i2c->dev,
+		 "Sony HELENE Ter attached on addr=%x at I2C adapter %p\n",
+		 pr->i2c_address, pr->i2c);
 	return fe;
 }
 EXPORT_SYMBOL_GPL(helene_attach);

-- 
2.55.0.rc0.799.gd6f94ed593-goog


