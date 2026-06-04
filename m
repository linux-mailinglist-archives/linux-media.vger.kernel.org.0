Return-Path: <linux-media+bounces-63842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fT3kHm7UIWpYPQEAu9opvQ
	(envelope-from <linux-media+bounces-63842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:39:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B38642F7C
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=eCynVXi0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63842-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63842-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A903030315F4
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 19:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56EB3C2BB9;
	Thu,  4 Jun 2026 19:37:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94B3C2B8D
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 19:37:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601826; cv=pass; b=N6Z5JqvIm9VHknyk/IXYh+IHlGWLObwyiafZ+JuCj7QwoNcCsa27s1X5TH9LunhxgQt2brYMOaDCs4F7qM2dZDEuCuuasxLtcisNcQXKHjAegNQxJhoQ4JtB3lV8k6GTpj2fgHuOii06hYQxcPOzKYxSGCekO4b2yy2NXa9gtrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601826; c=relaxed/simple;
	bh=4ny8mDdyqCfb4288ejqLKiubk6+o7RxTB1IiqZu7ppU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+Jcd77zMh3Ee9cY8++/G9Lti6PZs8UbV69IBs8AacFkwbNvOqzMJviw+uRug0BZDjYsxYUP0pF2ZB5BViTQySL6EfdQGD7rF1G1UMVZNYq2TdVIpsH1+f+J8KhtbpsPaqugITajSh0mQgseZkUXEwRHTwqqiaD2Xl15OHCiSJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eCynVXi0; arc=pass smtp.client-ip=209.85.167.41
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa62bd04fbso2019e87.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 12:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780601821; cv=none;
        d=google.com; s=arc-20240605;
        b=Y8Q9mNaww/nwtFriq2tVY12TckpOgGjeIqOJgYYjXj5KsW5k/dnw16lh231Vy0WUrN
         Np89/IMlEbqgyvdirfNMm8F/576MdjlnaczHKDy/meiwtT7G7kGUcmmvIehoJ5yjYlG5
         rqNnFLsTOz4cF4wSTME1iAIZYmcdD1St2ySAFbepflIDWsQUm3YdhCM1bVgbaHAl1gYo
         7T0glFl1eEw33RPL72BVR8ISCNS0bzQvwSmVeR2Ks7GaVjE21uKh0A+M2UnSg2R3OeIL
         uDi9pBFvOJovyERjW/NSyE22feb1W94YWLwq/R8sj8lbOWye3dipelmWTRyztNIkVZet
         fzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KUiC23PK8EOFQC+N7GaZpdkePm+wStyLtAYgas7c/7M=;
        fh=uGwZ7/HoU1ErEJCTPAEDWjE+2Klh1NjQBubOoo+AKdQ=;
        b=Ta/SboFLTvtAfI+H1ak9TRP32JxGOjXse99g+ChTbq5U73sQwqwdCa07hBsfrRpEWi
         5ewi4orONF1RPRWRZZ9voCDfryGZbVU5kw+VOwM1R/JbgwYglqaNCR6QecJai67J8lo9
         n63jUcZnnfrBg1ua6cYYXl2A/jj9jaiXmqNHU1xfzwVTdgisWwsOLq8keJGEEeiUPnvr
         Bk78gRSsmPPfC8rG6A3YW7whwt2BJdzXIjOPBYPbal4XAXQ7Jn1gV+DZMzh31cQK+vl4
         Q4wGDCsnWFfCMUke2LPSq04sboeFYPDoPQxhnhzHUUHnmOczMh79M56ME85BkOPZOLTv
         Sr+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780601821; x=1781206621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUiC23PK8EOFQC+N7GaZpdkePm+wStyLtAYgas7c/7M=;
        b=eCynVXi0KEova4WZPuxCJP0NaAKAr28HbFIpn+G+vPRJjsOZAvt8ZjNvAP3qn1SsR/
         UO61UwC4BKmTCLUjVSuHLfAn3kfoE+rz7GnIZJO8/9aopLnXL4f6S/gFm3XJykqVQ6Kq
         bO7fx9QSlfoZTV+J19TdvGRjy/XyDZdv0GrWk5hCkoh/dluFutN0qOGLnspbsvqe2eNb
         PdeXxoera08OFf5rGTMCk7gLM5pcjSIvvJBpiCWidHD1vsN+0nwFU6ZFFWzuiXGkdEjl
         FvJhfEFmPsmEkrt1NxCAr2U5ze58Mhi0V8wxrC+CzdRkjQom+PXMd52WRyIIrktYWq2S
         a1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780601821; x=1781206621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUiC23PK8EOFQC+N7GaZpdkePm+wStyLtAYgas7c/7M=;
        b=NMQI5/XrIAHL2jZek2+9DsIcHEyPDsjOfD3PN/WY3AoeA4+dTWvd8QiqJ6+BIvJHDu
         R47/r0JACpy02Ks53lkEjwsUeQyfGBcXj5cVhULlH7IrCSdRETEH6lUbxtstWO2Zlb15
         1RSpUJkz9K8uxTb3QgGi2D5RbdgRcltHhrrtDGgtsys676eAfrtT2NousvDINBrnxa6o
         i4VOz8ShOfHLollM5nUzgzMyLc/ww07JMsrYJRWP8aSlceCKWVvOci+LsENzRb2VCSMz
         i4DhRxiLcBrOd6dO99yreMNzojGLxcgxibZ+7ssNt9r1+hyZ9iQiOTwA2aEAiQxrElca
         qmmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ejNzGfMJ0NVvqJBAw4yOVewhPUf7T0C4+4M8HsAnO9welALGqhqdPhKT2N/8TN8v/sR/di11UbgWjpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxx9IgFAhtWHOr/dGoY53ZodH8pC8nTe5S83GSC22ApRrGbDiS
	YeoFXJTBLBjNVGdY8Mbcy6oU43DRyhx6y/KPNhpi4yeXSffJzDtsqsW6+rOHCawBSAH/lJyPnzB
	9FwzS9BdcNPgR80nB3PxU7TVMjUkl7xmki+8Y6eA=
X-Gm-Gg: Acq92OHRzmdObzt4100pDHemmRyGJEtR76vvqJlT/pEvVodVC7C12UoNaU7OHvSNper
	lQcaaISWdlT6BIx2WpZYotIQuwFdEk7Et4eH/VQlnn+NP2v1y7UmvEZhaJLYXZco0EqkPBvrbhJ
	4YsboTqq1Y7HY/Xbw2mBljdwMawGU726TKEplv+IttVpLUfXxcV7JbZMs7CjLxus/O8RS2KtcFp
	DgVmaIE1aZd6qGVthzgn4tiGZyvGgW7jQQ0Kv1oACQQ6aMxRuTPN29pqG3GohY/rtKqsGkhmrnS
	ipwxy6+T7xScinK7tpCpWcDNZyRFxJa/oVCouRkklAJJRwU=
X-Received: by 2002:a05:6512:2446:b0:5aa:6ede:1a68 with SMTP id
 2adb3069b0e04-5aa877c6752mr44886e87.10.1780601820811; Thu, 04 Jun 2026
 12:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601200012.3872274-1-xuehaohu@google.com> <20260604094344.GB245424@unreal>
In-Reply-To: <20260604094344.GB245424@unreal>
From: David Hu <xuehaohu@google.com>
Date: Thu, 4 Jun 2026 15:36:48 -0400
X-Gm-Features: AVHnY4I667s8Q-kTs7E7YlSR5Fzg5WrO7fnNQmow9VUJtwR-GDJeAyWDhu8beOk
Message-ID: <CAPd9Lg_JkRdtNa=n+HE9SP+NFCSB+X_97eiPBqiONVLwV0pHwQ@mail.gmail.com>
Subject: Re: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-63842-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3B38642F7C

On Thu, Jun 4, 2026 at 5:43=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Mon, Jun 01, 2026 at 08:00:12PM +0000, David Hu wrote:
> > @@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_sta=
te *state,
> >                                 struct phys_vec *phys_vec, size_t nr_ra=
nges,
> >                                 size_t size)
> >  {
> > -     unsigned int nents =3D 0;
> > +     size_t nents =3D 0;
> >       size_t i;
> >
> >       if (!state || !dma_use_iova(state)) {
> > @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_sta=
te *state,
> >               nents =3D DIV_ROUND_UP(size, UINT_MAX);
> >       }
> >
> > +     if (nents > UINT_MAX)
>
> I would suggest to use check_add_overflow() while calculating nents
> instead of this check.

Hi Leon,

Thank you for the review. Using `check_add_overflow()` is a great
suggestion and definitely
cleaner for the accumulation loop. I'll update this for v6.

> > @@ -133,6 +137,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dm=
a_buf_attachment *attach,
> >       }
> >
> >       nents =3D calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> > +     if (!nents) {
> > +             ret =3D -EINVAL;
> > +             goto err_free_state;
> > +     }
>
> Technically, this hunk is not necessary, since sg_alloc_table() will
> return -EINVAL when nents =3D=3D 0. At least, that is the behavior I reli=
ed on.

I originally added this explicit check in v5 to address Jason's
feedback, and to make the
failure explicit rather than relying on `sg_alloc_table()` failing
silently on `nents=3D0`.

Jason, do you have a strong preference here? I am happy to drop the
hunk and rely on
`sg_alloc_table()` returning `-EINVAL` if you are both comfortable with tha=
t.

Thanks,
David

