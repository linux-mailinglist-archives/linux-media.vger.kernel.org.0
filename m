Return-Path: <linux-media+bounces-67652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TB3LCC9zV2oJOQEAu9opvQ
	(envelope-from <linux-media+bounces-67652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E975DB35
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=f1AGOqOy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67652-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67652-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44FB430BA081
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B13244C666;
	Wed, 15 Jul 2026 11:44:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5144A71E
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115854; cv=none; b=BpFpff+tQGsSmfMt9oXvouraVxR33CgSr6+tSTX6HobPpp38Bz5nrbkAtryX2OtwYn2i30+Zot1K4cjXk6IDFJf7mQMGQu851ZlMfw0wq5WuvxPOjI9GsHyUJetik5gAyGuaBJAfkDOl9SWNV4rgwPtllfbHyPeFFjSVqqMk+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115854; c=relaxed/simple;
	bh=RDZWQZuinWfD+cU4EhZ+Qa3Kim+iJSBL7wAOTiV77wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQawfVSYT8nG0Q2/aWo0sliwaSRD58qI4IqCeheXvZj5LbC6R+9CWleExO8QvgAO5mJpW3LBXzofubWhvR7UtIuRAw58T7TfxJ07YpixDl2X7F46lWDSfrvenNJPkDYelGyUDSqwVYAdGGU/EVNVmSAl2nYsNNh+Dz6mqeA0PMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=f1AGOqOy; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1541624f8f.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115851; x=1784720651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=f1AGOqOyd2OsH+O5Y4ykn+BtrqZJIxCxH1/Qk+3NxoWcGmTL6fLBSb8QCBAl/aeu02
         oyM4K2g5hUFOCfiyAXlnLzKQJgm0FyvArvTArdePPpqJsvcxsBjXil6aX9oTPdx2d8Qa
         9+MkuDRYyvj5UXL94xkfgAE6JFeEtxJ2R5flO4+NtgUhgY2jRkUZcWs2tjLKgtnStvTo
         bsbL4sOOEPrByBQyImHHoBMA8Xu7aVW1Pfa9QH4vPe8DrMNLz7imb/XDvaJ4l/VPGGjE
         51XIujYD03r6RBfR2YRg+V9ip1Jl0I+RP/uwdTiADl+FPo5JYaW/j9qh7q41JYR+d4rt
         zUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115851; x=1784720651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=aFw/ewvZ6OunaxQJzWSaCHztxt/R4uhR3uol3DoswEnaJ0vWxihIkw0vtstWlCwftj
         e1pANFjaEFlV3SbCki+GKH4/L/wKfXmuaatMXANZv/OdY+7xPSsIRFGlT5mhzhty5Vap
         nnJcl5kypNpAfJ0610vsJ0B8zTH8TF7pJJuEpZG5zSXjFGKBXLhDJD6eDlM79eP+5+zl
         YApQFq4cjw28czuaXaVu8Rdwm300iGV4bIuJayuF6ofaJ9fzLiTIauX7ySzLQFl+FM1f
         agXrdhOqYfNSJKW9jwNn64WkZEFT8eTkDhwgBHzwq5U3Zs3LJNvqx1xzOjdPkOw1WHsa
         k5qA==
X-Gm-Message-State: AOJu0YzXTfup8n4EvpDL82cMUvrfKkw1BF8AkmKhZnu8Gsg4bRFhF9NI
	7nZocrbko59xOUHbUBrMxb6hotzmG/7+mNJLdsJEKElQk8pxsX6QCqoI0Vv2oeXSJnA=
X-Gm-Gg: AfdE7clBbKFmAMyLUmxT5eF7GXD1fOMP8n3ENjjjEE1QxfInfaj1cb71UlPhDhpwJoq
	mLALiURvGjSd+GLl9ra8BWvo30iBav/TMaiG1NNwt9Vjqgs76mpWcvtoLN8p9he/nUGPTgbzxD0
	4I3aZdfd6DWOpKYhV3c0XsRs3ej4Cghs2rM/FK2+/JvE2Li8SxZdlOhmBJsaTwUfSaJi/u2YXIx
	8BvqQ7xxrCN/oFoeAs7ppn4kOSIeIqulLD9Ip+18Zv5hO/U/LtUUnWNVgKb5HJfOWVRKbC+a20C
	/UpRFk+88SgBwxZqnEElv1bX2tuMlk53BzPBrbEJfFEmEQjRW4/H2auTChgdDD4L3rJ5CF2hxuz
	yOZoK64E2XyvJYiMvcWEQnY8LWfzoMk/2IUFEw3RPRLKMrSEGJAdRWjI9hKGb4O8jVkSfqWPxDI
	uH/AiOn23QxnERx8WxN4711Y4sjIO1TRLWDK45M+BzISfcsERoqs7jtfel6W5RHeYn8b3GYU49e
	kY=
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47f2dce3062mr19855884f8f.45.1784115851121;
        Wed, 15 Jul 2026 04:44:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:16 +0100
Subject: [PATCH v4 03/21] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-3-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-67652-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A9E975DB35

The sensor supports output over either 2 or 4 CSI2 data
lanes. The binding only permitted the 4 lane configuration.

Add the 2 lane configuration as an option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
index 6050d7e7dcfe..d9cdfda699bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -50,8 +50,15 @@ properties:
 
         properties:
           data-lanes:
-            minItems: 4
-            maxItems: 4
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
 
         required:
           - link-frequencies

-- 
2.34.1


