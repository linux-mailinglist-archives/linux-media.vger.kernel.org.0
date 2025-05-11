Return-Path: <linux-media+bounces-32249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B60AB2AAC
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 22:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17B24167F35
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 20:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E852609E7;
	Sun, 11 May 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SpGaGmJP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E9priAjd"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D91442E8;
	Sun, 11 May 2025 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746993821; cv=none; b=Ncm5vRi6GpTi3hd4on87gXxQL4dK3tk9WwX35nJoHcxk35JX73d0BeMOT6GtD3Ar5Q8iqMPLpcP6donSLiRP44dQExpFns1kV8GLgwiR2+47+X+LI5JWcevPmalXixGfD7Ohg7yqBFROqiCmbJsnP0cfxhye/7RDMVxIg0/Kloo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746993821; c=relaxed/simple;
	bh=0tYsn1+YB/ZDeCJGDSidABD4h9cNg37UMu/lTg/ewHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/b+s+VzELghoU8pdR6oGyS1dOevHSff3MmQg4Mt5uBY3jGzoNGCOG9MbO56s+cLbDlDSGxQyd3r++/GmFmxSxbtIEzY4ZbqqTGKWyY8mns/U2pRwHkyKgmeSflxqjmCRFqEYwpT+YPmxLgR8MgtPYMvtSZlKO6Rw0ejF1IBQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SpGaGmJP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E9priAjd; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 9E2531380136;
	Sun, 11 May 2025 16:03:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 11 May 2025 16:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746993816;
	 x=1747080216; bh=ER8uMPUUfV9fh3JuRD1VcY4p3g8NRe+ep1bNdV6iuAs=; b=
	SpGaGmJPXZxe8k7LmCTcmSjAlMq6CewrbDLws58cbZQm84IlpKbg7zwkJdfcMOip
	eJn43rAAFSXoCbVNDKUkWsxCS96ChLde7bd19clPwo7mytpOjYpAA2b4ETngkUmd
	n7dsXg+CSoiQdzAU3fwAa49vlkl77PiF8hkSQkbAIfhKVmPnFHtHHEXoF6rczCKT
	ITrch/bGyD+MU9ly7IGB1rS8K5HZ7wQ9F/xu95gJrlT6ALpiDqDup3R4Iyh+fE0h
	pyUaI6PaOZ4+pakKK2CTbDO2egy0piXJfDatvcAjunOMRMOjhdL3eZHDBeO0VRiT
	dU2TqKGNfMvU41pFEJ4hHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746993816; x=
	1747080216; bh=ER8uMPUUfV9fh3JuRD1VcY4p3g8NRe+ep1bNdV6iuAs=; b=E
	9priAjdztj0ZZgiOuYjkoJ8r40hmZKgL7x9tDP+5D1+BnYSZt5IKahMe1d4HY0SE
	p252KrqXaJb5n7GjbTnOrGaDBIB7OniX6CkxUMbRpHMPBQ66hoIhUABT2EgdZJ+0
	YvckYfWZ+L8tOX//ZUr/4UOB4yOP68s07qINAusyOJq3BI9O1ndKJe+aUNMGplt5
	6YyZ+7czhMi4BpxKRxdnF1WRxNIlf/s4hbbyEMWdBCTQwoPXRkjB84VXMjhg1KQE
	wXh6Mwi4kP9TAWnqcAcjD9recHsKVgq5XfHZZeO4ifhJOStvGcsleHEUFDPFxmKr
	aGEf/kmIM8e5KEPpwJbnA==
X-ME-Sender: <xms:lwIhaEGDI37vobuVJfEbUfZpqX-V159auS3ZdModr0f2hIgZgXwVkg>
    <xme:lwIhaNVk7ULjIeW9CgdGMtXANmZxPXj9nd2IrSlOfejQKLtcp-zpC2qBc1dEWkSTp
    SEmHw3REa4diuP90To>
