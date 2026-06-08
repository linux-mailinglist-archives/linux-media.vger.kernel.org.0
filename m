Return-Path: <linux-media+bounces-64245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HuXnHVEQJ2olrAIAu9opvQ
	(envelope-from <linux-media+bounces-64245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:56:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C08659E78
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:56:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=rqKSegmZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64245-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64245-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8623047BDE
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E573DA5C3;
	Mon,  8 Jun 2026 18:55:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9593D6690
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 18:55:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944916; cv=pass; b=OmO1l5MGRHrAhdfHb18j6coQVNzfNQ7oNH6jOdpnvtd/RH69Opfh1dHVlsYLuwuxnHB6NWvMqnXmGcjBiSQNQ7KkAmd+kLruwNlGwq8DAT9I8oDuflDNfyUXjd5aMbCja9Kw2lIhpxpVGHg5NR19LbXhVX6kOKHOYdi7oO0KYow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944916; c=relaxed/simple;
	bh=zKNEWyIdx6AUnE+D5RSyECXmUt7mDFTSd+8dDxmh9dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPDWzpAClYk5xd/SsUpJMdvatyT1YAaQUuaLl3iIdQbQV8/1Nhwk0CezRB9UtohWcU4cZUBo7BNI70fuP38OcYkYKHbd6QN3+A6lbrA8ug/FjuGBvnaBJvDNwDJHq7zDqw/Gksgz0EBLxiM0RaUhVDuyk8l+9Mkzkg/5ZlBV2ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rqKSegmZ; arc=pass smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa64afcfdfso20258e87.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 11:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780944913; cv=none;
        d=google.com; s=arc-20240605;
        b=U4umWX4g2p2doEwzvoHgxoTKTa4Qngv++M8rEB2NJQYON6MPzGlhPrgHcvKXwjz5hj
         w/zXOHmy6dtSb+3fGR+NsTE4xlhZgop/x2Lv07UYJA5HuXC33XEg/Tv3A41LIbRwvyXs
         GRKPyzhUBW6z25g5On4J+LLGThJ5GIeB131m/1tIXwrFO3r/q0TAik2/lXivpccwhZTK
         qsVaJTZfUr1E06iaNsyUGPQ7MCp/EYFoCmqur0XL/3C4sf0SOWWgQiRG9GxTdLcMEWpW
         1oOa623D1S1L9J/2xQZrpk5zrSc0ku8f+/57nyG1wf87u/5b1JCsxOxPjiE18NOthwjU
         1MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw+WR3kgPsmomU5BDy/wi1DbnucrDq50YuLE+lo/Shg=;
        fh=gpExdFEKZZCK7G0djdY9WzWqIQdFx28aW1M8QvZjzWE=;
        b=K48dht98W1YX20aVwjWAHPlgE20lLVpD2Fu6UyZou6Bbcf6Pkxay7ZJW7y9BVy8c2s
         3mlWoGekHGLP8gQsjeV9QGktFUNVG02SfvGbvOUTl52SVyK/LaA3mXN+YpKnz+TY2cZj
         RsUcrugSfVkOixomRCEwAjqhDOO9qrouvJVyKIqmCXDL1ugqhSfGNDWGNMCBAGchUJFz
         76OcxJTuQyH7wx2f9P8oaSJJJWvr7dTwmNlbtMZsOXh/jNVUVlIn0jJEBDdS4uiWaCSD
         /RoPeEf7S+bKw9gK//fXRGTzK1TbLy03I5wxno6iS82fRZ60xxp7eZ2rWL2QcYH5Z9Ae
         8RFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780944913; x=1781549713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw+WR3kgPsmomU5BDy/wi1DbnucrDq50YuLE+lo/Shg=;
        b=rqKSegmZLQBKD5b5RRvE1G8hxE8ZwYnoCRtkoB2UGzazOQAkOQnkcMjyOlFqK9ufj/
         B00giIS7FS2ZbyfkjmmrUow+Ie+rsHr7+FcL9gRpOYrzNnPQgOswrvhwLIKEg9Himntb
         isOwldfThEYz2/B2x0EiOVAlkHNSc3ntvhg9xXGX5Z6vTOceSXGGMS9l2Nq++mBmHtj1
         fBWlTGcFu98noiP/SApLU+XBWslhTs9XyXj9IadpnETbuw3hvCd8dUNoF1CMkxYpHQfD
         sxODVy09d7xYRl/0pk6P2yGs86EJ/DV2uNScbbp4AyIAUnp8fHQBJfFg1EANFzDTu/K/
         TK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780944913; x=1781549713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dw+WR3kgPsmomU5BDy/wi1DbnucrDq50YuLE+lo/Shg=;
        b=b+aJzzm9Db7SSIpQ7rq6i0Oi7sNmA+6PbFx1w+h8fmdmvu6cpCGJ7hqydS5twhUF0y
         b8sp1d4BqM4MvbILcEohF3eqhNQN+bRhkBPZTLEj7lrOjnZo5OwEqjYEFWCTBBL5/zH2
         uv8HUy38bfP/qtxUpmjtdxuxgSn3emdEr5Ser0i7wz9658vK+VMrimA7XxhxwvdrVFAn
         D+woeQAF32u2Oc2zHtIGV3g7oeftmbDCS3F4ZJ4ssrtfDpKd8jK0BsyIgFK0GvCTclrd
         xtynH7KtEpEHuEHzKSWsLOaxXFXUvGVMjixY7rc9pfeu1L8/h6u2W5elp26V6JuvmVK1
         oUWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Mc4w/aZqBwZHI1HALtVLMVk3UX6r44zGfE6Aoaz2+s3zZ7fgzS7cHLynJqO/tnSiO0grwQUKHV1JOcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hZj6dcLZi+CNP2np1zwAedppbmu3+tZwUHlOyQlcKFO5S56T
	KtGtgIFBHFFJiVi9qARlskGdEwRs4WlFUC6ICuFilE3JoOH+Ckx7XBlvqWzxtL92UtRwMGkqtYb
	gQoHjGofrgXVKFb4iVQuNctMDd5nPCWhRG3kHvQs=
X-Gm-Gg: Acq92OEc/+Rc2gWUIMDrZjH/Cwpj42SeUkB8QqSEVKZ9gWb8ajNPRpS2TZgEnY0+sFU
	Yuu/DnXuq/urEGDLyzfyAA1rP0PkmwsJ43JmBJSTcM3xy/B8YvV8OR7A5iOAK+TBSyt6g+8a8tg
	+Rmoqbk+o8ZJCJYzS8IRm7gVDSfiBpBasv77/tR+6BXXOhEkGZ3AHbi0sLWQUZBNpjQkMKDKqG6
	IjJjFwEUYkP1A0LKeXtFGnuW8RU+Ge2vxcHbUZK5WGO1Du2QrnVD3sCVHBfUFEOsvSN40DqtApN
	dFSV0WFYKl8ElrC5yJ5fHJTXT5Pui2kp1JymJ2aey3uQdFLJYXX4NYw=
X-Received: by 2002:a05:6512:3341:b0:5a1:274b:de2b with SMTP id
 2adb3069b0e04-5aa88640402mr537440e87.9.1780944912435; Mon, 08 Jun 2026
 11:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601200012.3872274-1-xuehaohu@google.com> <20260604094344.GB245424@unreal>
 <CAPd9Lg_JkRdtNa=n+HE9SP+NFCSB+X_97eiPBqiONVLwV0pHwQ@mail.gmail.com> <20260607080244.GA327369@unreal>
In-Reply-To: <20260607080244.GA327369@unreal>
From: David Hu <xuehaohu@google.com>
Date: Mon, 8 Jun 2026 14:54:59 -0400
X-Gm-Features: AVVi8CcrgIqNX---JRMNN-9SsXpCXMWpb_Y08c-v1_nrKhDd232Ciz6Ae661o0I
Message-ID: <CAPd9Lg94nGnn7HQPNiSS7w2QQjVAuJ_FkMggR=JfSGVJyAsgeg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-64245-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16C08659E78

On Sun, Jun 7, 2026 at 4:02=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Thu, Jun 04, 2026 at 03:36:48PM -0400, David Hu wrote:
> > On Thu, Jun 4, 2026 at 5:43=E2=80=AFAM Leon Romanovsky <leon@kernel.org=
> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 08:00:12PM +0000, David Hu wrote:
> > > > @@ -133,6 +137,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struc=
t dma_buf_attachment *attach,
> > > >       }
> > > >
> > > >       nents =3D calc_sg_nents(dma->state, phys_vec, nr_ranges, size=
);
> > > > +     if (!nents) {
> > > > +             ret =3D -EINVAL;
> > > > +             goto err_free_state;
> > > > +     }
> > >
> > > Technically, this hunk is not necessary, since sg_alloc_table() will
> > > return -EINVAL when nents =3D=3D 0. At least, that is the behavior I =
relied on.
> >
> > I originally added this explicit check in v5 to address Jason's
> > feedback, and to make the
> > failure explicit rather than relying on `sg_alloc_table()` failing
> > silently on `nents=3D0`.
>
> I prefer explicit checks, but I am not in favor of duplicating them.
> Since sg_alloc_table() already validates this condition, we do not need
> to repeat the same check in dma-buf. A comment should be sufficient to
> inform future reviewers that nents =3D=3D 0 is already handled.
>
> Thanks

Hi Leon,

Thank you for clarifying this further. Removing the duplication here
sounds good to
me. I'll drop the hunk, add a comment for posterity noting that `nents
=3D 0` is
handled by `sg_alloc_table()`, and send out a v6 shortly.

Thanks a bunch,
David

