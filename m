Return-Path: <linux-media+bounces-60328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHlQCW+A+Wn/9AIAu9opvQ
	(envelope-from <linux-media+bounces-60328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 07:30:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D74C6E66
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 07:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 550203028833
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 05:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C37E3BF693;
	Tue,  5 May 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y84FU50h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08163BF66E
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 05:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958985; cv=pass; b=qaUQ8m8BMh5Y0YU2CY9hBUrvBqgka4OJX9JPgop0VVrWkoY1Z+bYf7X92MyHxPOHSRpRW9M0mXU3s1NYkXcCT2I4k9aCCcZbhlEN4eud/HethLooeqzvYPXkZT4hxlo56GqQ/nQUOPl4i22YLEfE+AFBH+EPItt0z+WYW2X5F2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958985; c=relaxed/simple;
	bh=V6Zurul8OIpaOamfisEiMCOrAsq2ljuPtO2RRKE9ogE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGytEpsNNeoFYKQu0/6J2jrqF+tPjIAQQItckkbJFeP8DNwl49S+/EPwywFnLmpBBtBRVMqFBFyJp4gGZZc6WW8ZeAS5tyB9AMbYs3k4sOWlazWzVd5MEfYxvlRE4OmmfZt5yyRQNHTbWqgG8HNWfRAIcTwm1/zazoj1hHcmwGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y84FU50h; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5223015eec.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 22:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777958982; cv=none;
        d=google.com; s=arc-20240605;
        b=fGn0pYTDcXFdveO29VOVTFca8MHCTdo3tg0jKUSgOwyjPSW0TZay4zQwM+/YqOZZFY
         8EHuNz4rRYb3Z967oxOFsFDKKutuMqY3f16IqjlwU/OGdZSRhGflNqnwAl8H52ngilj7
         MMbDDgR4q60humoJPF9TBLSp2ABDETevTWR9RSHAy9JSY2yDHriN+Eyw2l+Y/wlH8UCp
         yNbi9IYNFMW0N1itVisySkEV0TWHCKmLqqAqlyiqKT0GwWKqWHjCxEqaXznbzcJdervB
         RBKnVT1akevsDHfbyf7VaC8dU08GzX8cPbBImIveVsWHN2jgNWXm4+FGkrzBrpw2Xzgj
         Mq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        fh=OaxvWQQkGLSJ7PSR77P+oXN7x1DPv1GeJTEmvv0GCeg=;
        b=WCXACNiXvR4WxwsP6z9cwmRT9TEcrO6PrcNWrgNBJMLoQh75f9qnzV/D11TVVDMR85
         yLYGvy4ftRpGIhdYd0YCbRSYyNvH/JoDWYV+CXYPJPChGQPedRv66vZPKaEmW9q8ybBB
         Eh15G1RKwzxaS3HbFE1Bn/j3BfIJQ4sbQ/hwdZEncArBdaRibWsN2JmLq69adYb2/d66
         MsF8DpJ+aurae4MKP/mmm6b+tdLRswo4eXjhugDPM3JtFxpFJDSAy8sY6/1yA7XFcIbr
         8tA2oMAJoA/RcGFYe0vR47ZeuocE/eYN5KQ1WTEmbJN4CfsmioVuQyWKQD/fSCIhZ/8t
         ia0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777958982; x=1778563782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        b=Y84FU50hfQe/MtMC4bS0CsgqkSV/29O1v1Y4QHOjE7ff57FC/bGbUP2h7sYq3Lq/RV
         kCXGlEdEmzjeOY+FSNG/mee0AkrtxQJ+mhrrsswjP98DT4NnBWXSWj8ABQOWt+K/497M
         seDe+PuoH6/UOoMr4TuRITx79L/l47el6YVaaSTDg7eICPQWzxkHtjF68FvKKXa0zc3c
         NIzDpoCJYeucD4Cdu6hNdp7Q/tdz36yv3P9FUh6Y3metdK3xjgzjKWf+8I0JCz33G/Qj
         XtiCahmRNPyslapIwqwQxHar8+8Qo3M/X+94kiA+D3snGff6J963rDK9rFxuCytLyCdF
         sZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777958982; x=1778563782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        b=gEXBfk0NvqelCBboxwPXinFayiGt7BsyL5+LIVPP9IAx6mFodOU1kcQX76MyD7wEyL
         YkJp/70nicoJsNV9jVr6/8a8mahGnfATo5hCDxAeykuhdvglWuzn+5jU89A4jRxPHyQ3
         Z5jjALGAu925KrM1S4a2EPiTjnu/rgp3PgcJ1dXf57Xtax74OfEQCEF0al31DQnORC+Y
         uyH0SuPvHxULEHJsEpvs5x2tuzgmHSeuN2jjpg6dVgoEjWKhf2JneuV6YKtxRq4uPBOs
         6ANxLVjxsIOIdbGAH2La9SkyooeifWQDYa6jU2wLHoEMZVkxNyz/2i2thFQ66qE1/Sf0
         NYhw==
X-Forwarded-Encrypted: i=1; AFNElJ8CbR1fbC8zVsNmY9txaZH6rU5FhNW0kay569p1dMYBZj8amrfMbQIVOjovltOkjAVeoCkYxMuUiEOdOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMe527F7VXfeMjzpkyTuvVhRNzqDWgzO2kTYew66DhekCSFVD
	jIViTDzz2o470E5q21FbwZO98ItECmTtLX254LAi9uWmhfhGOe3emT/6ITZGX8BdFc8Sbgmep17
	Pw/+llYMBxlu4liFyZcoQc8hJ3HzUyglCBJqh
X-Gm-Gg: AeBDievFoAT491QIHo8hFTMByF6jRL/bwG8Gt9hhyJIec6qEetsh1HinIIlduzMWOTq
	YHswy9BaIch4koQeB0QVb/5QL5lc3YBbqTtlgxIqHVh2KCmkfpr3ZTWVmg9tyuXv44vgN+wecyM
	O7GrXPgYIwwRArAzWG/gG62Fqolx5pNgXuC6UKqNoiv+McobhmJfAtcHF0KeUHLxO/pYrBDeB2B
	soHwIy6Dzuj/FASpof3hNlpmW1u9hvW4PDA09hirKZ84hVwORPaA4HSe1Sx+CYZheAMMYOiPUEJ
	+arkbIQW5RHXuXYePa9Vlygw+2qIvQ==
X-Received: by 2002:a05:7301:678f:b0:2cf:3de7:22ad with SMTP id
 5a478bee46e88-2efba28ad10mr6432810eec.27.1777958981772; Mon, 04 May 2026
 22:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406081330.30362-1-clamor95@gmail.com> <20260406081330.30362-2-clamor95@gmail.com>
 <20260416214025.GG1824072@killaraus.ideasonboard.com>
In-Reply-To: <20260416214025.GG1824072@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 5 May 2026 08:29:30 +0300
X-Gm-Features: AVHnY4IqOphoy4i60hIX9XKC-SiiHCkMxyeKQqhZZfL3LpieJyG94SWDZIgtJGg
Message-ID: <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common video
 device properties
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7B2D74C6E66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60328-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
0 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> > Document common video interface device properties, such as rotation and
> > orientation.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.y=
aml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > index e896f4db2421..2b39614f5cbf 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -15,6 +15,9 @@ description: |-
> >    an I2C interface and outputs image data over a 8-bit parallel or 1-l=
ane MIPI
> >    CSI-2 connection.
> >
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> >  properties:
> >    compatible:
> >      enum:
> > @@ -90,7 +93,7 @@ required:
> >    - vaa-supply
> >    - port
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
>
> --
> Regards,
>
> Laurent Pinchart

I am looping in Sakari since they are i2c media devices maintainer and
this patch touches i2c camera binding (get_maintainer for some reason
did not include them).

Hello Sakari, Rob!

This patch hangs in the LKML for quite a while, and if no one has any
objections may it be applied?

Best regards,
Svyatoslav R.

