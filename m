Return-Path: <linux-media+bounces-66890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pdidGogzTWoXwgEAu9opvQ
	(envelope-from <linux-media+bounces-66890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B371E2AC
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Vu15L3wr;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66890-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66890-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 221F0302A732
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DA847D927;
	Tue,  7 Jul 2026 17:06:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9243F4BD
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443991; cv=none; b=bBrGBdyJ1/LJ21YmAQrUQuo0RHclRgSVLH8W+1Fq5INppUUODStWBonHrHaVfrnaEjq2OinEXlkUFI2ZeEZr0vkPV8E3McP1L1bY35xiE466aoIJjfv6VsZ7sBFMve/n031YA39Tt3jQyH9cikxFe1OeQaKm9Jwxex2528g0jfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443991; c=relaxed/simple;
	bh=pL9+Gp3HHNJUFJ9I1yxkiyYvcmYZWduBQ35yDMHh86M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u717SQw9xJDb9C0+VW16PzkI1QC4WRfkcBcH97yGjkCIgTq4/KaWBfdS+bFFmB29u5HEPiep58fop+UTTrT+3efQwk5pzwGaF/IYI4ypEi7wAq/7VYQztJM8rqVHPaLWcqGuC6jny5notOhRqDipKfElA/fBSRq9o1UlT4xpyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Vu15L3wr; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2407223f8f.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443988; x=1784048788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxQnxP8jSm74fXyluLhSPK0fT8u8cFN7trYTCmlKjE=;
        b=Vu15L3wr/OwrRR3Ew+6qkVwHs/OU8q8ZbpOcdwGnSYahSaiuGKHz58XkcY9ikTcUGC
         tnKZ2R+CS67yrhAjxvsd+susmb+pD8Pw8sTlrfpuFVQt8pi/ldsXItXYmRF6FieSYqK6
         5OBz3QoKqY+aMoYRv/xJhkkKXavM8ezmbGkSHlrzOEQRGXT/TGxvxidnQ0JNEylAs8b5
         2WiXQSRVK+NoVW0tr7bfqzRVoJ1zGJSGcZbnVL+fBWb3NfANeGuoDm2SlylJy4GM/7VW
         3GLm/aJnoACIv4flrzUAxNqSyhNCuCO+r8JWj/ky2GOBcIFRVojaVqbB+TiAfq47gLaU
         pYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443988; x=1784048788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxQnxP8jSm74fXyluLhSPK0fT8u8cFN7trYTCmlKjE=;
        b=PvuctfHUAiMJw3G2o3d0J+qaoXG8WlP44OcLZx+eSAH95ufB4ELJqCnGysLyvOsazP
         XAwA8orOUN4Y3oG6M7W2FDO8jICx1yej6E7tmTouxiU4yJ05lEUwXGMgjsNWh28CLQwL
         Dw5O1s0H/Nk6nLoicLCKzlRQy6gA0Le7rBYSyoMrQ9uVKHu4t1szwCWlZ2amCxfTMHd+
         mJwa7J6leL8bXNnjQ4Qb2r15c9viK3ATgxj5cGQvzM8z+mi8k6D8jk+09Sa9ozeREkyd
         fYsyDA9osOVSuE6ZivQ7VFATK5PU8yNXxTfr/a7FqJOAP/9BRS+k2R16x2e7CofDoyxk
         4gVw==
X-Gm-Message-State: AOJu0YzeobPQu5JbkFs9SwiyFxPRqhIM//sD7gvS83SeTt8heDWlxJ3V
	dacJLBIIi0bN48htD1Z1Y09WmKWqfJfGdl1LIoeqXfkwr7lKG8GF2M6r5WiLA9dVoWg=
X-Gm-Gg: AfdE7ckpWDhq/BdHzdV82ajLDEMRkMeeiCsjN0TIHcgVbGOmVIgGYdgT1eDx27LocrB
	XYetyxzSmQ1WNxApWmj/oo71Z98ANPFUQrpjF6eK/ilCnDkQlx2v1Mtr0Ows6+4DVi+TPJ4YtBG
	CankluNFWaXmabp4rnMKF0mSCcDXhIFlTf5a0RFqN7SZcFKRVxK/68vibv031+cvDlksu+gG+AR
	scAuidZbbnIt5TVluq+7Pag/VMj+pRkGXEloJjldCQnyNSjJuZw+n3NBgryYb6UsMgCOaoRpGdk
	4RdVw39Oerj6g0FlPMV3eaLkammaLAItcHtMw2RvmHe5MhjFvJSngSjd45FFVrvDpjxPp4wtinF
	Jmc4i8LXh0cw2K8Jejs37We4qSRNDjTVsUCaB7c0l2JnmMVr2XbiZECSqG5MKiJYB2hlD6boMWD
	L4+VRNkMVmzn3FK3JJaBBfIJNOd7frvlj9biU9WHPqrIen3Vl4tI3BQr60oJ8Hceqh
X-Received: by 2002:a05:600c:3f0a:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493df080c62mr67623595e9.23.1783443987981;
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:47 +0100
Subject: [PATCH v2 15/20] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-15-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66890-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 187B371E2AC

The difference between frame length and max exposure time in
lines is 10. That had been used as a bare value in calculations.

Move it to a define, and use that define.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ff9eaec39fe5..0b95027983a7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -51,6 +51,7 @@
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
+#define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
 #define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
@@ -630,7 +631,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - 10;
+		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -1118,7 +1119,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1


