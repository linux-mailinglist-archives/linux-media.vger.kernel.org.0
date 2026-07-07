Return-Path: <linux-media+bounces-66877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qMGaFy0yTWqxwQEAu9opvQ
	(envelope-from <linux-media+bounces-66877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:06:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F871E18A
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=dUSVizK9;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66877-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66877-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 058FE301D4E9
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FD0438484;
	Tue,  7 Jul 2026 17:06:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2693434E58
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443979; cv=none; b=aWih89mI3l6+NGoJQ8838iP38kILL+ErbuZFZYE9GCZYmiAWMruCNgOMU909gLlMEyeQ+B9wgIGQ9BizD98AJR8lqWtN5hjBbwt5OvZw0G6UPW30Ti13WETJTEzJKDFuQaAYIMJyNlHN0wliaK2Ll2grzu2XREW7xjoDDSsLDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443979; c=relaxed/simple;
	bh=SsYILJfkf2iZ7t/l3nX0eduOwBCCQs08zQkAb5y17HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slZnZTj3PjGVweIKcVUhqivGiWkxhDVWvEQU6N4Ytc0dyvQAVkVmTFFDNys321QNI1rUEUSAgm4jbu/n/0BdDOcnKAQiFeAk0kP8+sWzEa7QlQAh/vWT32CttiWPWEDa7nh6Qjco9GpbuJzIFQndSiJehROID6p/Ila8K9TQOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dUSVizK9; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so4213650f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443976; x=1784048776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98h84xUiJLI3J436hrpC7VMqWAkahaKTeHKmOowBonw=;
        b=dUSVizK9Krz6nBviYXyqZrx4nuxLk4IBIYFqa7tp4k3Iluf7HsgG1eb3CuN3MmmLFI
         lgPdL1+LQmrLGMapLMTdH1iHmEGfhaUCjKmc8KBiJKphx3N+2sfjMUSHcwBdxf5P8KNg
         A7LFYdIodXhawQiU7k31v62UsnQb1xOOcqDYvXujajO54Zh4SJs89DkqPC/+/8LRtY/O
         L3434c24vLoNDG1DipxGXppPjpIcBtBi3CFICcQhyZulBtacwWnKrjeaiVucHJD3mVQi
         /Yi+r56QKjh2qq+3+HNUYeyZclMbMencUuAqpBtX21XpcoD9kdAi8cjb8PKXyihsaKJv
         szMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443976; x=1784048776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98h84xUiJLI3J436hrpC7VMqWAkahaKTeHKmOowBonw=;
        b=ReDeI7vj3dfo8kDpUHBPFD2cWud9TdK3t/DxZ1Tasz6XVs+Q+6dbui9ZibUF5xGnCR
         i2wZvmzJRofL5rd+MtxCArqCW5B9LOvY/MEOV8kqe5NtJgTZx9Oh6TlVdxMO3CKoS5Li
         m8MZM/SnxgOMmrjRkBbr4gylGEDaU+GiPTWvBjNj0LFTuwsZ6cw/BQMrn4hX7Iu3Jy1J
         bx7onMDqSAr5vL++1vH8j8ms5FRTQtPH2dVVgbr2628587sBqpfSv2yam4su43Dc4/YJ
         fJmR5ZbsRxsnV/dRvmL2VD9a7tWHB2R0ZcxPP/DHBYQlw9rBFSQp5S8EnN+/Y4dgR4lq
         Ysww==
X-Gm-Message-State: AOJu0YyZIfzpVcPtcKf573tU9K/QQqXra5Leg/NJrilBGUX+zgPWlT52
	N+vVQeKnOKW6js4ItF4HB+osve6Ye1HLysptFFHb/CkQ1EeWygIWWzgkhAXgSHBtIJg=
X-Gm-Gg: AfdE7cl6Ylkg8yLoECcqlz99PoJA00rwX8fCj+CHHjQMOXk704bkyZ2cOfERWqDCpdD
	njfWy+HkfbLX3Ia2zjf7xofgoFy0g9KJjDUTu09lWq9O373sz89xLEsocmGp4/sSNE9t8xAz64A
	1MNhETJdBVfLUAIHPRAqkGeKehpr9gKVj8x9JjywPmsa10BD7/jXLoF92WNwVPaA7BrPXLinkwb
	5LR9jL0JVngSodmqowJ5gvpidKBmDbPxzwTN5HJ5Uhzialxix6BpUWb1vKySmI/bKhhD5ISPaF2
	9RjcOLaALMSLojdbwquD0gSGdxd2XRctb4FhuvfDliBpXfNSGtSEzUIIufjni1juw4dQdx2YkYW
	rpOFSICy3bOsHMrwLhznSGXQ1dGFQy0655bo0Wndm+cBwoE0WC8WbBEnosBdFafdYFzRnZbitsM
	fcwGVGN9aZGRn897wx5EMnb0CfCsDbURabkn4xyhaMO4uuBSLP+45G1aJn/jDRe5MJ
X-Received: by 2002:a05:6000:1f06:b0:47d:e022:944c with SMTP id ffacd0b85a97d-47de668a6a0mr5130779f8f.4.1783443976106;
        Tue, 07 Jul 2026 10:06:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:34 +0100
Subject: [PATCH v2 02/20] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-2-1683ec07b897@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-66877-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F30F871E18A

The sensor supports output over either 2 or 4 CSI2 data
lanes. The binding only permitted the 4 lane configuration.

Add the 2 lane configuration as an option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---
The original bindings just used minItems and maxItems which implies
that lane reordering is supported on the sensor and that the lanes
can be entered in any order. This isn't the case as lane reordering
isn't supported.

If this change counts as breaking the binding, then is minItems: 2,
maxItems: 4 the best that can be achieved which leaves 3 permitted
but invalid? Or is there a better syntax?
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


