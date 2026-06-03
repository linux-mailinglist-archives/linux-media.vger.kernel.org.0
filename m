Return-Path: <linux-media+bounces-63666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2thNAyTIGoQ5QAAu9opvQ
	(envelope-from <linux-media+bounces-63666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:48:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9D63B384
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Qz9X5i2n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63666-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63666-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D845930B63F8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EEC429825;
	Wed,  3 Jun 2026 20:44:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484640756C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:44:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519449; cv=none; b=OPQDNrjapNqNC3CLM4+ZHrCwvdiDbgZ2ugpbu2mRUCAa44vVetgh19T6dqMU71qsGWFhUptExs6HVaGeAJwazlZV78ZHIfUzw/6npjC2/YDIhkMcMt3gBWTQFoF6JWB3I9g1+cwFtdn/02PiaBgq4fICnzBKec5G99W70ohPYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519449; c=relaxed/simple;
	bh=cVp6ayeUgmE8WBe34rL32LQuso/i4iAijoExnQqrcQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4WCIp/iv3y3vN6lwIa2Os5akOdUulOiWz82AZiSp7gTCPXD2XC7r4W9gcUO7Kju3Eia3ok0/aMDPMymVu+8evG73ipYr+OdQ2PtR9rjTZfVs3NkNQ6Cx177W6clsF3Y+CJoEfAyLjiSd8K7nlUloDN7DSqBwnUiG8jon3ZOP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz9X5i2n; arc=none smtp.client-ip=209.85.167.175
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-48611abeeaeso1715586b6e.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519447; x=1781124247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLhbmjyf/Pct2anMIF8eJOQ51u9gqHgtr+412iMIgpE=;
        b=Qz9X5i2nTcIhNIe1a5IIN9d4uP34651mWbQht0SEm9kRuzWw6MibroZ3hRElOojd2x
         IcdFwlp1m4I2LQy2sfa5gvz9ZbjwC71Njc8tyfqes3DBiUvCFZPU6RO9kDEUE/hqhMef
         UGKjA3eJmgjTNlUrlFHxP+RiFjW8XcirN6EOswyUX7bp1BbdEM+Jf7KAgBKSVFeRFDge
         J/w7Pd/V83MYDXurrjsX6NXVF/mhxXfeY+IX41HUmQdft7PPjZwuTp01pi/NNXx4gGj0
         iO9C5mywFFGGAZZN7UaVmqG4YdRwj1OzoVfkxJ6v6KzFw0eRKsw/lvT57ic6e2BX0uhY
         +r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519447; x=1781124247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLhbmjyf/Pct2anMIF8eJOQ51u9gqHgtr+412iMIgpE=;
        b=reFyo1Oqy3PCJcWb+K0psuYbBgOYyVhXdUuIEefN8tELKrypsp7qYzw9S+OlCyB33z
         lpqbr5Ygk8BojLF8AiLUriOiBXPGKLRKj6H4uN0HmMpfbMhiuwDV/K6PyM+gN33Eajc1
         fA4mLplkKjw+DT38+0sv19rbjT6sQTx5C5YwcpYbkFtuyhfoeN/FrOEuNKn76bSWqtqx
         uOOP5RePE+vj20MkOYqTTwMAPQNovMi9OdlfmqhXtXHFPUgJ37VGj9MHtHqFMdt6FNGl
         fg28rBmaISxoLHpsfD6ZFMm+K9XFXjqnUfJpPlm4FkP4/Xflo7sA/fiXjJeWnYFwJhiI
         Il5g==
X-Forwarded-Encrypted: i=1; AFNElJ/y+u0K6mEAFrV5YLHOz5wLDCcvRqDSbn09Vo2zTBlRYOmpj7/XAokoy2o6HUjnTJguUF2fVDIgiQtKjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqCnHDFdZgh09h+B6UXf2eLYmqn14IHjYCPx51HfUjBt5km2q
	brAZ2hyX1Ife1CGL+Ac6fpDnqzoZ7G7pzoNtN6Hy5kl+kbLeCryJmLom
X-Gm-Gg: Acq92OEExKRLW0QX2kiENAn+9qD9aO1wltY3VtqETzCID+W086/wgdR89nlusoOPX0M
	lKJeIH2L5tkMuZKuUzd3FDif6llssL+7fQbpdfcZXke18S9ZlZKrjJ7potZDTpPPC/7Ckcg6Bg9
	c0jZzYYA3m26oHv/3GOS0ewAQK+0a2slNyrO52LpNawNUVVj3O/0hd0h2TdzLKaXs8oJ1hYY2YD
	PjnnoCl1yKUcRn0Y0uqGoKjHnyUFx7cS/PScqf9u47PRb/i57Pd/6ybOfneUs2t3HWlvdxdFWZ+
	K0OGiON9v0egzoihCpZdwqHtuX3XcRu6EMYfldsInvdgwbviJJ/CzkF7Xg3BwJsAUmzZx/GSakW
	V+RdoxVS1WeRBYPLox7D20nS/+WW3cZOcJwquO6nOhEdTwLkEXWnNKqDV0TVxj5M+1MgMYVP5vE
	5Gqr9bw0mFwWY41K5NyEr+3OPAtjRJlZB71kN1xF+q8grdjabyvEvsC35f8pyv
X-Received: by 2002:a05:6808:50a2:b0:47c:be93:9214 with SMTP id 5614622812f47-4865a97f66cmr2948106b6e.20.1780519446735;
        Wed, 03 Jun 2026 13:44:06 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:06 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:20 -0500
Subject: [PATCH v2 3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-3-c8c19876ab64@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63666-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:olteanv@gmail.com,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:lee@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:akash.sukhavasi@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:akashsukhavasi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CD9D63B384

dsa.txt has been a redirect to dsa.yaml since commit bce58590d1bd
("dt-bindings: net: dsa: Add DSA yaml binding") introduced the .yaml
schema. The .yaml has the same filename in the same directory, making
this redirect unnecessary for discoverability.

Two files still reference dsa.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2020. Update references in lan9303.txt and
Documentation/networking/dsa/dsa.rst to point directly to dsa.yaml
and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt     | 4 ----
 Documentation/devicetree/bindings/net/dsa/lan9303.txt | 2 +-
 Documentation/networking/dsa/dsa.rst                  | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
deleted file mode 100644
index dab208b5c7c7..000000000000
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Distributed Switch Architecture Device Tree Bindings
-----------------------------------------------------
-
-See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documentation.
diff --git a/Documentation/devicetree/bindings/net/dsa/lan9303.txt b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
index 46a732087f5c..0337c2ccfa9a 100644
--- a/Documentation/devicetree/bindings/net/dsa/lan9303.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
@@ -16,7 +16,7 @@ Optional properties:
 Subnodes:
 
 The integrated switch subnode should be specified according to the binding
-described in dsa/dsa.txt. The CPU port of this switch is always port 0.
+described in dsa/dsa.yaml. The CPU port of this switch is always port 0.
 
 Note: always use 'reg = <0/1/2>;' for the three DSA ports, even if the device is
 configured to use 1/2/3 instead. This hardware configuration will be
diff --git a/Documentation/networking/dsa/dsa.rst b/Documentation/networking/dsa/dsa.rst
index fd3c254ced1d..42a99f5dfa2e 100644
--- a/Documentation/networking/dsa/dsa.rst
+++ b/Documentation/networking/dsa/dsa.rst
@@ -509,7 +509,7 @@ Device Tree
 -----------
 
 DSA features a standardized binding which is documented in
-``Documentation/devicetree/bindings/net/dsa/dsa.txt``. PHY/MDIO library helper
+``Documentation/devicetree/bindings/net/dsa/dsa.yaml``. PHY/MDIO library helper
 functions such as ``of_get_phy_mode()``, ``of_phy_connect()`` are also used to query
 per-port PHY specific details: interface connection, MDIO bus location, etc.
 

-- 
2.54.0


