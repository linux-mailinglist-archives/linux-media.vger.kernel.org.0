Return-Path: <linux-media+bounces-52368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON82IOxoiWks8gQAu9opvQ
	(envelope-from <linux-media+bounces-52368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:56:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D803F10BA4D
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DA563006795
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 04:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D380923314B;
	Mon,  9 Feb 2026 04:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b="LjCa8K3l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8444A1FE44B;
	Mon,  9 Feb 2026 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612960; cv=none; b=QWzSogIjr3ACfgBrbIQXVtksNCQcrDuYODDt9BakKBvMDLAZXe3G0/28+rNtqUL6uisTKjqBQWDmEa1i3+aBm7Mprsy9ilO8BOiSpbifLpGnp1ArdiGAs84LT0y7WNpMgmD9hzftVGqllrpPR8D74eLLB8jpMeXKXvv3GUWva4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612960; c=relaxed/simple;
	bh=1nyS7lbXnHgai1A+sIgXovx2mevnkD41RjmQtUQ01uk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nafM5OqndeKwT+IiFtvRYatWoDsLUgWY6kb7sDkKap5hkCuIQHw9t/T6iYj8eKnSdOiJm3s+8DLzYVvxKDW0Fd2CawZcbojQebXmdOIzwDULagSQQG/fK3Ab5JWuF09KYlJVMvsRPe3nLa1WYm1zgFhT/6dLD5rniPKPIdIJ/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com; spf=pass smtp.mailfrom=ohxorud.com; dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b=LjCa8K3l; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ohxorud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohxorud.com;
	s=protonmail3; t=1770612949; x=1770872149;
	bh=ajz/J67SYGZtvvatvCFt61byHAfVGF/M2f3Jg6Efk3I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LjCa8K3lrWC+ZYlV0jmoOY9SpTMVkVCBE6I4tlE1hM9EezxSusenuCmLbT8XaPRTo
	 r0MaS5rwUDwq9MIerWaPkVURsFHJ5RDUlYBd7x9VgIwI++7oegwdrDVD+SzvG5nbtr
	 6bkPx9yPdogTEipBYMlu5UE+h29qfcW0yRJyzPMsOJoGTx1/pWeIhSsPW0fsiGSeh+
	 AjqUcBZjaoWys0s4yTJdOCeYLUiyp2XzJEtDtCzsm8Z29ICFLilIW9NLNO0cVliapV
	 HP++2cII09HyrVpnGSNCQorCpE1WfNh5ivCCwYXXgs1ec30oep9J3DFYwkdayMke4s
	 EtFBZl+S/DyUQ==
Date: Mon, 09 Feb 2026 04:55:46 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
From: Taekyung Oh <ohxorud@ohxorud.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Taekyung Oh <ohxorud@ohxorud.com>
Subject: [PATCH 0/2] staging: media: atomisp: cleanup ov2722.h driver
Message-ID: <20260209045514.40352-1-ohxorud@ohxorud.com>
Feedback-ID: 133357498:user:proton
X-Pm-Message-ID: 76bf0fbbbec20355906d96a6064303f9a1a092c0
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ohxorud.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ohxorud.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52368-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ohxorud.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ohxorud@ohxorud.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: D803F10BA4D
X-Rspamd-Action: no action

This patch cleans up the ov2722 driver in atomisp staging.
Both patches fix warnings reported by checkpatch.pl.

Patch 1 fixes block comments coding style warnings.
Patch 2 removes unused code blocks enclosed in #if 0.

Taekyung Oh (2):
  staging: media: atomisp: fix block comment style in ov2722.h
  staging: media: atomisp: remove dead code in ov2722.h

 drivers/staging/media/atomisp/i2c/ov2722.h | 649 +--------------------
 1 file changed, 6 insertions(+), 643 deletions(-)

--=20
2.50.1 (Apple Git-155)



