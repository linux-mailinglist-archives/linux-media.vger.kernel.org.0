Return-Path: <linux-media+bounces-29663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D83A814D8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 20:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598508877B8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D970923F41A;
	Tue,  8 Apr 2025 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="I7EbdKzj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5523ED56
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137691; cv=none; b=Tx0kWGorkmhHTqx7TKkKsoyZlikG0cLJXhIyI5/qWg+fHVQDtZKwPst1wGuxz6w6uUBNYnpgPIiajTz2BLTHr1c8k/pg68ZFoXXGKZF/GFqk6YaWN1T9AmJmR+tk4GRxd7B1QO5AXnYQerYVR0xhbZ7pG5tTDbcum3OPwH4+nio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137691; c=relaxed/simple;
	bh=c8UrXhDmRKW3SACZDUqR68rXhfG28f31bXRX+XIY24s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=abiXou1vwq75RWgmuhfiBPhJ6nYtZIoXQW9kAl4tODn73VnaRBGBl+rxLG+fI/jxT3tVAYz78Pul3X8umzQ6mDKlY/0oY3HCuh5Se9A9Mzcta52ur1FyI03py2XL54wr+lsXs6H6mmtjGHPx23LtI/nnRNL4BKz/EBHT2rD46D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=I7EbdKzj; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c54a9d3fcaso610419285a.2
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744137688; x=1744742488; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c8UrXhDmRKW3SACZDUqR68rXhfG28f31bXRX+XIY24s=;
        b=I7EbdKzjHB3KIldjyKjZyV9DtVvFxZMpNySIEgjfdimfvdXsY2wsug9gKtLNbjAmAz
         Q+0AJoiu2rpL+qSGpso0lJle+LFBEVjasrvk90WTcbrZOHPe8cza1ZZC5/LcqcqIowkn
         l1bXGLMd4jBgwRWF4Fg4MRpY79POj1SLS3NqPjg9jzH+I1j+qQJETPKVDEFSBpPCl286
         6OCv27j8HHG+lHgwJGerroOA4718eFbWqgfSy3R6nrlMrU1cqjToGtbpcj2feYaC1cmd
         PdlJvOFJ5lEhgjJ5z1fHRuqRyS+klqjED8+xmbNT7NenXAAN2+4V1dWTVn35yH5DR+Dw
         vHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137688; x=1744742488;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8UrXhDmRKW3SACZDUqR68rXhfG28f31bXRX+XIY24s=;
        b=kwJvTGIIV3l9jBbRRGHCRL782UOICtgwiUmgkTaCaFLwwryUnSYHL9OdeYK83rVvtF
         m3H1FHtK5Y0pBJpe7v41SU4WG5fwTViABJ1XXb4jUxxFD3kfYmnc6MuVGZv7i+O+Ui1f
         71s/SsXhqZpVEsHfXMVtpWy7KTbU30XnbfqpVdHudyusDEm7oAePct3EyFpiU8Y4kWhr
         728EvhyNJFmALL+XeEcld3x9Q1K4UEaeyFkDMPuqSaicqONgxuXWrIo2U8bsOtSzJr1n
         A1Hu5UHaA/VkbV6OCeYHzvVOza7Wj12hlYuz23jaFiZt+9enz3Y1QkcDmIRctLIHasgU
         wdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXczocZ+ft9ZRkh2OpGKjvCRfy34adKWrjBChxl842XIWpRbdnPq6t0K5z2pBnK0+G4Hxm3Z9z3cR5U6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAYcZKFjTux3CcbFs2fEs6/ElYLOYTbgpfgmbYRWpLIsyEBcs
	PxG+QXo22vzBdTTToyA0D99PfM3Dp7NIfkjEB/M4mEzQHFjW8P9haxZX2KhqvhU=
X-Gm-Gg: ASbGnctbPEBvWwCQiABGeIGnDWWs3u+pDcBy1xb1PfT6Jn6No1RlAG+FhHetLf/g3OW
	uAXTAE4GpG3BvShkg2iQL0I7qig0av51NFDIeXFF3NX+KqS4dsWbiC+TnY3I3lSgHM+IFUUG8D0
	vjWPQlz2iWAsTM3xZuw3fJw43ePlkBMmnrF/LL3hON4hqfxzNrrcYpTMCwvAftSYK7eZWSP4B2w
	Yy35it6ftur9yF77gOzaEVRxDIh4CeeyOD0lmkeQr+bXdg74sDm3WBqQneZElRhAmwB/QWb8FjD
	ol1ajVfZC6hmdROODFToN2Z6LbrWB/ZI3Ku0S1dkU/PnFEh2uQ==
X-Google-Smtp-Source: AGHT+IFAGoKp0ZbpFonPknb/idxEysC7JTwNdK/15gO/2RLYFsUPAH381r8pMn3IujTjWUt20/YGkw==
X-Received: by 2002:a05:620a:27d0:b0:7c0:6419:8bd3 with SMTP id af79cd13be357-7c79cbd46dbmr36642285a.22.1744137688634;
        Tue, 08 Apr 2025 11:41:28 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea8581csm787529985a.107.2025.04.08.11.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:41:28 -0700 (PDT)
