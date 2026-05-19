Return-Path: <linux-media+bounces-62196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNWaN5z0DGqPqQUAu9opvQ
	(envelope-from <linux-media+bounces-62196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 01:39:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BEF586149
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 01:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3500303E120
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B271A374190;
	Tue, 19 May 2026 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS9zLKic"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE73343889;
	Tue, 19 May 2026 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779233935; cv=none; b=NoepP1cUFYHoorkyW/AOayOfhj0CHJcJwVjrbfb0agr7SsIRCXU4YaSSe4WT4WvXBlNj8jMI11GtwVA1ZNFS4OrNXtzJ6Q1itq7nMXUkWTgmWuexhcghHlU2B1Fh4T0z39xIzbFlLa2jSY/JjvqLLfTo6G5jaAYXTKD7q5c1ENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779233935; c=relaxed/simple;
	bh=SIeEWIykIk5WwUzrKwMRjKmdpPAxIIzIKp9bGA3MS6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtWKc5m7XnlFHx1l0q70CRlyV199ioPQ9yurUD0QyA/MgIutF4jKp2WbAXfNSfVSoHqC9yKjimfGGvkwMMk4C38rjnCSGYaASJZebaHBwiJnmIYX9kel11wykJneEQQhoBVnchzMRATpd0YJ6XKGTjO9nMuuy8KPur1v2psVk0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS9zLKic; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A321F00893;
	Tue, 19 May 2026 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779233933;
	bh=nRQgbMjzxu8Q3kOrsyDwli0tf7eSBOzQr+PWLku10Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OS9zLKicRAaT0ytGqArZtlKKQMTl4c4yfc7HkT8Fbm4pW7slkIkJuyJS4jABvY+is
	 57p8QyTJlXVhvMoXPgA2GDDM+pEFicCRawsSv8wCiRTWbsBY/cPlsGeXZdlhWGQvGB
	 Pmx2xLRg1JU0vxDqGPQwbpprmgdNYmbAqZIiJwCtYTxWJSgkX0VK9WV+P/CY/K3il/
	 4AaQKZMX73BqXLMoJkDSlKah7GrzZ6OYnuslOzzIBaW2DbWsiOPw/BEsfP0DrGMcdr
	 Edq2FWfbKCdtIEm8m2e6Z8fegrW+0ygMk3dHTl92JkDpeVWDzxOMuvU4HnM58x9U7K
	 YBzUWIivryjjA==
Date: Wed, 20 May 2026 07:19:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: system_heap: Use LIST_HEAD() to initialize on
 stack list head
Message-ID: <agzwB78oIt6yZAOs@xhacker>
References: <20260519060532.13221-1-jszhang@kernel.org>
 <b4acc363-b307-4ce1-beef-fece0d66e696@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4acc363-b307-4ce1-beef-fece0d66e696@amd.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62196-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jszhang@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 63BEF586149
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 08:51:00AM +0200, Christian König wrote:
> On 5/19/26 08:05, Jisheng Zhang wrote:
> > Use LIST_HEAD to initialize on stack list head. No intentional
> > functional impact.
> > 
> > Change generated with below coccinelle script:
> > 
> > @@
> > identifier name;
> > @@
> > - struct list_head name;
> > + LIST_HEAD(name);
> > ... when != name
> > - INIT_LIST_HEAD(&name);
> 
> The patch itself looks correct, but my question is why would we want to do that?

The benefit is: simpler code, combine the linked list defintion and
initialization in one step, thus 1 LoC vs 2 LoCs; And potential bug
prevention, e.g use the list before intialized.
But I agree, no strong benefit here.
> 
> Initializing the list head (or any other result variable) directly before it is filled in is usually good practice.
> 
> Regards,
> Christian.
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 03c2b87cb111..6f8b7138ff56 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -409,7 +409,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> >         struct dma_buf *dmabuf;
> >         struct sg_table *table;
> >         struct scatterlist *sg;
> > -       struct list_head pages;
> > +       LIST_HEAD(pages);
> >         struct page *page, *tmp_page;
> >         int i, ret = -ENOMEM;
> > 
> > @@ -423,7 +423,6 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> >         buffer->len = len;
> >         buffer->cc_shared = cc_shared;
> > 
> > -       INIT_LIST_HEAD(&pages);
> >         i = 0;
> >         while (size_remaining > 0) {
> >                 /*
> > --
> > 2.53.0
> > 
> 

