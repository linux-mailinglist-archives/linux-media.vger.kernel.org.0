Return-Path: <linux-media+bounces-18181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F06975B2F
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 21:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5351F2238A
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD751BAEE7;
	Wed, 11 Sep 2024 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="Zx8obt58"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EB1BA870
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726084715; cv=none; b=VrZ8xUt2gwDflM8jZClhNjeSdmHjcfWSZqc74V7Nng/aSaq686JyibgU5rI11O37waKY4cyjWXp/Y4k2yDXRnvk6pWvHvi56T93fz8rcJhROMwCZYV0wefyDOcQ4jS2xMq5a5cDZzJITv7+G1727irhlniWlQUZxc2mcd0yZrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726084715; c=relaxed/simple;
	bh=9lMWDDSEPhKlHvtHXAmhT4mc2c3tX8YbQ7KSRO7viIA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dIQegyBPO/NW2qe1QAkzXAV4ozrRUICRjCoZCCBpnz+f9rBh3Y/pZjN7q7RAmDTVNTh2fQ2IpajUB5A5v9B94Ql9pPzh+yd9dBogWwaHtHXcnt3hILIyiyd8QvJdQXMgr2QeKlqu9+goNBnpSl16ipkpZcRqEcThwNfu+fKcET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=Zx8obt58; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=K32TjC8ssqva4HJaxS+r+9Sjd2LGOMTuxLSRmpqRvmQ=; b=Zx8obt58kF8ECai7fZPRQgMxCG
	udUi1z+BLcz6wObALqTvdl6pbg8mhqEmr8h12FAFBULUTyKRUaRVU2ssRENQh0wkAU7fizZZCA/UV
	tMkWYw3RY40GvpDtJVZhCVp7FPNXW14u9mifibyi5S9BaUbUZUWzWNNPoHvcX3ehY03Mszb2Q8mqz
	CJv/PgUQrlX13nNLsgZ4dVzn+P303fx4rUQwmcC7yjZCRYUXh8/ZgTYKyUZdJ1yvjPZ2l29ShnNmi
	YOemz9IscOo2KrGDOBVU1JgHVJOZ3XelZMJGj6qlQjrFuBOmKMuLKQseoDULzMSa/rqxYHx3s2Hbg
	usloYILg==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1soTTx-00BoQS-AG
	for linux-media@vger.kernel.org; Wed, 11 Sep 2024 20:58:29 +0100
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d87a1f0791so123525a91.2
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 12:58:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YyeGaEZ/4Rt18lutardFNr7euW/LaCyLRD8mSvs0pJ+qOnq7Tpd
	asvdABFWSRAF0UPFGF+tSPS+P5gG6Lx36KemeRuzJVw0SL8c6DPstugOF5OWzo4x6PCuQfOZ/wX
	eRi0VaKvjb9dzbGdyV5F7tDhyGNc=
X-Google-Smtp-Source: AGHT+IG+CVjN+wtNFspgET5aJz6CLXRykw0cp/UgB+U0lt833yFqh/FGyh+MIBCIzN1YQj49Z6BlSt76fEq/O4aVFcw=
X-Received: by 2002:a17:90a:d915:b0:2d3:c6a7:5c99 with SMTP id
 98e67ed59e1d1-2db9ffa39aemr325163a91.8.1726084707668; Wed, 11 Sep 2024
 12:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Given <dg@cowlark.com>
Date: Wed, 11 Sep 2024 21:58:15 +0200
X-Gmail-Original-Message-ID: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
Message-ID: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
Subject: No uvc video support for D3DFMT video GUIDs?
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

Hello,

I've just received a review sample thermal camera which doesn't work
with Linux uvcvideo. It's reporting itself as providing a D3DFMT GUID:

---snip---
     VideoStreaming Interface Descriptor:
       bLength                            27
       bDescriptorType                    36
       bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
       bFormatIndex                        1
       bNumFrameDescriptors                1
       guidFormat
{e436eb7b-524f-11ce-9f53-0020af0ba770}
       bBitsPerPixel                      16
       bDefaultFrameIndex                  1
       bAspectRatioX                       0
       bAspectRatioY                       0
       bmInterlaceFlags                 0x00
         Interlaced stream or variable: No
         Fields per frame: 2 fields
         Field 1 first: No
         Field pattern: Field 1 only
       bCopyProtect                        0
---snip---

This corresponds to D3DFMT_R5G6B5 or MEDIASUBTYPE_RGB565, based on the
reference here: https://gix.github.io/media-types/#ID0EC2AI However,
the UVC driver is expecting RGB565 to be using the 4cc RGBP GUID
52474250-0000-1000-8000-00aa00389b71. This is very nearly the same as
the alternative GUID described on the document above,
00000017-0000-0010-8000-00AA00389B71, which uses an index rather than
a 4cc.

I haven't been able to find any references as to what GUIDs are
supported for guidFormat.

(a) Is the camera wrong?
(b) Is the kernel wrong?
(c) Am I looking at the wrong document?

The easy fix is to patch the uvcvideo driver to support the e436...
GUID, but that doesn't seem a great idea. Any suggestions?

