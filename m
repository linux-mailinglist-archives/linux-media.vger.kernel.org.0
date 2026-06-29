Return-Path: <linux-media+bounces-65880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gQKlNZw2Qmqv1wkAu9opvQ
	(envelope-from <linux-media+bounces-65880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:10:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23A6D7E51
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:10:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=k6LBd3yF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65880-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65880-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4BF83034B30
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C123F3F8883;
	Mon, 29 Jun 2026 09:06:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B12F872;
	Mon, 29 Jun 2026 09:06:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723992; cv=none; b=t9iqBb471c6zuiQZ48/gndPZSzp9WZaq2Qrl/TgvvOQq/c1sprgYsAxWMNyw9sHFo3ebFOdgtprC0PGMWh23QwaAqwHWyvixLHxB+Fn2xGA3us7oqoXATpq69xx9Ff8kkYCKLPuZSzCSKXWIGAMiDSccsPB5+1wlJN2rB5ZcMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723992; c=relaxed/simple;
	bh=+5DbOdCREXrMOWTs8JUDBnSvw6WHxdCc8/FhJoU4pkA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lmQcW3e1T2o5BVf+pqMzwTGuVoJSbH7Yh3ZYXWpOQpOUwdxNSXq/xeqT21MaHXb2yiIENqYLoopoyQTle52Zogmd8b27/psL3KSm9jvjgXMjvxsJpZNdalp6jGQunNJWQAh5umAC5bQ1Hy8uOaCNPR0MX2h2DCbvxeUFyA0tGP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=k6LBd3yF; arc=none smtp.client-ip=80.241.56.161
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gpgPZ2Y2Jz9try;
	Mon, 29 Jun 2026 11:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782723986; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5DbOdCREXrMOWTs8JUDBnSvw6WHxdCc8/FhJoU4pkA=;
	b=k6LBd3yF3Cnq4MQdQc4I+O4WCdw+y7Noqxao+VzjtYi9OYQ7XW+2HvjGqcRVJHoVhmLcLc
	s3f/wRe0eJmN96EjhPw1DUomwvvHCZp9E29MDxZJGXjRduvgqpZmDIYGpED0MHzlp28kzq
	sWzDf/9h6tcOGRsWGi95XWpN/DHtGbuRxSXnOUtWgHmSLUHbth47Y6lCTVQizyutGmTqBZ
	zzmkABTINM7ROXl2HyKnQeCjpT5/UZ14ebvsqlbd7vW3fJwKCs1y7Q16CANb7SxjrDlZjT
	C5FMk0+KCbADbCzC5PRtEmUQmFqwwGEJDRkMh/I2fRYCS3JdwRS43uAxcBxtmQ==
Message-ID: <7dc78d8ae9903c215ec492ee39b27cc504da8307.camel@mailbox.org>
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
Date: Mon, 29 Jun 2026 11:06:22 +0200
In-Reply-To: <66344c20-ea97-4dfa-ac42-c9d6e061eb95@amd.com>
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
	 <becd29b5-9e40-4104-b6c9-3d91e2ddddff@amd.com>
	 <058f4bb261e408cf17deca9ff7354460675eacbf.camel@mailbox.org>
	 <66344c20-ea97-4dfa-ac42-c9d6e061eb95@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: cfpbhpfazfnp163f3j9gh77ehdtgq5zb
X-MBO-RS-ID: 2e7c4b9ff8e2908180c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65880-lists,linux-media=lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D23A6D7E51

On Mon, 2026-06-29 at 10:52 +0200, Christian K=C3=B6nig wrote:
> On 6/29/26 10:49, Philipp Stanner wrote:
> > >=20
> > > I will add a CC stable before pushing to drm-misc-fixes.
> >=20
> > No offense intended or taken, but don't the DRM rules say that things
> > do not get merged while there are outstanding concerns or significant
> > points in review feedback?
>=20
> I haven't seen that before writing the response.
>=20
> I usually go over my mails till the end and wait a couple of hours before=
 pushing anything.
>=20
> > What about my comments?
>=20
> Looks valid to me as well, but I think that is a separate issue.

But if we keep it an integer for now, and if that check is added, and
it most certainly should also catch negative integers, shouldn't it?

P.

