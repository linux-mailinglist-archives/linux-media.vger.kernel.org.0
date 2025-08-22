Return-Path: <linux-media+bounces-40787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A88BCB31E69
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0271898DD0
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4310523D7D4;
	Fri, 22 Aug 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW/2WUY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E020B7EC;
	Fri, 22 Aug 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755876005; cv=none; b=CpteShWfDGg87DmcXzalq3AOaixNI4kByeTidg0yhm8WQOeAXa4o7F+I2Lsa2pkRW4JMyTbYdA5hTk+mirJ1owBjTM5s8+pJYBAjn6fs7m6Cjbw1AySc++H8V/8FLa87yqKMw6EXhx7nsygiRpHHAcqAhHPCXjzeLwdJi8mWqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755876005; c=relaxed/simple;
	bh=JOL3FpNcW7XVkfaKqRUbAJhlY/J+/ntD61UHF/LtcUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqBKLLoa+qITtpvtlMhGqh9RnRUJyjE48Vvmho4xciMlAA/TBopF44MEhRwETHOKzufJp7yn2mEzHPgwHYsVZXIUEojtmkZ504cWzPxJ1IC4ZXOxskiV4NIAYA9wCCXzR1pZxTZdvJWu98PA2vT06YhmDnc61knQ3JvoXVh5d1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW/2WUY4; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70ba7aa131fso26711866d6.2;
        Fri, 22 Aug 2025 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755876002; x=1756480802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg4VQPMYGnpIz2eC4DVED3WvrWoEWvClGsj9KQ0QyuQ=;
        b=YW/2WUY4ye1VO706src3Asnl8xBCOA8uZRY3355fDU4xo6Q261uVBwj5G+ObUDeS2G
         di+7wbFXp4REH31MwblD7rebxcLaA/uty6X7EKKejpSaaoRVSO5Y2SEwjufLAy3eihB3
         xsvGaV47IB7yz1hsCciLvUiRfgSw2bf7Wt4gP87HjeliUxUBY35OqWonkzhy60lNhcEu
         R+DvdtW/XHBzaEIF96SzLTR/P1jLBLSPm/VG6wZHj4Z1Bw9sEj3Cpb1lyrt18wuqCej4
         Vm2BpkJhz6tEqy4aGjtQqwLeV02osHuyR/JIyTjQoa4ALoglGOgXDnZmez2dLmcczlkx
         CGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755876002; x=1756480802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg4VQPMYGnpIz2eC4DVED3WvrWoEWvClGsj9KQ0QyuQ=;
        b=vK9xDnSwQ9iMfmLJ7+zFDi7XN6hszajseI2qIK7T3NwlmNUqPFWfwDpZerz7UuaxXt
         MuP1Zl/U14/nH8LiJzGCxQ5AZUnTVzw64DbkVfNilmPCaDl3hWPAAoqZuhg/5fUZ1jWN
         N+n1GeZgrdf5RYnyHphXbhDmGBCbSZPkusTCVMs6+9uodgn3YTeavgZXX6Ru778IcarV
         Pkj8+L//22w3xZo+Hf0RYaJ3Sr7CdeqPIid3os2ZhOmj19izwF1xmf1MgYgJ7JiWW+LH
         6sdsbz49bZ+FGKsbtps/gHz2xETYP+on1KNvEGyXAOa6nKKKcQdkrYWvG0fAQTqXrvVs
         5V3w==
X-Forwarded-Encrypted: i=1; AJvYcCWiMa857Xk+1qJRlB37HbVkb5JcaEPOq6A3GlOV38UoCOxRQhtEoCft6W0f3eY6usgRELwKEUbmYfynsvA=@vger.kernel.org, AJvYcCXg0F+mH4pECnHkJFbIZPAwdfqZNrgHFNA5/IpmLEnj1Kvalxw25fCJSB8p4Wg9yo04+nIgd/DRiHGKAAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+im9ynlkSkLAllvlg4RmwUlxIq/H9C+peHQBnHV04tToeOJ4
	7ognRoesR8u6F84HRLUdofVGQX7HhDjrcmtwKJNiHqrdZPH4FE0yUSZHVnVhxoca9qR4+HVW4ZA
	Z4pFB5Il45apPWI2YiOymvnU9QDUzYeU=
