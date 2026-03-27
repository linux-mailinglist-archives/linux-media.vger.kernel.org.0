Return-Path: <linux-media+bounces-57288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DMQIfO7xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:18:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4134830D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B8D3064E19
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF49371CF2;
	Fri, 27 Mar 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh7V6/mk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04935263C8C
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631434; cv=pass; b=F2FXclLNsmhtdST3ptCfxSr9upqEa7CEjdDsHNy2XH7m264QSJ1dmeR590OSeNB/V8gbXRm9zO0guKr1pj5gp/TTG+4z2jvw0JWPQwo/PrwzBfWuqf0wO9GOZGccSqhfUxI/+1Y1SIA4aU1vnQ3KgAmuto/bMGtDMrGBvgqIUus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631434; c=relaxed/simple;
	bh=RiLdmFAG6rzjt3NdgrPWGBfa4yukoYq3tZh2mFKSfFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHJ1dVoIKJdLYDnpyQOQAxl7lYDe2xVTIBPSD1QeZJEBRzBIwq3swB2o1jerRv2i3SpfwrqndypKRLU7EDUMLrnAQi1ZnF9ev0LdMNKli3+kBP/eFm1DoVsTyf4S84F1yEMVOOiHDPK+iznKEEiDTu9w07fufd0ndP2Mggczy+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh7V6/mk; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40ede943bf0so1489900fac.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774631432; cv=none;
        d=google.com; s=arc-20240605;
        b=GAUzvQPU58NesSFFK5O7IpZcKAxNPSWq5O/Ea4biWRDoH2/Mz9PNtbAQYC/kiNeTcc
         AUOrNTErAEpz/9ARQckhHDPF6wMnq3R3BG4FSS9bEveeMHWIXB5d7x8SmDW3+VdVP7MU
         tjnZw1HsKpWetiJTS+pRuAeGBE1D2/+yHaSNy88X2Jt/J+tn1KURjibrwq+B9pUoz/Qs
         RYWQXysEbY6wkgmWKyDYhU7I+hyGlBi2MmGeuayXn4FjbeBbRso1QdNyRgYdt+Dq8wZW
         1YaMmd7N60iotMVmoP1m08y6xcuueG347ia0JyClxugXvu7VgR803fXBWR4YpO7kZumA
         vAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8AvHeaWZczLND5McWF4Y3v90ltLIbni7gd+Xa/oJ55k=;
        fh=CTNryDK/9GV/KMYYU5PqmO6QHxnvrGzPXKNq0myC3/c=;
        b=FZC2pVFNxbrwy87ZXry/FhqnN27WEFNYwQse4zJlGCKKuEmlF/V8lx4y1fV+ctPxO1
         HqXOciBeM9b7csTPjOenCKJ1/CBg9FzcRNIBiRTbxvg2aNlrIpC3V/s7rCQQN64ZI6s2
         Y6buFarlQHoE7tRi7oHn1o/c7/vAsSxp3aA1ve3mqN/TjmmANvH5DhoydGU3BOb6KaJE
         kH8vVw8BfUK5AYAod42XYEo2RSFB9wCc9dTZMO1p7POE1WkTSKPzdE86vQnwukrmLv0W
         C8kwf3hITWZ2DLUfMoiN9RI8W4raD20+TIuyNI70/Ps8zpsKFS4DBz6wSjCj8qOxh41k
         wfNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774631432; x=1775236232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AvHeaWZczLND5McWF4Y3v90ltLIbni7gd+Xa/oJ55k=;
        b=Uh7V6/mkTEfXxLU4ZIsIEbv3ZnZHt0Lk5wjkfMVm00oMhwT7sQsaZda5XWxGXlGl5v
         KoODwVVAj7qCYtJMMffqJmkhYzImCPA9ydqgyX741eMfW1K5yqHeJqE781L86N9hBM0i
         MO9PeK9k6kVFthBiz+3tR3/YSP3K6ztimzZzePfCmnyL41g97f/dNBZ47SN8sbVj5GiR
         V7TjP7zEJVJYQ2AGopypNq/qcwvC9jtEoAGDxWCnMJ4mMdlyDeUMMfVC2MWBu5uWwWR+
         7m/CCU2CiuUjTRWJARS+COt/XAj1bc0+IEKrcZ45urNCz/U4S88nQtheyIqnQQqv/Zn6
         HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631432; x=1775236232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8AvHeaWZczLND5McWF4Y3v90ltLIbni7gd+Xa/oJ55k=;
        b=a4RltfusiOQ3s1NfOj2djAlrLkfHQ1H7jpb01hdhrrpkfo+yMzJ+QN88KjFbHzv///
         S7Ehq069Qx4PZZewtHm9uLtGS1XY9Saw8he56o39VlkqL8BFIstdw4hxypiKYXtCkgPU
         hnoVJVMSX2QkjngBAzekdFj3rz1XKZaUEMdgIetsAJ7ONx0EXsTtyrtgRUE1ojGP1/bS
         fRQRCI6R5UiVvY4A33i7ZKDQLIz6cN2ecB7S51ahzSSjyHW7CHHJo2OZNvJu1bsZzBCB
         KZLLPGZqejJBXAoVNkMRTFIpwz50bhwdNms6MCxjKIL2sjspWztgQrsaizCHuc55LN7n
         N7VA==
