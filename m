Return-Path: <linux-media+bounces-66424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ILNFIBRHR2r9VAAAu9opvQ
	(envelope-from <linux-media+bounces-66424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 07:22:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDB6FEAB0
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 07:22:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h+kVEf1z;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66424-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66424-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 824263026C29
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 05:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902E533F8A3;
	Fri,  3 Jul 2026 05:21:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762FA353A90
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 05:21:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056111; cv=none; b=G1s0ESwjcUyOyP+XICoUuf5cFnUglMjqA1SrGyU55dtDxx2BecT4pgTHWc4+NBnznWPzt7rpvsviUt2YCZhb89lB0xAvV3nnAUv42W4T3c4KO91WUihoXpomKFkyltwUaeIYzi69l+xOnPEI5FymLB5S75XYffUPnFqSUjvIdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056111; c=relaxed/simple;
	bh=ungXM+pGccTPmY4MYi+TOmQLabp5apMUzorBXrm5qVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVSp+zFrIWD1erhzqqVka+em9+aG2j+eTx4kKjc6AWpB3qKLTjCmKP8fzfGzKaN5PWRXCriRkls3m3yzHjeVpJhMXzkn+YreIbZHP3Hi/h95C9tJAlOeWNgb2cRtOkk6RVPavHg3zM3jtxjcc9RQ3H0SAx/prKeopjhyvPGexx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+kVEf1z; arc=none smtp.client-ip=209.85.161.47
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69ec2ebec61so68647eaf.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 22:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783056101; x=1783660901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rbrF5PgluXo296yF8wu1iDrFOX+6QVWi9u8cpBpxPXM=;
        b=h+kVEf1z6+OUrrAyxKRdwJjeEEDGg+rG8cF484EV4vUNX33SgP84/tqzO/tWZcxZZG
         lLqZtJMpLTplvc5dNg09j5raiJ0qFSOMpngjR1Cv6YoO3+WP1vyenhsHoRMwIuZ05Cni
         lC4VzpI+njML3iNw5w0E1aZRA2T5eOaRJU7uJAUCKhYf19vVLw/ZrcnDdS+qUtIZ/QG7
         N/lOKYdlgHJeQ/VntPRGTXyJ0y94ci6Xk0T3JrQKK687yEEQ9s31ZApWcpdii4Y2hIq3
         OLRIe7iHrAQScSLI1sg8oT89oDNPl+JGr4b4NaU7P2mZTofRTSCTvnLQK1JcV7XKomx9
         Pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056101; x=1783660901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbrF5PgluXo296yF8wu1iDrFOX+6QVWi9u8cpBpxPXM=;
        b=WhF/r8yuyD5kyMYD8vR1xHMypose34iZ16uT0lA7K4e3X4WLNW+Q3oPI/KXVQ2tQEQ
         9R+HL8Q/WMWGkyEZLEYlFibftKpVC67S4QTdM7eH1AlhbNfWCc/KD8mrg5/qFsZI3wQw
         HKmOd54SB4ZRe5lVnIfHA5LlOcNIjQWu4/8eJlq1eLjtYP5/Jc+kTyXwUVhnSnqmMuI5
         HQF3wKxZzDELuAh5ygnHiaJM6cUX5vBpupF6Qxp8GWyZWNxDLIVJBcPY8z+aTfm0VJeh
         +8dYTTscpso2MS++QxDYJLylGWPfdr1JlmEU5pqiMEPhSsknBQ/qKwHIZc99WepiiJ4g
         30og==
X-Forwarded-Encrypted: i=1; AFNElJ+JDGszKwROyosq4xJb6XtT4fn3gONuvg0eUwOrzIrSmOA6zy+GTtkybOmf8oS/GEjDHgDSxMfcI2U/oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKwD9sWviWaCuZnOZQCK5aOpvBcMO7WZEKCgHMa+GuRHCMxcZ
	d/onYKkx3gJaS1W7OIXjKJ/1kA1UqCu6naWQj7nMsERO8e/C6lSGCBgA
X-Gm-Gg: AfdE7cnOazF9IK7K+tcCWEFKY2jrF5HmO2kEQcD6FsJA0fZNwpsL2SZdNUaIbtE2Vu6
	LeMYhOVfrKTdzbuUN4tSFb6MCtP0RjI4vfqz3SmCHplckFb+WPS5b/Ox8tqePmOPjtLjRylptz8
	ecZ+T5WDy7MBXGLOsFSKyjUjvvW4Doo6k6vB5fYAsWps5cKc5S0jnYW6YTRIraFGEHyYIT2qHyc
	2ae4QXOoAf2VDkvtjfBsQfD5GyJmYKDX+p74IZknNCjXVVh1mtPSVtTFVUfw2fJ0aCxo6K3TW86
	/zpdJ62/BnJQBpQOEGPo0ANjfURRgUQ4MrsLPnvzLXR/aSKK/KoMqlwrg+Te+eOtdoXw9TcCpuX
	X8Yvt/Fx/Te/kLzGRCRUUt7QeB6K35JhzE3xdyTddjq/nSERxKD2BaLeEiAXwhsohV4aKIMYrDG
	fAM559bDH1wf7iCS/AQ2Ce
X-Received: by 2002:a05:6820:4c01:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a30d887c40mr4436494eaf.38.1783056101413;
        Thu, 02 Jul 2026 22:21:41 -0700 (PDT)
Received: from gmail.com ([2600:1702:56e9:4b40:ff21:65e6:6e3:5b43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d011asm894391fac.8.2026.07.02.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:21:41 -0700 (PDT)
Date: Fri, 3 Jul 2026 00:21:38 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: remove obsolete rc.txt
Message-ID: <akc_pO_ctTiZmbFw@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-2-c8c19876ab64@gmail.com>
 <178052520503.2279647.12293343206224505400.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178052520503.2279647.12293343206224505400.robh@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66424-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:kuba@kernel.org,m:jonathanh@nvidia.com,m:pabeni@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:hkallweit1@gmail.com,m:edumazet@google.com,m:devicetree@vger.kernel.org,m:horms@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:davem@davemloft.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:andrew@lunn.ch,m:krzk+dt@kernel.org,m:linux@armlinux.org.uk,m:linux-doc@vger.kernel.org,m:netdev@vger.kernel.org,m:olteanv@gmail.com,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,vger.kernel.org,gmail.com,google.com,davemloft.net,lwn.net,linuxfoundation.org,lunn.ch,armlinux.org.uk];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBCDB6FEAB0

On Wed, Jun 03, 2026 at 05:20:05PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 03 Jun 2026 15:42:19 -0500, Akash Sukhavasi wrote:
> > rc.txt has been a single-line redirect to rc.yaml since
> > commit 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for
> > the generic RC bindings"), which introduced the .yaml schema and
> > reduced the .txt to a stub in the same change. The .yaml has the same
> > filename in the same directory, making this redirect unnecessary
> > for discoverability.
> > 
> > One file still references rc.txt, forcing readers through an extra
> > hop to reach the .yaml. The stub has not been touched since August
> > 2019. Update the reference in hix5hd2-ir.txt to point directly to
> > rc.yaml and remove the stub.
> > 
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 2 +-
> >  Documentation/devicetree/bindings/media/rc.txt         | 1 -
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> > 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Friendly ping on this one. Rob's Acked-by has been on v2 since June 3
and the patch still applies cleanly.

-- 
Thanks,
Akash

