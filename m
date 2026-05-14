Return-Path: <linux-media+bounces-61615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JRcI9EBBmrFdwIAu9opvQ
	(envelope-from <linux-media+bounces-61615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:09:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7B545165
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1473036EDF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 17:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD20389E18;
	Thu, 14 May 2026 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvEJgs50"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9655387599
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778564; cv=pass; b=Q62gJyRNP+AB8TcBjBSP6p1fzNP1hz1iYnWxHP6N1CwAy/cDbV3BPYaNF+u7ISc8gaYkbCTrqSD2gfTNNtb+wrM/WNxLkNuXevUuoDTIJBDq4D0yUAJkZlHwoFs5S8tLaB1O0OqUJ4XZig7YrOsBf90naRuHFZresPWBAl2Q2TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778564; c=relaxed/simple;
	bh=haYX7pI7eZx4Dlmw/+yxfUwXy8H0ImaG+Y59zoJhFVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRgPTh9O2psqikIV0ifFCTn9vn1bldVFk1+RUQYVzv2u66ka8moCjraGjnLos1NhphuXP4CmRgFWbjRNBeKTbJw03b+jAxzCMEmLb+7Px4UZW0LBLYT8L2OmV6+RzG/0Wm5VowCD/VcgX8WhcD8c0qmRbBF7OitlPFjdrzg/kMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvEJgs50; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6579254f996so6049552d50.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778778562; cv=none;
        d=google.com; s=arc-20240605;
        b=FELqaEpt5O5lbnvQXB/8x3wD+AgyDZr3Cu1Dy0MLljBkBp7m43VjVLklk/lp8twdph
         xPZGVmd6jNm6GzzC+ohfztLu6o6f3hD+VNpO/E0+iP9jJRW/5I6bq5c3Txa8sUryEVOC
         Rdl9yy/34GTOdqs3hWUKsChp9dEhQ2fwMKGN/C80dFwibiwgf8Ph+f2HAezmcGBpe9XK
         FeNzyNBvxLSoC1w2GtUiDUMyQp7CGTVUz6XeeK1qhh4rBEJSogJsyMWCg4/w96QODbmB
         q28ltJoyQ6htbTivPsOpe6wIqbvTeyA1rkxJOIZ94okuPsvg51DDVB3W51Pa+R4Kn96f
         OWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q68k3qvFh5WSmW5/XAb3NIaTUyA2Pk7yy6D1aLYaWeE=;
        fh=WNSPasOtiDuajWD9QYg7+q/27j/93ai7yxCupTgdKgw=;
        b=G5MrL8n6fX/UZAqvy/eOQzV3cN+pgBMhFMTLo6cQdxWBTHQklk/y7bzJk2X5NlFTTO
         kN6iOSYk7JrTG8BeoAkpVfp1/RHq7nNMqWP5W/5nEH5sROH461Xsya8TGTLtuSVxOro9
         pPNrhtiPTcGj0o2A/MAatKu+3StHtoC5F+DNcI/SS1HYVqV9fI6KawwIZFu5KKG5dkv5
         5tQM+HYFffMJEPAf2B6SlJMV82V7bPj/tcvJa9X0uqwi7/bc8/FSI4bx4ius7PfQylhI
         U1GwwE6F8qtepIc5yuVWADtI3q/uujJQ0vmR7PkKTF21xZugzlesxiFDYnbKSyZKbWE3
         95JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778778562; x=1779383362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q68k3qvFh5WSmW5/XAb3NIaTUyA2Pk7yy6D1aLYaWeE=;
        b=DvEJgs50U4LT2Sl7HDLu+KninlhMnpXsn9r8qLz7o8EUuvh/Cwl2bBxRu3gs4b/W2I
         g8UTR+3q8t7sGKwQpv8Oewp6DuDKDMQwGMxHVxrDiF3xIbYxSp1MWf+TB0S1zOiUtEfJ
         tZu5pl/K/a+vLEocoV501v+XD33Za5Ye3w2sRrB+tedRhM71kVGe4qRCs8ZskKd4CgvJ
         cAK8WqCE5OcYY70wS//4uxH+KBsJ7qtSkVyuzTfVXvjKFnUSyPl3GH6MF8ra96R2Ad5e
         BksoeOTR9s/enxTobN3e+CiSYkOoEQMlVZFXYA3QqR02Ia0LjjOvPl+6OWet0/4pyiZy
         jrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778778562; x=1779383362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q68k3qvFh5WSmW5/XAb3NIaTUyA2Pk7yy6D1aLYaWeE=;
        b=i/Tevrc9WfqQz3jrL+WkR6ATwx6lXGqWhrzM3bazMOCMJncaJ0Wfr+miTdxqjyY1s7
         rPUR5BSUbm/b6Rpg4tZeqYZ12Wa2JVX+15dU3e8KVuzavb9vFFMawG00MKZA5ik1q04I
         FSb+NZDDzRKSAXPpxebz1BDDW0G+bg6yi++FNeFTkrEOjRrITJmX8EgzvzMAf7yA9Reu
         WUQEGadaGRRJPz/mzaoP4LBI+MPKHuZMBPjrpj5i9T/F+j0NSormmw1GLXSyMSizpe1Q
         IE83N/o8XU9C/IjtfbNohOmWLKUcBujzG0Jb3njfKwJq1PLu12YyYZDpbS86mKLnKLBB
         G6+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DzVisZK36vVNDTA3A1x6i3Lj7DL850NK05rUKWPBwdchKKT+FLmdW+ezBLfx2RJvSIXDNyOKa6gFf8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEMxuarVpda9VvKam/q7JPVHeeXM2M6lPHkoCHpMimuCT1Z+K
	+fb8Pjsx/ivLxKZS/JCiClW+ALU6Xi+zD3odXwyfs94dofM4MXBB4fgZCB5CE4BYs18nGo7rjw2
	k3OXGmrZztT8lI+e8oYv9atjz+RfO7d4gEJG7
X-Gm-Gg: Acq92OFNaN49kDJqnKBcVpr7fkPOWI9/Bn7w8krU+yQFDcVtVcKwhYnNm/VmIrGlm8X
	NZPL2y4F3XmtwB7zqsdCzKnt93IYI3xxDPJrd1Fl1PSxaOPxurUeM0mWinaoQTG++Q6YaeU663Z
	VacT1bMyotePh3TbBafuzAyFJLxipswiI0chwK7zL8sKBScgm+aVxz0t6TBDSncvS2vGOwc9H7h
	ML+Url/uSoCKUF+E0ZlprFqzqTGjJHKWgP9i67sPdVUro4VLN45BXoqcl2iAJTJG8tFHP5apVCu
	MrVqB+uiUehiDK4chgT9bQsnqUQmcIs4c1DsWGpuLBtzW1Zcm7C7kpOW0/0v2q4ECJFSWuV0Qw=
	=
X-Received: by 2002:a05:690c:6d84:b0:7bd:7b55:ebe1 with SMTP id
 00721157ae682-7c959f80c19mr1966067b3.1.1778778561722; Thu, 14 May 2026
 10:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com> <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
In-Reply-To: <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 10:09:10 -0700
X-Gm-Features: AVHnY4I212PjTT_rDyYSXIkovkEef-Opnswhr90mIqa564wAfvhabndPAnzBHJ8
Message-ID: <CAPaKu7S9WMbJERrWa=bj5qyQg72no9MPex6S1MY6t8nXoMbB-Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D9E7B545165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61615-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 6:24=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 13/05/2026 17:58, Boris Brezillon wrote:
> > Right now panthor is mixed bag of manual locks and guards. Let's
> > make that more consitent and thus encourage new submissions to go
> > for guards.
>
> I'm fine with encouraging guards for future code - but I'm a little wary
> of a big change like this - it's hard to review it and check that
> everything works the same. And it's a little dubious that the mechanical
> refactoring produces more readable code in some cases.
I agree with Steven in general, although I am in favor of landing now
that you've gone through the trouble.

I also have mixed feelings about some of the non-scoped guards. Their
scopes are extended slightly than before, supposedly to avoid adding
another level of indentation. But other than slightly slower, it also
becomes less clear what exactly do the guards protect.

>
> That said I asked my friendly AI bot...
>
> [...]
>
> > @@ -3142,48 +3126,44 @@ panthor_mmu_reclaim_priv_bos(struct panthor_dev=
ice *ptdev,
> >       LIST_HEAD(remaining_vms);
> >       LIST_HEAD(vms);
> >
> > -     mutex_lock(&ptdev->reclaim.lock);
> > -     list_splice_init(&ptdev->reclaim.vms, &vms);
> > +     scoped_guard(mutex, &ptdev->reclaim.lock)
> > +             list_splice_init(&ptdev->reclaim.vms, &vms);
> >
> >       while (freed < nr_to_scan) {
> >               struct panthor_vm *vm;
> >
> > -             vm =3D list_first_entry_or_null(&vms, typeof(*vm),
> > -                                           reclaim.lru_node);
> > -             if (!vm)
> > -                     break;
> > -
> > -             if (!kref_get_unless_zero(&vm->base.kref)) {
> > -                     list_del_init(&vm->reclaim.lru_node);
> > -                     continue;
> > +             scoped_guard(mutex, &ptdev->reclaim.lock) {
> > +                     vm =3D list_first_entry_or_null(&vms, typeof(*vm)=
,
> > +                                                   reclaim.lru_node);
> > +                     if (vm && !kref_get_unless_zero(&vm->base.kref)) =
{
> > +                             list_del_init(&vm->reclaim.lru_node);
> > +                             vm =3D NULL;
> > +                     }
> >               }
> >
> > -             mutex_unlock(&ptdev->reclaim.lock);
> > +             if (!vm)
> > +                     break;
>
> ... and it said the above has changed behaviour.
>
> In the !kref_get_unless_zero() case you now assign vm =3D NULL which then
> leads to the 'break' case above. Previously we 'continue'd.
>
> Thanks,
> Steve

