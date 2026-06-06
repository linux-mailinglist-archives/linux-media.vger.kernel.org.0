Return-Path: <linux-media+bounces-64031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +gAPAGiLJGql8gEAu9opvQ
	(envelope-from <linux-media+bounces-64031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 23:04:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A964E60A
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 23:04:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gyC2BOm7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64031-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64031-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6DCF3032F4D
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 21:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0A43C415F;
	Sat,  6 Jun 2026 21:03:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D82F7F18
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 21:03:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779831; cv=none; b=E3sa+32mhigBkFj9RLLEje7weJF6b1bOchzXwRXFCDn7cuidZxMgirADL/ypdcwsnxp0Qi7vlsuJx+8xEYEbgtWP7JP7mC+9XXSPdqXnw1pdY+tai+A8pBu8HcuEqJn+1flrgt4+6TV3DWRB5Lc8T1As8AYyHZ6i0kuT9oMBMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779831; c=relaxed/simple;
	bh=8aQsvQV92fCNEJtI42BLGSyXug3KVyb8/WsuBLmztq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrbpGd9oHg5cvqaxwvUxejlR8sE1JWMZ2qmpjCVjaSFc5HC/UgyPkNqHmGxCqUbC/wRNsw01ivD1zIkrDAK2w3BnkOo8HLyDKSNXWtfXdB3jyZe51wqd+UEJQ9/Tgh8TH8cVopbxdY/7CYHPV9JNv18RyvZS1WQ+DrKPoomJyNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyC2BOm7; arc=none smtp.client-ip=74.125.82.42
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-138188a7dccso961656c88.1
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780779828; x=1781384628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=gyC2BOm7S5VP72mgnsTuhnN9AFqyGpSdrXsm683Sebk4NIWJ7aOvSj1RrBs8RPIALg
         ZlNdaZ6jaPPQp6+QNBHKWny3CXkarbqoUaGSz5nZFfgV0ETia4Zz6BiXd1JOg4UmlgeH
         IuJxGxAfRFywUbRFS1iclf3mrzxm5/YMbwIWZh/Zvc2KUwvcPfGzQ1jPQS3SxbG4rzpd
         I1JOn7YF+iLVtAt46bifoeGncS+O5KRdu/D51wKDROjvP6s93+ODmZRsr7ztmDXC/aAq
         6gEML85fg84YhetACuEBdxXki7T3+TQ9/FzXnXlw0NSKYOaRFV/LYo5zSa/cyeDPxFUS
         HWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779828; x=1781384628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpsbdQ4HEXAu1DofK9GVpNtvbeL5V7mTYGQq3LB/EZo=;
        b=Lbr3Urk4JC4rD/EbzhSTLKjiFq1GEHcGVxAE0wM0Gw5RnawxZ3wOiGABa+O6Cnj0dO
         OlUsbk1729iDrSU4AKdN/22ZU1+3HSCH3lyOJ/6A+u82NWjANYmMjWMGi3AuXiUBOQoX
         AgRk805ZK4mxJrwcyxn8xx5p0uJ93FLy0b0yPFMUCi6aQHRYskVu8BtkJnOFUeykwqLv
         cI6bAlLU9ACGnK8mqaE8RADpBQKoeotyPbsWCl4sdNZ9uTRZGoylxPu0FAHuqDeJ9ZiL
         BwSrUbzXlBzEyNSAQ6cqlHb8eTxFzGLAyjHXX+9xBdq/ColsBUu77z0NhXmRZRUBFgip
         rY4g==
X-Forwarded-Encrypted: i=1; AFNElJ+X69zB23WOA0eFQvBiMySLdNamKuQcQd7CcyQa6g7toduQPzHo/qDauT+WFA8p5/YzWCgwt6J5mxNjXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Hk/h0z4ZWZ/183AFOpCMH2GCdlLN3TBprH+1dfiEXpb3EBgg
	w5IM4thWApUf2TXJa1VcC/2fHmaqM4FBfdtF7uHIfsmEl4GFOz8ezSiB
X-Gm-Gg: Acq92OGZzXkKPWFN2mjh2FpHSlq02yBShsMjEuEZ4yxY8rYvjEeJuml/L37Y+aa/mtR
	9D/4OqyqJyT+CT5ml3BklrBOdSH5rU/7K7SfmLhgNMJp7NizQjzy9UpPpyPhUx7ooDEPtqTSw3f
	63+JddHkHDNJg4eFGzrzVkH3DtG2zuAW9EsprtFklQ92z40zpAJVBNMg2CiQ48qU5zs7knRxwA9
	IJSGwHNx2LuBxUTyUAJpkVSUc582Q0ho3LGhY1+d4HEp35RpUkWmHAw+NlAAqzYGvUkrHO+oY0z
	FXYj3A9doVadOiozsiX5jRt21nOeVqJchv9K44eS7QFWQ12uKH8AdLyP3jrOIaqOyE1FN/eBBRv
	cdJAMdJwdytWXzs9ZtthiUoNN0GoKdi7dTwRcef7K9P3Mers1KoTYEpAtRfWDtQHheR+plK0oAG
	CYFDL1SRAq7hgEsP5hAl5H85jOfNnqUKj25XKVUbQSIHRUi5AvM6IfX1G7Mg39+L4JAUQGcWmfo
	7YaFtAU4ADFWg==
X-Received: by 2002:a05:7301:5f0f:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-3077b1de34bmr4945899eec.22.1780779827609;
        Sat, 06 Jun 2026 14:03:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bb2f:1c0b:386d:8909])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm11772015eec.19.2026.06.06.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 14:03:46 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:03:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org, linux-input@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Vladimir Oltean <olteanv@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: input: remove obsolete
 matrix-keymap.txt
Message-ID: <aiSK6_n4ZnB_KRd8@google.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
 <178052559618.2296868.8781332297681333925.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178052559618.2296868.8781332297681333925.robh@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-64031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:lee@kernel.org,m:akash.sukhavasi@gmail.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:linux-tegra@vger.kernel.org,m:linux-input@vger.kernel.org,m:mchehab@kernel.org,m:hkallweit1@gmail.com,m:thierry.reding@kernel.org,m:linux-media@vger.kernel.org,m:krzk+dt@kernel.org,m:kuba@kernel.org,m:olteanv@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:jonathanh@nvidia.com,m:horms@kernel.org,m:devicetree@vger.kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:corbet@lwn.net,m:akashsukhavasi@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,lunn.ch,vger.kernel.org,google.com,nvidia.com,redhat.com,linuxfoundation.org,armlinux.org.uk,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 672A964E60A

On Wed, Jun 03, 2026 at 05:26:38PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> > matrix-keymap.txt has been a single-line redirect to
> > matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> > Convert matrix-keymap to json-schema"), which introduced the .yaml
> > schema and reduced the .txt to a stub in the same change. The .yaml
> > has the same filename in the same directory, making this redirect
> > unnecessary for discoverability.
> > 
> > Eight instances across six files still reference matrix-keymap.txt,
> > forcing readers through an extra hop to reach the .yaml. The stub has
> > not been touched since June 2020. Update all references across input
> > and mfd binding documentation to point directly to matrix-keymap.yaml
> > and remove the stub.
> > 
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> > v2:
> > - Patch 4/4: corrected commit message (eight references in six files,
> >   not eight files), Sashiko review.
> >   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> > 
> > v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> > ---
> >  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
> >  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
> >  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
> >  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
> >  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
> >  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
> >  7 files changed, 8 insertions(+), 9 deletions(-)
> > 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Lee, could you please ack for MFD piece and I can take it through input?

Thanks.

-- 
Dmitry

