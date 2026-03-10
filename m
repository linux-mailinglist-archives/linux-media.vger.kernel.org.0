Return-Path: <linux-media+bounces-55075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLctIITsr2nkdAIAu9opvQ
	(envelope-from <linux-media+bounces-55075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:03:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89C249046
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C02C3072471
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DEE42B733;
	Tue, 10 Mar 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2UxfeozA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FF40B6F2
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136658; cv=pass; b=JdgpQs9UwlkQUqaUGkM0ViUbobJFMtughbBeDlXNQ5Dfw9eyF1jJUwme/rGr5FgpT4DlFU5QAuhyS9VPst1W8ARhPOBIgnkeef238wmLPjjDtbPaTBzvocFqsofq3FTC69qXlN2ejIBn1d1w9Wl8xoC0m5oeb1oC6rLTK6hitnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136658; c=relaxed/simple;
	bh=g++kyQc0yGPZrvRZ8688KVjPzzrfFlPc7qeEgTFaAdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMWSHwFXxwFZMX7s7pGjOiHPcaQvk/qc2JwCSHSd4ljJgiR5BJZEXgm760Y/ekVA5UulWMPVaQqBx0PEpNGEUcYQU3ee4413CgA2rs3tnNH0NLiRbuXfbAnTAw8y6U1Eh/UJkZIbYV6YqAQrTW5jeWU5ms4gZim9aCbPboiP3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2UxfeozA; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so4303984f8f.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773136655; cv=none;
        d=google.com; s=arc-20240605;
        b=jvYCSGJsQQrjQQA4ObqB9TE3kRwxtk1szt7y5MNEpe+PoQ6OdKeQLDGcDfBwUtZz4J
         OYTZndBxJv9o1AINGjZWOeacRVcf8lSst0KzF48fmt1DYad+Pz367Id08FoSBxRGyfAm
         Zz/UFHUr8H8z1JNJllHQVXo654IUTLivMXNQGBjx0zRxsXaz/R86lPcpKLMaTRjE8OTC
         O3EGRUT9Ri3tBafLs+ChxZxhNJBGKZP9bRg17kw7Ek6tUIvv1t6JR+5dRM21aBTVfp28
         oQy01rZ0ZwyHWNEaG5eG498JmV44KAulKAiRrEwIryiDFpz3Zqc9t+8/bNz7Yvd7ivHy
         i+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imuiYNJPY0bDHZSHwt5D14aV4XPeY5B4dzHeVoTNbvc=;
        fh=w/h67jaKqmz0fv2ZAEfFuFua66LO76lD/LDzeSo88Vc=;
        b=IZyQ17sRT7IOzIBn+s3rPmnu3wYlQLjT/cRDT+O5f/NS8tXaeIbuP5nZjAuauJq9Ec
         wpaIgSeN1kLTqvl7dfE8L/HiIDqRO7Aa95FmE4TCt1+n6VnFasaSkq6BteMjYldoAmjo
         VKg0VdDBcGOAvtt1ayZWylYNrmCVqP6dVP3qCopy16iMVSXJodmNpsWTaASIAx5hEsIo
         Tvz11z6hpoZLy5RG+ID+nhWNRWTzAqWaOfDUyIxspSqqf/l2/8MLwPggtcH7Rd1CVgYH
         PFycDxsOGU6Ta47wn+P2gzxjT5AY4vwEQeu8dufk2lIYtm1RvliiQ69gQYB5toNqGh6O
         MApA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773136655; x=1773741455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imuiYNJPY0bDHZSHwt5D14aV4XPeY5B4dzHeVoTNbvc=;
        b=2UxfeozAd4RIO9MHg/VTA+YqeBquWszCWZbX98W+3tovI0ECRRgH+4reg4M+LH7+ME
         Nuga2vZhPsLKrsIT3QGU4rAzBmT12mWO+ilrjkIOUtRKJGdBxVStMgxhoFhRItGIM3MC
         fAVhbQ1VJcujjj+BzsEsnj84sVmblerU8gij4/atlyU5aiErQ006QYAS2a5yNLoGbhXB
         YPLQLtsIH3Cy3UjSgyBQ8c2Kz+Pbaz5pSLEPKBUtjdVzWQIgImUvqzkK3VwFbmIUX+FL
         NzaXRj0cp3jD1/+STzbpFictkDTI6KpKTNle4PpRz1YH32xkiKo8LXTolIZGxToAk4fW
         C9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136655; x=1773741455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imuiYNJPY0bDHZSHwt5D14aV4XPeY5B4dzHeVoTNbvc=;
        b=RB2IoVXnsfW15rKVnd3J/pJb10Kr+gKknPsciTjUYT6hT5hSrgA+XVNccAwrWj3/M9
         E7acGVLGsQSS/6xzAy86LVL4IxY+Ii49NMVWrtfw5nIt3ut4C5waX5bnV/1WKK5ZT5f4
         1zGQ+9dG0ea7/OuVAAuDBhRZkGniWNPbFQoYz1seHTegRSFgKabtmFAdCD4hHYjosH6o
         VLVS7Z93GQZRhkktFnlpr9S0IffXjUokUAWsdJNxyT+albgfR1yCK1gNyTXnWBdlwOfr
         cGqAmaOC/T1KPMg99jpqXWRtqclLttHvZ0EcGZlpQPeUn7/sA2VzXOOPqdeSwzcxtAHW
         CS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDJkko3gCZaVDsy2cQIQeI3CUBU/+eRTnTxhLjrHGrli5af4NJatGA+RWfNr+5hqFk/Uom3vwNIIkjNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydbSkR8yRQJfSNHgrejFBdrIZ6T5lzOae+OI91KwcMNHBZFbIa
	UaNWz1P5jr0VpRAdIG+sEM4/iYlG+cPYjiLFYxAIFiriF5cCuzG4KsykIzpM5NZUiZSOUJrS69t
	eanYlP75SCWwO9r0kWXGLZ6mxzX5RWoBAmgmjmKlm7iGHOxqX61nIQ+iE
X-Gm-Gg: ATEYQzwK2dsGi7v0M9cxiLq+daCtFAx8M92t5FZ3UtHf5Kytv3aoynR6esY8N4z4YZx
	6pyKtIzfOA1GcQNzaMPqjH4OV1iRpgsOGT6ycePa7JfATLD0jfjAA4t4vixhKH+SxBp2DQDQhRD
	RPYZVzHcRvPyPO8A89H76ySjh5l4aCxqGaOSNRY+nWWiNPTmPdIqQfq4D/+yyP3laUVHRVEsO6q
	O67U/frGtWXtKVcfDyqluEO4mkKTJfw/teDtI/25wBQr1qnLrmgaLYZqHCeldDXMo/cEx6Cd6D2
	Gdf2urnnPK0d3YHYTF5/rjglYtVudx60fusp
X-Received: by 2002:a05:600c:4445:b0:483:79ad:f3b9 with SMTP id
 5b1f17b1804b1-48526979bffmr216012195e9.28.1773136655161; Tue, 10 Mar 2026
 02:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <69a696be.050a0220.21ae90.0009.GAE@google.com> <76fe124bc112126324d7ed05188518cef7223609.camel@ndufresne.ca>
In-Reply-To: <76fe124bc112126324d7ed05188518cef7223609.camel@ndufresne.ca>
From: Pimyn Girgis <pimyn@google.com>
Date: Tue, 10 Mar 2026 10:57:24 +0100
X-Gm-Features: AaiRm52SnIaztzz2xeTP6kHhRMXHppVx_mK5FYqbC8iW-cR61TfIG0DIZpZLWsM
Message-ID: <CAJWNTGzfrwXeH-xVpH8vznZsio0v3_UVAGGn4LyeR3DeOpYYhA@mail.gmail.com>
Subject: Re: [syzbot] Monthly media report (Mar 2026)
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: syzbot <syzbot+list844890cacd1fd70d3d36@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DA89C249046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55075-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pimyn@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-media,list844890cacd1fd70d3d36];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REDIRECTOR_URL(0.00)[goo.gl];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,syzkaller.appspot.com:url,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 5:17=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
>
> Hi,
Hi Nicolas!
>
> Le mardi 03 mars 2026 =C3=A0 00:07 -0800, syzbot a =C3=A9crit :
> > Hello media maintainers/developers,
> >
> > This is a 31-day syzbot report for the media subsystem.
> > All related reports/information can be found at:
> > https://syzkaller.appspot.com/upstream/s/media
> >
> > During the period, 8 new issues were detected and 1 were fixed.
> > In total, 32 issues are still open and 103 have already been fixed.
> >
> > Some of the still happening issues:
> >
> > Ref  Crashes Repro Title
> > <1>  2684    Yes   KASAN: slab-use-after-free Read in dvb_device_open
> >                    https://syzkaller.appspot.com/bug?extid=3D1eb177ecc3=
943b883f0a
> > <2>  451     Yes   KASAN: slab-use-after-free Read in em28xx_release_re=
sources
> >                    https://syzkaller.appspot.com/bug?extid=3D16062f26c6=
480975e5ed
> > <3>  340     Yes   KMSAN: uninit-value in dvbdmx_release_ts_feed
> >                    https://syzkaller.appspot.com/bug?extid=3D01d4620886=
bee3db0e74
> > <4>  137     No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane=
_buffer (4)
> >                    https://syzkaller.appspot.com/bug?extid=3Ddac8f5eaa4=
6837e97b89
>
> I'm quite new to this initiative, but I work with a few other initiative =
in
> other project. What is the process for relevant maintainer to gain access=
 to the
