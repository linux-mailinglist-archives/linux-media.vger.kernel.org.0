Return-Path: <linux-media+bounces-67010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2++DVVmTmrhLwIAu9opvQ
	(envelope-from <linux-media+bounces-67010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE77C727B74
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=g2ze6OKl;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67010-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67010-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A97730F9ADD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0A8466B47;
	Wed,  8 Jul 2026 14:49:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F43B8BA4
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522155; cv=none; b=Eaq1oZDs/VyqYsChzEEfQ557vEuVfMEb9Yjgi+Y0OsacgeafzxslwyHj0CbHUMTOZTWfc8hyTtWf5X3nk16K/JGfc8nP4H7dOUZCSUi6lLB1IloLG0EbHc9yJnFnzGh+9SsULRG1CEfVoeXKGW1GKc6MRqsS9M1OfAPAl+S3VLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522155; c=relaxed/simple;
	bh=RDZWQZuinWfD+cU4EhZ+Qa3Kim+iJSBL7wAOTiV77wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ji5FPigoOrebShv1o9rUR68374iT6PXmtBycFZg0ObUxTcTFauep5yp4X2IhBrL/s2w9kwAFBeHsWGDw2f68BvoTiEH5lKFtfmcC76kbBDMfcP4YYHlb22/lGpI6512dcp01eOmd3mvTYRu+NEiTU4QkEvckg3nw3J1jTa1Xcak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g2ze6OKl; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so5500035e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522151; x=1784126951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=g2ze6OKlRmnp1Y98cN3MOkS1eSvAOpqjk7KdREdQcaTURoga6uCLx8D/+cwH4O/JBQ
         BuUTNpOturf7rtRgzhuHlb+6yInPfb6Og16uV3dJmjUAxF3HG6vPkgsjOWfHRGgxNoWa
         EACzOrNdtQYmVZuPIi95A1qbZz4a7vB0NxfZeyDWp6B7NAnLjUCKOfPewkCV5cwo9uhZ
         Aw+CnJcdiFeyzz2+Blx33YzGfoGDj//DV/fQ6nUmfFm0eKKLURWGnnR06kYellrsGbMx
         6vAdespOq4xqgIQKAN/DWzaJ+T+M0Y/wusbM+UCuZrd+FERFFRMdONjjz8BSI7O/dgVo
         OAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522151; x=1784126951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5o9RlxsE2MKhjLVDUh9pAaiwDabzRmi61sj7zjZ8Dg=;
        b=lJomKAwvdWKkOn3FmYkU4XL+XNhxv3sAmqEAGT5kMckbOrVMrsMuIX4zo/ZGeyXJyu
         F4i3Y4Kgn6Oq9VIYBtAJbhp4OwxeHNvOfam1Q/ubDWJA7PTJyhhDVuD2jZiyYOhN6/xI
         Pk2rx4+8GBXY222uFeyobP+xgyRcAqFhU/dVxrnMk6ZIsoA99W7pr6jDH63IYUCkt/2s
         zc5qgDnx6jhIt0mW3zlBdvLh08CzmFdBCZMuqln8CVYGZqdJJMOx/HzfvCCd+mfgEu8n
         xXEaNvL4jCIVPq7HJqAfPkzeJT4Y9i2MuamlDGqHQuFxTawiiWNNfUbQo298UFxMD0/V
         zMzQ==
X-Gm-Message-State: AOJu0Yxuzjp6fvpmuUW824IsSb1IIyP8o6f//pouAp4gnsTBBmMZOyZA
	yicvOLGysANajU92zG0YFAjOr76qVwG3X6HDfiasFizG+Qb6PV6pzKpTBFW+iLfpSyU=
X-Gm-Gg: AfdE7cn5Hor3a5VR6QTvAQ2ppadGr3xeozB9UB1AHXbAPkGtzDOHYE4gyT0eRGmvm0x
	SqB2T1m17iNhQiuUDnAHAGuec7jhnd9SHSQfWuHG/WbIWHI3gxbR+PjJEFIi4G5mta3w/5NSXQT
	wk+8onWNYUKnZHg6pAMoz8Wug/q9HDFYH7p43YzbEpl8kgTHKaEp3tlzMn2bqEmhZgjSqj+DZ9V
	8Uq7Ehzztkj44dd5ke+zC08MqutzRlBljAbPaAsuYD+3nqiqawjgt5ljQtww/yn3yMHpfHmU2qW
	CQiqWUWlck2QoKRYidi6SJFpW3jNqN1j04pNZVhSF2IFSTCfLjzYOpi3DvlHoo6cQ0h76619uuz
	aun0Nzl3dW8pFxVtLMMPrhp25uysmt6Cj7AwPYCVBBxQam9KvLRg4FW/gi8N3XM4lXV4nYL+qCF
	hgCzvzbTZJyR3QHzpOR8oYyfS3OzT7qO0jLSu3/Md84ZXNrkStMVLtA64ZOcy8q7Q5
X-Received: by 2002:a05:600c:3e0f:b0:493:9cb3:53fc with SMTP id 5b1f17b1804b1-493e7e84c21mr20262795e9.11.1783522150858;
        Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:38 +0100
Subject: [PATCH v3 02/20] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-2-9df386a623d7@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67010-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[dave.stevenson@raspberrypi.com:query timed out,linux-media@vger.kernel.org:query timed out,krzysztof.kozlowski.oss.qualcomm.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE77C727B74

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