X-Forwarded-Encrypted: i=1; AJvYcCVLnz+ihPhDdQa0DFW73Vj4+M/x2DqTp8CNEqLBpOE71Luk0Tjtvih8QuyG6h3w96FqClSnx2GDrp+x2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNAT/JD964Q4a0Ky+rWh+mrDszFAbzmbySQKDcsaGV800jFE4
	uRnSSOhUqvHrfEaOQOU29YULWGjSwqqrnbcJ+pHVbkgqfMW+eU5FskZ1abPNQmh51bJ3QfT5Gf7
	FzlQCLs9t061M5jYhJtxxKD8tcuTKYgk=
X-Gm-Gg: ATEYQzwU1VQ4Yr1xXfrT5VXxycvQRxKrX6+YtSpldkA2+wJ7xXKJE2/0er6/nGjOtXb
	Tj0YtQMjRALsFvoEVtd5dH0zjlHVe1A/pnQ/y+XGi2BlsxFQ26JXhRVMq4j1DCwTQk8IIW+sfMi
	tKT2M6gp0YkDRsWhEQ5J1ubLFWxsrqADWkToamMxD37BzU/I6cnxynPkIHRThQdo6r8VbDSUiYb
	X843d/PKLJ0mx4HqSI2c5kpGbgiC9IQn7+DIPnHQL0vV9/U8XpkR0csRF6rM54JYClhTpjnePSG
	wqnvY3o2PaGotHo6ISYZPRTJKu3RLP6gvCclIg==
X-Received: by 2002:a05:6871:550:b0:41c:6b77:b7fa with SMTP id
 586e51a60fabf-41cec06f29cmr1656646fac.5.1774631431790; Fri, 27 Mar 2026
 10:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327150707.256752-1-devnexen@gmail.com> <20260327150707.256752-3-devnexen@gmail.com>
 <aca4W1BY4vbqIMnz@zed>
In-Reply-To: <aca4W1BY4vbqIMnz@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 27 Mar 2026 17:10:20 +0000
X-Gm-Features: AQROBzD6nmypbcDz7acc5dBlnxelfIzp3V75SnQufk8XzIihRPDraowBfMoiFMA
Message-ID: <CA+XhMqxxdbS4NaGBCURR3mg7046ZzkcGRHBwk85hvcX1pPP5jg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: mali-c55: fix probe error path skipping pm_runtime_disable()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57288-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DBC4134830D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 at 17:04, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>
> On Fri, Mar 27, 2026 at 03:07:07PM +0000, David Carlier wrote:
> > When mali_c55_media_frameworks_init() fails, the goto target jumps to
> > err_free_context_registers, skipping pm_runtime_disable() despite
> > pm_runtime having already been enabled earlier in the function.
> >
> > Fix this by adding an err_pm_runtime_disable label and redirecting the
> > frameworks init failure to it, so pm_runtime is properly unwound on
> > that error path.
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driv=
ers/media/platform/arm/mali-c55/mali-c55-core.c
> > index 38b11d5ba168..f998f914b355 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -828,7 +828,7 @@ static int mali_c55_probe(struct platform_device *p=
dev)
> >
> >       ret =3D mali_c55_media_frameworks_init(mali_c55);
> >       if (ret)
> > -             goto err_free_context_registers;
> > +             goto err_pm_runtime_disable;
> >
> >       pm_runtime_idle(&pdev->dev);
> >
> > @@ -843,8 +843,8 @@ static int mali_c55_probe(struct platform_device *p=
dev)
> >
> >  err_deinit_media_frameworks:
> >       mali_c55_media_frameworks_deinit(mali_c55);
> > +err_pm_runtime_disable:
>
> Is it necessary to
>
>         pm_runtime_set_suspended(&pdev->dev);
>
> ?
>
> >       pm_runtime_disable(&pdev->dev);
> > -err_free_context_registers:
> >       kfree(mali_c55->context.registers);
> >  err_power_off:
> >       __mali_c55_power_off(mali_c55);
> > --

Hi,

  Good point =E2=80=94 yes, pm_runtime_set_active() is called earlier in
probe, so the error unwind should also call pm_runtime_set_suspended()
to undo it and decrement the
  parent's usage count. Same applies to the remove path.

  I'll send a v4 with that added to both patches 2 and 3.

  Thanks for the review,
  David


> > 2.53.0
> >
> >