> reproducing code ? Specifically this issue has been looked at by Hans, bu=
t he
> never figured out what the robot found and could reproduce.
Unfortunately, not all issues are easily reproducible. This specific
issue seems to be one of those.
In other cases, the reproducers are available in one or two forms:
1. Syz reproducers (written in Syzkaller DSL)
2. C reproducers
A Syz reproducer is a prerequisite for a C reproducer, so you will
never only find a C reproducer.

The bug right above it:
https://syzkaller.appspot.com/bug?extid=3D01d4620886bee3db0e74 seems to
have reproducers.
If you scroll down on the bug page, you can see the `Crashes` table,
which contains all the relevant information.
Please see here for instructions on how to reproduce bugs using the
assets: https://github.com/google/syzkaller/blob/master/docs/syzbot_assets.=
md
Here if you don't want to use the assets:
https://github.com/google/syzkaller/blob/master/docs/reproducing_crashes.md
And here for information about Syzkaller DSL
https://github.com/google/syzkaller/blob/master/docs/program_syntax.md

Please let us know if you have any more questions :)


>
> With ZDI and other initiative, we have private back channel, and they pro=
vide C
> code so we can go straight into fixing and validating.
>
> cheers,
> Nicolas
>
> > <5>  124     Yes   general protection fault in dvb_usbv2_generic_write
> >                    https://syzkaller.appspot.com/bug?extid=3Df9f5333782=
a854509322
> > <6>  120     No    KASAN: slab-use-after-free Write in as102_release (2=
)
> >                    https://syzkaller.appspot.com/bug?extid=3D47321e8fd5=
a4c84088db
> > <7>  111     Yes   general protection fault in vidtv_psi_desc_assign
> >                    https://syzkaller.appspot.com/bug?extid=3D1f5bcc7c91=
9ec578777a
> > <8>  34      No    general protection fault in vidtv_psi_ts_psi_write_i=
nto
> >                    https://syzkaller.appspot.com/bug?extid=3D814c351d09=
4f4f1a1b86
> > <9>  11      Yes   BUG: corrupted list in az6007_i2c_xfer
> >                    https://syzkaller.appspot.com/bug?extid=3D0192952caa=
411a3be209
> > <10> 4       Yes   KASAN: slab-use-after-free Read in v4l2_release (2)
> >                    https://syzkaller.appspot.com/bug?extid=3Da658d41cf8=
564471775e
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > To disable reminders for individual bugs, reply with the following comm=
and:
> > #syz set <Ref> no-reminders
> >
> > To change bug's subsystems, reply with:
> > #syz set <Ref> subsystems: new-subsystem
> >
> > You may send multiple commands in a single email message.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/76fe124bc112126324d7ed05188518cef7223609.camel%40ndufresne.ca.

