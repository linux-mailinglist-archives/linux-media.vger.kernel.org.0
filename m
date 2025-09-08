Return-Path: <linux-media+bounces-42041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC6B49982
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 21:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4ED1B280A4
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 19:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B26238C16;
	Mon,  8 Sep 2025 19:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygvp0i9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65751799F
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757358791; cv=none; b=llQ1CpW3gL6L4c7UmWR0CQ4o4VVf9vxjkRB7Elmv+HiIGCjoWmFFHEAduWRxDRwhKswSFpNo57mgX1qnexwVI0w3RWALgJNWA3Pr9PjQCXzQkFKsa305Twnmw0AZK1zw3TWqUbhZ64KSkWEJFiz2IOJylM1TzhP4aQXNIIzdFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757358791; c=relaxed/simple;
	bh=9tqTictt0bIeYq9M3kKgFGXPmspKDgzvP7BL/kxEWM0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=LrqhN0eYo1nsgoBm27XVO6GYkhJNa3ppkrTGcPsYs75RqP0r1GuBt8IXMu8eO2L+ejEY4JHd55m/zfYlvnOi5Fj9k4yYwhTyckYMl/PKwaFuxBBQt5Xn+JfSNNd5ESZx95pgxZeX+s4CEQajAkWEXTy9D+J97jXTUjbmivmBCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygvp0i9p; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so4703384a91.0
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757358789; x=1757963589; darn=vger.kernel.org;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WF9y3esq7rUlzs2qNkOwkxEeP9lXO2vlIjsTClIFM7s=;
        b=Ygvp0i9pPMb1KUHZvmtGwwQusqhujkeq9sIbhN6Le2QVkHNpM6BTATSrR6cToR0EaN
         tiDYWO5EhM/Co1/wXBU8KTvcFuwRi42h1EKNqRcYolV5xYBRwCq4TCKLJTRMEE65eOzf
         ZMP0KT6XdIxTbJmelAQUALpeosrdbTsvxErHUCJkh8Gt9FUHzmAt+E3kZi+51SFoU0H2
         cMc5PL4PngKijJh/KXjpRmHee8PPQldehFq8rG9WPgNygpn2Sxb6KCFY0RxYy8h/7BPc
         HvL9O8fY8VHvXGHmQr3axOOWlWishLlwJEXHvcGvIMFqAMs4wbKbZxZgQH4qzuFVSD9u
         9Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757358789; x=1757963589;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WF9y3esq7rUlzs2qNkOwkxEeP9lXO2vlIjsTClIFM7s=;
        b=FeppwGMkNr4dgtj5jfhFutrd0ncRAUkHvrCFIKja0SdvDs8gApzQ1dMwBVH8AaI7Ni
         wuOkFiImBIvJ/iYjVuBUMXBxOVltb9HESL5KR0tNPBjX/LyxKUG0EHv618XskOoLGP2G
         IaCb8hHrbIRXQxOg3zD+hr1Pu26NAcawSouZemcFwy0bywJWkVu/Yr3IthuRyHlHSto7
         RTr/10UnKeaB8NAbFOwEjd6vHOpQRLdWJvn6X2mE1KzMcsnyrr7xOFdSMRxx57JDcS7s
         Q+A551lH342UI6gmjqInYuC9fZwXcW0xcApXtwJYgoWdO5mhgX9hU3bUbJjOWeuvfDns
         kWww==
X-Gm-Message-State: AOJu0Yy4FbgLFW8+mXIaXPh7iDUZKMp423GJmqztVbb2wGEMEyt0n5XZ
	a+r7vepaGO7ywzcZ2tptXOqRJusyUHbZWPSiqrZkg50LZIMf66y9l95H0w4xC+hw99vLz0fxDrH
	jBNzsrXJdAR8e+0WKb4akSX7VqWHIw6t9U+jS
X-Gm-Gg: ASbGnctXGDTnvshYFDuj1D0IjqpNTay+PCEuOMn2cjthq7oKdHXTo3mwO/3fCf4z+oz
	UXPdetm8TavbEcrzla4NjsAY+yTH0JxjJ6n8/Xt+ZPDnH9fpxl4pjkNrClLBetnYDR5U2FxdNbo
	HSMcawJhrbvxrdNsp11p4vU976Oo+C0v3934HId+jU6aXsIKJUtd4faYRP1+d2mXnHwgbvDdWw/
	lVpzQzS
