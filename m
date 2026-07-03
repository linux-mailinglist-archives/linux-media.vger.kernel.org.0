Return-Path: <linux-media+bounces-66425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MOWMGFRIR2pxVQAAu9opvQ
	(envelope-from <linux-media+bounces-66425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 07:27:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E76FEB89
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 07:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KXJ4pZkR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66425-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66425-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 743703077DF1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 05:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C1333F8A3;
	Fri,  3 Jul 2026 05:24:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D29311968
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 05:24:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056288; cv=none; b=frboeutV73rw+lmDOewHnBjiPGQ+mE6aAtckHg1o07jX+0bQZGl7AVAWz9kKSYoGCWczvIy0waPZHJcLIA6T9Eqf/At/PseNPceLhkgCYJ8IRuKhPWSe7zpR1D1gd6PMNbjZQClxPDS2E+xYW9pxmQfI2dvkfiPz3VQOzvj55FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056288; c=relaxed/simple;
	bh=pVm9pS+PVo1sWY7zlCDKGAP+Y0EYCctZHYBMrpl/GZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JExieELsAY6p1Ri2PaETN2W/DCgbSbDKvGvCHvj1OB7brPxqs0Lwlhm6Ev/QEM7YONp53BS6NqlCw5aGC4TO+qpErODm4ltPca6KmnSZRAt3qQEvl32bNFmpW0EL6u/nHu5tKuqqWZpXVEu3SqcqfnTrjqcBmp5te4aJzA6vjPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXJ4pZkR; arc=none smtp.client-ip=209.85.167.169
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-497deab2d66so140277b6e.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783056273; x=1783661073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ku3ZZ8L4tk4M+xljq5uIH94V1Fi9oyEnYUJ16WQL16A=;
        b=KXJ4pZkRaWMoCDVsHoj7F+5BU+SKV1XiAXTHMgr1/EWdolktKmWF1LSM8xlg2nWQKR
         eVySg5h2jsIpESxZ45VId3YPfPcSYNhF4yzO7BRhpsNromS69c0xiliPF6nWYl+0ryd4
         OSloI+O+LZOrVxX3Tr40bX56ZbjZRWyu42G9oq6UgUKjvPd6tdG4NcHjKZIWTThiz6kg
         eohHoZClM+JOTQoYJvAmKdT1s2wR7hk5RgpbPmElLqX/r7efOafuSUakKYsKBWe8m5pi
         oBvoav1sNKlPcIhLupQAfY71WLp1aWXkFZZosD3V0bqRvYldfrEkxQZaVD9m8DMq7BOK
         i7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056273; x=1783661073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku3ZZ8L4tk4M+xljq5uIH94V1Fi9oyEnYUJ16WQL16A=;
        b=njVd0UP+ed/sByhWvtepVZhc9tb0KcP1Wvy2+42FWUPxXtEm3r0++4WebLHBRZlatS
         3k53OlHVM/C+hJw1/jQJd8mcSeEJbvIEBJGk2sAmggHfMOwk/Skk5fFARM11tF6KOQTy
         WdCGGpXa8YYqvCsMcidIcpHmsukG9blGTPIbpknAA07baijarUBcU6Wa2wZbtTC/OKa5
         N6DHhP0siEppWtoV6Y9ZDkxyxUagzYUVrQTsTIFFkONJ3PhhI3BSUxSUcwIo6F2TghHz
         qNwtHfF458IKnMruO3Ruzt1Hk+LPszJKU+uzkZeSQvDv+5uF2rDDkKrt2RkBH5XL8CFI
         1Faw==
X-Forwarded-Encrypted: i=1; AFNElJ+TfvJhVOXqBf4UF+SaEY6M6Mo7IzHaGkGM2rav9GaXB53yGalphaxU773cQLrF61+TIeQULRAXw/uNCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqeTlZ3Ae+I4hPUHBePsEqZfBLsSDXbWV76A0Ik1xavQWWc7TO
	7svwbHbuqinEkV9PpP5/T+L6kSJQJ6insrVa59HNWsfudoIGWg+MQR5x
X-Gm-Gg: AfdE7clGirABs5Kz1HAZ4NMZlgtb0otOtHbLpqVE4L+4QbqQmNAzxPg2JYHAalH6gCY
	A8HfWMpkP+28kk6yaaRG5sfBFXl+hj90JGY/V8F33p0Ctq/Dg6HWJAJYoCguzRGDEqx6uUPnDe+
	avO0MM67OBGwPL3ZgDNkiXuDLc+zH5aGWKzevqB0pzuMMObAkyQMPi6xYCvN8RJykSbs82Ym05O
	zqJ7hMdxAbreIBS+F2dXgluGm0ljBdGqsL9cHSko2cTbq78qa7EtB9BExtArZGim5iZy94zUFbE
	Ml2Os5cK40JPS+5Zj/z4D1wTk83NpP1QVnMe+c/xS/B96I3Gh8UruJXNsi1tbc1W/phk8jYjwMq
	9FFEDrT0vAgiOeWzAvKuOfAJxV64TInu//Qq16lC1L2tBk8hZHG7DKNd1Utkg863mEZIWB4LbpC
	p/GoaOu+9lb6ioe/c/29cU
X-Received: by 2002:a05:6808:17aa:b0:496:6b1:cc7f with SMTP id 5614622812f47-497e1bec6ebmr2160066b6e.3.1783056273105;
        Thu, 02 Jul 2026 22:24:33 -0700 (PDT)
Received: from gmail.com ([2600:1702:56e9:4b40:ff21:65e6:6e3:5b43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-497d1b77a11sm3272472b6e.17.2026.07.02.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:24:31 -0700 (PDT)
Date: Fri, 3 Jul 2026 00:24:28 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
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
Message-ID: <akdFQ3j6fDW4cVIp@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
 <178052559618.2296868.8781332297681333925.robh@kernel.org>
 <aiSK6_n4ZnB_KRd8@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiSK6_n4ZnB_KRd8@google.com>
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
	TAGGED_FROM(0.00)[bounces-66425-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:linux-tegra@vger.kernel.org,m:linux-input@vger.kernel.org,m:mchehab@kernel.org,m:hkallweit1@gmail.com,m:thierry.reding@kernel.org,m:linux-media@vger.kernel.org,m:krzk+dt@kernel.org,m:kuba@kernel.org,m:olteanv@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:jonathanh@nvidia.com,m:horms@kernel.org,m:devicetree@vger.kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:corbet@lwn.net,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,lunn.ch,vger.kernel.org,gmail.com,google.com,nvidia.com,redhat.com,linuxfoundation.org,armlinux.org.uk,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 880E76FEB89

On Sat, Jun 06, 2026 at 02:03:43PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 03, 2026 at 05:26:38PM -0500, Rob Herring (Arm) wrote:
> > 
> > On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> > > matrix-keymap.txt has been a single-line redirect to
> > > matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> > > Convert matrix-keymap to json-schema"), which introduced the .yaml
> > > schema and reduced the .txt to a stub in the same change. The .yaml
> > > has the same filename in the same directory, making this redirect
> > > unnecessary for discoverability.
> > > 
> > > Eight instances across six files still reference matrix-keymap.txt,
> > > forcing readers through an extra hop to reach the .yaml. The stub has
> > > not been touched since June 2020. Update all references across input
> > > and mfd binding documentation to point directly to matrix-keymap.yaml
> > > and remove the stub.
> > > 
> > > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > > ---
> > > v2:
> > > - Patch 4/4: corrected commit message (eight references in six files,
> > >   not eight files), Sashiko review.
> > >   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> > > 
> > > v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> > > ---
> > >  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
> > >  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
> > >  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
> > >  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
> > >  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
> > >  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
> > >  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
> > >  7 files changed, 8 insertions(+), 9 deletions(-)
> > > 
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > 
> 
> Lee, could you please ack for MFD piece and I can take it through input?
> 
> Thanks.
> 
> -- 
> Dmitry

Friendly ping on this as well. Rob's Acked-by has been on v2 since
June 3, patch still applies cleanly.

-- 
Thanks,
Akash

