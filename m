Return-Path: <linux-media+bounces-59241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJtxFrDV52nTBQIAu9opvQ
	(envelope-from <linux-media+bounces-59241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 21:53:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25B43F1C0
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 21:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A264B3068EE4
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61B22773F0;
	Tue, 21 Apr 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ojw21miq"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B03178372;
	Tue, 21 Apr 2026 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801045; cv=none; b=pZ4uk6N6xJsZr24G5UcsBSSqcon6Vjjzd+BzamrXqMYpKpuDznmTO3tH8uhNfc2/wcLyZmzhevQ8qYhjMNw4J99ul0QgrdMLCF6Lp3+VUsaD55eh+wNKM+CdX4aCJYzjmlOB2KLQWTTaDnZWWb+Tyh7yS4NPhLtKLKNHWkJMwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801045; c=relaxed/simple;
	bh=WCjWSSIZbA4XEQuOH5MeUsG+YjOq0+1NceVLCuMx9rA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bylZLlL8e+FOKTDdyNDghoJ/ZNIyyALkW6BCEPZRmwk5OGylnWj5+VGLkFuiaB56nzwBH61+oW29fPwfIUr3yd2nnCO7vd4zrgLuv1IN12S6wehIN2Y4GalsS31VCdHzHYaWTFEycbMtMzXq3Bn8cPm3LMiz4HucXGxh2TPdfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ojw21miq; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g0Xyl3Jg8z9tkN;
	Tue, 21 Apr 2026 21:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776801039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCjWSSIZbA4XEQuOH5MeUsG+YjOq0+1NceVLCuMx9rA=;
	b=Ojw21miqs8FzWgLIMJ4vgrHZMwCxxXTrILZb4XsZkxtpyvb3fJ/+EBJO2gQw9rRpqUswuV
	mhO3KP0pHGeSllyCHNCqAAqQKAxWhLhLHZar/9NQ/s7QwP4BvLmrGALf6Uq2dEhTAlfpPB
	TwsZq+gdSnnUCdJ7tJjZS7gh8dyu9pHZUCGnIvjGgefM2OhNSXqIHR7g2CZMMy02RLhK1b
	L7Mbyn3iRK0ux+YdzJ4KTq8nk0R97KNdRgVkxPc96sGqOqSqSVlU94T8UXfntorpNNzvJq
	8Pv/+ovu7c/TR4WPHmTkAIFcoXprzbrJbB5hCkxMve8kYAXfKPYZntKn780JCQ==
Message-ID: <f1bf7387d578ce4d52ad3830a5c9d9e4ceb86b62.camel@mailbox.org>
Subject: Re: [PATCH v2 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
From: Manuel Ebner <manuelebner@mailbox.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>,  linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org,  linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 21 Apr 2026 21:50:34 +0200
In-Reply-To: <aefPCV4ZvrnrCmoH@casper.infradead.org>
References: <20260421175516.224960-2-manuelebner@mailbox.org>
	 <20260421180200.225244-2-manuelebner@mailbox.org>
	 <aefPCV4ZvrnrCmoH@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: y6krjg6cqr7f8bgpz3k5aesy41yx81y6
X-MBO-RS-ID: 9292af9b2e0ed599f04
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59241-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD25B43F1C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-04-21 at 20:24 +0100, Matthew Wilcox wrote:
> On Tue, Apr 21, 2026 at 08:01:58PM +0200, Manuel Ebner wrote:
> > +++ b/Documentation/core-api/memory-allocation.rst
> > @@ -135,7 +135,7 @@ Selecting memory allocator
> > =C2=A0The most straightforward way to allocate memory is to use a funct=
ion
> > =C2=A0from the kmalloc() family. And, to be on the safe side it's best =
to use
> > =C2=A0routines that set memory to zero, like kzalloc(). If you need to
> > -allocate memory for an array, there are kmalloc_array() and kcalloc()
> > +allocate memory for an array, there are kmalloc_objs() and kzalloc_obj=
s()
> > =C2=A0helpers. The helpers struct_size(), array_size() and array3_size(=
) can
> > =C2=A0be used to safely calculate object sizes without overflowing.
>=20
> This seems to have been done without any thought.=C2=A0 kmalloc_array() s=
till
> exists and has over 500 callers.=C2=A0 It should not be de-documented.

you are right

> > @@ -151,7 +151,7 @@ sizes, the alignment is guaranteed to be at least t=
he
> > largest power-of-two
> > =C2=A0divisor of the size.
> > =C2=A0
> > =C2=A0Chunks allocated with kmalloc() can be resized with krealloc(). S=
imilarly
> > -to kmalloc_array(): a helper for resizing arrays is provided in the fo=
rm of
> > +to kmalloc_objs(): a helper for resizing arrays is provided in the for=
m of
> > =C2=A0krealloc_array().
>=20
> Think about why this is wrong too.

i see now.

> And you should have cc'd linux-mm on this.

will add in [v3]

thanks,

manuel


