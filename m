Return-Path: <linux-media+bounces-67622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wGIrCPwuV2plHAEAu9opvQ
	(envelope-from <linux-media+bounces-67622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:55:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95975B436
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nlfnWahl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67622-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67622-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC77F3007527
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 06:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA33254BD;
	Wed, 15 Jul 2026 06:55:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE1312815
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 06:55:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098552; cv=pass; b=sTqzv7Tyt6z9W0jjWw0yqAjFMh2nmvxkriLL1wA1k7/gRATcAILBXvesE71EBkAmhMBODqSxvAnyRPZC0F5gBnRkCxJDIZfyyTljvMUpgsOAriHMOxElRBVk1kCatZwjTFOnOGJOV4TO0lRqdqCzdQgh6dY+7wPX5nhnbV+Ew1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098552; c=relaxed/simple;
	bh=ifJqXZ4ZAmIfzckP1/3gX562cvXWbJvgz42X1CY3OO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehbYFHDQ+4dkA8NTk1A9vq99380B0r1e/9eyblXwtQregr5SzogBKoxUo7da3e6+CXW7KIJYQI3QJ5UpKrgA3nRp2Tdj7eXRUyoVfyIUD6v0teqM0z1euIbErQcq/RQgAoJGy07LA0oRuWHqoWswiN1xBw18xL/zoeNf9WKIqh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlfnWahl; arc=pass smtp.client-ip=74.125.224.43
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664ae043b7fso259629d50.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 23:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784098550; cv=none;
        d=google.com; s=arc-20260327;
        b=NG33kQMalHUM5KTAsVvlOiX5Dd6+MG6pUYl/51olpLRjBviNRkjJdLq+WAhkWNeWZa
         +sat+ZMqSOpmDb0WB6QtE9RleewwUD5UQPTHQJlv7k7TQZZKOcpFQnzOcah+dY0qtc2N
         t4xDibArQBPyznSVCxGqV1yCwZ9VFjaX/BJpKHsjRyHNE+3el+zVc27JsvvYz6nS9M49
         WqWYPMh3OrFokM4iHs3MCGZoCuX85rsPuDq/gMWYCX+3prpu1IKRo131EnVN7z/itiWO
         uvsLXcwCvvAKDqV0GlTxFCQcqU1sT9ts7R1M6FK4InC/7FMB9hAcvitcJukqcVtfjeqc
         QccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        fh=ljAUl5JJW9+h1Ku8n8ZJAHFtZbR7+mCkNpoeUy2K2IM=;
        b=LyDa0jYlAMVuYLMxE4K2uvKwczSqZmYSyCBZjqp6T/fYuvyjwyzpCiohu0QPY8wnwa
         sDSFE1kmKCh0YAcFuzmVD2byxVAsDCpM0trRo9l26bpXBSCb/Z1k5rqk5iWz2dvxmaJ2
         Ym8eLEfSoOkmRLQZnxR3eONnXHkX4nO9jgxe3guFwXGrGgI7CPz/tdrcWRbIGzJlYKfA
         NhjftowFhmgiVPjj8Hrrwd43YToPdgZSIgFfsylkQs5g/WrLj6SX4z8rw3Pk1h9U8fTy
         Ancruug1EN29OZKZCx4p/QZgh13/TY9JNeB6HvD0DLCEXnVmZD1I8Hv3mpN6UOQLKuOI
         68VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784098550; x=1784703350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=nlfnWahlF4LVulHFBitVf5ysKcUiRkciEu3JCD1EskkTEMySnuBn7uQOnGtz05dymH
         FAb7Zw8YxCJ2sgRlwMFzywpsDXsmOZDEewJhhrCVdymQ66EeS3726K4oqt4TEnFmnMuR
         6C1hrl65zmUIYBRO8rXix6D/oYcsuB2Km48olhPcN+11ZoMN5p58eRLaC9qIMIIJTayQ
         VRo+ETSNU5510VOINAZ2OPBbU1rX7bB4tY7zoOIC4TYahFFT9qvGT0+lfKjfe2CdDyoP
         X9BdHSIZnThWszY494dXKLzFLXcYUa2rKVhsVsWFx0KOn12XSwqpzrqphV1EbXKg9lKu
         mFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098550; x=1784703350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6gxrK21sxCB/eCMN/j8yC9AHCK9IHMw89lMoZ6UyRY=;
        b=XsqOamVwdAhZKYPdGe6B8JiqzZK/gcb6D7sY71OuKUa2YPhbOZRYRXsuCxRFtZILbf
         J/G3gJwsdSh0jAP6KLSfI6u2ST4JJo+aLRes+yLLFPWsDWrdSgzkY0azedMkdXMg72gO
         4jEEc+lyAMjlj2z/jJF4L5tH/OSyJZxKjj3cRlmIIx61a8AgXE7uBgITNMJMrxxqSCD+
         ha0TOme7IGVcWb+lBTyM3YS4yImsx/0RD4rlEbqS5mISjE4eVCYYJ7RaZ55n6GyqGIEx
         /fX4MeZbbuNAYq+4Rd3ILrkX9fJyRxhMV1qC2q6IkrZC9EgzK2QdP4o7Y+17tZGp5AWx
         WRHw==
X-Forwarded-Encrypted: i=1; AHgh+RocgFbiDI5ZpqMCV2SNWRN3oh1sdKgyEjHxKpSNG6jitbv8AYADbbPMn5gE3jHuiLK65QPNJ0tYZKeeIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DmxQxOFiSb53yyWKidKTLrzhXYCkzeSeOKEZl9OivP1YBCX/
	JqkNlYKiCbHHE7X9ZabbKeEnf5i7L8GkeAv1gNGlSunKSX+U1ojdPFRInYLvdH3fB9kbJvuVrR4
	4rBXMdZSOXKprGPdu2pwWUeTQCfzucwA=
X-Gm-Gg: AfdE7clLSg3bc7s1uHIOg0NZRzl6IsZvemmKIhyF15eQnXzaRT5Bp9qcACGFOxWCuaD
	ChQbZrYJBhgOYrzkEU6i7B2eH/x9lSSH1iaErDRGHOyBwaW3SIEOTtmyF5cOJ30o0ASahXpCdlZ
	eQ4xMRj260/LQiV+73i3EGqwk5LUx9w1iwsd2S8fprjX8elrwFrPFtHlRcziAvCrsvWZ8FLBlX/
	LHflFe78IZuolz/sxnN7IfiH8eVzox3uFIjY//A9ywtwx8pJUyWyu6aTXMXskwzmlpUfXGPWUBE
	aH2W6uxLGnQoYmJqFYGPvTGZJvkirqg=
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2127791d50.6.1784098550460; Tue, 14 Jul 2026
 23:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
In-Reply-To: <20260715055448.AEA021F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:55:37 +0200
X-Gm-Features: AUfX_myzakcKGN9vlq_qc4LRJvv-oSEDxuwqFd24WcJAwYA-kTmTVF-i9eX42Ks
Message-ID: <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67622-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA95975B436

> Should the constraint be set to 0 to follow standard device tree
> norms?

Fair point. The current RFC wires up a single I2S DAI, and for a
single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
exactly that for its one DAI on the TX side.

The reason I picked 1 is that the controller also has an S/PDIF
audio output path (the vendor driver exposes both I2S and S/PDIF
DAIs through hdmi-codec), so a DAI index becomes meaningful if that
second path is wired up later.

Unless the DT maintainers prefer keeping 1 from the start to avoid
changing the cell count if/when the S/PDIF DAI is added, I'll switch
to const: 0 in the next revision -- please let me know which you'd
prefer.

Igor

On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incorrect cell count constraint for single-DAI provider.
> --
>
> --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #=
sound-dai-cells ---
> commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> Author: Igor Paunovic <royalnet026@gmail.com>
> dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
>
> This commit adds the #sound-dai-cells property to the HDMI RX controller
> bindings, enabling a generic audio codec to capture incoming embedded aud=
io.
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87d0e06a..83c10d9997c8e 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller registers a generic HDMI audio codec so t=
he
> > +      audio embedded in the incoming stream can be captured. A value o=
f 1
> > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
>
> [Severity: Medium]
> Is this cell count constraint correct for a single-DAI provider?
>
> Looking at properties:#sound-dai-cells, the hardware exposes only a singl=
e
> generic audio DAI. Requiring a cell count of 1 forces device tree nodes t=
o
> use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> for =
a
> single resource.
>
> Should the constraint be set to 0 to follow standard device tree norms?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.64=
652-1-royalnet026@gmail.com?part=3D1

