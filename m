Return-Path: <linux-media+bounces-57264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNydEDOcxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:03:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7833466FB
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42B443011756
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4C6246BA7;
	Fri, 27 Mar 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVq5TXBR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB51C862D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623695; cv=pass; b=bkjhGjiqXwJTkG+j+GaCTQVIKqz7AyhKyKqgmeQfcBivCzvrXAFH/SWKrab6lIvsaqU7fYgzJwSDVQ/ni0MANLNnAYVCqLYqWQjBPeXx/XC7PxbmgxI2tUHv+Bipg9i3lH0hO9e4k4eM1WMi9VPkCxcFgSxWZSz+0eUFtJB4W94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623695; c=relaxed/simple;
	bh=Xy5va9aRunm7Gxr2CYAyg1Jp+127RNdLqn6HJfyqZcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKxKidE0FMXiO42mJMizG2Pk4yF6GFFlHu6FN/7K/My8cZJlwFPBXTveAvxpRxEMFeu5SO5JwTKAZnDdFpEivPtSX5RLhmpSwkTdgp3WQSX66rs7KUxSdyspl34NSy2G52HuBC2bk3q7v7ww9pw1L86A8PUtUwO8l+FaBb7a4mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVq5TXBR; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40f0e14b9f9so1533089fac.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774623693; cv=none;
        d=google.com; s=arc-20240605;
        b=XK8h8QesQGw5PTx2m7LVa1pOahFGar1yWOF7WLFXkF+MCq22DQvVPn4AOhoYNeViob
         dPFR4lxy2VGarjockWoZMDDGICVg7188RgGWj1yk0WdG+VOvx14KWQ4SIT4fMr+rydje
         hKAAehD6j57/TMUjad+45PeO/I/trrEencu+rFWpLjl3sU41T0Y0grJR407JyoeE5zqu
         E4mXL6BYWggETu7OU6YtS6dolNV5y3TXbengvZA/mAJHJfdgqO3JEeW6VOtWrRC6QzAT
         yZYhVpZeSzxFdMqARdsl2zQ6zbroPj9lu3IWZV55cTH+8yZ2nQviTPOjtfh8Sovm7UeA
         Rnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oGc+URrPr4MNm9zkatzl1INmw3zMmNzu3aegNs1QZUs=;
        fh=RZ9+3pumSNXDctAnbfWXzWo1W8i99y8DaiZx5P95JuM=;
        b=fuP4bModeDble5yB6rZ9o1TVHYsFPQbWTlEy+DlWnCRyHlcx4n0EvlMUezXMxM8dfC
         nTHLVEusUtFtZuwDvArkxlma7s5bXOesdgJpb1P3LC0FQ6epxeMz0aYQVht+sHIEfND/
         VawdD2Wvv9jVBt9F/s0HFIImwRglkcrfcLuhHfQtz+npYxeQvWEQuhuXnNFw1irRiIqP
         v/Eub6Bm4UK10OEu86xNtdodej8w4iOqphqYd3ybv9Kb35Q6ro+S0i/LJ1IY+hqYK6/m
         N/PPXgqp3f2cjs0Up4CDfaAF5ItmUfu39hG+KmwSQReY96IUpdJmHXS5ZU0KHvJnqWrW
         S8tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774623693; x=1775228493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGc+URrPr4MNm9zkatzl1INmw3zMmNzu3aegNs1QZUs=;
        b=ZVq5TXBRv8lOBIQBLL5T0n4MT9lW0byK8yoFCI+lt9EZ8PcTPMK5NYDMED8oly+fRN
         4lMqLBZ67k683tfB+DQE1NoigI/jFtjRGQX6Pyvxwy5ebWwgdi0WO/K0jyzGWK/rcYK9
         HfAorbAaa1i1HrmRb3PBEcs5s+MtROMtDbRi7fA2nJWrad0DOwjemByJaImqCXDhwpfU
         G+nxzduRlTdFIBjEiOQ8b9Cg7IITonUARqSVutOpJsDd9Ai352foB29SWO4PwSMjx89V
         pcGmi0ams2bfHxJY65lQf3Ce40NURbodOFslmEuV+VWXR2VUpXQudjymHiW3aJsYS9q7
         7vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774623693; x=1775228493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oGc+URrPr4MNm9zkatzl1INmw3zMmNzu3aegNs1QZUs=;
        b=tBaiF6kmJ2f20jFWKmliPkbIDKcyfN8wbLow7D8DGj2bE+EL8tJO7fU2Nsn8upylfI
         hYaqev7l7EPpcQOBl4D8djwcCL+KoVfc+XFdhOkKtCfazwPPnUmA9W45df+5j7DkRPiQ
         TW8flpGSt8R+IBhWtwHJiVeJ64FyQBaCt9mMiulSq4s0uNVNRHuIRlmx49lRIqbN9cRH
         cBxvOQ2zaqnW/QaJIBwWgw5Q8NMQa7Y0EcOhUSJYd8ERYQb4kuL32LmEsvLc8P9PyYT+
         KCFzo5Fzn2khPtxmauXRnlhqdPYs3ult7rCf7+UOmNGqpVNe+bb/4k8rpyCIyc2IQjGK
         orOA==
