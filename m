Return-Path: <linux-media+bounces-52439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBCjEBYSimlrGAAAu9opvQ
	(envelope-from <linux-media+bounces-52439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:57:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BD112C4F
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0888330067AC
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 16:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D679137FF59;
	Mon,  9 Feb 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b="ofrkTQMu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AFA1DFD96;
	Mon,  9 Feb 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656269; cv=none; b=LGXC2gq4Ds9GBR4y8jn3Cuo7qXKtIqqlifm7qmb9GY6qH4WW6Tdf9YkHt4+xZmwgpJEsGIzhrg4ssHB6nwmsaaYOx07Xr6cHnaJhWwRsxWW6BKe9gWSX9CpKP0MhR9kgPfOnCGQZKurdVv4TaolPrsaWDPC7frmL5WtlL425t7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656269; c=relaxed/simple;
	bh=xRD+tuTTS9Fhaqc906Jzq1ctEFHwQc/CP4chJ9C7qxk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aHBFyzjVbmcbWp1hpvMY0ykIUBD0E7nnLX+x5Z8XcEonGOwXbFp/Y9FyUTD025L1EJmAdF+joY8DDsU23+h6dhj/bOK/Zz9vlNAcEEmnMgFfOA2vxIyr/FdHzb0f1/ZFjCouj4zc4+SqqAp/a0rGr4KUd5IXXckphSuGOsuW9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com; spf=pass smtp.mailfrom=ohxorud.com; dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b=ofrkTQMu; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ohxorud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohxorud.com;
	s=protonmail3; t=1770656260; x=1770915460;
	bh=xRD+tuTTS9Fhaqc906Jzq1ctEFHwQc/CP4chJ9C7qxk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ofrkTQMu7bPiHKltQXD0jxRR4s5yOrUQyyhpuWAliDucC8ZpQT1CwxtNGyWqSgXoi
	 D4YM+94jcwOIQXvTUJ29kCuEqhoXIB2FsvPxGVj9hiJKq+VpJCVFqdkrs5MH0fsUUM
	 PjIGazuppiLxLvQyZtffcuuZfbelLgLsfPrS7eoNpbMbQHxwBDYx3HU6Ec0ukXe6Ny
	 uZ5yRw7A0L3H/ELsbQ/Gmkv9JLPSN0QMoUQAR+DJJVIqmsqpwhQEpAoFpw/d9IIbed
	 zBugKroJGZpvR7kHnBsIY5axuNT+chAz/t3IswZe2+h068KjCrfNpXEufwnAAYm+6E
	 rWe9Er0L77VVA==
Date: Mon, 09 Feb 2026 16:57:34 +0000
To: hansg@kernel.org, mchehab@kernel.org
From: Taekyung Oh <ohxorud@ohxorud.com>
Cc: sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Taekyung Oh <ohxorud@ohxorud.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: Fix block comment style in ov2722.h
Message-ID: <20260209165727.72957-1-ohxorud@ohxorud.com>
Feedback-ID: 133357498:user:proton
X-Pm-Message-ID: c147b0e0f93543816071b29c8a35171aabbad07d
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ohxorud.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ohxorud.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52439-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ohxorud@ohxorud.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ohxorud.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ohxorud.com:mid,ohxorud.com:dkim,ohxorud.com:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: B33BD112C4F
X-Rspamd-Action: no action

Fix coding style warnings reported by checkpatch.pl.
Move the comments above the corresponding code lines to align with guidelin=
e.

Signed-off-by: Taekyung Oh <ohxorud@ohxorud.com>
---
 drivers/staging/media/atomisp/i2c/ov2722.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/m=
edia/atomisp/i2c/ov2722.h
index 00317d105..b67c26dca 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -566,8 +566,8 @@ static const struct ov2722_reg ov2722_VGA_30fps[] =3D {
 #endif
=20
 static const struct ov2722_reg ov2722_1632_1092_30fps[] =3D {
-=09{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
-=09=09=09=09a whole frame complete.(vblank) */
+=09/* For stand wait for a whole frame complete.(vblank) */
+=09{OV2722_8BIT, 0x3021, 0x03},
 =09{OV2722_8BIT, 0x3718, 0x10},
 =09{OV2722_8BIT, 0x3702, 0x24},
 =09{OV2722_8BIT, 0x373a, 0x60},
@@ -668,8 +668,8 @@ static const struct ov2722_reg ov2722_1632_1092_30fps[]=
 =3D {
 };
=20
 static const struct ov2722_reg ov2722_1452_1092_30fps[] =3D {
-=09{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
-=09=09=09=09a whole frame complete.(vblank) */
+=09/* For stand wait for a whole frame complete.(vblank) */
+=09{OV2722_8BIT, 0x3021, 0x03},
 =09{OV2722_8BIT, 0x3718, 0x10},
 =09{OV2722_8BIT, 0x3702, 0x24},
 =09{OV2722_8BIT, 0x373a, 0x60},
@@ -878,8 +878,8 @@ static const struct ov2722_reg ov2722_1M3_30fps[] =3D {
 #endif
=20
 static const struct ov2722_reg ov2722_1080p_30fps[] =3D {
-=09{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for a whole
-=09=09=09=09=09frame complete.(vblank) */
+=09/* For stand wait for a whole frame complete.(vblank) */
+=09{OV2722_8BIT, 0x3021, 0x03},
 =09{OV2722_8BIT, 0x3718, 0x10},
 =09{OV2722_8BIT, 0x3702, 0x24},
 =09{OV2722_8BIT, 0x373a, 0x60},
--=20
2.50.1 (Apple Git-155)



