Return-Path: <linux-media+bounces-59279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEmKFAFt6GkSKQIAu9opvQ
	(envelope-from <linux-media+bounces-59279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:38:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C58994427CD
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AF1F301CD95
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F8831D366;
	Wed, 22 Apr 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW9ucfVe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD5318121
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839791; cv=pass; b=rcTic5WIjQX7kWwcOJM1m1WofMxzz1AIahprlvarui9xnYbupKXy4V2luXD1I/j+3fo5nmTTrZyMkSs4gtsNbthWesZI8kxW9iG6oa8iOzJ1T8w3YvxRuMsdM/lEMYXxLh6Arw/MBPz0GmP7IBmUkZ8SaY6lc9wqiIkmdoz6nAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839791; c=relaxed/simple;
	bh=wfavpjAJSZ7hjRrsG7wTFAHndOUYUXOJbTCj7dcdkBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opzjDKubvs2KvVxKy8ELN24Eh6XsYX/maolcw1BnwzYwNG5wZXOqDGhcaTX5VnwoTMFt4UMh/9919FfdsMbc89p8WlP5H9jxuVAPCqfPF7DSD6EmG1OIizPYyMRNhPcHfO3AygIp+/twiyVbHz1Q35AKdNozYwDQWx2GF5NkhKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW9ucfVe; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3486715f8f.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839788; cv=none;
        d=google.com; s=arc-20240605;
        b=PS+ya7sSYxsK0/3Z43qyZEq8Wu0/GGGVbFmlEpYWieYNrSG3J8Z6XzDq0JYX3HMvmv
         lnZYok5Whz5zK4J5Ck4HVsUiRDOJstD3uR7ljnT9RTi6b+NqioKQcXEdUqTAfV6cPgyt
         bHUgBhQswgAYudlfhSmrCVK6XOhTetRVwPgwOSw6ysbP7lZG8iWqz7gbQXKiz1Ed4T7E
         uMAKDnsM0/h2iR+rBe50KjbWFs1dxqbUb+SI7j4vYF+P4X9Z8vp8bY/xSQcCKiUWKTFE
         5UTZwLG7YVNqe0oxRIUwggIXrGe+XAHpNDUmFbs1trjYtj9NmvnAqA7Sw9A1PHwbreUy
         68pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        fh=aG+ph+vD6X9B0bctHsofdBj6IJO6pxaf4+zevsVfclI=;
        b=PYNMGoGg6gT9HsQBz9mRFE0ua2IrsMln32Um3qnBB/GNMkd6RfNSRVuSSklIRNz+kf
         1JogSgjjvmvGjxEw1DHJjsch2MXt2KaV7bkTN2DOJZCSST0WH0RJdK4C0vt2+HOTNxte
         /rxsxDOEs907drMHWm6/iSSSs8T1VxQme2VL9Qv4YYT2N9Z5AVFFFiLby5seo2O7tePe
         6lfXQMf21la/qIbYzyLOPhboTQARnjp+sXkOj93tk1ZDalTbEkEJs/CDwUqvtoDV0xeC
         odyWroIdtR5mTWgAMhbSVg6iZk3XxEK5FK/bxdfxAN/oSsolo7B0Jh+rtlXK6rPR957z
         0mCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839788; x=1777444588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=IW9ucfVeT/mnGYgdSshb9A6jwQ0aWoPTd+/L0/mNQEziubP9LOAO80jXmXkMiUL8WI
         kTgrLMbtOFO3k6wNDQ9HWyEebrgoZSfR/ZXLVdqlibRJMXVlG4fZK3+8y9gah3L176Nq
         CcN1y+yITxuY93trrd1JfELQx+9CRkEr0FgrCyYL0liY9Qb+PoFe/mtbqBDwwelj1pHn
         IXx4sUuukSvCAvvDqYkhD2XxsWJeKYWr266+Sk0QSjUqOAZtcVkuO1/+2xjRWADy0xT3
         sujfqm3P7KJZ+UK8i+5hqMgLLiYnpGanQTrlVyP0fDoVD476g8fOwvglnao0htYh+wXj
         oXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839788; x=1777444588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=jICO4/JGKQl5BlYyQP6aCEOBepYCVX93Mw+XUPYH2ZNdeCOIxy8b8FnEV8UdOc0ZOg
         OLn7rz+47v/3AOqGXRFXokGM609P3M1Nr9/CNuIIlmzBYsia9eKICYkBkBAr19XxyNc/
         nRRl72mfJ5jP4S5zr0QxyvvDT7h7zWmAQtWBZeUDe5+606b5GhAvUKRoH4dPX0ARERwa
         f40VP1I/6mdsD9aDPRCOA875dRKU1xIolL3IGKPB0GTVB51APJ+kPwkmRWQbh2UWh2C3
         bdgFYxvBqd6U0qdNEEgFGGyhIifJR3sKDClirvQCLO9Em096TCFlaWn3A8FI0vZFHIwz
         aPlg==
X-Forwarded-Encrypted: i=1; AFNElJ/U2ZNkvhjtmokfs0V2OraAzLheXhnaK5naTEdHg+/jZH2eoGwtqMRKxcdcpH7Su0fbZZoc524eXHhcmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+7HME2TKTvSFv2vbhyMerYR+doEiNbcpOqJJHU0iG1geFRyV/
	dbrtD01+xXx6Bp9nLv7ht4yzTzf7VxyKw/K1RJKw/Caau5x1p9yVBxxZhe2Ge3ZQapgiW3EsVA6
	1noiIaD98UFtlPjiNQqpXxeWx1TAH4Jg=
X-Gm-Gg: AeBDieuph17BPH9saMXV7bwLthiJcL8v7AHXjQZntT6tbxI69Ubrzv5BJN1ztY1UAHm
	XYdv0cEhe7mRUUww1ijc104awXPHhA7qg7QWun5F7Ss8MDfJ5c2/2uIADG6aNQ88bhvE52I9K/R
	21Nhnc8BQIrTIyLU8KTgheHjWcTGJb21pD3hG1DHkAxJgGTHWA7NHliaL8F0s0avYk4Wd5ykWwU
	JbvGZokyBVzz8A5gBjKSpJGHeeIcm/VM9rkpK8D/ivBXHjcghYQzA278NSzvcLkqy3rBOGnM7Js
	dYPZWMfDqqiy9kme8g0=
X-Received: by 2002:a5d:5f92:0:b0:43d:71f4:7ed5 with SMTP id
 ffacd0b85a97d-43fe3dc54famr32939529f8f.17.1776839787814; Tue, 21 Apr 2026
 23:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud> <aeZWgcARBqMQatrr@kekkonen.localdomain>
In-Reply-To: <aeZWgcARBqMQatrr@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:36:16 +0300
X-Gm-Features: AQROBzCUJhTnbg5bBGAy7L6DdQ6sPnv4p1g7vJBHYljdROCv4p5UQj1SToqiRiM
Message-ID: <CAPVz0n10Us=zU38v4ieqWXkQ2pXRKi=6M4i3k1Q5bJ4g2QQjgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59279-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C58994427CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D0=BD, 20 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
8 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Conor,
>
> On Mon, Apr 20, 2026 at 05:20:28PM +0100, Conor Dooley wrote:
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,lm3559
> > > +      - ti,lm3560
> >
> > What differentiates these devices to the point that fallback compatible=
s
> > are not suitable?
>
> Good question.
>
> It seems the currents are different albeit the register values themselves
> are the same. The driver doesn't seem to handle that properly right now, =
so
> it's a driver bug.
>
> I'd keep the compatibles as-is as the current limit applied should be as
> specified in DT.
>

This is a valid point. Unfortunately, I don't have device with lm3559
to adjust driver accordingly and test.

So, Conor, Sakari, what changes if any I should apply here in v3?

> --
> Kind regards,
>
> Sakari Ailus

