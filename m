Return-Path: <linux-media+bounces-34796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863FAD9D06
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 15:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62890189B58A
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F642D8DA4;
	Sat, 14 Jun 2025 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mKqNTRMV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB98462
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908766; cv=none; b=bwMG0oExut2GDRZH5XMgd09fQAvWhUHoAcdsLFsbXyPPJxWCVCHkizY5nQVn2J0//CUMvGdIpJIQQmoSeqWpUV5VnEQ4z7KmOOLcqPvPmWgApuFDImf4EyfNYx3JX1S9CxtIGbwM1106osg0JGur6yQdS33eMiFox/5BcR+wqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908766; c=relaxed/simple;
	bh=DS0JYUaVJXBQ7M9BpNk4q/jCaqrBlepi/lLIuw6v47c=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hd/mHtVfayz/b7QZx+VmXnYmE0jsKrPnvWfPZ4IGeURuAF4pDcdeCgQSnVctEjNeCAgXM4xYXHBNV4rPeU11600TmciOF6ZeIdiC903ruIxb9pD3ufO4pGZhTJ8gNNgO0T9hV+NgPQ3wHU99Lmwevtgd+3zPMkzQfJh/B6F6Ag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mKqNTRMV; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749908753; x=1750167953;
	bh=DS0JYUaVJXBQ7M9BpNk4q/jCaqrBlepi/lLIuw6v47c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=mKqNTRMVS4tnl9awxMzUYHZ9oe19aDtaFYJJ6RE29HwOrCg0345HiUs4o4x2XtHTr
	 6jMAdrXmn7deYU1EBokix21ByJybBhrMf8UgyL4CnAh6ZL9daBY6faGG6wYUGkIJBs
	 hytYGUJeXobsrVeMusdgmKBJ7hvQCk27MFAQXGvPiVDwiz/xwsErieKRYhXDdukQ+e
	 rnkwLVnWZ/Dyi7iH6p1tUgbQTPasLoYwLzkwtfqC3FcK5nkXBxyXpJLsh8GF9AjFJo
	 WPW+ILNHpxpci5jG8Q5hcouAK5Ch8l7XdF9X+AffYqRnKBXGNnRKcnq/7e9v7+KNrV
	 LWvtutESKHkDQ==
Date: Sat, 14 Jun 2025 13:45:48 +0000
To: linux-media@vger.kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH v4l-utils] qvidcap: Fix video capture being transparent on Wayland
Message-ID: <20250614134523.695131-2-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: e9cccbc822894ab94dbee18259fea18ea2fb7d39
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
 utils/qvidcap/v4l2-convert.glsl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/qvidcap/v4l2-convert.glsl b/utils/qvidcap/v4l2-convert.g=
lsl
index 8bd5694b..e6e6794c 100644
--- a/utils/qvidcap/v4l2-convert.glsl
+++ b/utils/qvidcap/v4l2-convert.glsl
@@ -96,7 +96,7 @@ void main()
 {
 =09const float texl_w =3D 1.0 / tex_w;
 =09const float texl_h =3D 1.0 / tex_h;
-=09float alpha =3D 0.0;
+=09float alpha =3D 1.0;
 =09vec2 xy =3D vs_TexCoord;
 =09float xcoord =3D floor(xy.x * tex_w);
 =09float ycoord =3D floor(xy.y * tex_h);
--=20
2.43.0



