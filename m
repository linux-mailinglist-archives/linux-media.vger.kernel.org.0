Return-Path: <linux-media+bounces-61919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHbpEq/ZCmoA8wQAu9opvQ
	(envelope-from <linux-media+bounces-61919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:19:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C095698B8
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D45A3016ED0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A403E51D2;
	Mon, 18 May 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MtzABl4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53813E1200;
	Mon, 18 May 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095704; cv=none; b=bXXpAq1/rBhVNQZfkS6d91hS3vBHbsqfPSt/dwkoJzr2C7hPxTmz4vp6KZVtwDiIw2rCzgwQsTRjcICiQxfIwbiYiFDbqMhAQYdw//JZaMAQcijuYGCyuwNgCcDFTb8X3ZtyXTO1V4cqgM2lZkpq7vt6VgVVEVwj16pN3MPCJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095704; c=relaxed/simple;
	bh=Evhx71+uHCKSNbI1/JWhyd7uMUqb7RZM1k+fJyqK8h0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbquVrMVoKh32M0Ut5hY5XH8XCZDVv2lhChwaY51ZlTo/cdVuiNp252RDFU2aF/SfF1RfSteufrKo0fZ5uqE/32ObHurO9uCtnwKSdLexjCg00PtUppGYjDraJQUcXi+GBG1D8Ub7KG6cwZbAH4PjrAItbPIiDZHmx7ZOv6TZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MtzABl4Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779095701;
	bh=Evhx71+uHCKSNbI1/JWhyd7uMUqb7RZM1k+fJyqK8h0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MtzABl4Q3eo4GdeoXvWI3cqPO9TB9LGGtg+aCcf41L4Mf22ir9b++t3fpS9jvSGwd
	 bPcO78fh1Na6RFzoy+kIES4fJNlLEWtPJPYlQN8+EUpWksyaRhwoz9MGP9WmWC+/fN
	 duVdX/lb18qgJ7S+5tNP+U9q4Ai5OrKbV/RbVwqe4MunZJe4C3foOr4EDutN71QLqh
	 ReLqLbArre6HxYnGUpcKJXP4dkuUnfdXOE6j3dnM+wgXUQWAwKkf5Y8hnDcv//TIE6
	 Pns1PthM/v6JOiWRSMmCDAfppOEyDec5Ik6cXJ8pYtyEDdptBMzkS6Ow9Np1x6XzyS
	 JkqM+aGD1NIow==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C06917E0319;
	Mon, 18 May 2026 11:15:00 +0200 (CEST)
Date: Mon, 18 May 2026 11:14:56 +0200
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
Message-ID: <20260518111456.30ba9bba@fedora>
In-Reply-To: <03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
	<03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
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
X-Rspamd-Queue-Id: C7C095698B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61919-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,amd.com:email]
X-Rspamd-Action: no action

Hi Christian,

On Mon, 18 May 2026 09:10:23 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 5/13/26 18:58, Boris Brezillon wrote:
> > When used without a context, dma_resv are no different from regular
> > locks. Define guards so we can use the guard-syntactic sugars for
> > explicit/implicit scoped locks.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> How do you want to upstream it? My preference would be drm-misc-next, but=
 I think I can live with a panthor specific branch as well.

Everything Panthor related goes through drm-misc-next, so drm-misc-next
also has my preference ;-). But I'd like to wait for more feedback on
the other drm patches, and there are a few things I need to address in
the panthor patches anyway, so it's likely to take a couple more weeks
for this series to hit the drm-misc tree, unless you have a good reason
to fast-track this specific patch.

Regards,

Boris

