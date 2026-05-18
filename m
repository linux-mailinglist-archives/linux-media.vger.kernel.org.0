Return-Path: <linux-media+bounces-62006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJHNDZ4fC2q8DgUAu9opvQ
	(envelope-from <linux-media+bounces-62006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:18:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94956E902
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9669B304B27C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6207B48AE01;
	Mon, 18 May 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MjR5dh6D"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7EB4657C6;
	Mon, 18 May 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113738; cv=none; b=hHpmriD6JAxSbYCB4TaXFo3TfWQq+XvCgQ+PhyKBCGcqg8JdL+/3XLzqAjmfpXC4m37b0P1SmKh3ZLWEP4R6Y8BSn+cShKe9CgY83P+fxq6KkW0L3WApN5KKLP3SHnOTcZp5vlgs03PE5WIJM8OocdJTxzYhiXkl/fD4w1m/a+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113738; c=relaxed/simple;
	bh=QDhP2ywyXlpxq310WYLb3KtdttgJ/FJZ9LPyfSF/Qxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkXbWvlQZ16C16PPuf69HgRS0VoG9wuKzpo05c/SfQ1x4+/EeK8eOFNpTsDy95LAtZ0b+Z4V1UP+SVXnPuWMTxgadJ1Qits6hlytQb70k2VJeSmSN8nM/r8bPkYj7AybB6Djks1UkCfqITJBAaQyHwhbsrpvKXd/JwTuUGx6CBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MjR5dh6D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779113735;
	bh=QDhP2ywyXlpxq310WYLb3KtdttgJ/FJZ9LPyfSF/Qxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MjR5dh6DsJgL0f40EMCWwtquK5OJ/A/kVSwXGNDcgSomQblUUjk8ZTwjRW3ENLNrs
	 aiJfPViRQVbayYcHJ5w6Z67KNWoebKyOi3echpl6ZFlozTqWd6xYAVsleIjLVVTXjf
	 d45/S10lQa/h9nykuB1QorwzPVinCUd/10e0iG9fY0sZuMhu3nPtmU/AcTTpaMjv2E
	 Bth3MqjjCZqzo3LzfKzg9sBu4eNgCPM4m+CY0tUPWW1EuwvqjeZrXWLJw2Y84ocqNe
	 3RdZvqYVsovVTElND8wBV8oVrhdqjGToQJErRh5s24fuPU6igUxKNAgTzfkrS3KO20
	 /E20WxyY+UuLg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D05117E04E2;
	Mon, 18 May 2026 16:15:35 +0200 (CEST)
Date: Mon, 18 May 2026 16:15:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv
 locks
Message-ID: <20260518161531.331cab2d@fedora>
In-Reply-To: <a9ee80aa-0c9b-4bd7-87bb-d3e228357b18@amd.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
	<03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
	<20260518111456.30ba9bba@fedora>
	<a9ee80aa-0c9b-4bd7-87bb-d3e228357b18@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62006-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: EC94956E902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 14:18:41 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 5/18/26 11:14, Boris Brezillon wrote:
> > Hi Christian,
> >=20
> > On Mon, 18 May 2026 09:10:23 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> >> On 5/13/26 18:58, Boris Brezillon wrote: =20
> >>> When used without a context, dma_resv are no different from regular
> >>> locks. Define guards so we can use the guard-syntactic sugars for
> >>> explicit/implicit scoped locks.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>   =20
> >>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>
> >> How do you want to upstream it? My preference would be drm-misc-next, =
but I think I can live with a panthor specific branch as well. =20
> >=20
> > Everything Panthor related goes through drm-misc-next, so drm-misc-next
> > also has my preference ;-). But I'd like to wait for more feedback on
> > the other drm patches, and there are a few things I need to address in
> > the panthor patches anyway, so it's likely to take a couple more weeks
> > for this series to hit the drm-misc tree, unless you have a good reason
> > to fast-track this specific patch. =20
>=20
> Well the DMA-buf code itself uses dma_resv_lock/unlock

There's no use in dma-resv.c that can be converted to guards. I gave
dma-buf.c a try, but just like for panthor, I don't really like the fact
it's halfway through (other locks still use manual locking), so I'd be
tempted to convert everything at once for consistency. If you're fine
with that, I can give this a try.

> and obviously has test cases for all the different variants.

Looks like the test cases all validate that dma_resv_lock(x, NULL)
returns 0. If I were to convert those to guard(dma_resv)(), these checks
would be gone. Is that okay with you?

