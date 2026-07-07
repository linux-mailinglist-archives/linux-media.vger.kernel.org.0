Return-Path: <linux-media+bounces-66896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AgudLhs0TWo5wgEAu9opvQ
	(envelope-from <linux-media+bounces-66896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:15:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFD71E30E
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:15:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="eVUupWY/";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66896-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66896-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 368F330174CB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1F0437876;
	Tue,  7 Jul 2026 17:15:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B69420876;
	Tue,  7 Jul 2026 17:15:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444502; cv=none; b=d+We3viVLSBh8nDpBdgH6CFpSZGtrDQGD2NcfTLAhg+FaMN3V4KvTznBb7aW2SMIZl0JI58tXj8SoXc9ZssEfEiQgDLYXd45HbPIr6FmvPsOgKUNyHzQuK3Zp7DRKE8IAny2sgyJglYJV5+n9psa93TNjIwQ18KBvICKMGtl8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444502; c=relaxed/simple;
	bh=JlPJkuFfNKkizmR2aoKw95+HeXemBamvQBSGiH2SaZM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HWM1ozHRv5WNLD77t5aqwm5x4Co+AjW6J0hEIVOxq8a5NUw9aAu6p5NLwYVGdxQGFrGgv+FcaqniB6czH7fX6xiktzsZtp+pCL/evOZ52TL2B0n7GSLkY7oacm69vmlg9y6c3P2iXT6Fhp4VbVYwMyCTPjuTAi+0+qCAcGanwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eVUupWY/; arc=none smtp.client-ip=80.241.56.161
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gvnsQ3NFVzKnb0;
	Tue, 07 Jul 2026 19:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783444490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sF1hONLMmDY9OkQWKEXIAboJjfp0ICifchOnedZQ5MY=;
	b=eVUupWY/ashB5sSisczxjLK/++KwWf16ZQK406T5bFsR67KnmOvlk0lPUKHsG/gbKzx5SA
	So1/0nLC+tab9eVngzcld1/HVD76IeN53TNmiEIoJ8QIUhUp6VYR6EhzRZ2tT7As+WqnJc
	+JSFaa7c2y9mJLqK/kUZ49efcGMmZ68nlCeIlHTpRjfKYPwFkShjkKWSlLoiOu38xeft8/
	4ahqvqNPYzgX3WO500nFJ24RFDyvgAJAmepicbvaQ73wCykxqlGdCZC1c8BJq1GaQj0As3
	huNalk3oI14VD5l5Y+xBKrD4A8o2VVJZIjX1p3sK28CRM0kInsl63/fJIzgNuQ==
Message-ID: <e90c54d7870c557a207904bb05108e9009eecb1d.camel@mailbox.org>
Subject: Re: Bad wrapping in some tables
From: Manuel Ebner <manuelebner@mailbox.org>
To: Daniel Lundberg Pedersen <dlp@qtec.com>, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org
Cc: Rito Rhymes <rito@ritovision.com>, Randy Dunlap <rdunlap@infradead.org>,
  Jonathan Corbet	 <corbet@lwn.net>
Date: Tue, 07 Jul 2026 19:14:46 +0200
In-Reply-To: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: xyqkrwgw6mu5pp85uci7d8u61ir1yg11
X-MBO-RS-ID: 0dc427f97734bacbd2f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,m:rito@ritovision.com,m:rdunlap@infradead.org,m:corbet@lwn.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66896-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAFFD71E30E

On Tue, 2026-07-07 at 18:39 +0200, Daniel Lundberg Pedersen wrote:
> I've noticed some bad wrapping happening in tables, seemingly only in the=
 Media
> docs, but that's also where I look the most, after v7.1.
>=20
> See:
>=20
> https://www.kernel.org/doc/html/v7.1/userspace-api/media/v4l/vidioc-creat=
e-bufs.html#c.V4L.v4l2_create_buffers
>=20
> Compared to:
>=20
> https://www.kernel.org/doc/html/v7.0/userspace-api/media/v4l/vidioc-creat=
e-bufs.html#c.V4L.v4l2_create_buffers
>=20
> Other tables have also changed, but they don't end up this bad, e.g:
>=20
> https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time=
-parameter-kgdbreboot
>=20
> I've bisected it to be f2679ac773899f5fdea0b68d5077eef5f88dfd42 that has =
caused the
> change

Well done.

Please use git commit description style:  commit f2679ac77389 ("docs: allow=
 inline
literals in paragraphs to wrap to prevent overflow")

I added the people involved in this patch to cc.

Thanks
 Manuel

> and I did try some quick changes to see if I could fix it for the
> tables, but I didn't get any positive results.
>=20
>=20
> Regards Daniel

