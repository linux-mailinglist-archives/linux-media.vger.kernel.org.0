Return-Path: <linux-media+bounces-34795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77924AD9D03
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 15:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C48067A8255
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 13:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0866E2D9EC2;
	Sat, 14 Jun 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iqewkEzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4FA2C08D4
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908711; cv=none; b=NfmSWovXnqHig2jMO72FFLX3fQVcoI0WMnP8RJgVV+VXLBsh7C08199ZoWvnzLe1mI4zoqyvv3K4/mguKCjFPiDxUZGF0FS13QEwKC+X67FpnNOpnVeslnfJPeOA9FhMqPwGp1zx0Rqzjn1kILd3U1Lf8boz7gyNDOBmKDfx3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908711; c=relaxed/simple;
	bh=EjvfJo5xjYxhNl+jLpVqVflioSO+Vn0SfETBDItfjT8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ES9ncRkbT+QatvlMeN7yV4Gpdq5SCzzx1qnxwKyoAeYYIOAptqHGbP1EvkLjvJxKFdRtiD8aWMtjpMO/pQH+O6w+pA3jlSrMRzSyeqS5ZxL7kplvcr13GC0ByI9ecnbXtV/uMChJqbMm0A0ocu2U+ks67b59FhxbZjuD+GlKJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=iqewkEzJ; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749908701; x=1750167901;
	bh=RDTQSNxzJFAvtckTdLi26nUN/GG01ZPWu5ySx2J7RPk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iqewkEzJedN2pOUU8V1QHm1pEgiDoQFTMv0i0+Wd7oEBw5PwJduwFX6qvIw0gDCVE
	 6hE740KwTLuwOyyWh7mTQZvJidoKCN7A3XRyQTIA3+aqIWgk0gEr2rI/8JdhfbVIzT
	 RxwcKkkEydLYJQzkvi2mWOQvbYA9yWzR8BBOHDAoIdow6P47kjHi6di/ZPQ1zHhjs4
	 m8HbMX3jAAho/fxMSNuctln8EmnHC703Evyho0lwzHFNQ85PlzOic67ukiNvVbEHXT
	 FMr6O/lgQTOQ8TD3+g0+3OaVRA/GXjgGp0FcB2auqpIEZjCLHrr1TgTtkNBKJ32Xdn
	 QmSUycBjybi3A==
Date: Sat, 14 Jun 2025 13:44:55 +0000
To: linux-media@vger.kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH v4l-utils] qv4l2: Fix video capture being transparent on Wayland
Message-ID: <20250614134354.674830-2-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 189fb1502e734f7c9c82db29201c39100afdaac0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When a non-alpha capture format is used, the default value of 0.0 causes
the capture to be transparent.

This issue is not apparent on X11 due to Qt not negotiating a format
with alpha by default.
---
 utils/qv4l2/capture-win-gl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/qv4l2/capture-win-gl.cpp b/utils/qv4l2/capture-win-gl.cp=
p
index 5558365d..5401e92c 100644
--- a/utils/qv4l2/capture-win-gl.cpp
+++ b/utils/qv4l2/capture-win-gl.cpp
@@ -965,7 +965,7 @@ QString CaptureWinGLEngine::codeTransformToNonLinear()
 =09=09       );
 }
=20
-static const QString codeSuffix("   gl_FragColor =3D vec4(r, g, b, 0.0);"
+static const QString codeSuffix("   gl_FragColor =3D vec4(r, g, b, 1.0);"
 =09=09=09  "}");
=20
 static const QString codeSuffixWithAlpha("   gl_FragColor =3D vec4(r, g, b=
, a);"
--=20
2.43.0