X-Google-Smtp-Source: AGHT+IGaeX993lSfRHJL20vpKhO6O6ay+3Nje4r6sg4R/KojMD0rw/1YPlCb325TA6jCylTzusse5/XJvLs55tklQtk=
X-Received: by 2002:a17:90a:da90:b0:32b:9b92:b32d with SMTP id
 98e67ed59e1d1-32d43f2fc85mr9918867a91.4.1757358788673; Mon, 08 Sep 2025
 12:13:08 -0700 (PDT)
Received: from 119074447949 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Sep 2025 12:13:07 -0700
Received: from 119074447949 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Sep 2025 12:13:07 -0700
From: trinitronx@gmail.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 8 Sep 2025 12:13:07 -0700
X-Gm-Features: Ac12FXwTr8--yuSgWCCzJw9sj7FHdD-zVtYZu27gZ1OFJou7o_PQbJCZm4Hti4U
Message-ID: <CAP4Ef8G8LV+F-Sm7R2RHy0jK29BA1wwt9bVy=asWrSJ5TMM49w@mail.gmail.com>
Subject: dtv-scan-tables - Fails to Build From Source after commit 15661aabc342
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello,

Just wanted to file a bug report or FYI about an issue introduced in
dtv-scan-tables.
A recent commit added many dvb-s files, which appear to include some
syntax errors:

https://git.linuxtv.org/dtv-scan-tables.git/commit/?id=15661aabc342b72f539d4600ad87df6663e23aa4

This is causing a FTBFS issue for the AUR dtv-scan-tables-git package,
as described by some users here:

https://bbs.archlinux.org/viewtopic.php?pid=2249257#p2249257

I was able to narrow down the list of dvb-s files with syntax errors
to these ones:

    dvb-s/Eutelsat-10A-12.0W
    dvb-s/Eutelsat-21B-21.6E
    dvb-s/Eutelsat-36B-50.5E
    dvb-s/Eutelsat-36D-36.0E
    dvb-s/Eutelsat-3B-3.0E
    dvb-s/Eutelsat-8-West-D-8.0W
    dvb-s/Express-AM-8-14.0W
    dvb-s/Hot-Bird-13E-16.0W
    dvb-s/Intelsat-10-02-0.8W
    dvb-s/Intelsat-35-34.5W
    dvb-s/Intelsat-38-45.0E
    dvb-s/Intelsat-902-50.1W
    dvb-s/Intelsat-905-45.3W
    dvb-s/Intelsat-906-64.2E
    dvb-s/Rascom-QAF-1R-3.0E
    dvb-s/Turksat-3A-42.0E
    dvb-s/Yamal-402-55.0E

The package builds after removing these files.  I'm not sure what the
exact syntax errors within these files are, but I figured that posting
a report here could help someone else find the root cause.

Thanks,
- - James Cuzella
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEm9bHrs1mCJLPb6GgJomkWbFWjQkFAmi/KsIACgkQJomkWbFW
jQmJjQ//RD0pGA5Pj/DU5QCuBDhmdsVkmVTctdNpwJ3OKuokzJ3QKVphW2BKUSUY
KRu8eiJhkrUUe6AsuyI1wUozRNmDR04VBlZ+fZs9VLyhylENR30xkNzrlQoYSGkc
Cml/M/n/umxru13WwrZGY+ZZnK8qwL+oAg8X0COlAXDwjr7rE3C2n+9SjGVUENfu
3cT93+S6p+imftbC7eos9uQ8RJU95JqmihfUYea3iDlXCeyUIhIzqFccSGB55RK4
CKeEx5x1KoY6u95KJFlvFRtevA0j1xXNK8iY1CdvCOp6RS8/yxYlbarqa629Hv1l
74pex9WmumcmiAjjxzet9kT3/5lHTtoKPeNDokZw9ZIv9uVytSAyFlScoYxqiMAc
qmERt7o6A8Zb0unB6n/04NEQ+seS2sad7saG6pSJp8WC87pvOXX3lkeSZL29ZbW2
5cxlrA/jnfFc1YN7qkpHnjZtfBSR7OM0HWgcicnDDIkZ/OPSVbbS+NaCWS0qPI4J
KXC3CGBwc/OxDvuOk5QepDmRl8Wp6hd9EzeJxh0fODdKXMTvGDOxxZea86Y98Opc
s+t7qMuvlUFkTs0ORQt5ZFbAn3LqBZlcZWeNa50wzsdn1ioVkRvTMSZD3rlxH3KE
ry3zyw3U0Ppan/zzbUEuxQ17Owj3AfruMm0G1LSmXew0uTmGztc=
=qAKQ
-----END PGP SIGNATURE-----

