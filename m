Return-Path: <linux-media+bounces-56383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N6tNB1hvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:48:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 345502D25F5
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A3F131F56B4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12CA34C80D;
	Thu, 19 Mar 2026 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QTKLQJCO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC716322A1F
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952974; cv=none; b=h9mNF3wIZuBvx/V6e3BXjpdXmt5QjGCGLzqUWHrk9FHrc/DWy0s/uLhr2j+Tjwkni85IeB+/r3hLE4XtVT5sKIkska/BwoinT19FN1ecN780CmaMuQMQNVrWPJRZGB8MeImMPH2e0r2GMDZwsvRjdlOuVojF3WmL+HwJuv0yNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952974; c=relaxed/simple;
	bh=4hf+2P9AGl/IybtiW3qOGbmO4Ni/rutnBaEKskRIDZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcWV8HlJzouqmkzx5TLuwgSRcscMB1NnnheLvdHQGZwvmR08KQJbpfn2OuJN0nJYi+F/nmTsOHKHRwMHdCkidtpCcfC8oXBHmtqS25KUn88G4Hy9Xla6SNoQ/IIfZ5XNlOKQVXAK35+xQ/V/unoZ7teSzTY4iBhUJXTk4wA3O4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=QTKLQJCO; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773952970; x=1774212170;
	bh=4hf+2P9AGl/IybtiW3qOGbmO4Ni/rutnBaEKskRIDZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QTKLQJCOUXsaDk7m4yVsKOxnusyMzvDQVaQVnNPW8OnXsu/J4/kklRG0kY2BJ5jja
	 4Oqp0ZomnxwebxYa8CcECxTW0aADeNfOrqaEm1n5LsA3TEA7VOdIwWY7bVHGNX4Fnj
	 KKQyl1sm4CkOcfWDjnrlqy5B5pwlXp76IxdSR2SlEXY5bGcEsGjEvdymrK7qjlhXXO
	 Gbx/0KLUJZhTri6fbgPG6JbHADGvdUglsNJuTNEvurtxDVwW2aiGBDSrcFdCvqFTP3
	 fOxrFXdhG+Yfav4RnT0u+OW4eZS27wVDqcOwq2LaLnr8epZQHZw2086QOuHHYlgxtv
	 Nx7+cUF8V2Dpg==
Date: Thu, 19 Mar 2026 20:42:47 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH v2] staging: media: atomisp: gc2235: prefer usleep_range over msleep
Message-ID: <20260319204242.2076191-1-abhai@protonmail.com>
In-Reply-To: <20260318212645.2014561-1-abhai@protonmail.com>
References: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: eb295a95d2e1e12abb5a57bc683bf2657fdde502
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56383-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	NEURAL_HAM(-0.00)[-0.916];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhai@protonmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: 345502D25F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gc2235 driver uses msleep(5) during power-up. msleep() is often
imprecise for durations under 20ms. Replace it with usleep_range()
to provide better precision.

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09usleep_range(5000, 6000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0



