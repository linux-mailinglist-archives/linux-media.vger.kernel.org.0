Return-Path: <linux-media+bounces-54607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENm3InpXqWkh5wAAu9opvQ
	(envelope-from <linux-media+bounces-54607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:14:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7A20F830
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD17301AF6A
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AE637D13C;
	Thu,  5 Mar 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3NL0/aX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997033F374
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705625; cv=pass; b=lAM0SgIA41i5NGTnv2b2vxthw5+LyY/u/Gnubya/Wjxi3vbtI4FQevRk7+STddZoXmNmCKOdMSsYqdKOIQZtSGsjc87gnhUsJOqm2xRF+JQVI2bEndhqb0qyGYUaoAS4VkOMv0eVESWKJOmdeTHODlQD+TSFYhtrzhzXonyesnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705625; c=relaxed/simple;
	bh=GFDwCGFB/AQTCAHU5tMsZ7q+/z20+AbsOn7k0Q64tAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvRT0fOV6NHE76FhMcwMToI60tz5EFGbAUFQCxmXw57iHjSSBaKNDF7TSLVo6f79evk68DEY1LapaXT72IbNkMKXcAa71F17qxiN67Se4Ejm0+CqC9wgo6Pk4xAP/Uaqw8eNGw8Oj3QKV8d0htKi6JePwQXSUl5pQ2V6q8BhY3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3NL0/aX; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso3384480f8f.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 02:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772705623; cv=none;
        d=google.com; s=arc-20240605;
        b=hH6Ac/KmT8GrEKZjaiU4ibB/fF0NzRDe4oKllqqRTf1EoMz0skDXpY93G3MU9jmRfA
         LixZe0HSqq3fOg95uGYESfzc2+AYCwVcRwcpsLd2M0NBBmvKyteb19ZB/bD3McIYip6G
         9MlarJIoUzR+W/b0duCfqphhEYUeU/QZ3I4asRXqmWn/YUrjEnpgqRsmBT8T7+exljbB
         AQZT9/Xb09Xtyp5gX/K+lWkS9J/n6pLy5LxNZ5iggUE6ndLNqZj2pPyhW80ewkYGvF43
         snXL2150fzMebUh5FDl80CHt9HV5gu+fNQ6+AZKVHZYJKEyZiiVgHBDZiTs0hL5zw+rU
         LI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rh3t36422Qx271p1OO0jFz9CqKGbapAyF7HmVo5B8yg=;
        fh=IwY0Piq5gKfcR4lNg3t3299glIIXLdhDx4p3mNgVwYI=;
        b=FTItiGckp8kkYWY0zRYyZMShY+13rLBKR38F4LmdM7tepmkS9Ev6NFYM8VW/oXWv4J
         oaHAo8/5J6UMUQ9IyRLTxcyq0ZVuupC2ZB/nNw8yi3/ftnc/6WLBPBcboUDZpfsFx63C
         Zz0V9sEfKylMjptLZzLXv3iuYdtNFOmP0BTRGCBOcaPPdkCtAzHBfUecI2ZOPOwFe7yN
         4fq1HvOpuIHY4YQje2BUozxyhP/Htr6F5mEIbT0AiatvzMqqHIQspVXY7nXBZOjMZjy7
         XwxYOgJGVxTOktrxqdV2621EIFB1lrU88a7NYXJahLyEsOlmJ58sm2IvPiWQskX+Cw/Y
         AMtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772705623; x=1773310423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh3t36422Qx271p1OO0jFz9CqKGbapAyF7HmVo5B8yg=;
        b=Q3NL0/aXAvHFVCIz1Ydn/kKZ4qsg+3H6AGq4vuJtmKPzsjHxlKvyW6l40BtnBTluZl
         hzhbPvy73RJoEbenPH2LF/pk/9XpX1pfw+pRMaFSpsjwKSgQXTLBdPAw4hExcNEaFz2H
         wFSKvbMgj59fd9InBOrnGmjawmrMMInmc9EfRrAb61g8kmZXN3Wk1zL9YupA6H1j/vmb
         CI61UvFTkmo6EbWoDmO1z0q8KRXpZJC9sZw+mtAK8thK7n3QyFehiVT2eTnMJXd4KQVy
         vWGHu3+CJce1+awcW5YbNpb7TtzuqW7qKeGmWzKxUWJ39NtoOHBwg9w6itWEYRlTdegB
         LAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705623; x=1773310423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh3t36422Qx271p1OO0jFz9CqKGbapAyF7HmVo5B8yg=;
        b=DcnF4K1vxMx1RhJujUY8W4uamVjq7yLJ2kvh9RT2qBwN5iRx8QgkbeueocUjRNyPDf
         1Vwn+3zrn29MnzLkTK1SwGOSN279973MnS5Iq7rwZkdFxPoovm4LgftjmBwmpG8PL/yD
         NUPN0efETbtscAFKv19jJlCrxUOrQZQ5iVwuze1YkF6orpBrLhPMsWBaQfyRsGHA4R27
         TIJVOEp4oERhR7UUoJvMTrP42FUoyxwPHBbxutyH0Gbu7/Z+m06xhOsfMJqKyyJn0TGX
         yhBh4infAHrNvY0FuQKFNA0uKgCE2j5z37u0IKg7Hn4qHB5qaCp+ist3QEAYqQEYM8Fr
         Avhw==
X-Forwarded-Encrypted: i=1; AJvYcCVtiVK82IcwxoQtEQDNyo/uJjngHTEvPlPfyQWKp60/R+b+qlb1U/Bv5/YJTnSkG0cxc1OpnxgZm5CV4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69xg8LfVhzGrXd69xxSstKyvrJq4JTusoFdoTaub0RgT1pmMH
	v4Ytyioqn1693+CMxCWVHsPYK/3k4purwpfpSu4ToMkt9GO+o5SuBUV8umwr0LnPmp5uqiPcS+N
	QNwkBGJ2LQ4WZU2S4VqQvDPQM4/P2VE4=
X-Gm-Gg: ATEYQzxL9mXY8y0bRvYLEZh1vUFM0CcNuVzZbGSZlf0hR64TPCnmD3iR8aBqp+Ay97E
	qbiFMmqqSTjz6i/xDdzuYydUKMxnMj1/em7o/Ho6qdVoQ4SbUDN1AfGYvR0AnRg8X9JVB9rmuuE
	nC2G0VCCdpfvfgL14b2WQ0/lNnCqpdbvIMkAVPTPRH1n1XYrl95PQBXvHWa43hX8996CR4Xqd8r
	SaoSfblbFhLMLBIeDdmdQTD0opEXSZBmnuzT+XjqGGgJSCcD9v/VB5SHy/eRceaaqK/wXGN7X52
	BGuFcR7A
X-Received: by 2002:a05:6000:2c10:b0:439:bce5:6518 with SMTP id
 ffacd0b85a97d-439c7fa448bmr9643738f8f.22.1772705622716; Thu, 05 Mar 2026
 02:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304185001.82988-1-clamor95@gmail.com> <20260304185001.82988-3-clamor95@gmail.com>
 <aainoYv6RXkXFcHv@kekkonen.localdomain> <CAPVz0n2e3HCJRo0_Q5zbYp4w_-=ZCypoaw9vaN0NTfFr7qgorw@mail.gmail.com>
 <aalUTnqTFAWR6nPo@kekkonen.localdomain>
In-Reply-To: <aalUTnqTFAWR6nPo@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 12:13:31 +0200
X-Gm-Features: AaiRm52wOY-IpQJuqUqpdfH3xEKrQOQebVgAQeqDUY7MYKuR7sv5CHygFlx1XeE
Message-ID: <CAPVz0n1a6MKYV8F5j2moP7Ym8K=e-r0ka58qarfMrXif=+kbXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E6B7A20F830
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54607-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Action: no action

=D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:00 Sakar=
i Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Thu, Mar 05, 2026 at 10:36:25AM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 4 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 23:43 S=
akari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi Svyatoslav,
> > >
> > > One more thing...
> > >
> > > On Wed, Mar 04, 2026 at 08:50:01PM +0200, Svyatoslav Ryhel wrote:
> > > > @@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client=
 *client)