X-ME-Received: <xmr:lwIhaOKkZ2lC1795DOSiRgLP2W1Cs1TkDJa4XgOtF7WAn_KOFBLPTaixfjmrJhP5qdNhEoxY_f1KapEgcGhH-qixr248Xa1rhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleelvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehff
    dtvdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrlhhokhdrrgdrthhifigrrhhisehorhgrtghlvgdrtghomhdprhgtphhtthhopehmtg
    hhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghn
    odhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrg
    hurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghp
    thhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:lwIhaGGsf0CfkHpOPju7UkFgtuWTYnWuYjvJS9f481BcaJOlhKbWyw>
    <xmx:lwIhaKVP624SPOWevi4mIS79QmBMucNWAp1q_hgi438KF0i2ZO9Rvw>
    <xmx:lwIhaJPDwabPlW_YyivRGC1rcljDslsXf1n6HHAoGvf4n0yEnSgOhQ>
    <xmx:lwIhaB3pV05xmn9kw-AYU9Vd_XNu7nXzd0iUmum3VMUdgHOGtJS7Eg>
    <xmx:mAIhaHK07y4TlR8iQkgzyzHb2h-oblMJU_1ORjNb2ew6FGUaNpyv0HZb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 16:03:35 -0400 (EDT)
Date: Sun, 11 May 2025 22:03:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
Message-ID: <20250511200333.GA2365307@ragnatech.se>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
 <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com>

Hi Alok,

Thanks for your feedback.

On 2025-05-12 00:37:09 +0530, ALOK TIWARI wrote:
> 
> 
> On 11-05-2025 23:17, Niklas Söderlund wrote:
> > +
> > +	for (unsigned int l = 0; l < 4; l++)
> > +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 5), 0x0100);
> > +
> > +	for (unsigned int l = 0; l < 4; l++)
> > +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6), 0x2d02);
> > +
> > +	for (unsigned int l = 0; l < 4; l++)
> > +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 7), 0x1b06);
> > +
> > +	if (lut) {
> > +		/* Documentation LUT have two values but document writing both
> > +		 * values in a single write.
> > +		 */
> > +		for (unsigned int l = 0; l < 4; l++)
> > +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3),
> > +				       lut->rw_hs_rx_3_83 << 3 | lut->rw_hs_rx_3_20, 0x1ff);
> > +
> > +		for (unsigned int l = 0; l < 4; l++)
> > +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6),
> > +				       lut->rw_hs_rx_6 << 8, 0xff00);
> > +	}
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0404);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x040c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0414);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x041c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0423);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0429);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0430);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x043a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0445);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x044a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0450);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x045a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0465);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0469);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0472);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x047a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0485);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0489);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0490);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x049a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04a4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ac);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04b4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04bc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04c4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04cc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04d4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04dc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04e4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ec);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04f4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04fc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0504);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x050c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0514);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x051c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0523);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0529);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0530);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x053a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0545);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x054a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0550);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x055a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0565);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0569);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0572);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x057a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0585);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0589);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0590);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x059a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05a4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ac);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05b4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05bc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05c4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05cc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05d4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05dc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05e4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ec);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05f4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05fc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0604);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x060c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0614);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x061c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0623);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0629);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0632);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x063a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0645);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x064a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0650);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x065a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0665);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0669);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0672);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x067a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0685);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0689);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0690);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x069a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06a4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ac);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06b4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06bc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06c4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06cc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06d4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06dc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06e4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ec);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06f4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06fc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0704);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x070c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0714);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x071c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0723);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x072a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0730);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x073a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0745);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x074a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0750);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x075a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0765);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0769);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0772);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x077a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0785);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0789);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0790);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x079a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07a4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ac);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07b4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07bc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07c4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07cc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07d4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07dc);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07e4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ec);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07f4);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07fc);
> 
> 
> Instead of manually writing each call, it could use a loop ?
> 
> for (int i = 0x0404; i <= 0x07fc; i += 0x08) {
>     rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, i);

Unfortunately the values are not all sequential, see the progression 
0x061c -> 0x0623 and 0x071c -> 0x0723 for example.

> or if values are not strictly sequential, iterating over the array.
> static const u16 register_values[]= {0x0404, 0x040c, 0x0414 etc,,}
> rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG,
> register_values[i]);

I agree with you, a array of values would make this look a tad less 
silly and would reduce the number of lines. I considered this while 
writing it but opted for this. My reason was as most of the register 
writes needed to setup the PHY are not documented in the docs I have and 
I wanted to keep the driver as close to the table of magic values I have 
to make it easy to compare driver and the limited documentation.

I guess it's really a matter of style. I have no real strong opinion, if 
people think an array would be nicer I have no issue switching to that.

> 
> Thanks,
> Alok

-- 
Kind Regards,
Niklas Söderlund

