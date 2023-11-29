Return-Path: <linux-media+bounces-1364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78647FD8A4
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BA002830E4
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 13:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AF4225D1;
	Wed, 29 Nov 2023 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="nWaWQ9i3"
X-Original-To: linux-media@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36892DD
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1701265890;
	bh=olq2gmIW3ZlQIeh/hnxfbIuvtQF0cf+hc7U/9VI9AR0=;
	h=Subject:From:To:Date:From;
	b=nWaWQ9i3RO3/PO/d35t9/GptcfmtId//Vx5o77QDMZK+LbunA7YyQ0flyr1x2QCmZ
	 Ui2mfj/sUyjf/Qa9jJFvX4LhNJSc07IopAhrS4TDjOc7f4vb9AleyPSXsTTYr9nQrN
	 AfjgYgrs9VIiVI0CVS/lKkKbImNZDAHV2K8lkBzs=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 759B366CC5
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 08:51:30 -0500 (EST)
Message-ID: <3ffb1568a9ff6c0b6f5424de3a0fafb24e7b3ac0.camel@xry111.site>
Subject: v4l-utils-1.26.0 overwrites /usr/lib/gconv/gconv-modules and breaks
 iconv
From: Xi Ruoyao <xry111@xry111.site>
To: linux-media@vger.kernel.org
Date: Wed, 29 Nov 2023 21:51:28 +0800
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi v4l-utils developers,

The last line of contrib/gconv/meson.build reads:

install_data('gconv-modules', install_dir : gconv_install_dir)

This unfortunately overwrites /usr/lib/gconv/gconv-modules (installed by
Glibc) and breaks iconv.  For example, a simple "iconv -f iso-8859-1 -t
utf-8 helloworld.c" will complain "failed to start conversion
processing".

I guess you need to fix the issue and release 1.26.1...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

