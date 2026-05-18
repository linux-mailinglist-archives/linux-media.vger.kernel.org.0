Return-Path: <linux-media+bounces-62058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNgwGwGnC2qwKgUAu9opvQ
	(envelope-from <linux-media+bounces-62058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:55:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE3575450
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 01:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DAD23036433
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 23:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F2D33AD8A;
	Mon, 18 May 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQGks2Bj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8F31E85C
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148261; cv=pass; b=K8Tk+Xf+WEkRlIHF6r2+RT/8xqZxf2LUzQAB/SK+SNjRb/c26S3nsnprm3y7j3j+AK0h43jn3OG0uqzWM1gJafqV+urJk1E/iSXN++sNTenfxk2AZ9PWYsaJ5YarucI+uZGKK7xN5KxCBZ+V4KNu30DgTyPPBtyjKkTV4K8GlfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148261; c=relaxed/simple;
	bh=AvdG+i+gFy3l+HsU7nMuJE76u5FmSMHTxUGFJaHz9fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzzCw67kBR0kKPniXgwmHs5qMSeEkiyzlAGEBgGI7dIGYuaV3lmiViYPqLL6u00QnSoZCi1VlVk3r6XRmZmZuQA8WK7jEZIefJrKqpoxy7uO/DVsvWo3Bi/XM+nxD7DcyvwkAoBzXeBvHEwsRYiRYXAGl5JgEFnq6hf7zkMFBfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQGks2Bj; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bdc947aaa3so21863447b3.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779148259; cv=none;
        d=google.com; s=arc-20240605;
        b=cFcfETiQ9PawqEqTUU6k2eLoc8DPa1x2BmcA4BQbUNmMX2nTc5YpCVaU8rPVU0TBSH
         fqTlWl0QD8f70RdJlyYwnmvJQAocn7iDknaRmyvrbYjgouf855RE30dNSpSaQbw2CI36
         cYZ2kWpPhMRao2l3doRb/ZvSiWD14Xm8U9H4/6upLsRAWfB7AH65sdmg6NAd3RHebV5K
         wewrBxwyRfgllx2dLTZgMzLTJ32fWJi1c+lQsOGHPyU/JPE8fRisFX81DC31qGDlPhgW
         b+y7a0fRMSzvitQt+eXgus9nXLNwUG5d5D5ukllBZlO84IgARV6z07gLEhYyJcOvqjbF
         7/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IeeTUYaRZ5BMifrp/CORM7G6Oak23mAzpXgU06USVUU=;
        fh=By8Z7emJwpkv512hXKtppgmvpvJM8MZqdSLSLno9thg=;
        b=ABXJINvcTNlzyf78QhQ+UiESlZ1kM5Px08P4ucGKhNFu5ysmC3GzgNOZGAPhbeqehS
         PLA14a7cTxGKJK7qRfrFS4FGP1cBlHcNrwNJWxDz5HmnWfXmLFWD1e/uxtw5QPky4J2M
         r8UER3fjgwXWlvrwqJDJuB7O7icDjYJ4IRh4R/R8I8W7VTq6VNWqhBQHvVCpB8MInYQk
         FyXH2s0OXaPHJBkff3QFBqzUBfc8o1qAvFqkGXGdUpdjzNeKtorpoET84oQuWlZJG0Xd
         LRRVjMuJAuF+C2TCqZTgXGEsAOQz6ctBU+bSiviwXHXPmC+o4eJiDfrerCwHUi5wLPad
         7hUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148259; x=1779753059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeeTUYaRZ5BMifrp/CORM7G6Oak23mAzpXgU06USVUU=;
        b=PQGks2BjMJ75Jdi9JhYKRz8Ave4KFA+XY47tOYyhr4fNmFNwgMCVlYDBus2Ajkec97
         5vmxFGJcON9f0N2LujMTzRbNlNA/l4NEQrC0aooQheq1MDjpKBuUcjKDS4K82X5dOkW9
         XSkTgwy+Cxh2FNfriLGZjPmNpgboRU1i24PJTOI2qzZLcuZOwv7LGyCbCv45vJ3775sm
         Gr++APfz538Tdu2e57kbkH+PxsgvYmqOhh4nf4MLUg+lCdivJEwqKZHOwLxNfGJUtX5z
         VgxgT8XPwGgU264XrS+O1ET6bckAC6RON301jx/4C/ExSDijKBAI2fgrSZuuIjVZkjb7
         nYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148259; x=1779753059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IeeTUYaRZ5BMifrp/CORM7G6Oak23mAzpXgU06USVUU=;
        b=JEy+1cyFJER40Nb1yH13VO8O+2ZBui2ic9ph7/suQ4y83RGyFZrrkRF3I9ZltkCnby
         JvkDOk5Xc1HCTTZLbtf5nUPvOEMt0nVwJ9TbUJC2do8xsGBWc3wxaNmIObtgLB2cv2S1
         3dOJ9XQc61fxMXGBn14X67zK0GM1VSrzraeJnXZH5SHADAwcN7v/Ad8uq5vLSkUbBoiL
         tpT1tbuboxKla+NBAHlpXdmQzzWgXoYSCsg7CK6wT4MWTQkEoLsEWqZDuPIo/tt3VjbJ
         fT1oD/m8JCkI+EFQkFFth1NAC66chuhsQ4gybIcP+GNgfJM5MxGHn+BZJvyBwdFXOmAh
         BrOg==
X-Forwarded-Encrypted: i=1; AFNElJ8pGRVain9WPCuAYgRzmJYed/07YyYaYZ3MK5OfSm+8N8xIz0liXBLi0sT1qabD3CoIGCuWNH0WCTfKYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLK+ihWj+hI+icVFt3dfud0wpcUrz53ae2bUN4+f0uSmivZ0D
	xxX6CmKO8pZeNPWmrhB/PKxZBRFw6OH5U7I6eM+uBd6xpvVjAcv0iC7qiAuoEHJ4x6OGABrzgq+
	Cafgo1Ix6/DutNfu7HyNC/j8f4M+1Eec=
X-Gm-Gg: Acq92OEfR0v0G9cV0LMwLW+/DD5RI2sVwqqMBgyHzKPYT5QnbORS5TyjAhmIjNRNbAC
	8jCit26xk5CexVmMC9dGoiImCmpwzvltHQr6fjSkBE6FlAygUFFPFH3t5KSgdwFWnsmnz5x2Bfg
	IiThDYTRLOLK/dkyAv58WBiqOhl6qSh3laexFGmwq4fYJ57NJpPl5RZ9R49e3ok7zGgZPiv6JNJ
	dRoOBcdYHIYL9QtNYIKc1k9rg/WcHj79snlQ6ff4caSfYU7pPGqbcW8SSHF7+AN5UqB7CV67hle
	qKUcce+2JFjRR0Kofxarr6fhUsOiIE95OAyIgIwLRP/pjF3DLPW3DfriVpcqROylhayASSGq
X-Received: by 2002:a05:690c:c244:b0:7b4:657d:bd5d with SMTP id
 00721157ae682-7c95bf10a2cmr197794877b3.30.1779148259100; Mon, 18 May 2026
 16:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
 <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com> <20260518105721.42ffa64c@fedora>
In-Reply-To: <20260518105721.42ffa64c@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 18 May 2026 16:50:48 -0700
X-Gm-Features: AVHnY4Kh2f1AVPZetJ2ndlIB4ihBeeqmA3WYM7Ew2lGnTHy97cgp6M33GrZdWXw
Message-ID: <CAPaKu7RRcGQSivs8n6RhOO5XeBSoLG6YF1GRR6Cysv_yDpd2=w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH 1/6] drm/panthor: Driver-wide
 xxx_[un]lock -> [scoped_]guard replacement
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62058-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,collabora.com:email,arm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C2DE3575450
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 1:57=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 14 May 2026 14:16:37 +0100
> Steven Price <steven.price@arm.com> wrote:
>
> > On 13/05/2026 17:58, Boris Brezillon wrote:
> > > Right now panthor is mixed bag of manual locks and guards. Let's
> > > make that more consitent and thus encourage new submissions to go
> > > for guards.
> >
> > I'm fine with encouraging guards for future code - but I'm a little war=
y
> > of a big change like this - it's hard to review it and check that
> > everything works the same.
>
> I can try to split that up, but even after the split, it will still be
> a pain to review.
Splitting up a bit can be helpful. If we did introduce errors
unintentionally, at least we could bisect and there would be less code
to look through.

