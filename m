Return-Path: <linux-media+bounces-64063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QU5AB9K9JWrULAIAu9opvQ
	(envelope-from <linux-media+bounces-64063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 20:52:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3C9651519
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 20:52:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A6Ba6Y1h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64063-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64063-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 874A33001A75
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 18:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5362EB874;
	Sun,  7 Jun 2026 18:51:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66F1DD9AC
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 18:51:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858313; cv=pass; b=I5oAQOKWVfXjfqN2ivFGlafhyEgnIe1FoSk3OC+qAeNSIBbKXreHuqw6/lSnFS5IotRJbWg4ar1K12YpW+PGYjOAYGhRHlaLBTuXrhYLW4tlHs1t/adZ35X9csMNJ4LCDtLZmoAyEPKERhlo0qPhUGi9mLvztMkijPX3xljbbCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858313; c=relaxed/simple;
	bh=ZcyHQLJI85pjDHXmRbjQbuMcsIzVEH7e6T0oI/ZovMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AoUuFCo8FIaWY28y6e5VP31pY/M/8U82P2tin522epmMJEirscx8IElH3NR6MxgO4A1Jlh1EMqGRNZw+Zir2NePx8pQ6X+sD50AqGH9E+yW2Kt3dqkgNhUDcYudl3zGr+8xmJPybuRntfjKJ/w3EIUNIQilQ5F8bpvvC3Hy2+jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6Ba6Y1h; arc=pass smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso727587366b.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 11:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780858311; cv=none;
        d=google.com; s=arc-20240605;
        b=DmkpJd83/6KuVt2J6ttn6NzlFwSVEVN1i69JZ3WWeniJB3Jbe41cQi3ogc4RiBXCAy
         IUHV1wRWIvXA147R5VhBRVxM0Zwj3xO//fSqU1dxmOA+dRHOKBI8trmpX5bgLwcY+IBb
         9QLc2A/r6M3nYoL+C3RBarChUz0FMUfu9OU41Ogxta7kO2TXKsvkhtwW03e8zNfGOTPL
         +eCaVm3i3udlXKop1CSFusIp2lOQsXMpzQFocsNxu6zrvba2U37voPgEDNIKeeqOyz83
         HKP0e94CBEUB5UX9zBob4Eg42j65RIXo92xm5rj5g+ShRnd/WCif9dccmpvr37I2DPD0
         6tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZcyHQLJI85pjDHXmRbjQbuMcsIzVEH7e6T0oI/ZovMw=;
        fh=rkl6EBWWr4uuOKHkWuPAF9AlpPmAh8Taf7LJO5oOaEM=;
        b=CcNGqejKMJLK89Fyis1SLfxKc8zNGxCpeVa4TO//yMKdCbwI735q03Kk18gkt7HT5L
         CrsmJXwZLQzyGAp7Ig9NKOkZ2QAhntlb6t/uDLao375dEYhcfnv4rRl7gsv9dlwM0u1P
         1EMx+M+OFVdq8thohQOaESc5MknB4QWNWdWGUC6Fx2JMnXZeOPvJPy635jPMTgke/lYU
         ycFwcU79CSpX9w4ZJdhcWO3CLvsd3WXJZgreOlsr5xlelOvtVTqr11NoPmXEHutp8Pq8
         nOdU1/fjSfCViue3xjyVxu6NqcT6qNvl/Hj1yS14xCrLgEU/evvFaaJJbOwpKGUtjOCN
         mMBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780858311; x=1781463111; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcyHQLJI85pjDHXmRbjQbuMcsIzVEH7e6T0oI/ZovMw=;
        b=A6Ba6Y1hHQfDc8nF70DDSzQpsIGDlSQi8EGOcsi/zq4SnqQjC+u08gW/iRKWV4YOOm
         KUESKLniiX9u3ZfxWD+s3E44yBbk4HmdBM/FYtBfug8g74/G6B0OhbvWe5bmQBPG2/JY
         +Z2PkLFC4+GCojozXuFAjCHE77ADplBoBvRlV4R9AejV57rC7/lFbv32eSKGTZaIIrGv
         ll23WjkuH+VxOkT403ocnYN2nDc6UPTRcFfnHMyLBfg1wtee0xVFF9c5vCuLpJM42jf9
         7B0RG4RXR0h0uXn7I6m3JNNtkhFDBVKhmGDC4Pio/BXtoho44TUrPC1s85RlhV1cXbMC
         lX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858311; x=1781463111;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcyHQLJI85pjDHXmRbjQbuMcsIzVEH7e6T0oI/ZovMw=;
        b=V0NaygMNiDygHii8i2bg9Evq+Os6xH0EHtEDBqN5//ssJz23awaF2WdmeB9pdzyldd
         SI4EN/H+CMOttocssQqH8NZaZzDnbtMpzQ/p1NEmxvfnrObRh1ITGzjkOcFDLKtJb9av
         mM4eHJSzYtwQ0jGrhOPio1PE5s/27qn6E6JmI9vBguyJTTCVMNYk9N3Qh+xFTHTtVtiV
         DVHf3Go0t0NrX4fn/vtFpGa6yGJiIAGIBD4VaMMLnddgOqxaBBJg0ErcxsKrYQp+xUm/
         feoNk/ELhhvLBic7uEzyuRRZaDh4lB5ew1uo4j0wE5NzMYZShm32XKZupqGtstw3exF4
         +hUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AlUxG9AsaOB0gs/jOL6ZBnnG/G1NzbxU8vKSFt2v8lI0qB/XGpXZChrtXuIDxWmhsjKhQy9LnBDXwWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ogX5VghSC3QBn007PuSBbaYqJd4S7sDWUYn/q1BLVM/OY7ES
	L1FH7cMy5lPOCppF2Tp1rBQFxfwPApXyKQzVwcFJhJzJaKnq4wZdBDJfRZ/X0iyNFwEFDCkS6Cs
	PlhWEg9bR0rrgl8B0DY0qrc0ZYRNmJYFn9jacUdsysg==
X-Gm-Gg: Acq92OECKOVBzNVLj6wSnxAwo0hQwtfb+rCUUryEtGkhf5pXJQszKYDWyFv53RmWlLS
	T7L+nQQwDNqnNwqGFpqNNkwrQvFENkWwBc6nlDrk2W/tN5KAmzk825IHiOqV7CxowzhgRXaKpkb
	fdscm8IAnM1qKazbFaC0930OCg5KsodYGGI1IWhYCde7m2WNWOGEGVxmpSw/SPaB3pYHUfuyZfj
	Xp43yoDYIlhetplaGXXAIscMhmdMCHQaKzYkQkBXcUUxSlGAVUewDeHZzo3hxDsZzPgq1X+CMrx
	Cf9X5EXP6PqS37eU+qso4zvzd6f1rhrKkjBbBbSMShUjVZwS1JWvtoFHPybzvK4Teu5/G6T12sj
	jqRvUPkX2SH4rfDYZRAS/Vvh+wmbTMwBmGxyL40iyY+WrUHSTdVHVZdrSBtiAgGJhunhTNBQxeC
	FaUb8=
X-Received: by 2002:a17:907:6d11:b0:bec:2d7f:fe03 with SMTP id
 a640c23a62f3a-bf370a65b91mr589791766b.17.1780858310335; Sun, 07 Jun 2026
 11:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606234427.9902-1-linux@notrealandy.dev> <CAHp75Ve_U0RmodQ8FzOXuSs95FwzN0fvBAQ5OX8ZTMp_U1PQsQ@mail.gmail.com>
 <B7B15655-45FE-4538-87A5-9D0926E8A941@notrealandy.dev> <CAHp75VdjTSjqana9kCoE9mL+UkKcu-x_bPHP9asjkm4sWQTKUg@mail.gmail.com>
In-Reply-To: <CAHp75VdjTSjqana9kCoE9mL+UkKcu-x_bPHP9asjkm4sWQTKUg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jun 2026 21:51:14 +0300
X-Gm-Features: AVVi8CfiaZws9EjR6pspfmIxOJ5Ufgs7UefREy09b09_i3Y2xcPACtXNr5gTs7Q
Message-ID: <CAHp75Vf_g-wN2PEEdTZ_W=NMnDd8gnOLU54ZjoV1rkQ_Auun-g@mail.gmail.com>
Subject: Fwd: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
To: Andrew Soto <linux@notrealandy.dev>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Ailus, Sakari" <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64063-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:linux-media@vger.kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D3C9651519

I just noticed you also replied privately, no, please do the
development and communications publicly.

---------- Forwarded message ---------
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, Jun 7, 2026 at 9:48=E2=80=AFPM
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over
kzalloc with multiply
To: <linux@notrealandy.dev>


On Sun, Jun 7, 2026 at 3:27=E2=80=AFPM <linux@notrealandy.dev> wrote:

> Yes, I ran grep across the entire atomisp directory and this was the only=
 instance of a raw multiplication inside a standard kzalloc() call. The oth=
er files already use kzalloc_obj().

https://elixir.bootlin.com/linux/v7.1-rc6/source/drivers/staging/media/atom=
isp/pci/sh_css_params.c#L4209
In the same file...
And maybe more, please try again. I suggest using coccinelle to find
all the places like this.

> I have submitted PATCH V2 with the commit message lines wrapping under 72=
 characters.

You also have to reply wrapping the lines accordingly and do not top-post!

> > On Jun 7, 2026, at 9:42=E2=80=AFAM, Andy Shevchenko <andy.shevchenko@gm=
ail.com> wrote:
> > On Sun, Jun 7, 2026 at 2:45=E2=80=AFAM Andrew Soto <linux@notrealandy.d=
ev> wrote:
> >>
> >> Optimize memory allocation layout in sh_css_params.c by replacing the =
raw multiplication inside kzalloc() with a type-safe kcalloc() array alloca=
tion wrapper.
> >>
> >> This prevents potential integer overflow vulnerabilities by validating=
 the array size calculations before interacting with the kernel heap alloca=
tor, aligning the driver with modern kernel memory allocation standards.
> >
> > Wrap the commit message around 72 characters per line.

...

> > Is this the only case like this in the entire driver?

--=20
With Best Regards,
Andy Shevchenko