X-Forwarded-Encrypted: i=1; AJvYcCW2tOvP5xIpoJ6M9miISQ+h8DqR0E4eP1tVUB+cbB/aLee/WLz0+m+GUm6HjOY/w57ACDUZMluSImpOgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItLhq8AKUow5fgGZtv0ioaZC/A+kUioquR9I3KOLU1Z27u6Uw
	zbSpYyYRQVum0uKOYu7OJhfmzitd7RHf/d+hfaJEu9mcSiUeTCjyqQXL4RrkDBElA4Ww4sKNBZE
	Q3vH1o/QnJ/PMkSk8PlxA2Byo2AeJQiVdINusmqo=
X-Gm-Gg: ATEYQzwPcseFUIcTvVIWJU2J8UgEbQhJoc6q/w8ojOzW32p1ghp8r0U7mB+ts2Xapga
	nO4gfQ10jbMY4C4ywAOkHvSgtPHMLkWyvfUwC6o8RVPY7cIb1lQJAtyAbooEq0Yn25ldZl7nBoD
	E+HjAsW75kik6M1LuumyganGPLJFxhQ2q4Qap0XOTcjnrm8MCMk1f/aEFsm3lJZRF7Lw4vsstc8
	ytRWkyl2qjIx1qn728l7LAFr51+N3EvG+bUUeAW/IDLdZOTHERAhwRv+Sf838Na3W/vypujZuO3
	6oAsKQoPO6e6hqw+t2X5VbBBhz207CEr6BQR2Q==
X-Received: by 2002:a05:6871:4186:b0:3f4:fed5:d88b with SMTP id
 586e51a60fabf-41cec3ba37fmr1423438fac.35.1774623691697; Fri, 27 Mar 2026
 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326190052.11780-1-devnexen@gmail.com> <20260326203339.35852-1-devnexen@gmail.com>
 <acZH-gbQsp6zl0lQ@zed>