That said, for changes like these, AI should be very effective at
catching errors.

>
> > And it's a little dubious that the mechanical
> > refactoring produces more readable code in some cases.
>
> I agree, though the mix of guard()s and manual locks makes things even
> harder to reason about, especially when they appear in the same
> function/block. The very reason I ended up sending this series is
> because, as part of the IRQ refactor, I decided to be a good citizen
> and use guards when I could, and I realized how bad the partial
> transition was in term of ergonomics: not only you have to think about
> whether the function/block scope is what you want (that's basically
> what guard provides, unless you used explicit scoped_guard()), but you
> also have to think about the interactions with your other manual locks.
>
> TLDR; I'd rather switch over to guards entirely, or go back to manual
> locks, but the mix we have right now is far from ideal.
>
> >
> > That said I asked my friendly AI bot...
> >
> > [...]
> >
> > > @@ -3142,48 +3126,44 @@ panthor_mmu_reclaim_priv_bos(struct panthor_d=
evice *ptdev,
> > >     LIST_HEAD(remaining_vms);
> > >     LIST_HEAD(vms);
> > >
> > > -   mutex_lock(&ptdev->reclaim.lock);
> > > -   list_splice_init(&ptdev->reclaim.vms, &vms);
> > > +   scoped_guard(mutex, &ptdev->reclaim.lock)
> > > +           list_splice_init(&ptdev->reclaim.vms, &vms);
> > >
> > >     while (freed < nr_to_scan) {
> > >             struct panthor_vm *vm;
> > >
> > > -           vm =3D list_first_entry_or_null(&vms, typeof(*vm),
> > > -                                         reclaim.lru_node);
> > > -           if (!vm)
> > > -                   break;
> > > -
> > > -           if (!kref_get_unless_zero(&vm->base.kref)) {
> > > -                   list_del_init(&vm->reclaim.lru_node);
> > > -                   continue;
> > > +           scoped_guard(mutex, &ptdev->reclaim.lock) {
> > > +                   vm =3D list_first_entry_or_null(&vms, typeof(*vm)=
,
> > > +                                                 reclaim.lru_node);
> > > +                   if (vm && !kref_get_unless_zero(&vm->base.kref)) =
{
> > > +                           list_del_init(&vm->reclaim.lru_node);
> > > +                           vm =3D NULL;
> > > +                   }
> > >             }
> > >
> > > -           mutex_unlock(&ptdev->reclaim.lock);
> > > +           if (!vm)
> > > +                   break;
> >
> > ... and it said the above has changed behaviour.
> >
> > In the !kref_get_unless_zero() case you now assign vm =3D NULL which th=
en
> > leads to the 'break' case above. Previously we 'continue'd.
>
> Oops, that one wasn't intended, indeed.
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

