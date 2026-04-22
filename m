Return-Path: <linux-media+bounces-59294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEzwLT6D6GkNLQIAu9opvQ
	(envelope-from <linux-media+bounces-59294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:13:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DE4434BD
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD0CB3025480
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBB6393DE6;
	Wed, 22 Apr 2026 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhdkYqdw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C83D38B136
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845622; cv=pass; b=hpmz3wQWTbIv3dlIO+r8KttoJYmLrU4xGOSbtnxvVx8/bxIrlsnTAlTP3RQ1y1vUMSugwMmC1X1LXe6CtDmffVHmjrci8uVtr06D2pfG0dxKnWSm/CoQJf1Fw1zpp3iHUyMQLaR5bZSxr6tFSQFY+Bk6LYLRYTpdMu5onsBZjj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845622; c=relaxed/simple;
	bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/cZBQydaPVOJu2M62iqFs+AA0glys5kT6aJ6d4Ef4UYJXgdz42yYUFfbv+iNOCrW0hvkWcqsEkfSXOwKn/Se51jkeLyNeyMr09MxFwax9q/B8CiD4BF58ydJ5S+mixUhgx/0gd1CNrP3RuAcdw+PbPCaoeBF3JAXGfFZRa/ZDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhdkYqdw; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41209075e9.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 01:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845617; cv=none;
        d=google.com; s=arc-20240605;
        b=DEhgnkqdigHP++osB7lnj/+kminTFRovqPw34K7DT3fH6tgwQcO4NlCcksJHgKKjBf
         eGnjktVkv3jWcbOlYtbGSaJYddItH9TtkJQTHSWrOE4KL7Tr0v0+PbBTzDXYT8y6+Vvm
         jTKLSFtPc6WkN8ZuBKZ2BYA516tAsUt8pR4EKcubNzrMJFS16xmM7Jc4bipIkHCzmr63
         T9au+pZLKBKGicv/kqgvrNkZKwJcqZzWIu2tjyLdBuMmk7pohn35Wc0jR0rfRaOm7Ffy
         7M11CqXWKujQwfuDwLEICdMzmEYYldh3lUe4T8v6Pcmf4peblWt/mj9ZU+7RzVztXnzw
         ChKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        fh=vZHVcfss33BMhLR40pSG45IVDeI/boIUrEPEbTHah48=;
        b=FJZqrDD7qdFvco3mQrCMBSpDEUPye45loPWw17X5yNxLXoRL5pUzPT6zv37T648tvn
         p+evp+ZnEbY5v4q/GFddkoyjqTRooLDWokxHaTnlehGJp1hKZFR8sEwPojUUPR/MDyan
         v6GQD3J2yNetkoeqnQqbxSKtmBUFKZxeBFASen63/PYm/AvqZb6C/JDzLa47YZ52+SSd
         vsMZhVdMMuT+/VYmCQdBeKTu0dZxAMPbY93MoUDo92+JlBh6OUG1wTy3uDXAYXMXDk9F
         QZrW51EW5K0o2geQIyy80GyfLoRApSg2gSFZS5OfDfPeQW+BVdRj/wa4EeWMNTIl1DB1
         p0iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845617; x=1777450417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=IhdkYqdwbGvyeUKZWE3AJJxXWaQIWiZtNGRyLt5NlcBIloJdXxD8kYLA7GZdIoH9up
         C0oQQDq/9kox5oSTmte5rc4G4dagdgNTOkDgt5e3vWCAjyqpKvyRrffd8OJvWL8EQeGi
         ul0MPHIM1OkA0TeBIVThsN5iudqfNW4UwhfwI8sqdWdUmGIHIwgK+OCu6LQVIFExTquO
         QbfQCshAAzgAzP8nhhIGFX3nOeUgtGOjrAidowi5ZrlgGxBBrPpQzuoD0vKW0egw4UO3
         mOfiYOMXoG28pf4oYR8jHDBpyGgaJiLJtNPo8kxj37A17RhsU4mnvA8oqmhC+jGDFces
         bDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845617; x=1777450417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=UfvUXGNyngMnC3XysBF8cQXOgnSW/Q35S4nZAe/u1VFsgzletEVnPWcwf6uQ5tfSMh
         DEJ0djmipc7z9+2UH1hmXOwi/dNfFzTOLza/xP2vtkBsqPFrM3DCq61dUqAMmx9f8+0q
         MNClKUst5F/wtPgkD2JmSAJtosacl5lHFXawNtURn/VHMvSK9Ksmh9EpWa5nHieRoU7N
         +UZfbkOe/J4WeSBKDCrh98qp72zTnIjMygAh/xwhAn34OTS12P3pn63mSHDjslGffo31
         9JD1pEesoR4Hp1dsm4ZA4JwZS6yaGYsNXOd4UU32snkJhM+OQQtWbG1GZ/m+vTe5qnpJ
         JHIA==
X-Forwarded-Encrypted: i=1; AFNElJ/2YWQ+qXrPFBHgmKTNVKNkIHoPp7RfSqeBGT+STiPyRlYL4qU0W6Ew9J9HH04NiPnCo41h8+RiDSdW/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXe4iGCF1p9/ro3GfQe2SYDFPG2Pb/iYVq7LRzzx65CfHv1mSK
	+Mh8xopQOFXae3XQpMh8TQ/zOOhKncA2519NG9wjtsayx+IcIwy1eSQ96FFd8UtazxZ6fDUjSmE
	w1Q9a6I/tcKThq4Yb6EXYV2XozuePDhY=
X-Gm-Gg: AeBDiesk5o5073ntG/M+9t3gCyQfmdx8zQbhM1JP7KVR7rZILu5G1QOxNb16MH789Rd
	xcFqSnbEsYj1xylj0gFaphVgsJiHjyifL2liSplO75L9JOwTQZ7Z4aG6O+uzlR86+z96xusbkYg
	+Fjd+1BhEKix7/epd+WpYqagMygol0/kTZukHjGEq/J8dHEHt0Y72U4untgqqZp3VxgFuKgSIU4
	B2qYbfRHRZZrjGoSc2vvSbzbbik14OjxQtqIRFfC1cBIkHQCoW80jrOWFkBG8zcO6zTqudaXzc+
	KoEDlLoCi1I6AqBuSbY=
X-Received: by 2002:a05:600c:c0cf:b0:489:1f3e:5f6f with SMTP id
 5b1f17b1804b1-4891f3e62a7mr115275205e9.12.1776845617219; Wed, 22 Apr 2026
 01:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain> <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
 <aeiAq_eep_fqwewN@kekkonen.localdomain>
In-Reply-To: <aeiAq_eep_fqwewN@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 11:13:25 +0300
X-Gm-Features: AQROBzBoeRBOPowp3OnCxGEpCKHgoXA68JG6VLytQ68roGoPnIj5MHCz_olxf0M
Message-ID: <CAPVz0n13wS1TnF_z-muwtnP0BK6FKiu4-6h5k6s6hm3p4i=0_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59294-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 443DE4434BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 22 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:0=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Apr 22, 2026 at 09:29:51AM +0300, Svyatoslav Ryhel wrote:
> > Noted. Any changes required into the other patches of the patchset?
>
> Please see my reply to the bindings.
>

I am closely monitoring all your replies, and I will apply everything
we have agreed on. I assume other patches from this patchset which you
did not leave comments need no adjustments?

> --
> Regards,
>
> Sakari Ailus

