Return-Path: <linux-media+bounces-64045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YEl/LLMlJWrdDwIAu9opvQ
	(envelope-from <linux-media+bounces-64045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 10:02:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2761164F0ED
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 10:02:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aE1SY8r9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64045-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64045-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 305FE301548A
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 08:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE4436D510;
	Sun,  7 Jun 2026 08:02:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4141A2E6CC0;
	Sun,  7 Jun 2026 08:02:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819371; cv=none; b=aM9f5zf2lSSMeTDVbNBm7ByoRri5zk8l7ukjK5nsl2rvNTtqQ0A0M/L3lARVoIkeUOMdGC9W9u7n+ettAmN6qy15WXQ3wEAeQau1W3vsFSk+ME0E5fqGP5qOaQ8vqkogP9FJgNenjztq8m5uPbwuRmKnqW3ozs3ch7qqvAJiFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819371; c=relaxed/simple;
	bh=fK33aw+FsNr4Lb4q2rl/jIj5PcYXk9p91/x81Ou+R/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yfe9wYALfRbA1BMOzCD9aKRD/+pgaYd1iMXfZ/QsNMUuomMV7MG3K30w5D+PkHorXhIMXiiFABTtXFJ1ezIbskJ0b4WFa285ecicE2xh/xkjRckjXx5Hpmd8tVWTgOBQTj15v1pIDakS5FiYWrCDDIyFuu5Cs2gaXAIjvdyGp+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aE1SY8r9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A9B1F00893;
	Sun,  7 Jun 2026 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780819369;
	bh=743mquA8eUU6nXfjkJF2bDmypYOyMCpDQhfZo28zoc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aE1SY8r9jkNr36mu/YYJAsW8bfiM7zw1BjgwI5hH9xzAqeIuvpxF5a5xHVcykvRhE
	 5rv4zb7l0fL/AVhPq95kRC309GpG2LYn9Tk0LfK0EftcbiMuP0mz7jwTgGkVUiskib
	 FsdBfriQjkjAOSaoOuF08eSIjgEI606M97YlP4uHMmQ2uHpzNScMRGEPVja8VRAJvY
	 PNxXin2R+XTuVfb00frIhDpIHsfV00jTfMFLAAGOUorTUFWPoAM25MVttHHa4l78o7
	 2BvhsE3Q4tELG3Xi5Wreq/lCyzxgWM6T3E3A4pyK+yA89GXQXm4j8JddNoJQxLgi0i
	 ymCQKza5mtMTA==
Date: Sun, 7 Jun 2026 11:02:44 +0300
From: Leon Romanovsky <leon@kernel.org>
To: David Hu <xuehaohu@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	jmoroni@google.com, praan@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
Message-ID: <20260607080244.GA327369@unreal>
References: <20260601200012.3872274-1-xuehaohu@google.com>
 <20260604094344.GB245424@unreal>
 <CAPd9Lg_JkRdtNa=n+HE9SP+NFCSB+X_97eiPBqiONVLwV0pHwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPd9Lg_JkRdtNa=n+HE9SP+NFCSB+X_97eiPBqiONVLwV0pHwQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64045-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unreal:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2761164F0ED

On Thu, Jun 04, 2026 at 03:36:48PM -0400, David Hu wrote:
> On Thu, Jun 4, 2026 at 5:43 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Mon, Jun 01, 2026 at 08:00:12PM +0000, David Hu wrote:
> > > @@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
> > >                                 struct phys_vec *phys_vec, size_t nr_ranges,
> > >                                 size_t size)
> > >  {
> > > -     unsigned int nents = 0;
> > > +     size_t nents = 0;
> > >       size_t i;
> > >
> > >       if (!state || !dma_use_iova(state)) {
> > > @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
> > >               nents = DIV_ROUND_UP(size, UINT_MAX);
> > >       }
> > >
> > > +     if (nents > UINT_MAX)
> >
> > I would suggest to use check_add_overflow() while calculating nents
> > instead of this check.
> 
> Hi Leon,
> 
> Thank you for the review. Using `check_add_overflow()` is a great
> suggestion and definitely
> cleaner for the accumulation loop. I'll update this for v6.
> 
> > > @@ -133,6 +137,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> > >       }
> > >
> > >       nents = calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> > > +     if (!nents) {
> > > +             ret = -EINVAL;
> > > +             goto err_free_state;
> > > +     }
> >
> > Technically, this hunk is not necessary, since sg_alloc_table() will
> > return -EINVAL when nents == 0. At least, that is the behavior I relied on.
> 
> I originally added this explicit check in v5 to address Jason's
> feedback, and to make the
> failure explicit rather than relying on `sg_alloc_table()` failing
> silently on `nents=0`.

I prefer explicit checks, but I am not in favor of duplicating them.
Since sg_alloc_table() already validates this condition, we do not need
to repeat the same check in dma-buf. A comment should be sufficient to
inform future reviewers that nents == 0 is already handled.

Thanks

> 
> Jason, do you have a strong preference here? I am happy to drop the
> hunk and rely on
> `sg_alloc_table()` returning `-EINVAL` if you are both comfortable with that.
> 
> Thanks,
> David

