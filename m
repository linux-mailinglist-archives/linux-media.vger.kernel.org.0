Return-Path: <linux-media+bounces-67012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e3lxNRxkTmo3LwIAu9opvQ
	(envelope-from <linux-media+bounces-67012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE027279B9
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=WJnM5xML;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67012-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67012-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45BFD300CEB3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BC43B895B;
	Wed,  8 Jul 2026 14:49:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70D478876
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522161; cv=none; b=diMwzO0/QIPr+2WTDuuXWEXG0CaFL6aOZl5poM9qNgkFPXExXddZRkNAnmEbnE8eVar08fiVsVeeNb1JwpsfBCeWT64hE1vOpFe2/IqRUzw2hOqB+MHUmV6ZFD05ctohllwP5wt8mQwGwwaXoKeWFxF6dBH7E/rOXn8olnF6+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522161; c=relaxed/simple;
	bh=hKJ1wRNw/4+kZM2FA6xVtBeoupjoOkwvBGVT6gKhBAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hN4Da9udldKhDNZm4Qjnja1kBbX0PUWPbV2nscG+TMLQq4D7rC3740aACqzlMnNSpGKT30jl8rW5K8sEoaDRz49/HOjZ7E3/Gcm9pml5GHLBvAvrcVwWM2mSBifrIW7QbBLSzXP+TqPG29+4sEI7NR8TT8s7NImTtym+2ovGtJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WJnM5xML; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c7902f47so5947275e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522155; x=1784126955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ab8Gq6xMWbh9FkKTB7pyP7zvswAoiXm+T3oZQ3TQDc=;
        b=WJnM5xMLQtvEhuVygsL4mCmUp036jCBhOB7ZWsFErEzmNJKe/M8iB4pbH9x9pjyAB+
         jBj+K8Bf5pqqzBWev3cMaUPGGAqqGxFbylBSgXA+zpTXJelnkIJk/zR4O38OxTktutA6
         ckCRW2VHdSzQMG1e77+E4QVZkWLALZnhdntBsmPyeQho0mqATg5EP82kcxB/+QY7/vGZ
         +7DfbZ9JmgzE98EayV9ik7rA3O3Pmlo2euGv8/m7yMQ5IfNs0FX95TsII9q7pl4KOtkF
         fxnfZVvqPTwnNHHw6cjvHKc7FM0S08B9Xb5bqOJwfvq7cjx8yBFBy9SlsGLj2CQ5JxdB
         uiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522155; x=1784126955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ab8Gq6xMWbh9FkKTB7pyP7zvswAoiXm+T3oZQ3TQDc=;
        b=rbDcNfws2mIJyeHOeoN9HJNBF9wcOBVFglQdikzmq5nNriX9p3GKHdk0MtaJqTU+7c
         vyAbjKWRdN4t9Cju0GpFO+ephjVxcpgsB9ZJqWsTlSWNvzir2VZcOSL86PAIhM/+SJYQ
         ADRSKTfB8rVxUNEdbrDq876izVK0vR2pOE+fT8nesekieVXjpanGCPMfqVyRXWHXbKqa
         zQLEyi2yvscR1wIkNv2cyjdP8PdpGMUAJcYhUx+MVKCtv+rdjh7DjFIAPWREAeIwM6Kz
         SQpXbgLlwmWKifp8ySrnb3JH1F8lVVlO/dg8rjx/eonzBiNeT4h00t1vdp+/ZhuadBv0
         eQqQ==
X-Gm-Message-State: AOJu0YyUPFwvwdqNkViynFIcWPZ0gem/czXA+7wtfFUmoc3cNtS9mNWj
	uWZINmcomT+OTffglX112sexP89nVSMOsJAaXWxXr4H7gAPAn7XJeg02QF2mwxtWQkw=
X-Gm-Gg: AfdE7ckd1HLIzmOkrc4hvNSBTaCS0lQSphlAvGBc/dRLpggwx9oIoDQMKV3PrZhbbiH
	hIyYMhvDQH8f9TY+1HKnEf0dgeepWWz0ihq+fU9SZcGzjQMY4y1U8o8I9TQHgtmkiKeeVZUiwQZ
	BzagFh4DEuh8ebvrVsK5AMLf/Q1GOF5tolgxAK3zn886BRRoJv8yxLAlV4U+wYrZED6uY3s1Cm+
	CUfr+t1RkJ6EqYSwfxupro+eYNu1jICVbv3pmbNYMyD4eCws1y2AzZsZgT22ySr7JYAmtc/Xfic
	n8TmTEmTV0yZ3l/jzdgi44ZqR+p5p5Uk09BOG+jcNEEnz0guQa6czKokWIUk5c5uJuAAWhkMFf0
	8bmKIsI0BR0TEqnQab6nQVz9aC9PfZUP03F5pcB0YS3XuByZGZgkim+OnYypCKiBLOKtuISLDiS
	xEnXlAR7U2eyl2HxbgfqZ7f3EptgakRso/APorv649ZxIgXeq5IREusn22XFykqyuK6bnOiOJc/
	9U=
X-Received: by 2002:a05:600c:3e07:b0:493:de89:61b with SMTP id 5b1f17b1804b1-493e6868766mr31462495e9.26.1783522154549;
        Wed, 08 Jul 2026 07:49:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:42 +0100
Subject: [PATCH v3 06/20] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-6-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67012-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DE027279B9

The driver already has the LLP value stored in the mode structure,
but also had the same value set via register writes in the mode's
register list. Remove this duplication.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 29bca1d98791..7aabd281cd3c 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,9 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_LLP			0x0342
+#define IMX355_LLP_MAX			0xffff
+
 #define IMX355_REG_X_ADD_START		0x0344
 #define IMX355_REG_Y_ADD_START		0x0346
 #define IMX355_REG_X_ADD_END		0x0348
@@ -260,8 +263,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -270,8 +271,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -280,8 +279,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -290,8 +287,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -300,8 +295,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -310,8 +303,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -320,8 +311,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -330,8 +319,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -340,8 +327,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -350,8 +335,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -360,8 +343,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -370,8 +351,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -380,8 +359,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -390,8 +367,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -1059,6 +1034,12 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	/* set line length */
+	ret = imx355_write_reg(imx355, IMX355_REG_LLP, 2,
+			       imx355->hblank->val + imx355->cur_mode->width);
+	if (ret)
+		return ret;
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 	if (ret)

-- 
2.34.1