X-Gm-Gg: ASbGnctiVHGMemeLxq/wfYHdmLQGnnY1LkwRG775pAh9ChiufbZkpgMm4RGGTQPyVNQ
	MKBPaYCyaKVCZkNXOTvA5of/K/mBaAM8S8Xvk+ROoy1YxRt+Vitm314Db1SQQI8A0Zk/tHl1ub8
	JOx5oA5Id80xviRrch6vgc7TE+PA1rK/1CGBgVd+F32R6uvtOT46yCX+gKAZmbsK4hl+3L0kI4a
	sMvFU6ClA==
X-Google-Smtp-Source: AGHT+IGBu+vkrLjqW0pAir920usKcMTOQd8uGzahofHowT4Tnjo3YnmqhFKwCUt3kfJ7vGhFgxgmK/+hkj0IrYp8YpA=
X-Received: by 2002:a05:6214:2466:b0:70d:924c:324e with SMTP id
 6a1803df08f44-70d970b28b8mr39600846d6.14.1755876002073; Fri, 22 Aug 2025
 08:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822065849.1145572-1-aha310510@gmail.com> <7FD2157E-6F0B-40E0-9984-7485845DAC51@gmail.com>
In-Reply-To: <7FD2157E-6F0B-40E0-9984-7485845DAC51@gmail.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 23 Aug 2025 00:19:57 +0900
X-Gm-Features: Ac12FXzJddLAYvULbOo4Rc_RE78LsHEgNPs4nfYYPQavtL_lbzpS-9tkQMZhpbM
Message-ID: <CAO9qdTH=7qdR2KGQiAeKu11g8T9pPjYN0zjarLGGW_EPQ_nZ3w@mail.gmail.com>
Subject: Re: [PATCH] media: vidtv: fix to initialize local pointers upon
 transfer of memory ownership
To: Daniel Almeida <dwlsalmeida@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,


Daniel Almeida <dwlsalmeida@gmail.com> wrote:
>
> Hi Jeongjun,
>
> > On 22 Aug 2025, at 03:58, Jeongjun Park <aha310510@gmail.com> wrote:
> >
> > vidtv_channel_si_init() transfers ownership of each object to the corre=
ct
> > table through functions such as vidtv_psi_*_assign().
> >
> > However, since it does not set the local pointer to NULL afterwards, if=
 it
> > fails for various reasons and jumps to a place such as free_*it, memory
> > that was freed in vidtv_psi_*_table_destroy() will be accessed and free=
d
> > again, resulting in use-after-free and double-free vuln.
>
> I get what you=E2=80=99re trying to say, but what you actually wrote is h=
ard to
> parse, can you improve the wording here?

Oops, I think I made the explanation difficult to understand and confusing.
I'll try to rewrite it so it's as easy to understand as possible.

>
> >
> > Therefore, local pointers that have completed ownership transfer must b=
e
> > initialized to NULL to prevent re-access to already freed memory.
> >
> > Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D1d9c0edea5907af239e0
> > Fixes: 3be8037960bc ("media: vidtv: add error checks")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers=
/media/test-drivers/vidtv/vidtv_channel.c
> > index f3023e91b3eb..3541155c6fc6 100644
> > --- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
> > +++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> > @@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
> >
> > /* assemble all programs and assign to PAT */
> > vidtv_psi_pat_program_assign(m->si.pat, programs);
> > + programs =3D NULL;
> >
> > /* assemble all services and assign to SDT */
> > vidtv_psi_sdt_service_assign(m->si.sdt, services);
> > + services =3D NULL;
> >
> > /* assemble all events and assign to EIT */
> > vidtv_psi_eit_event_assign(m->si.eit, events);
> > + events =3D NULL;
> >
> > m->si.pmt_secs =3D vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pa=
t,
> >     m->pcr_pid);
> > --
>
> The patch itself is ok, thanks a lot, however:
>
> > media: vidtv: fix to initialize local pointers upon transfer of memory =
ownership
>
> Can you please use imperative voice here? i.e.:
>
> "media: vidtv: initialize local pointers upon transfer of memory ownershi=
p=E2=80=9D

If I do that, the patch subject will change. Should I just change the
subject and send it to you, or should I also send it with the v2 tag
included?

>
> =E2=80=94 Daniel

Regards,
Jeongjun Park