> > > >       pm_runtime_set_suspended(dev);
> > > >  }
> > > >
> > > > +static const struct mt9m114_model_info mt9m114_models_default =3D =
{
> > > > +     .state_standby_polling =3D true,
> > > > +};
> > > > +
> > > > +static const struct mt9m114_model_info mt9m114_models_aptina =3D {
> > > > +     .state_standby_polling =3D false,
> > > > +};
> > > > +
> > > >  static const struct of_device_id mt9m114_of_ids[] =3D {
> > > > -     { .compatible =3D "onnn,mt9m114" },
> > > > -     { /* sentinel */ },
> > > > +     { .compatible =3D "onnn,mt9m114", .data =3D &mt9m114_models_d=
efault },
> > > > +     { .compatible =3D "aptina,mi1040", .data =3D &mt9m114_models_=
aptina },
> > > > +     { /* sentinel */ }
> > >
> > > The driver also supports ACPI. mt9m114_models_default needs to be add=
ed to
> > > the ACPI data, too; otherwise ACPI support breaks.
> > >
> >
> > So turn into
> >
> > static const struct acpi_device_id mt9m114_acpi_ids[] =3D {
> >     { "INT33F0" },
> >     { /* sentinel */ },
> > };
> >
> > into
> >
> > static const struct acpi_device_id mt9m114_acpi_ids[] =3D {
> >     { "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
> >     { /* sentinel */ }
> > };
>
> Looks good to me.
>
> >
> > I want to be as specific as possible to avoid any misunderstandings.
> > Additionally, please ensure these are all the required changes to
> > avoid unwanted reiterations, as I may not be as familiar with the
> > media framework as you are. Thank you!
>
> That's what I noticed after going through this once more.
>
> Review won't make patches perfect (mostly) but the more issues can be fou=
nd
> during review, the better.
>

Yes, but the more iterations pass, more issues may occur due to
mechanical typos or unintentional misbehaviors.

> >
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
> > > >
> > >
>
> --
> Kind regards,
>
> Sakari Ailus

