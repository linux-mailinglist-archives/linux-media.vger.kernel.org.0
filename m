Return-Path: <linux-media+bounces-60195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL91OUNu92nYhgIAu9opvQ
	(envelope-from <linux-media+bounces-60195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:48:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05B4B6516
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A7893007964
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9603B2FD0;
	Sun,  3 May 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pPCc8QTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA93B397E8E;
	Sun,  3 May 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823289; cv=none; b=fIJ5COxoKUvCcKBc4zwFDfO5L2d0SD02M5x5zecnTV2n6evd/KzxvmH756MkWPt/GCU0lubKe7eY5BOXePruUrgdkSScbc74C3TU/Lftknh+kwJD46LomfwNQsljwqKBRrdYEZyFRikpxoiH+ZjuddRVMIPsgWv81S1hWlXMdNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823289; c=relaxed/simple;
	bh=KMvULQt26Z7JUeaeAaMxQ2terk0U68wuEmxDC9UqF6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRWwfI7pKlnAqnC//K7Wa4DhJH0M9IrqSpvpRzXEBf7c7qFWbHN58LUu/4HqhEAKV/MXYqfw8ATdld83c5Htly5MI6qnUrdwoqffalUCslUx8UF3DuMUnwMVonUSzK7qyB5bLojWgVuLu3MHqZKVPplxxK+IgpLHiDVo1v2zODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pPCc8QTw; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7q1H3GKpz9tKb;
	Sun,  3 May 2026 17:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777823283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoJ22uoHPxO/Fiuqw0BQb106Foyun4Y6/eKPYRUL254=;
	b=pPCc8QTwbHGBtpyOcgiepxODTyt5c03iNTyFiVidzF17rpDgE+prPLl06qbUcWimYLdgov
	p8wRU9+QPhUgz3db/co19ImRiwrtzsxOAmSRhf8T6ixwsI0qjl5NC2q6M/XB8wbZvlca4L
	LGh+cd2NXlbO5g5sPPxONm/p3J0MkZXjdk1xmHl64hKZ5AzRiLOCdhlfK4AooanboFwp5S
	lxtykgi+z5HOGvYM6qzCCgxwPys+uZEczX/QVpCVhL/VhrIBav5WglJ3E2FwZd6uEKo7wD
	BW79SH9nFDPO/1050XrE9EciwVqsyoqHauQwl1eI7MvRlki4gHwN52lh1V9Esg==
Message-ID: <df48beafcb0cc9caff40db78285113f0b1bd9b87.camel@mailbox.org>
Subject: Re: [PATCH v4 0/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
 linux-sound@vger.kernel.org, rcu@vger.kernel.org,
 linux-media@vger.kernel.org,  linux-mm@kvack.org
Date: Sun, 03 May 2026 17:47:57 +0200
In-Reply-To: <87o6iwczjm.fsf@trenco.lwn.net>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
	 <87o6iwczjm.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 795585f96704e0164ab
X-MBO-RS-META: rsbayzutnfjqyda4tz9cmg9m847bfsut
X-Rspamd-Queue-Id: 9F05B4B6516
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60195-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]

On Sun, 2026-05-03 at 08:56 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
>=20
> > Update the documentation to reflect new type-aware kmalloc-family as
> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> > and family")
>=20
> OK, I have applied this series.=C2=A0 While doing so, I restored the "gfp=
"
> parameter in the changelog portion where it had been mistakenly removed.

That's good, thanks.
I had two more changes lined up for v5 of this series:

-	ptr =3D kmalloc(sizeof(struct foo, gfp);
+	ptr =3D kmalloc(sizeof(struct foo), gfp);

and=20

-The argument gfp is optional, the default value is GFP_KERNEL.
+The argument `gfp` is optional, the default value is `GFP_KERNEL`.

I don't know how to go forward with this.
please advice

Thanks
 Manuel

> Thanks,
>=20
> jon




