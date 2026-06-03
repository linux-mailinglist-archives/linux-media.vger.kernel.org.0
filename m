Return-Path: <linux-media+bounces-63664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7aoOD7mSIGry5AAAu9opvQ
	(envelope-from <linux-media+bounces-63664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:46:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 898F163B32E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:46:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="PT1+lJi/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63664-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63664-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D3D3091793
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60100425CE1;
	Wed,  3 Jun 2026 20:44:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D49409109
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:44:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519447; cv=none; b=Sx2qk5+lTxsy9MOR5xK1o22fceb7QYo9TUU1sjuCEy71lqUXjItzWGFG11GgBj85sBLPc4ez2dJ7Pzkt2LC//bIi+bdMFMV9bz9Q2Axt9ZmRSN/jke285Wa7lHrVj7JbjFiBlfym+b0PSBQfPZt04N7xnup0oTAWMvmJ0Qu8vPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519447; c=relaxed/simple;
	bh=1VgHiEy4LZCKpTLkS9uhtOQ9zMOOI5+2vy09ZAAS624=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw9w9C72VkReMNC0XO6ozK9B3n/2wzzib/zmc5SvnqMZfhNHFzbitooW9WgU8bb4X7FASz3PNtC7FTizH49Hb8T4R1dUqcIGIZapmGJO0cYp91lhG+puQX3CNvZZ6YDsDFMk3BBPvv+i4RG3L6IYB22L1b6oNnwG+OV/YlvDKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT1+lJi/; arc=none smtp.client-ip=209.85.167.175
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-48673dc56a8so64246b6e.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519445; x=1781124245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=PT1+lJi/dVYSSC+fFoYHIJrGX9eMjKdSl476Uq9/CyTks5EULnBzI+7eCrWu9tCyl7
         Ld1H8U7yUkY7YHV1symkS6+rVED9QEQ3JN/bckDHENZc2zy4lUWMGCkC0pV55dNgRQ30
         c30GJghRC2z2yv3DxxpteL1bPrBx0EBd9iIWLLUztI7M63Fe5jrl4C8wE8VtOMtlAQX0
         WNo+Gh7X4gEUz0IyrgvkLEk5rOPzRl0JoXTF7d4Jn0w1tDWoXvbOFgBTdsIjzvPFrgzz
         Yhxx9TBiuxpTtU80FiuhQNCII8hH466uUQw3YDokhGYhIR6N/DwYkfA/nx8w1Me5qpoE
         wAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519445; x=1781124245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=cubAA8hPUQHOMh6TRnko2WpPKnfHmr7KZbS7bxqHyELm9BiBdNOQlIuk6OVCQu7BGQ
         EGzvfWO+Ki48GxoxEw2/XdC/8UrKCeKbjTIaYB+Q995/MwAS0eqYCmhmeAZHGcpIjuTv
         2L9mLEeYAIrZ5k7a38DuQzVuCT9+ZpMidzj4TPn4Fp/mo3kAnfE8ZZqUT+VLTfPW+uaB
         IisQMcs4Wv1vfQ9+5xp1RdWP9DrOWzNEtf3Ir/srBCF0ZKbd+XkXcpUQtiYIB42YQBcM
         Ktlr2l2ekNsCIeZKn7qxIKGFJxF4pusbBqfmw8A4xFUK+8MVT9hcUdrx/MWVrqToMuMM
         /+ug==
X-Forwarded-Encrypted: i=1; AFNElJ85lCb6xISuFU/0I7X5mjUFxk4yepMfQASbzLkx3PKOR5ok2cEUMH/VdcTOmI7Gil7UTES6XU5obV+qKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcrxtu24pzp4EaYT8sc3tP+F+HYD9s9oe4lYe6q6S40odl4ak+
	9yq+cYTTXARiFkXaa+TTayNak4Hq8NcZ8dJAPWg8dV89Nw/UREPKPgqY
X-Gm-Gg: Acq92OF5HXZxkGoRNzN29pasf9Irk5kl4ZrwtsYxPOEJL+RTwdRMmqGXYWz8I2cBuOw
	sRwx3YOWcgkMDv4PEbYbNNB1lnez6A+z18pQD1XC6LzjwvbSZjdDZC31X2+B68yhSj1XA559ZbZ
	okviBr5ZIUEXBXMHffafT9oo6O/zRyW6Ioh7GM850Ed6Qoc7DmQx+MURcZBhfAntkkoN3zjwhB1
	fkAIwnX0gBn5qntAl4VqncEN0W7Fjn6d/IeVJS9R1Kdxz/rcI1ovjlrSzgYTa9zEjKWv4rhYqDI
	UJ0rUKO5+HuepItJyJ8TPsWUSs+Yw5+U3p419MdSyd7ycwDr+j9KLqxuPd7zo27ZEZDvAKCTQ6+
	JMJqDQ+fPN7H4UpwX6OxDA4by9f+jGtdzh4YeFQO+xvlkjZcRtUwzzjrbdRqAEdx0Hr5hq7qRQv
	GY+w6Xs5YnmVvidvj2455FDsnsVLKzGqCo+Xa/4fsXRllU0Sui8Q==
X-Received: by 2002:a05:6808:1a19:b0:467:58e:5d4b with SMTP id 5614622812f47-4865ab31ed2mr2926769b6e.20.1780519444730;
        Wed, 03 Jun 2026 13:44:04 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:03 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:18 -0500
Subject: [PATCH v2 1/4] dt-bindings: net: remove obsolete mdio.txt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-1-c8c19876ab64@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63664-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 898F163B32E

mdio.txt has been a single-line redirect to mdio.yaml since
commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
generic MDIO options"), which introduced the .yaml schema and reduced
the .txt to a stub in the same change. The .yaml has the same filename
in the same directory, making this redirect unnecessary for
discoverability.

No files in the tree reference mdio.txt and it has not been touched
since June 2019. Remove the obsolete stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/mdio.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
deleted file mode 100644
index cf8a0105488e..000000000000
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to mdio.yaml.

-- 
2.54.0


