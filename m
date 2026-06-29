Return-Path: <linux-media+bounces-65892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rc/FsRGQmpo3gkAu9opvQ
	(envelope-from <linux-media+bounces-65892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:19:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522D6D8D24
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="jK/op6iK";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65892-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65892-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28069305BCA3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A433FD15F;
	Mon, 29 Jun 2026 10:16:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205733E5579;
	Mon, 29 Jun 2026 10:16:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728174; cv=none; b=kjjnHPC6BfyFI00/jLX4OgxQmnVtcChuN8VfNZgv6UeWI/NQ0QF90aGO+Ancz55SJz4vRkY6st+ibS3lbJxjMGiRxzmOl2Ku/t6BABjtm7/rs2aVfXOlLGxvuu46iS1thKmrpsjQqokipSVHCCbvEu7Gnjd3kB7H4bbP1dru9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728174; c=relaxed/simple;
	bh=HW+BWg1JW9BNHOp4E3b5w+CbOMquiIMjz4qFrzocohs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MJVOyTPk6Jl8zz+cWpS4iB2H/zhLyKqyHxbh+uIYS7jHS6rpz+Wm1HQ7rEg8KH12CRblOcBovcgUNfxHz1TER2ZzefuR5ZhrE7xGLXtmy5DRUvtB3WgFPHM9YfuIg86y/odYKDQY5OOnzL3/8WXIBUVcGqZ893noHiKVzE8O5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jK/op6iK; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gphxz4gTyz9v8L;
	Mon, 29 Jun 2026 12:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782728167; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HW+BWg1JW9BNHOp4E3b5w+CbOMquiIMjz4qFrzocohs=;
	b=jK/op6iKOf1vTXFwaDd/0zgNygsmmHaCv3tMcFv5+iH3+DDblF/MSPxD75wLznpekMTSWv
	Lkph52uqTDvIzBN7QoROOJsWOa0bM2mNUwancglKHe4kvMs0AMBGipFw3WO6SCQ4XpP1Oz
	J6FRq/PVuGdEDCt4R9MR8AQkulWZpqkuSFiMRTHCT1U7ndySQz0gR/Ab1/yWTGuZqBZhE+
	GlMM+rDgzf9LYeGob4ZWgqvdZDb/lwmMjjuT4UhPPlaAsFYN6Iz95DnUcFhHtT63qhytxT
	J5F12TJTLxeXcYfkQ3TOF4iqZWES9oywB7+vht13SmcJYV49gsGwE43V0jqEYg==
Message-ID: <9bd4bd923eacca9da25b6b9fda33057455d084c3.camel@mailbox.org>
Subject: Re: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against
 0-count input
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Baineng Shou <shoubaineng@gmail.com>, Sumit Semwal
	 <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Akash Goel <akash.goel@arm.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 29 Jun 2026 12:16:02 +0200
In-Reply-To: <349ada65-c788-4c5e-9992-0278cf1382dd@amd.com>
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
	 <becd29b5-9e40-4104-b6c9-3d91e2ddddff@amd.com>
	 <058f4bb261e408cf17deca9ff7354460675eacbf.camel@mailbox.org>
	 <66344c20-ea97-4dfa-ac42-c9d6e061eb95@amd.com>
	 <7dc78d8ae9903c215ec492ee39b27cc504da8307.camel@mailbox.org>
	 <349ada65-c788-4c5e-9992-0278cf1382dd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a61e13d958b385de307
X-MBO-RS-META: zr99d7yz1wiidqwq7p49y3w987uhfuxh
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65892-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:tursulin@ursulin.net,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0522D6D8D24

On Mon, 2026-06-29 at 11:52 +0200, Christian K=C3=B6nig wrote:
> On 6/29/26 11:06, Philipp Stanner wrote:
> > On Mon, 2026-06-29 at 10:52 +0200, Christian K=C3=B6nig wrote:
> > > On 6/29/26 10:49, Philipp Stanner wrote:
> > > > >=20
> > > > > I will add a CC stable before pushing to drm-misc-fixes.
> > > >=20
> > > > No offense intended or taken, but don't the DRM rules say that
> > > > things
> > > > do not get merged while there are outstanding concerns or
> > > > significant
> > > > points in review feedback?
> > >=20
> > > I haven't seen that before writing the response.
> > >=20
> > > I usually go over my mails till the end and wait a couple of
> > > hours before pushing anything.
> > >=20
> > > > What about my comments?
> > >=20
> > > Looks valid to me as well, but I think that is a separate issue.
> >=20
> > But if we keep it an integer for now, and if that check is added,
> > and
> > it most certainly should also catch negative integers, shouldn't
> > it?
>=20
> Maybe with a WARN_ON(), but not as regular code path.
>=20
> The thing is I think we need to backport this fix to stable kernels,
> but switching from signed to unsigned is only a minor cleanup when no
> real users are currently affected.

Fine by me.

P.

