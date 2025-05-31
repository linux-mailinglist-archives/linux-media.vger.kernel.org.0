Return-Path: <linux-media+bounces-33715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11362AC99DE
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 09:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35D71BA28F3
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 07:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6208122CBEC;
	Sat, 31 May 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gYx5slE+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MGmNjSH0"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD60195;
	Sat, 31 May 2025 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748676873; cv=none; b=V6wXwiDb0YdOgP0ksxML3mv5716RGidoplUP+doH7VQyYC6I1XiR/aM7DPrSMOrHLagcZQB+p5QIYoWeGGlt1fHFmlw27YMtjhltFr+rNoH/qgKlmPRbnyI80ii43szbTqrduvPfsBkBXd3avDzCtxn3Iy3hOeOudPjpyKI47rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748676873; c=relaxed/simple;
	bh=tdiP19824atWDqmVyCJmb/N3MwpNgOA3BvVGBRXCthw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilBlNJ3igWgy7JLQtkOqxLC/fgC7awoGX53IOeIfJHPG2yspLXxTX9Kww4fUluUshCggbEcyPJzfUGhwbdZGN2BwKAuLmJ9+73ETDAcU2fgg+ua/52e/ohvPcQetGkRtFIT6DWLhCWKiQ+usD/Gz7Yq+K62AqQUot8YP8gmO3f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gYx5slE+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MGmNjSH0; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE8351140158;
	Sat, 31 May 2025 03:34:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 31 May 2025 03:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748676869;
	 x=1748763269; bh=kTmUc4L0SF252/oTp6ysS4H5+yaET3jZeIYizi1TdlE=; b=
	gYx5slE+wKduZUzwY4Ufkd7ulqPlnWmjiO0GGCFSTBab9zPZhUMA5vpw3jyh1TBp
	Hobipi2eSzhkwrGyl8PSb2K/JJ7nPOwHjyZTjJH7HRgCtunX2OQPn0xEHA0EMono
	XBe8ZbeeIBjLX5SsEqUUqzS2FmVfsUXgGRwGjOARP6AD4GQ8p6Z8F7TtZ5TVHARv
	a3twbhalqJjb6SeU/CS+Joau1b3nfjY36uJtATEslUBR0ukP2xJBb1JTEwuHOpUg
	A4hxIn8XQ58JyXdwOncJO8S8j+XmP5Y3o3N0Yj4msNL4fCgg/4Cb7v95j0+55v5q
	xhuvGVYZnXmFnaCh9819RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748676869; x=
	1748763269; bh=kTmUc4L0SF252/oTp6ysS4H5+yaET3jZeIYizi1TdlE=; b=M
	GmNjSH0kG4zqp0vy8MbEf4K46rt98u8Rh49ouvVWmBSO3GzkPgkGqAN2l7T30Z9G
	EtggP/hsVuMqK8MJzWr9Hw1Vzdf+OufI4RJeHY8SIVzpCiTS3SrBu2rO1sxsYGEA
	eouQjMocSZfLSxgDRSR/qpLhtILMCzKVYha+HYGCq7mQSAaPAETBy4PjodOJ2pSB
	j2Gw0FW+oJibDa+FOW9pqd5trJ0+cqZqwgfzq9s5JDJZkcsPMhpDZqnsurPZEZEE
	Y+4s6B5Szwn9bwdzyqNPWtZc99kZAJlyMA/IJzovWM10+AwgBMYw0BLiceFixOFC
	+NyWue1Nc9TpoWu/xHitw==
X-ME-Sender: <xms:BbE6aDrxANPQT7KFfzMy_xdMj2ASRBZV8SZ05kZCNtcXJivC68IH7Q>
    <xme:BbE6aNrtjqU0XIUEh16fpOEaTSNAuwCHQMY0YuERyqxyatxUGC36Xofw1H5_gFIaz
    mbelrjEBxspX02gMTM>
X-ME-Received: <xmr:BbE6aAN65S8OepEw-W1v8FvSuAvgAJohiNt48gfW3J7xfhghwnqSDsHKKMq1A_3jOqDxHWDXI3qrevq5wr_HhY-rz1_c6HPO7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudefvdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunh
    guuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgv
    tghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevhe
    eikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghsse
    hiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    sheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghs
    qdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BbE6aG4R--msOlaAHm03cUaOy7WkBfXjB1UZEDXruWZQbure5xdg9g>
    <xmx:BbE6aC4EO-OZPFH_BxkCU_oHOGY6kZqi4l9ONGPw81XCpz9LNF8EHw>
    <xmx:BbE6aOi3MAUrnGiQ1rhXW2jacD7HWC6vbkSU5hhtxE-SW3kG8ro1Qw>
    <xmx:BbE6aE5Pdidlq7719cJX2axeQ2CtsZN6Ctk9Wvp-6LClHfiU0A9oWA>
    <xmx:BbE6aHW_mGtj7EgSNATLWc3k0kzM8NR9Ur9I4unjIoMH4C1ZowcESpcQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 May 2025 03:34:29 -0400 (EDT)
Date: Sat, 31 May 2025 09:34:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
Message-ID: <20250531073422.GA3849429@ragnatech.se>
References: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
 <4ea2b464-81d8-486d-bce1-540e1cecb87b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ea2b464-81d8-486d-bce1-540e1cecb87b@ideasonboard.com>

Hi Tomi,

On 2025-05-30 14:58:17 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/04/2025 21:33, Niklas Söderlund wrote:
> > Earlier versions of the datasheet where unclear about the stride setting
> > for RAW8 capture formats. Later datasheets clarifies that the stride
> > only process in this mode for non-image data. For image data the full
> > stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
> > Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".
> > 
> > Remove the special case from pixel formats that carry image data and
> > treat it as any other image format.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
> >  1 file changed, 16 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index f8394be8a922..fdf0f86c801f 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -680,22 +680,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> >  
> >  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
> >  	stride = vin->format.bytesperline / fmt->bpp;
> > -
> > -	/* For RAW8 format bpp is 1, but the hardware process RAW8
> > -	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
> > -	 */
> > -	switch (vin->format.pixelformat) {
> > -	case V4L2_PIX_FMT_SBGGR8:
> > -	case V4L2_PIX_FMT_SGBRG8:
> > -	case V4L2_PIX_FMT_SGRBG8:
> > -	case V4L2_PIX_FMT_SRGGB8:
> > -	case V4L2_PIX_FMT_GREY:
> > -		stride /= 2;
> > -		break;
> > -	default:
> > -		break;
> > -	}
> > -
> >  	rvin_write(vin, stride, VNIS_REG);
> >  }
> >  
> 
> This one breaks RAW8 for me (V4H, streams, GMSL2 + imx219 sensors). How
> did you test this?

I tested this with V4H and IMX219 and IMX462.

As you point out in your other reply the documentation is a tad unclear.  
I don't have access to it atm, but from memory there where two 8-bit 
modes. One operated in 1-byte units, the other in 2-byte units. This fix 
addresses the 1-byt use-case.

I will get back to you when I'm back in the office with better 
references to the documentation. Just wanted to let you know how this 
was tested.

> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

