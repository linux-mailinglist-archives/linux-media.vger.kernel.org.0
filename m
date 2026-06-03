Return-Path: <linux-media+bounces-63665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNu6LdaSIGr95AAAu9opvQ
	(envelope-from <linux-media+bounces-63665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:47:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885F63B34A
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fK6invHP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63665-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63665-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DD9309CEFB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4943A37F748;
	Wed,  3 Jun 2026 20:44:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD705405859
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:44:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519448; cv=none; b=u1K8A2r26jWXdWC980siuRCNgiNFV2HyRItH1hhCdQPrp9R42KDhKY4zgcgN7nxZtZvuW+9DVn4MT6bi0iv0NPADYlRgrbBBQTK5TtHD9MCPqeAFENXArWZghLcrQ/p6okaAj4iYnhol95Hz/Tu0qq2VnWtNXJtgJEcfq0eDo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519448; c=relaxed/simple;
	bh=pbYzAD/lWC4Pz/OEGGhMlNyIqjw7NhBwS4JkwfMVbT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNL1eo6eK15gl5ReBY1l7vTnCL+i8XdT3G7gzzM+DhK81y3XohMUT6UpN58EuaydQ2EUxCePY/LV+L8W6FvrbwbuO/yY/oAwsXktkwAAwhXelBaRBGpLSlmr747PjXsBu2dTPq05d+CSGhALZBtRovB/xyR8XpOiN0KygG3zeeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK6invHP; arc=none smtp.client-ip=209.85.167.175
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4865b9e16d4so589414b6e.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519446; x=1781124246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6hcdyukWIpCgZ6HyRZXaSSsQym/0U9vbUF5hMDBmww=;
        b=fK6invHP9bbLrF8F2Xv95Jbgmo/EccDqmfqiUXHrmNB4Tk0zDXsGPvzyoj4dC3opCQ
         I0IH5woOXsoBUvvilrVP4maim/njkUH5ydbPDPwnC5oAYKrreUD2WO3Y+CZefIy5l8qq
         ZT0p6wcZWpIRb8o3KYS6yRU7+IOeUXuadQxV/npwmkBJ5p2DFNXAMwFX0VBK8EjOGAKQ
         CRBrUjr0BLZitw5ktHq5Iiq4NPRHfSa/wFQoEBwUZ/PVGkdY/thcRicX9bpw653Kf2zG
         WZ1OCZ8HNDpB2w/VWeUE+iyzl0ekEGl8PaCzUw6rSm8HMJ4s3OU3uXlrH3T1ckCqzsGw
         YuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519446; x=1781124246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6hcdyukWIpCgZ6HyRZXaSSsQym/0U9vbUF5hMDBmww=;
        b=SNsuvBvPR0pfUiwtDKvGdX/tnS5X7AwKpBh126J0FWq3g9L0GcYQIjKxxlHeFIoIsn
         MzUisW2sJKsaeKBunKE2BRr8onJzGav/FCEjHWmoSc6hRDy04JsO9uEQX7ynrwAsNqLF
         VpCBRF6dkMmPW/z3iSAboAjZr/2kRcNCAEU0IFejjRBmJznXiaaTitfk7yN91Sh3Aho/
         +k61sFIL/o51qiFfsuKQwviq7BVLvZwn2LrQd0gyuCoZw0+NwpLl8DZP2uhtO9o/igdr
         ZhGxHQPSq0VkNhYadW+CxMdKdUX4wSssCO8tGaXJKSrd89fxF5puPYCuaXGVh2V42b4N
         CfeA==
X-Forwarded-Encrypted: i=1; AFNElJ/9gGy+8nZmY1zkm3aAHGg22O9o5aW9QJlqo6STA0kFHA7Q2UDHwG04Z/Of7n8o7bdKvyQcmtF6uM44hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSj6/NnvlVgX9uVW8RIDy2+AhV0TTt6dCCawSfl6Uadgin4nN
	0TNlRfQq7S91wmI1mLcgsdq5TBYMP3+PdHRTCk575tEg+2lY8BAOIDE6
X-Gm-Gg: Acq92OFouU11vRzui7QCtlAxW9bhOAKYYFbIc3ZtlXmjqIW8/kN9qloJ/oXIc0d8qcj
	eTIf7uzM8dWAvpX90UZpIgqge/v9vmik37kmIamXav5j7RHRsBRX6oRymN07AApA6KBXT+JIogj
	PeCSeWgKu1T3GBjhMPbJOCvEGO1gpHXGYqtf7vR1E0b1pemsPEBR6ta65huWVZ3/3qUy15emv+x
	B2Y/QzuJc8tTkyOFp5yia4qZVsS5H9emUvCpw58Ny1pwSAAmEPbyAsjv7Y5uRzQ5F/qRq5lp6Fa
	ZpoP3dzo3TEyCnakDU0ThJuCppShAhEBZljHCuXajtXrzCXtdM1kGwGWfDzsdza46A1b3CtvLl2
	43k3argGEMU8ZJ3cXqR07gsNmlXwUysnq7REpF0OfKFfXqQkh7H0mnMHJ/eVCNLE986hkkKXw7x
	7P1uTPlVCYcMMtPQi43KH6+WYKJ11lqVxcL/+sN6X9TGnT/7JfpQ==
X-Received: by 2002:a05:6808:3442:b0:467:15ad:9de5 with SMTP id 5614622812f47-4865aaa8d0cmr3200764b6e.13.1780519445730;
        Wed, 03 Jun 2026 13:44:05 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:05 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:19 -0500
Subject: [PATCH v2 2/4] dt-bindings: media: remove obsolete rc.txt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-2-c8c19876ab64@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-63665-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2885F63B34A

rc.txt has been a single-line redirect to rc.yaml since
commit 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for
the generic RC bindings"), which introduced the .yaml schema and
reduced the .txt to a stub in the same change. The .yaml has the same
filename in the same directory, making this redirect unnecessary
for discoverability.

One file still references rc.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2019. Update the reference in hix5hd2-ir.txt to point directly to
rc.yaml and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 2 +-
 Documentation/devicetree/bindings/media/rc.txt         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
index ca4cf774662e..f777c2707e65 100644
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
@@ -11,7 +11,7 @@ Required properties:
 	- clocks: clock phandle and specifier pair.
 
 Optional properties:
-	- linux,rc-map-name: see rc.txt file in the same directory.
+	- linux,rc-map-name: see rc.yaml file in the same directory.
 	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
 		Provide correct clocks instead.
 
diff --git a/Documentation/devicetree/bindings/media/rc.txt b/Documentation/devicetree/bindings/media/rc.txt
deleted file mode 100644
index be629f7fa77e..000000000000
--- a/Documentation/devicetree/bindings/media/rc.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to rc.yaml.

-- 
2.54.0


