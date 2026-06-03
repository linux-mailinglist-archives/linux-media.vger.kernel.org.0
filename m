Return-Path: <linux-media+bounces-63663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixoiFoySIGrt5AAAu9opvQ
	(envelope-from <linux-media+bounces-63663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:46:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7363B325
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:46:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="eBhHX/bj";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63663-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63663-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FCC03035A97
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD4A409137;
	Wed,  3 Jun 2026 20:44:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6203403146
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519445; cv=none; b=qu5PO/MoZqkvQl8xDHNoabVVahEB4N6J/nRwaI1uuRZ13NxGKWxsH3IvjWJyU5Xy06jJc6v9UMHxLMmU6RAa4Kg54CwAGSxQ+x9YOm55FujgIXZeIYhn7K9Bpjh89nfpK6hr1QyRZNt5TKRQLxOtQy40XkOHkDkYEZKHKGxb9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519445; c=relaxed/simple;
	bh=+JosnbZhQUF/MOBUAyqR6d/lHKYmP/5jY0EEF59+azs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oIM1ZUg62pe+pQwqWj4C3apXJzo1SLxDyiRBybt0rAYC9UDn5JAPFZeNYrl8SvtgZwbxMjCVpQvf4ZhJ65MgBYw2stU5M0J2VNVQEcipAB7T8h0gHNzHMMUAi1xbMtUCoxBfEMadV6hD6+RUbRScSAxkheVu/1hmw3tVNE+/ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBhHX/bj; arc=none smtp.client-ip=209.85.160.41
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43d23173511so31573fac.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519443; x=1781124243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IEf6hXj7f37DFxPYxn9sI96qJysjet+fYfxXFRG2SM=;
        b=eBhHX/bjUqK/bQgWs32lKFc+cdIrlG6bjDtdscaOc4jE8J3fMP6N6xa4MHb+aanQ4r
         vjdbiFEKLGRZgWx8jdRAt2PzEL0vjWQoxbnsouDIXQtzrul6Gxuu5eRXWMVcz+5n/Rhe
         jig4upRzejUnzDzQlUALFqK+JmJAoR8lz7Uw3U3SwruM1FGl3106LcTKsn/3yDD8FH/B
         3MSbKgu1iwmv1uz4BAc1vZBJ0hfRZTGZvVUyaUtoFLczTJCWd14PC4Nsc9C6lHppBbNh
         4pe3UUvDR5qWghr81ltPt45/kVmIgiN1XGrcWJ5QGk7LUk2PvpJL01qWrTkj+rolK28m
         xPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519443; x=1781124243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IEf6hXj7f37DFxPYxn9sI96qJysjet+fYfxXFRG2SM=;
        b=LwQ2WO+/LCO7Pg8T6DDJGJlG9OlifxsuRhLJu+MHbUMziP90WTgc2XjSXZfzCWz2Df
         gX3F3SbahWeGb3RI0ZSbNNh2euleHBcOnUFkZAGiz9XNvt86MHRTcdRDNJCJ4lF6HHiN
         D2AFUiz9nFRhpVbAXRBkXjh8PaCPazpfhNz8E89NF0i1s1hsvPGbX2IbUZW3620jXiiN
         nv7s01KzmkT3TaNK+3IjNgiaAiJQEpISX9K9D9rwwdJhOznfIJcqJ3pBsa7LBMm2twqL
         1Izud9IffykElqU+2sC/jDZdxfx+PPiG56aWIiX3x9do1EZ9Z+xqZvEncE53FyjGH4UK
         xhLg==
X-Forwarded-Encrypted: i=1; AFNElJ++2OKpsaXOjsF5qmGtbmO7M5zuFoFJbafX5XHIKwcB64Y7gQpmzMVj7fuikKigXY9s7/LbmvgmHa/mBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxM9NBbCL2BaEWSOhL1n3rnLpyZk2DB4CyuqsGqN5jyAYa85se
	KKIYwcI/oSuX1yKeb1rLf3K0Hpk/VWxFuM3hwNEnz/CTH6MjdkyZjSHT
X-Gm-Gg: Acq92OH5Z1m9aqVmAhLgLSD5WtuuV2C/eoJ8jWLMkhgFpO3XkDtjiBYvkbXgBAZwjV9
	oHSqJumVCLDxlB4kPP4vGlrNnWg7qKqSSNGD1947s5q3wi4p/riXMo4C2qZR6QuhYMsA5jXT/L4
	Vnh5YtoPeX4MTz5NmJVRlNolbcqKWxAd7wBNSWdWpVCuylXcve6KmMogs2iSvkw0PQQ6IUqUReZ
	9xkIB4E0DGsysMPn6NMOgIOwHKjJpOASOS550GWf2l8lKXJayxO22/6fY2d+NiTzwBLs8QctPxk
	1anaEfdWqDGCIWBIIVGZUtxnn7s4CiI6w+/lKIXsJYrvUljdRCEJ1fTFKIawsDmmM0BBTCoIDWH
	qquzMmEPDDCejszQI4f7GM1WViz8rkpLpfOk9Lk1c3f8Ze0iqKlGpyum9LiQlUVphUUgdk2/xBB
	vp5lPufU2g7xt05ZhgQ7vPFW8GC7LHCEkUe7KXjCxZTcmvg7hARA==
X-Received: by 2002:a05:6808:144f:b0:479:fa21:adfe with SMTP id 5614622812f47-4865a9264e7mr3070801b6e.6.1780519442890;
        Wed, 03 Jun 2026 13:44:02 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:02 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: remove redundant .txt redirect stubs
Date: Wed, 03 Jun 2026 15:42:17 -0500
Message-Id: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvyJ7diFESWO/Ih5isql7UMuuihD8e
 0NPwxxmCigJk8K7KSB0sfK+VbFtA3EJ24eQU3WwxjrjTIdzj0LrflFFYqF4oB7nrOiHIeToc3g
 lBzX/CmW+/+txep4f7I/bSWoAAAA=
X-Change-ID: 20260603-b4-remove-redirect-stubs-899afc8fa7d6
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
	TAGGED_FROM(0.00)[bounces-63663-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABC7363B325

Several .txt files under Documentation/devicetree/bindings/ contain
only a redirect notice pointing to a .yaml schema with the same base
filename in the same directory. These stubs were useful during the
.txt to .yaml transition but are now redundant, since the .yaml is
discoverable by name. Meanwhile, other documentation still references
some of these stubs, forcing readers through an unnecessary extra hop
to reach the actual schema.

This series removes four such stubs and updates all remaining
cross-references to point directly to the .yaml schemas.

Other redirect stubs in the tree were evaluated and intentionally
kept:

 - Stubs pointing to .yaml files with different names (e.g.,
   spi-bus.txt -> spi-controller.yaml) serve as breadcrumbs for
   the renamed schema.

 - Stubs pointing to multiple .yaml files (e.g., nvmem.txt ->
   nvmem.yaml and nvmem-consumer.yaml) convey that the content
   was split.

 - Stubs pointing to .yaml files in a different directory (e.g.,
   reset/st,stm32-rcc.txt -> clock/st,stm32-rcc.yaml) serve as
   cross-directory pointers.

Two additional same-name, same-directory stubs (leds/common.txt,
regulator/regulator.txt) have significantly more cross references
and will be addressed in a follow-up series.

v2:
- Patch 4/4: corrected commit message (eight references in six files, not
  eight files), Sashiko review.
  https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4

v1: https://lore.kernel.org/all/20260529052246.4934-1-akash.sukhavasi@gmail.com/

Patch 1 supersedes my earlier standalone submission:
https://lore.kernel.org/all/20260523004223.3045-1-akash.sukhavasi@gmail.com/

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Akash Sukhavasi (4):
      dt-bindings: net: remove obsolete mdio.txt
      dt-bindings: media: remove obsolete rc.txt
      dt-bindings: net: dsa: remove obsolete dsa.txt
      dt-bindings: input: remove obsolete matrix-keymap.txt

 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
 Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
 Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
 Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
 Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
 Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
 Documentation/devicetree/bindings/media/hix5hd2-ir.txt         | 2 +-
 Documentation/devicetree/bindings/media/rc.txt                 | 1 -
 Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
 Documentation/devicetree/bindings/net/dsa/dsa.txt              | 4 ----
 Documentation/devicetree/bindings/net/dsa/lan9303.txt          | 2 +-
 Documentation/devicetree/bindings/net/mdio.txt                 | 1 -
 Documentation/networking/dsa/dsa.rst                           | 2 +-
 13 files changed, 11 insertions(+), 18 deletions(-)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-b4-remove-redirect-stubs-899afc8fa7d6

Best regards,
-- 
Akash Sukhavasi <akash.sukhavasi@gmail.com>


