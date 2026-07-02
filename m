Return-Path: <linux-media+bounces-66418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iyHBNgHfRmqFewsAu9opvQ
	(envelope-from <linux-media+bounces-66418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:58:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6666FD1B1
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 23:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m6wRCBx7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66418-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66418-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6F9303B6FB
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 21:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFED3B19A9;
	Thu,  2 Jul 2026 21:53:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373333F8CA
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 21:53:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029199; cv=none; b=ayvIalytEE/Pwmy7ZkWmPSsbiav2X2ISSfpjHzKbuikUZ6YqcsC06uUjXP9N/eFfBo8UsvVn8x5dR+OAw36eWea7H04wV3Lr4njdZNuc4E0vcoarYJ+WueH9oUnROQe3MOOB3pzGAqyWoeDUjbovK1uMM+I41pBp7J0kzuQuW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029199; c=relaxed/simple;
	bh=zjILW9Q86QgNkyAX/V+hLv/MYkNtg71tImXI0XhySLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uC5ZdfeiBCCz/Du6o3JM3/NunanNbi29w5g5Ad/oXmr4ZkfCwsKWFZtV35h0MsK7EpchaVEbn6z8I/Nn4F5rY/rznt2/E+diI0q36W7oMdq2kt8TyOT9Aoz79r7nfjPyrJDCcu8R+4kqs9FSb20maAzmvQVoMCYLugf+xzPTx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6wRCBx7; arc=none smtp.client-ip=209.85.161.42
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69d7aa0ac14so1708955eaf.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 14:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783029197; x=1783633997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=m6wRCBx7b9q+FI3Azmy1t2U2OkB7E26MMIzk9wbY60Wul+ymsac37Dh3U1WlymmyzQ
         6w7ZeUSZHcB4YLaCliKXLxmBUNi3DPGMypNuOerMX56ChNdPFLytAFeqt0SREM2gfsKI
         OB0ax+mXSuMn9t3Gnd5H/Tau8O+7nwadi0/9tc9qZMfwaHE5nI/0K3A93/LAlBSltPAo
         66QoyhEp5lAmTZkoRZGxEP86pUJfkBEzf95vpQcdjqICfXj5G6WilKe05W7SaHuXbKGE
         DsgD4XbKtHsLL13FdWkozDdzwKqvvQPQxNqokClHlMbQr/8LJH+1J7wDuIRAUC71V61d
         yzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783029197; x=1783633997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=EwGEFunMAOiz2wuL/3V/YxgVFpPgnKZn3z75Nt0ulyGn3SfhBzOeRosI7lWkiH4sS4
         JN2TwDyP8SvMhKCHgjTzWeUxS6S1jH4MDHcUcJ+FHbFASSYuN6AvqVSMV3QhyRTrQXaQ
         NjAfQAPmOR4Q4hwhNSn/14HhIfhlfh9Wb33u9UlzGE3IZ8VNeqEqkk735V4j8y6GURqn
         /B2jG3HHsSAvTWv/RmRLb3hZrp3hmdBEjXLjaoOsUTmETSGqNvtGCgQXZNEGMCAYM2v1
         OM+FiF/VAu291CE+hB0XMrsJcR6PPr4LMkukVQDgK6DaaE4+IsHtT8XZv3voPVHsmUSb
         T/8Q==
X-Gm-Message-State: AOJu0YwN8FaH0cKbUOUxTJNEOYDaivPhz9WL4OpxMbGZ8y9bJIC25rfe
	Jmoh9gdsfk5vu9G5Nix4Xu+G5LERotv1jaPuxnpgDGohOKbrMs3KycoXd1tk/2T2
X-Gm-Gg: AfdE7cni0ssz2jz7mzqYnQQr0E/6U3svDu9srPBpzGQcL3LR0atmtMDGbR1+fCyd2Yv
	lI9BHyaZgIMcj3OxbFNKSSCp5r+w0q7HpLniNXk3kOj0Jm4WGH1xt7ZrfwAKE2WvlIYlLj7wdLs
	Y9dafF8oX+CMgXhPq7qGz1XGbfUos9QQd2qHsydnlDwMWxFxpy/XLkmXS7xkHciJphwERfUBBvm
	ZWKQfVO8iAF80ZVYwrBmnEpzdi3njjka1LZpJ/fK9Lz24ZChFwWJlLOSK29KkFjH8coLxln9H0O
	TKpIQGUJR+DqwDzVeLwD6I0VmnaAikN0NkbyFxeQPa5A4eXr7TCWCCtIinPwZmrYzFKvDiljmGN
	I19IRc69sHVeihVLCqFPaTwmiOBUbZjQK6cBQatNAkD67nzZzAT+3c/KT9Xfx7Y1G7qRKvvET2/
	nKEmVtuiGbjJVSoNJjv3hG5xrDFpcRiBRnS3NMsF8p71esFuQMgX21Grx0qA==
X-Received: by 2002:a05:690e:4397:b0:664:ae67:b674 with SMTP id 956f58d0204a3-66521bca8b7mr5877472d50.80.1783028879729;
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Thu,  2 Jul 2026 17:47:47 -0400
Message-ID: <20260702214750.3428694-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66418-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,gmail.com,sholland.org];
	FORGED_SENDER(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:utilityemal77@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[utilityemal77@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A6666FD1B1

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
It is not backwards-compatible with the A31 programming model: the
control register has a pulse capture mode field (bits [7:6]) that
resets to a value which captures no pulses at all, and the sample
clock divider is now selectable via SPLCFG bits [1:0] instead of
being fixed at the old module clock / 64.

Since a kernel driving it as an A31 CIR receives nothing, add the
compatible as a standalone entry rather than under the
allwinner,sun6i-a31-ir fallback.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..06656058ce91 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun4i-a10-ir
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun55i-a523-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
-- 
2.54.0


