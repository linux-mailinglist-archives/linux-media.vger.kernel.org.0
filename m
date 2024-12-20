Return-Path: <linux-media+bounces-23960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4491D9F9A0D
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 20:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E8716779B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 19:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6AA21E0A8;
	Fri, 20 Dec 2024 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="Zrna1Mh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED01632DD
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722069; cv=none; b=J8rCGEJk25edWVDUbkvt1wfSHRMR1HgYADsIz6/b/fcRZyGTd3qzymwRLOfIC0bzphLp51CdpL+2dQwAx3U3GXCTTvkjYg+Wmn4FZWaCeRJVzyq0vuvs6sHf3dMKBhvfy3GbmqNCEjLs9VgDS+SkkC6p3Ugy0GpDDZ7AtsxAUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722069; c=relaxed/simple;
	bh=cCI3OGh2kM/Tsgpn5nUHtDuLnkRtqiujpeRTILbsZ6Q=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=XpP1LI/FHgsR6FQeZl003kjkZ6JTdUPYn7NeaNgbY3VQ71kBrCqBHJy07lZOvRpUZ7heLxrlqI2L0wOZDDDSpsWDqkpyTJzokpCyy0Fg3LT7USQey2IAsAr0EDMcoO1wnDwReb7H+jvCrLbHGifuWeJIy6013NxLeUdB5Xn+F5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr; spf=pass smtp.mailfrom=emersion.fr; dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b=Zrna1Mh5; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=emersion.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emersion.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1734722057; x=1734981257;
	bh=X+5sjLzByJca3Q9CuTgIGKL1HjKEpjNQOJo9t0nvVQM=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Zrna1Mh5KnoEzZqVc2EjLbDjRcYNvsU2YU6q0CHUMEiY9jVNxz6TcR1ttxJZO7s6z
	 ax4wCdzdbolw17lVVwOazGIFaJvNREsIiSzKVB+PIve7iREiUzwbap3LG7uEG2OQ5b
	 dfTErEpBwOqH413jhQk6SvZJpm27BKLaIzPPHi41VpCpARGLQ2UYKbTka8QxjIdqHi
	 UWdSf9NoPlVThAzKRA7xKEY08ZXSj5JtwWYXJOm9m358sjQoPw+WsKUrSJHTF8dwWi
	 4p8/KRgWzrdjr1OLMBa7Aum/Wrs2KXnOEmhSTciIR+I9HY1P9gYbNK4Wu7vFXIO/sm
	 YNQxiAE25alMA==
Date: Fri, 20 Dec 2024 19:14:10 +0000
To: linux-media@vger.kernel.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v4l-utils] edid-decode: use override_find_program() to ease subproject use
Message-ID: <20241220191402.10699-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 6d214ace618dca8bdda23546312b9cbec5c49f71
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following will work when edid-decode is used as a subproject:

    subproject('edid-decode')
    edid_decode =3D find_program('edid-decode')

This got lost in the v4l-utils migration.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 utils/edid-decode/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/edid-decode/meson.build b/utils/edid-decode/meson.build
index c2ddd9583795..807d4e873c05 100644
--- a/utils/edid-decode/meson.build
+++ b/utils/edid-decode/meson.build
@@ -25,4 +25,6 @@ edid_decode =3D executable(
 =09install: true,
 )
=20
+meson.override_find_program('edid-decode', edid_decode)
+
 man_pages +=3D [[ meson.current_source_dir(), 'edid-decode', 1 ]]
--=20
2.47.1