Message-ID: <eb6aff833bae38c0a8e3a4be2cb7456b071dab24.camel@ndufresne.ca>
Subject: Re: [PATCH 00/18] coda988 video codec support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,  Vladimir Yakovlev	 <vovchkir@gmail.com>,
 Maksim Turok <turok.m7@gmail.com>, Sergey Khimich	 <serghox@gmail.com>,
 linux-media@vger.kernel.org
Date: Tue, 08 Apr 2025 14:41:27 -0400
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Philipp,

any plans to review this series ?

Nicolas

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> Hello!
>=20
> This is the implementation of the Chips&Media "CODA988" video codec
> support
> within v4l2 driver for coda. Support for the following codecs
> was implemented:
> =C2=A0* h264:=C2=A0=C2=A0 decoder & encoder
> =C2=A0* h263:=C2=A0=C2=A0 decoder & encoder
> =C2=A0* mpeg4:=C2=A0 decoder & encoder
> =C2=A0* vp8dec: decoder
>=20
> Support for the following formates was implemented:
> =C2=A0* yuv420p(I420)
> =C2=A0* yvu420p(YV12)
> =C2=A0* NV12
> =C2=A0* NV21
>=20
> Also the following features and fixes were implemented for coda988:
> =C2=A0* special config for mem_ctrl
> =C2=A0* special config for encoder header (sps and pps)
> =C2=A0* special set profile_idc
> =C2=A0* special set RC config
> =C2=A0* special set QP
> =C2=A0* special set slice mode
> =C2=A0* special set Motion Extimation (ME)
> =C2=A0* v4l2_ctrl for h264 profile=20
> =C2=A0* v4l2_ctrl for h264 level
> =C2=A0* v4l2_ctrl for h.264 RC mode
> =C2=A0* v4l2_ctrl for h.264 skipFrame
> =C2=A0* v4l2_ctrl for h.264 i-frame min/max qp
> =C2=A0* v4l2_ctrl for h.264 p-frame min/max qp
> =C2=A0* v4l2_ctrl for h.264 entropy mode
> =C2=A0* v4l2_ctrl for h.264 8x8transform
> =C2=A0* v4l2_ctrl for h.264 i-frame period
> =C2=A0* v4l2_ctrl for h.264 Access Unit Delimiter(AUD)
> =C2=A0* v4l2_ctrl for h.264 me x/y search range
> =C2=A0* v4l2_ctrl for h.264 intra refresh period
> =C2=A0* v4l2_ctrl for h.263 intra/inter qp
> =C2=A0* v4l2_ctrl for h.263 min/max qp
> =C2=A0* v4l2_ctrl for mpeg4 min/max qp
>=20
> During adding support for "CODA988" we also did some extra work
> related to refactoring and improvement of generic part of C&M coda
> driver:
> =C2=A0* Improve error checking for probe, irq-handle and etc.
> =C2=A0* Update work with resets
> =C2=A0* Replace hard_irq by threaded_irq
> =C2=A0* Remove double setting of stop flag
> =C2=A0* Improve some prints
> =C2=A0* Fix loglevel to avoid performance failure
> =C2=A0* Fix support of MPEG4 levels
> =C2=A0* Fix setting gamma for h264enc
> =C2=A0* Update default velues of QP for mpeg4 I/P
> =C2=A0* Other minor fixes
>=20
> Sergey Khimich (18):
> =C2=A0 media: coda: Add print if irq isn't present
> =C2=A0 media: coda: Use get_array to work use multiple reset
> =C2=A0 dt-bindings: media: coda: Fix resets count
> =C2=A0 media: coda: Add check result after reset
> =C2=A0 media: coda: using threaded_irq for 0 (bit) interrupt
> =C2=A0 media: coda: Add reset device before getting interrupt
> =C2=A0 media: coda: Add fake IRQ check
> =C2=A0 media: coda: Add log to finish_encode if buffer is too small
> =C2=A0 media: coda: Fix max h.264 level for CODA_DX6
> =C2=A0 media: coda: Remove double setting of stop flag
> =C2=A0 media: coda: Print size of encoded buff in other place
> =C2=A0 media: coda: Fix loglevel for seq mismatch print
> =C2=A0 media: coda: Fix support for all mpeg4 levels
> =C2=A0 media: coda: Fix handling wrong format in coda_try_fmt
> =C2=A0 media: coda: Use v4l2_ctrl to set gamma for h264enc
> =C2=A0 media: coda: Update default velues of QP for mpeg4 I/P
> =C2=A0 media: coda: Use preferred usleep_range than udelay
> =C2=A0 media: coda: add support coda988 enc and dec
>=20
> =C2=A0.../devicetree/bindings/media/coda.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0.../platform/chips-media/coda/coda-bit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1114 ++++++++++++++-
> --
> =C2=A0.../platform/chips-media/coda/coda-common.c=C2=A0=C2=A0 |=C2=A0 430=
 ++++++-
> =C2=A0.../platform/chips-media/coda/coda-gdi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 149 +++
> =C2=A0.../platform/chips-media/coda/coda-h264.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 10 +
> =C2=A0.../media/platform/chips-media/coda/coda.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 41 +-
> =C2=A0.../platform/chips-media/coda/coda_regs.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 157 +++
> =C2=A0.../media/platform/chips-media/coda/trace.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 16 +
> =C2=A08 files changed, 1703 insertions(+), 216 deletions(-)

