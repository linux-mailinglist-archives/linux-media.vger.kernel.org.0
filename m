Return-Path: <linux-media+bounces-52437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGcnDGMNimkQGAAAu9opvQ
	(envelope-from <linux-media+bounces-52437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:37:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 950EF112926
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C71D302B53A
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 16:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C306A3816F6;
	Mon,  9 Feb 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b="lNshjayT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A1381703
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655043; cv=none; b=jD5o+Q2Jgx9xXSuVtRYRd6l/Xan8sHa8KktkVU08O0ZbhIJUZbeKjfrE5V69zNa5dyG4umCr729GepUG31OFTvC/g8kJgIVArIlkHY0JOAqMvr5Z+YNw9q514HMjsCKnPhXrJc0z8Qwt/t3aC+fCe+hbknM6v/ILNEB/XgyuYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655043; c=relaxed/simple;
	bh=ZpCIh3YmGM2PQaY5i03xa2LMNqp/dOnAKuJCxZJjJ/M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkLVQpSDEGVzxOnF3IRte7SloOBueyRfPkYMefOzqXF+DIM641oZ6nqOzUKTC/+r1PrIOUF7pndAxJaR8YhigmD8NULPNRllqhurZnHWpmFZ1nrNuOLMsX9UNctg4/4ped4SJVTTv6aS/PUG9PtvCISKg67OoBbOdRwT8mh9pSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com; spf=pass smtp.mailfrom=ohxorud.com; dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b=lNshjayT; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ohxorud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohxorud.com;
	s=protonmail3; t=1770655033; x=1770914233;
	bh=ZpCIh3YmGM2PQaY5i03xa2LMNqp/dOnAKuJCxZJjJ/M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lNshjayTFFf6UyHyTJyd6E15DgJpCUVc21lPOTMcrfPq4KFE5C2NoDROkNCC6Twfu
	 tE9UWnIerV0rEN7BdiBgpW5uuvH34PwjJlEQJeYKwrwQWcTwtbEkmUK5lZK5hTBlzk
	 RYgwu17EpWTT8O0KXFxha71eDykhDlmq9PcRj3cOqgoYxaqZVuL2qeyzvm12hsJVmU
	 Tzxgimt29O2Y9niiDyQSyOtL+dAioAsmKDL+6p2Hi8m3YHkxDgeAZPZogr+zDrFKK9
	 U4cAwRWhZPA+ofv8CePAOqypO1YY2EPFatXFkQFDKUTEgYa+VCFUNcZY4ml64yVtSt
	 xZ14JdovOBXWw==
Date: Mon, 09 Feb 2026 16:37:09 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Taekyung Oh <ohxorud@ohxorud.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: fix block comment style in ov2722.h
Message-ID: <5isyX-KyGZ3-LVeiuUnlFG1AlQlIYH5xLLULPByi_RrZJyVnxeqzFLjhvbZ2igz4R8Oh-YoaRWfFlmg0co_9jzENT_JJe6b_HOYdjYoh6X4=@ohxorud.com>
In-Reply-To: <2026020950-pacific-concur-9b99@gregkh>
References: <20260209045514.40352-1-ohxorud@ohxorud.com> <20260209045514.40352-2-ohxorud@ohxorud.com> <2026020950-pacific-concur-9b99@gregkh>
Feedback-ID: 133357498:user:proton
X-Pm-Message-ID: 28c1e6efa9a85965f578a213725c6c77a70c49f2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ohxorud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ohxorud.com:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52437-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ohxorud.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ohxorud@ohxorud.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ohxorud.com:mid,ohxorud.com:dkim,ohxorud.com:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 950EF112926
X-Rspamd-Action: no action

On Monday, February 9th, 2026 at 1:47 AM, Greg Kroah-Hartman <gregkh@linuxf=
oundation.org> wrote:
> > Fix coding style warnings reported by checkpatch.pl.
> > Move the comments above the corresponding code lines.
> >=20
> > Signed-off-by: Taekyung Oh ohxorud@ohxorud.com
> > ---
> > drivers/staging/media/atomisp/i2c/ov2722.h | 12 ++++++------
> > 1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/stagi=
ng/media/atomisp/i2c/ov2722.h
> > index 00317d105..c69f0086c 100644
> > --- a/drivers/staging/media/atomisp/i2c/ov2722.h
> > +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
> > @@ -566,8 +566,8 @@ static const struct ov2722_reg ov2722_VGA_30fps[] =
=3D {
> > #endif
> >=20
> > static const struct ov2722_reg ov2722_1632_1092_30fps[] =3D {
> > - {OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
> > - a whole frame complete.(vblank) /
> > + / For stand wait for a whole frame complete.(vblank) */
> > + {OV2722_8BIT, 0x3021, 0x03},
>=20
>=20
> You now added a different coding style warning :(

Sorry, I made silly mistake as it's my first contribution to Linux.
I will fix tab style and send v2 shortly.

