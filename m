Return-Path: <linux-media+bounces-65368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l1xfKDgwOWq0oAcAu9opvQ
	(envelope-from <linux-media+bounces-65368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:53:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 014106AF94B
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:53:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UFmmQWcs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65368-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65368-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E1A9302BE23
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E29F3ACF0F;
	Mon, 22 Jun 2026 12:52:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDB2DF142
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 12:52:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132761; cv=pass; b=oYBSu81RWQ5CooPkUA1XTt3nbzDA1FQvyiygz9r03UrVGyEHDf2APUgW0VwnoohPPN+czBuk1vti8bZNWjesvVwlpo+qHzweHByexu8zpz4Wo6iv7qBk16uJ66Ix94L8QAKHaZ8rxUu0zFT6eaRaVm789KqHYh6CAImr/8WDe1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132761; c=relaxed/simple;
	bh=fWjKgd/rYK+kkg369WeLjO+VU9fLbw43TyCsOKgkOjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mria2pnQsev02lTlTWFOtv2s6Yi5ehYKFPVw6Q+TIgDhY8eY4tLgRTmQM5m/LaDdaBl08a0m42O7C7KKgGdgxxXfWT3ct7iIH99xWIVcalJgvSvrYbsdRp2Mya7Jq9yDooUy2EKNi7G3CNJJZAvO3IVLpOSoNRtkvkZWSr0grw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFmmQWcs; arc=pass smtp.client-ip=209.85.128.169
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7fe4808741eso45327837b3.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 05:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782132759; cv=none;
        d=google.com; s=arc-20240605;
        b=ACUX5pkONrLGsQaZ3J206zB5/Q5U3B1+/l/4J228TJnHRdBfYaZeh/mMJJvWL5LB5l
         b5pe2IwUd4ktV7nnUqUCTCJGxZOIh56E+WPwrrIgF+ark8qmHSG5LvKfWqu6qJWoRSDq
         9FJwAbVth2yjvXdW/EZMGOnorXrb+qy6LCKR4dRDx1OOdVxp4aYjjM9lAiIDWuQJ2eRS
         yxn3EHPmEGodwP1n7/16b6ssb0XXSFL2YeW3s3l1NqXyuVjCJi3fWfnFHgTRjTQ8lOE2
         2D8+KRAyrcnzvonpA+OMSQa8r6axgFCXkYvD70xJIK8agklnYVoq1cpQZ/JgT9weg9VA
         +zAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQG1dK1Pn3kDMIdZo6j2PggknuXDB9/v9hKNqUmuRqo=;
        fh=aKQv/0uStIUirZO8itVQaPFEDwzjEsD29qrCYlv0hNs=;
        b=l3H/Ns1MTNjmiULyD0udnjKGSgo2nqcvNu4Omt/hYK2+rkVXTWvWoCb5zqb2PfdopD
         Xv+/EZ5ZGFFWEzYU6duEaYkx4Z1gHRz8W3TL0A7V1o30NDSUo7MPWjGEGwe7yrXEZFiv
         OM9ipnAdaknHqcHemPKY53II7w9cZfePUxy6J87PqjxChkRVChD35HF3l+RYFUvFxoED
         WROA1hgkx5Z1zUjCyNLV0jBzjHyZv2bVymicAeHvsfws7Nw90ERHCl61nQ66wNqH31rR
         F6iDrAdYFLa82L3D0olN19wOtF4IQR9pO+Jnl0fQFtCTLQK8CuUMvhiXXh8U6akoYuuD
         uyuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782132759; x=1782737559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQG1dK1Pn3kDMIdZo6j2PggknuXDB9/v9hKNqUmuRqo=;
        b=UFmmQWcsUEMtRyGw0CbpS+p7r6inUNDp4GDJw3TJKZYbQGuIECzbP7ZOxEwubx/aBx
         GB+j8BwI3r1Ukmx5961p7ZZTDMWXGYAVx6NYRjsv+oc1+ZzDd2oBEgmcPD1lLnrjFap9
         FaGNJQwPYvHc93heM0CnVwz4Ke/Xw6K5khDsQwJrWxIfugN4iHWI2wnHonzwMU+9oyZ/
         a21K0gxy+e/r3GuYJZO8RmQHmwZjoV4ymot0tASzs4URctLXZY1KZ4OqyDKGmq36Adk9
         dwNMrde2t4h1ajPpmos5x7jZ1EzZYLZvR7nk/EjhnrC6EJES0R4LzDUlhNaJRhrg4UpM
         wSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132759; x=1782737559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gQG1dK1Pn3kDMIdZo6j2PggknuXDB9/v9hKNqUmuRqo=;
        b=GUfWr4CPgTQGNdiCTng+zLU6fpUuZLjtYbfn/YeWYjDg/u3GV4zTsi6utu7oFOPlUu
         c0gGHobg4o8nu8Q3SK4o5Tj1PKGRAbiSde0cuqDc6tNMGggTrUAhZN1q0/F/Eryppi3g
         1SXNGo0khLdYg5mLQtuIAXHf6K47Wh6TaSjx1cFgOxgbGWLj4X+6GKUuwaYoDEuMP0ef
         qsm2uzfDxtXe5DmswKutyWp3PtD2vVXCRHh1qm0g5eeYevYI5mffEsv25e1myJmIG9oU
         W44GzmzBZA7Zel8mnMjqTP1IdAZiAX23CS6Xp4K1TPFU+25gRWYRG+xa6dQBcn3odss9
         FJSA==
X-Forwarded-Encrypted: i=1; AHgh+Rre2rObwW5odGWlh/WEmE1+0qsW8J5kJZdeGLmjrVq3B9wTrr5ySJFtGZu0WK2Mdz9iu2fhTQRnp1GMMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyssdO5kJVndNtiM0dwUaj7MnAUhJ/Q8aKqByIqrpljbhG/0mgH
	2MniqTEnW930S4qp7/bHhAaKEU8hJ7mft5NYtF9n+i2lxOGlht9XhlW6p4aAU/OVdORp2EVsybf
	7sKjDcvH6x9QbO77JnOAnnnDoh5CE1e0=
X-Gm-Gg: AfdE7clG5Nb20S5Yn6dpG7gkOwguzENoJuFqXo53bw8h8UQ+4JRCuUI48N59EYM3JJc
	5RD8a4pJRyddpkWAdXxrwQojrx60+vSstWPcIcLTba6pq1E7ZXDul2bBtw2/1a4AtFMdkpDQf99
	kKl33U8UBMLG9vMVuUhjmRaKCNNsV50AsTFG+5rsO7SGr3BRqtRLc4KzWKlOt+eGAgbb7vmThvO
	tzuTLf3yCwDLPPzOhLRTlevrkkdwQ/DQLEkF5KGzaCrYykoufEF3sId6Ya/1v31Q6wXqPgu
X-Received: by 2002:a05:690c:e346:b0:7bd:882a:43d9 with SMTP id
 00721157ae682-8013236fffbmr132455027b3.27.1782132758806; Mon, 22 Jun 2026
 05:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616181956.61476-2-birenpandya@gmail.com> <20260622115544.GA3899302@killaraus.ideasonboard.com>
In-Reply-To: <20260622115544.GA3899302@killaraus.ideasonboard.com>
From: biren pandya <birenpandya@gmail.com>
Date: Mon, 22 Jun 2026 18:22:27 +0530
X-Gm-Features: AVVi8Cck-hMvuxp0n3mewo-gqCHtjTxGDRmA3jAjW6tNVdbjxYSJyw9YAMsTs2w
Message-ID: <CAAeMi9LMootkxmRE0tjo0mwijAuA0u+49HhxWxRGU-pSz+Cggw@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65368-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 014106AF94B

On Mon, Jun 22, 2026 at 5:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jun 16, 2026 at 11:49:57PM +0530, Biren Pandya wrote:
> > Several GEM core functions manually managed mutex_lock() and
> > mutex_unlock() over single scopes or error paths. This adds boilerplate
> > and carries the risk of lock leaks if error paths are refactored.
> >
> > Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> > macro. This ensures that the locks are reliably dropped when the block
> > exits, cleanly removing goto out_unlock paths and tightening the
> > lifecycle.
>
> What's the reason for doing so in in drm_gem and not other areas in DRM
> ?

Hi Laurent,

Thanks for taking a look.
No deeper reason than it being where I happened to start =E2=80=94 I didn't
mean to single it out, and I'd rather the treatment be consistent than
piecemeal.

> > @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_devi=
ce *dev, void *data,
> >               goto out;
> >       }
> >
> > -     mutex_lock(&file_priv->prime.lock);
> > +     scoped_guard(mutex, &file_priv->prime.lock) {
> > +             spin_lock(&file_priv->table_lock);
> > +             ret =3D idr_alloc(&file_priv->object_idr, obj, handle, ha=
ndle + 1,
> > +                             GFP_NOWAIT);
> > +             spin_unlock(&file_priv->table_lock);
>
> And why don't you use guards for the spinlock as well ?

Fair point =E2=80=94 the spinlocks here are equally good candidates; I only
kept v1 to mutexes to keep it small.

That said, this is a pure cleanup with no functional change, so it's
entirely your call whether it's worth carrying.
If you'd like it, I'll send a v2 that converts both the mutexes and
the spinlocks in drm_gem.c consistently. If you'd prefer not to take
cleanup-only churn, I'm happy to drop it =E2=80=94 no problem either way.

Thanks,
Biren