In-Reply-To: <acZH-gbQsp6zl0lQ@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 27 Mar 2026 15:01:20 +0000
X-Gm-Features: AQROBzBJansAVcknxazdLGqJWHrEwX5ZLh312W_xpzH3oRd0BFcOpHvLuHwn24U
Message-ID: <CA+XhMqzEc5G=iWZf6c7gvN1=Cp==QpE2DFO2vEseqQC98J+0xg@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: fix resource leaks in probe and remove
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57264-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8A7833466FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Fri, 27 Mar 2026 at 13:51, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hello David
>
>    first of all, there are two version of this patch, one sent in
> response the the other. Which one should I look at ?
>
> If you intended to send a v2, mark it as v2 (depending on the tooling
> you use either let b4 handle it or use -vX switch to
> git-format-patches) and send it out -not- in reply to the first
> version.
>
> On Thu, Mar 26, 2026 at 08:33:39PM +0000, David Carlier wrote:
> > mali_c55_probe() calls of_reserved_mem_device_init() to associate
> > reserved memory regions with the device. This function allocates a
> > struct rmem_assigned_device and adds it to a global linked list, which
> > must be explicitly released via of_reserved_mem_device_release() =E2=80=
=94 there
> > is no devm variant of this API.
> >
> > However, neither the probe error paths nor mali_c55_remove() called
> > of_reserved_mem_device_release(). Any probe failure after the
> > of_reserved_mem_device_init() call, as well as every normal device
> > removal, leaked the reserved memory association on the global list.
>
> Thanks! The of_reserved_mem_device_ APIs documentation is -horrible-.
>
> It tells you what the functions do but not how the API should be
> used. I can only resort of the fact that a _release() should
> logically follow an _init()...
>
> >
> > Additionally, pm_runtime_enable() called during probe was never undone
> > in mali_c55_remove(), leaving the device's runtime PM state enabled
>
> Ok, but this is a separate patch
>
> > after the driver is unbound. The probe error path had a related issue:
> > when mali_c55_media_frameworks_init() failed, the goto target jumped
> > directly to err_free_context_registers, skipping pm_runtime_disable()
> > despite pm_runtime having already been enabled earlier in the function.
>
> Ups, yes.
>
> A separate patch as well please.
>
> >
> > Fix these issues by:
> >  - Adding an err_release_mem label at the end of the error chain so all
> >    post-init failure paths release the reserved memory association.
> >  - Splitting pm_runtime_disable() into its own err_runtime_disable labe=
l
> >    so the media frameworks init failure correctly unwinds it.
> >  - Adding of_reserved_mem_device_release() and pm_runtime_disable() to
> >    mali_c55_remove(), with the teardown order mirroring probe in
> >    reverse.
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  .../media/platform/arm/mali-c55/mali-c55-core.c  | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driv=
ers/media/platform/arm/mali-c55/mali-c55-core.c
> > index c1a562cd214e..de895b69d786 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *=
pdev)
> >       vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> >
> >       ret =3D __mali_c55_power_on(mali_c55);
> > -     if (ret)
> > -             return dev_err_probe(dev, ret, "failed to power on\n");
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "failed to power on\n");
> > +             goto err_release_mem;
> > +     }
> >
> >       ret =3D mali_c55_check_hwcfg(mali_c55);
> >       if (ret)
> > @@ -826,7 +828,7 @@ static int mali_c55_probe(struct platform_device *p=
dev)
> >
> >       ret =3D mali_c55_media_frameworks_init(mali_c55);
> >       if (ret)
> > -             goto err_free_context_registers;
> > +             goto err_runtime_disable;
> >
> >       pm_runtime_idle(&pdev->dev);
> >
> > @@ -841,11 +843,13 @@ static int mali_c55_probe(struct platform_device =
*pdev)
> >
> >  err_deinit_media_frameworks:
> >       mali_c55_media_frameworks_deinit(mali_c55);
> > +err_runtime_disable:
>
> maybe err_pm_runtime_disable
>
> >       pm_runtime_disable(&pdev->dev);
> > -err_free_context_registers:
> >       kfree(mali_c55->context.registers);
> >  err_power_off:
> >       __mali_c55_power_off(mali_c55);
> > +err_release_mem:
> > +     of_reserved_mem_device_release(dev);
> >
> >       return ret;
> >  }
> > @@ -854,8 +858,10 @@ static void mali_c55_remove(struct platform_device=
 *pdev)
> >  {
> >       struct mali_c55 *mali_c55 =3D platform_get_drvdata(pdev);
> >
> > -     kfree(mali_c55->context.registers);
> >       mali_c55_media_frameworks_deinit(mali_c55);
> > +     pm_runtime_disable(&pdev->dev);
> > +     kfree(mali_c55->context.registers);
> > +     of_reserved_mem_device_release(&pdev->dev);
>
> This patched prompted me to looking into module load/unload more
> closely and indeed there are more things to fix on top.
>
> If you split this patch in three I'll take them in and work on top of
> them. Would this work ?


Ok I m going to split no problems. Cheers.
>
> Thanks
>   j
>
> >  }
> >
> >  static const struct of_device_id mali_c55_of_match[] =3D {
> > --
> > 2.53.0
> >
> >

