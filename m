Return-Path: <linux-media+bounces-63122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAn8AnzNGmoh9AgAu9opvQ
	(envelope-from <linux-media+bounces-63122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:43:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264560C97B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA8FF300EA8D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FCB3AC0F2;
	Sat, 30 May 2026 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iu+PCqve"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044913A1A2D
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141346; cv=none; b=MrqXDSklccgx/9I6oq3yIqJX0zVz0Dg6DdpMREQr5PVvJEmK57/iaI3Vy7ZcSHTD6C3bQ69QN5JGoxkLVroxzGX+VVtwr++UFt5ZTdN42MV8+FA4iaNv6kACH8I7XaniVg7NVb1t4PHo9f+0G0burplia2scn4gqSQ/8YzS2BeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141346; c=relaxed/simple;
	bh=5vKhU6AGNPRsq1s15Xrr7B3P7JnL8Yy9GQqTCMk7h1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TlRk8KmD5W8UN6UpnITGaq/89vwvYtEGyTzTj9AG1W/nIJc9BBBBpJ10tl6+/61I9dUiwpjgzTcrulOgElvDIgZDGeaXiZmf29x/S2XUeNmf7xv908Kfzetk6F4ecCGYQF76LT4oq70ACADu2qH6LdUEXCUkp9XPAXdEECbKvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iu+PCqve; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869391F00893;
	Sat, 30 May 2026 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141345;
	bh=vHfte9aMNawBk1O55qvMKvcqr54H5dQ/ifVN2V4t2L0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iu+PCqvedrENdQHElt5fljh7Z7yCtqfJpcIht5VRlIzT1aWse5wJHX+zBUTNYpadn
	 vBj0rw8edAxp9zJfKBaDv6KzU4BuyXZUbahJ8K/b8dvS1HM+sqJ30AEHGWRj2/V1/0
	 tD8aQccZ4By3Tv7iJXSapGa6KnKOCdTjpgGd/mQNvG2Oi/lLXjyp1qq6LRh7Eh72iQ
	 a7KguvKAP3nudXfw5WceuQRTalMc9Z0DgE2i2I8xhol3OQF78oE6X35z63kS1Ho8rp
	 hwmTU+S7pyszFdWa16judqL2cJI0BHoSV2jt2XbgoEuw9ivVJ4976crFVMvnYgfaCG
	 AUSN9kihv4Dig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] [TEST] add a broken patch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org>
References: <9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 11:42:25 +0000
Message-Id: <20260530114225.869391F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63122-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6264560C97B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Intentional compilation breakage via an invalid syntax token at glo=
bal scope.
--

commit d87fbaaa0dc34bb42824653229b401ea3e07a379
Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

add a broken patch

This commit introduces a compilation regression for the stated purpose of
testing patchwork. It adds a bare identifier to the global scope of
sh_css.c.

> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging=
/media/atomisp/pci/sh_css.c
> index 6cda5925fa45e..0e62b6d8161e4 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -88,6 +88,9 @@
> =20
>  struct sh_css my_css;
> =20
> +FOOBAR_SYNTAX_BREAK_BY_PURPOSE

[Severity: Low]
Does this bare identifier introduce a compilation regression? Placing an
undeclared token at the top level of the C file prevents the file from
compiling.

> +
> +
>  int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) =3D =
NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/9050789262f583cef77=
7eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org?part=3D1

