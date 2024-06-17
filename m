Return-Path: <linux-media+bounces-13445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315E90B35C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769D11C23801
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F52914A08F;
	Mon, 17 Jun 2024 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JoR7hqox"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D51149C4A;
	Mon, 17 Jun 2024 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633909; cv=none; b=hg8IYIjWy5diWuLcdN0ynqLSx85ReXn4X3tboS7siui+AKC+mItiWWc463VCxM72c/hJI5K3IFttCwWDQj9P4OLywCFyjBmV3/lFXZp66JCQ3vKB1HCEriJ7pfk87HRgxO5M/qixhaZ71ORjZIbgxDcS4EYXjoO33Dh9oF6YLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633909; c=relaxed/simple;
	bh=ytveol5qA7BaFj8j5NKPewvfykTHo0GBRryp2gg+Q/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5sDNutta/sIyemM30MROZzCT1/U5ggik15zQR+Q4+p3dapT+07zYmhMTpSlJKJcO0O22hImLVhwp5WvKyPK8jlwRUa2twEud2ZeZRQ9iV26olJqv3DI3hOk5X5rP5C3ZdzUZfamyaFxIxN0cNvQYedyewdFVwK1mQ1re0xsXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JoR7hqox; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718633905;
	bh=ytveol5qA7BaFj8j5NKPewvfykTHo0GBRryp2gg+Q/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JoR7hqox6Xwispeojm3Jf4M9nFmQ2505u7oBKLr9p7LXWkEHHw4F1qSLmNuAB/tvT
	 cPKGHAB23xTgT306WjvxrsAbeYT0zh1uvf++XtgEilPjNpA6rUx1RJ0/Efs5SiPC/9
	 qVBGpxBbDs6cQuciDM1QboBXHhgRj/p8hsKiSX3u0NojAozHTfxVji9UtUEWyEZuDL
	 gmosxFrHDzuIVlTDXGg4vnIiJ2dw412/nUipwsBXpj91G4sVBPalikZAdAjpU0XKQV
	 Hh61q/KtCGplJwu5rn5ncnjwWzZCpXz9+TISVWkE6jjO10dRi1NjUDckM49DNvL12m
	 wnHRDpmqbWYaw==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B0C6637812FD;
	Mon, 17 Jun 2024 14:18:22 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:17:55 -0400
Message-ID: <11614270.CDJkKcVGEf@arisu>
Organization: Collabora
In-Reply-To: <f301fb0b-bf87-49ef-847c-dbfae00f3a11@gmail.com>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <f301fb0b-bf87-49ef-847c-dbfae00f3a11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5548811.5fSG56mABF";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5548811.5fSG56mABF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 10:17:55 -0400
Message-ID: <11614270.CDJkKcVGEf@arisu>
Organization: Collabora
In-Reply-To: <f301fb0b-bf87-49ef-847c-dbfae00f3a11@gmail.com>
MIME-Version: 1.0

On Monday, June 17, 2024 12:49:41 A.M. EDT Alex Bee wrote:
> Hi,
> 
> Am 15.06.24 um 03:56 schrieb Detlev Casanova:
> > This driver supports the second generation of the Rockchip Video
> > decoder, also known as vdpu34x.
> > It is currently only used on the RK3588(s) SoC.
> > 
> > There are 2 decoders on the RK3588 SoC that can work in pair to decode
> > 8K video at 30 FPS but currently, only using one core at a time is
> > supported.
> > 
> > Scheduling requests between the two cores will be implemented later.
> 
> Regarding the cores:
> Did anyone of you ever check the CCU (which I tink stands for central
> control unit). This feature doesn't seem to be implemented by the BSP
> (neither kernel nor mpp), but the configuration workflow is described
> pretty well in RK3588's TRM v 1.0 ("5.6.5 VDPU381 CCU configuration flow",
> page 676): It "sounds" a lot like with this enabled you do not even haven
> to care about scheduling/concurrency ... whatever for the cores - you're
> just saying how much cores you want to use and the rest is done by this HW
> block. I'm mentioning this early in the iterarration of this series as is
> it might / would infect DT modeling. The same is true, btw., for the 4
> hantro H1 encoder cores: They can also be controled by a (own) CCU.

The downstream kernel has support for the CCU and the device tree can be used 
to tell the driver to use the software or hardware mode and is configured in SW 
mode (https://github.com/rockchip-linux/kernel/blob/
604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/
rk3588s.dtsi#L4135)

I tried to use the HW mode with that kernel, but without success.

As rockchip doesn't use it, I don't think we should hope too much that it will 
work as expected.

> > The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> > currently only supports H264.
> > 
> > The driver is based on rkvdec and they may share some code in the
> > future.
> > The decision to make a different driver is mainly because rkvdec2 has
> > more features and can work with multiple cores.
> > 
> > The registers are mapped in a struct in RAM using bitfields. It is IO
> > copied to the HW when all values are configured.
> > The decision to use such a struct instead of writing buffers one by one
> > 
> > is based on the following reasons:
> >   - Rockchip cores are known to misbehave when registers are not written
> >   
> >     in address order,
> 
> Could you please outline what makes you come to that conclusion?

Basically that: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
linux.git/commit/?id=1b3bb574569e5fe5aeb0a9c73848430b7e271c20

> >   - Those cores also need the software to write all registers, even if
> >   
> >     they are written their default values or are not related to the task
> >     (this core will not start decoding some H264 frames if some VP9
> >     registers are not written to 0)
> >   
> >   - In the future, to support multiple cores, the scheduler could be
> >   
> >     optimized by storing the precomputed registers values and copy them
> >     to the HW as soos as a core becomes available.
> 
> ....
> 
> > +/*
> > + * Constant CABAC table.
> > + */
> > +static const u32 rkvdec2_h264_cabac_table[928] = {
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 
0x21173307,
> > +	0x00150217, 0x31000901, 0x390576db, 0x41f54ef3, 0x310c3e01, 
0x321149fc,
> > +	0x2b094012, 0x431a001d, 0x68095a10, 0x68ec7fd2, 0x4ef34301, 
0x3e0141f5,
> > +	0x5fef56fa, 0x2d093dfa, 0x51fa45fd, 0x370660f5, 0x56fb4307, 
0x3a005802,
> > +	0x5ef64cfd, 0x45043605, 0x580051fd, 0x4afb43f9, 0x50fb4afc, 
0x3a0148f9,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 
0x4efc2d00,
> > +	0x7ee560fd, 0x65e762e4, 0x52e443e9, 0x53f05eec, 0x5beb6eea, 
0x5df366ee,
> > +	0x5cf97fe3, 0x60f959fb, 0x2efd6cf3, 0x39ff41ff, 0x4afd5df7, 
0x57f85cf7,
> > +	0x36057ee9, 0x3b063c06, 0x30ff4506, 0x45fc4400, 0x55fe58f8, 
0x4bff4efa,
> > +	0x36024df9, 0x44fd3205, 0x2a063201, 0x3f0151fc, 0x430046fc, 
0x4cfe3902,
> > +	0x4004230b, 0x230b3d01, 0x180c1912, 0x240d1d0d, 0x49f95df6, 
0x2e0d49fe,
> > +	0x64f93109, 0x35023509, 0x3dfe3505, 0x38003800, 0x3cfb3ff3, 
0x39043eff,
> > +	0x390445fa, 0x3304270e, 0x4003440d, 0x3f093d01, 0x27103207, 
0x34042c05,
> > +	0x3cfb300b, 0x3b003bff, 0x2c052116, 0x4eff2b0e, 0x45093c00, 
0x28021c0b,
> > +	0x31002c03, 0x2c022e00, 0x2f003302, 0x3e022704, 0x36002e06, 
0x3a023603,
> > +	0x33063f04, 0x35073906, 0x37063406, 0x240e2d0b, 0x52ff3508, 
0x4efd3707,
> > +	0x1f162e0f, 0x071954ff, 0x031cf91e, 0x0020041c, 0x061eff22, 
0x0920061e,
> > +	0x1b1a131f, 0x14251e1a, 0x4611221c, 0x3b054301, 0x1e104309, 
0x23122012,
> > +	0x1f181d16, 0x2b122617, 0x3f0b2914, 0x40093b09, 0x59fe5eff, 
0x4cfa6cf7,
> > +	0x2d002cfe, 0x40fd3400, 0x46fc3bfe, 0x52f84bfc, 0x4df766ef, 
0x2a001803,
> > +	0x37003000, 0x47f93bfa, 0x57f553f4, 0x3a0177e2, 0x24ff1dfd, 
0x2b022601,
> > +	0x3a0037fa, 0x4afd4000, 0x46005af6, 0x1f051dfc, 0x3b012a07, 
0x48fd3afe,
> > +	0x61f551fd, 0x05083a00, 0x120e0e0a, 0x28021b0d, 0x46fd3a00, 
0x55f84ffa,
> > +	0x6af30000, 0x57f66af0, 0x6eee72eb, 0x6eea62f2, 0x67ee6aeb, 
0x6ce96beb,
> > +	0x60f670e6, 0x5bfb5ff4, 0x5eea5df7, 0x430956fb, 0x55f650fc, 
0x3c0746ff,
> > +	0x3d053a09, 0x320f320c, 0x36113112, 0x2e07290a, 0x310733ff, 
0x29093408,
> > +	0x37022f06, 0x2c0a290d, 0x35053206, 0x3f04310d, 0x45fe4006, 
0x46063bfe,
> > +	0x1f092c0a, 0x35032b0c, 0x260a220e, 0x280d34fd, 0x2c072011, 
0x320d2607,
> > +	0x2b1a390a, 0x0e0b0b0e, 0x0b120b09, 0xfe170915, 0xf120f120, 
0xe927eb22,
> > +	0xe129df2a, 0xf426e42e, 0xe82d1d15, 0xe630d335, 0xed2bd541, 
0x091ef627,
> > +	0x1b141a12, 0x52f23900, 0x61ed4bfb, 0x001b7ddd, 0xfc1f001c, 
0x0822061b,
> > +	0x16180a1e, 0x20161321, 0x29151f1a, 0x2f172c1a, 0x470e4110, 
0x3f063c08,
> > +	0x18154111, 0x171a1417, 0x171c201b, 0x2817181c, 0x1d1c2018, 
0x39132a17,
> > +	0x3d163516, 0x280c560b, 0x3b0e330b, 0x47f94ffc, 0x46f745fb, 
0x44f642f8,
> > +	0x45f449ed, 0x43f146f0, 0x46ed3eec, 0x41ea42f0, 0xfe093fec, 
0xf721f71a,
> > +	0xfe29f927, 0x0931032d, 0x3b241b2d, 0x23f942fa, 0x2df82af9, 
0x38f430fb,
> > +	0x3efb3cfa, 0x4cf842f8, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 
0x53f64afc,
> > +	0x43f747f7, 0x42f83dff, 0x3b0042f2, 0xf3153b02, 0xf927f221, 
0x0233fe2e,
> > +	0x113d063c, 0x3e2a2237, 0x00000000, 0x00000000, 0x3602f114, 
0xf1144a03,
> > +	0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x19163307, 0x00100022, 
0x290409fe,
> > +	0x410276e3, 0x4ff347fa, 0x32093405, 0x360a46fd, 0x1613221a, 
0x02390028,
> > +	0x451a2429, 0x65f17fd3, 0x47fa4cfc, 0x34054ff3, 0x5af34506, 
0x2b083400,
> > +	0x52fb45fe, 0x3b0260f6, 0x57fd4b02, 0x380164fd, 0x55fa4afd, 
0x51fd3b00,
> > +	0x5ffb56f9, 0x4dff42ff, 0x56fe4601, 0x3d0048fb, 0x3f002900, 
0x3f003f00,
> > +	0x560453f7, 0x48f96100, 0x3e03290d, 0x33070f0d, 0x7fd95002, 
0x60ef5bee,
> > +	0x62dd51e6, 0x61e966e8, 0x63e877e5, 0x66ee6eeb, 0x50007fdc, 
0x5ef959fb,
> > +	0x27005cfc, 0x54f14100, 0x49fe7fdd, 0x5bf768f4, 0x37037fe1, 
0x37073807,
> > +	0x35fd3d08, 0x4af94400, 0x67f358f7, 0x59f75bf3, 0x4cf85cf2, 
0x6ee957f4,
> > +	0x4ef669e8, 0x63ef70ec, 0x7fba7fb2, 0x7fd27fce, 0x4efb42fc, 
0x48f847fc,
> > +	0x37ff3b02, 0x4bfa46f9, 0x77de59f8, 0x14204bfd, 0x7fd4161e, 
0x3dfb3600,
> > +	0x3cff3a00, 0x43f83dfd, 0x4af254e7, 0x340541fb, 0x3d003902, 
0x46f545f7,
> > +	0x47fc3712, 0x3d073a00, 0x19122909, 0x2b052009, 0x2c002f09, 
0x2e023300,
> > +	0x42fc2613, 0x2a0c260f, 0x59002209, 0x1c0a2d04, 0xf5211f0a, 
0x0f12d534,
> > +	0xea23001c, 0x0022e726, 0xf420ee27, 0x0000a266, 0xfc21f138, 
0xfb250a1d,
> > +	0xf727e333, 0xc645de34, 0xfb2cc143, 0xe3370720, 0x00000120, 
0xe721241b,
> > +	0xe424e222, 0xe526e426, 0xf023ee22, 0xf820f222, 0x0023fa25, 
0x121c0a1e,
> > +	0x291d191a, 0x48024b00, 0x230e4d08, 0x23111f12, 0x2d111e15, 
0x2d122a14,
> > +	0x36101a1b, 0x38104207, 0x430a490b, 0x70e974f6, 0x3df947f1, 
0x42fb3500,
> > +	0x50f74df5, 0x57f654f7, 0x65eb7fde, 0x35fb27fd, 0x4bf53df9, 
0x5bef4df1,
> > +	0x6fe76be7, 0x4cf57ae4, 0x34f62cf6, 0x3af739f6, 0x45f948f0, 
0x4afb45fc,
> > +	0x420256f7, 0x200122f7, 0x34051f0b, 0x43fe37fe, 0x59f84900, 
0x04073403,
> > +	0x0811080a, 0x25031310, 0x49fb3dff, 0x4efc46ff, 0x7eeb0000, 
0x6eec7ce9,
> > +	0x7ce77ee6, 0x79e569ef, 0x66ef75e5, 0x74e575e6, 0x5ff67adf, 
0x5ff864f2,
> > +	0x72e46fef, 0x50fe59fa, 0x55f752fc, 0x48ff51f8, 0x43014005, 
0x45003809,
> > +	0x45074501, 0x43fa45f9, 0x40fe4df0, 0x43fa3d02, 0x390240fd, 
0x42fd41fd,
> > +	0x33093e00, 0x47fe42ff, 0x46ff4bfe, 0x3c0e48f7, 0x2f002510, 
0x250b2312,
> > +	0x290a290c, 0x290c3002, 0x3b00290d, 0x28133203, 0x32124203, 
0xfa12fa13,
> > +	0xf41a000e, 0xe721f01f, 0xe425ea21, 0xe22ae227, 0xdc2dd62f, 
0xef29de31,
> > +	0xb9450920, 0xc042c13f, 0xd936b64d, 0xf629dd34, 0xff280024, 
0x1a1c0e1e,
> > +	0x370c2517, 0xdf25410b, 0xdb28dc27, 0xdf2ee226, 0xe828e22a, 
0xf426e331,
> > +	0xfd26f628, 0x141ffb2e, 0x2c191e1d, 0x310b300c, 0x16162d1a, 
0x151b1617,
> > +	0x1c1a1421, 0x221b181e, 0x27192a12, 0x460c3212, 0x470e3615, 
0x2019530b,
> > +	0x36153115, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64afc, 
0x43f747f7,
> > +	0x42f83dff, 0x3b0042f2, 0xf6113b02, 0xf72af320, 0x0035fb31, 
0x0a440340,
> > +	0x392f1b42, 0x180047fb, 0x2afe24ff, 0x39f734fe, 0x41fc3ffa, 
0x52f943fc,
> > +	0x4cfd51fd, 0x4efa48f9, 0x44f248f4, 0x4cfa46fd, 0x3efb42fb, 
0x3dfc3900,
> > +	0x36013cf7, 0xf6113a02, 0xf72af320, 0x0035fb31, 0x0a440340, 
0x392f1b42,
> > +	0x00000000, 0x00000000, 0x3602f114, 0xf1144a03, 0x4a033602, 
0x68e97fe4,
> > +	0x36ff35fa, 0x101d3307, 0x000e0019, 0x3efd33f6, 0x101a63e5, 
0x66e855fc,
> > +	0x39063905, 0x390e49ef, 0x0a142814, 0x0036001d, 0x610c2a25, 
0x75ea7fe0,
> > +	0x55fc4afe, 0x390566e8, 0x58f25dfa, 0x37042cfa, 0x67f159f5, 
0x391374eb,
> > +	0x54043a14, 0x3f016006, 0x6af355fb, 0x4b063f05, 0x65ff5afd, 
0x4ffc3703,
> > +	0x61f44bfe, 0x3c0132f9, 0x3f002900, 0x3f003f00, 0x560453f7, 
0x48f96100,
> > +	0x3e03290d, 0x58f72207, 0x7fdc7fec, 0x5ff25bef, 0x56e754e7, 
0x5bef59f4,
> > +	0x4cf27fe1, 0x5af367ee, 0x500b7fdb, 0x54024c05, 0x37fa4e05, 
0x53f23d04,
> > +	0x4ffb7fdb, 0x5bf568f5, 0x41007fe2, 0x48004ffe, 0x38fa5cfc, 
0x47f84403,
> > +	0x56fc62f3, 0x52fb58f4, 0x43fc48fd, 0x59f048f8, 0x3bff45f7, 
0x39044205,
> > +	0x47fe47fc, 0x4aff3a02, 0x45ff2cfc, 0x33f93e00, 0x2afa2ffc, 
0x35fa29fd,
> > +	0x4ef74c08, 0x340953f5, 0x5afb4300, 0x48f14301, 0x50f84bfb, 
0x40eb53eb,
> > +	0x40e71ff3, 0x4b095ee3, 0x4af83f11, 0x1bfe23fb, 0x41035b0d, 
0x4d0845f9,
> > +	0x3e0342f6, 0x51ec44fd, 0x07011e00, 0x4aeb17fd, 0x7ce94210, 
0xee2c2511,
> > +	0x7feade32, 0x2a002704, 0x1d0b2207, 0x25061f08, 0x28032a07, 
0x2b0d2108,
> > +	0x2f04240d, 0x3a023703, 0x2c083c06, 0x2a0e2c0b, 0x38043007, 
0x250d3404,
> > +	0x3a133109, 0x2d0c300a, 0x21144500, 0xee233f08, 0xfd1ce721, 
0x001b0a18,
> > +	0xd434f222, 0x1113e827, 0x1d24191f, 0x0f222118, 0x4916141e, 
0x1f132214,
> > +	0x10132c1b, 0x240f240f, 0x15191c15, 0x0c1f141e, 0x2a18101b, 
0x380e5d00,
> > +	0x261a390f, 0x73e87fe8, 0x3ef752ea, 0x3b003500, 0x59f355f2, 
0x5cf55ef3,
> > +	0x64eb7fe3, 0x43f439f2, 0x4df647f5, 0x58f055eb, 0x62f168e9, 
0x52f67fdb,
> > +	0x3df830f8, 0x46f942f8, 0x4ff64bf2, 0x5cf453f7, 0x4ffc6cee, 
0x4bf045ea,
> > +	0x3a013afe, 0x53f74ef3, 0x63f351fc, 0x26fa51f3, 0x3afa3ef3, 
0x49f03bfe,
> > +	0x56f34cf6, 0x57f653f7, 0x7fea0000, 0x78e77fe7, 0x72ed7fe5, 
0x76e775e9,
> > +	0x71e875e6, 0x78e176e4, 0x5ef67cdb, 0x63f666f1, 0x7fce6af3, 
0x39115cfb,
> > +	0x5ef356fb, 0x4dfe5bf4, 0x49ff4700, 0x51f94004, 0x390f4005, 
0x44004301,
> > +	0x440143f6, 0x40024d00, 0x4efb4400, 0x3b053707, 0x360e4102, 
0x3c052c0f,
> > +	0x4cfe4602, 0x460c56ee, 0x46f44005, 0x3805370b, 0x41024500, 
0x36054afa,
> > +	0x4cfa3607, 0x4dfe52f5, 0x2a194dfe, 0xf710f311, 0xeb1bf411, 
0xd829e225,
> > +	0xd130d72a, 0xd82ee027, 0xd72ecd34, 0xed2bd934, 0xc93d0b20, 
0xce3ed238,
> > +	0xec2dbd51, 0x0f1cfe23, 0x01270122, 0x2614111e, 0x360f2d12, 
0xf0244f00,
> > +	0xef25f225, 0x0f220120, 0x19180f1d, 0x101f1622, 0x1c1f1223, 
0x1c242921,
> > +	0x3e152f1b, 0x1a131f12, 0x17181824, 0x1e18101b, 0x29161d1f, 
0x3c102a16,
> > +	0x3c0e340f, 0x7bf04e03, 0x38163515, 0x21153d19, 0x3d113213, 
0x4af84efd,
> > +	0x48f648f7, 0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 
0x34f73bf2,
> > +	0xfe0944f5, 0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 
0x25f947f7,
> > +	0x31f52cf8, 0x3bf438f6, 0x43f73ff8, 0x4ff644fa, 0x4af84efd, 
0x48f648f7,
> > +	0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf2, 
0xfe0944f5,
> > +	0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x00000000, 
0x00000000,
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 
0x00003307,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
0x00000000,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
0x00000000,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 
0x37010b00,
> > +	0x7fef4500, 0x520066f3, 0x6beb4af9, 0x7fe17fe5, 0x5fee7fe8, 
0x72eb7fe5,
> > +	0x7bef7fe2, 0x7af073f4, 0x3ff473f5, 0x54f144fe, 0x46fd68f3, 
0x5af65df8,
> > +	0x4aff7fe2, 0x5bf961fa, 0x38fc7fec, 0x4cf952fb, 0x5df97dea, 
0x4dfd57f5,
> > +	0x3ffc47fb, 0x54f444fc, 0x41f93ef9, 0x38053d08, 0x400142fe, 
0x4efe3d00,
> > +	0x34073201, 0x2c00230a, 0x2d01260b, 0x2c052e00, 0x3301111f, 
0x131c3207,
> > +	0x3e0e2110, 0x64f16cf3, 0x5bf365f3, 0x58f65ef4, 0x56f654f0, 
0x57f353f9,
> > +	0x46015eed, 0x4afb4800, 0x66f83b12, 0x5f0064f1, 0x48024bfc, 
0x47fd4bf5,
> > +	0x45f32e0f, 0x41003e00, 0x48f12515, 0x36103909, 0x480c3e00, 
0x090f0018,
> > +	0x120d1908, 0x130d090f, 0x120c250a, 0x21141d06, 0x2d041e0f, 
0x3e003a01,
> > +	0x260c3d07, 0x270f2d0b, 0x2c0d2a0b, 0x290c2d10, 0x221e310a, 
0x370a2a12,
> > +	0x2e113311, 0xed1a5900, 0xef1aef16, 0xec1ce71e, 0xe525e921, 
0xe428e921,
> > +	0xf521ef26, 0xfa29f128, 0x11290126, 0x031bfa1e, 0xf025161a, 
0xf826fc23,
> > +	0x0325fd26, 0x002a0526, 0x16271023, 0x251b300e, 0x440c3c15, 
0x47fd6102,
> > +	0x32fb2afa, 0x3efe36fd, 0x3f013a00, 0x4aff48fe, 0x43fb5bf7, 
0x27fd1bfb,
> > +	0x2e002cfe, 0x44f840f0, 0x4dfa4ef6, 0x5cf456f6, 0x3cf637f1, 
0x41fc3efa,
> > +	0x4cf849f4, 0x58f750f9, 0x61f56eef, 0x4ff554ec, 0x4afc49fa, 
0x60f356f3,
> > +	0x75ed61f5, 0x21fb4ef8, 0x35fe30fc, 0x47f33efd, 0x56f44ff6, 
0x61f25af3,
> > +	0x5dfa0000, 0x4ff854fa, 0x47ff4200, 0x3cfe3e00, 0x4bfb3bfe, 
0x3afc3efd,
> > +	0x4fff42f7, 0x44034700, 0x3ef92c0a, 0x280e240f, 0x1d0c1b10, 
0x24142c01,
> > +	0x2a052012, 0x3e0a3001, 0x40092e11, 0x61f568f4, 0x58f960f0, 
0x55f955f8,
> > +	0x58f355f7, 0x4dfd4204, 0x4cfa4cfd, 0x4cff3a0a, 0x63f953ff, 
0x5f025ff2,
> > +	0x4afb4c00, 0x4bf54600, 0x41004401, 0x3e0349f2, 0x44ff3e04, 
0x370b4bf3,
> > +	0x460c4005, 0x1306060f, 0x0e0c1007, 0x0b0d0d12, 0x100f0f0d, 
0x170d170c,
> > +	0x1a0e140f, 0x28112c0e, 0x11182f11, 0x16191515, 0x1d161b1f, 
0x320e2313,
> > +	0x3f07390a, 0x52fc4dfe, 0x45095efd, 0xdd246df4, 0xe620de24, 
0xe02ce225,
> > +	0xf122ee22, 0xf921f128, 0x0021fb23, 0x0d210226, 0x3a0d2317, 
0x001afd1d,
> > +	0xf91f1e16, 0xfd22f123, 0xff240322, 0x0b200522, 0x0c220523, 
0x1d1e0b27,
> > +	0x271d1a22, 0x151f4213, 0x32191f1f, 0x70ec78ef, 0x55f572ee, 
0x59f25cf1,
> > +	0x51f147e6, 0x440050f2, 0x38e846f2, 0x32e844e9, 0xf3174af5, 
0xf128f31a,
> > +	0x032cf231, 0x222c062d, 0x52133621, 0x17ff4bfd, 0x2b012201, 
0x37fe3600,
> > +	0x40013d00, 0x5cf74400, 0x61f36af2, 0x5af45af1, 0x49f658ee, 
0x56f24ff7,
> > +	0x46f649f6, 0x42fb45f6, 0x3afb40f7, 0xf6153b02, 0xf81cf518, 
0x031dff1c,
> > +	0x1423091d, 0x430e241d, 0x00000000, 0x00000000
> > +};
> 
> If I'm seeing it correctly the H.264 CABAC table it the same like for the
> old rkvdec version. Boris did such a great job with constructing it based
> on the standard. Please reuse it instead of pasting blobs.

I wasn't sure it was the same, I'll use Boris' standard version and check that 
everythin is still working.

> > +
> > +static void assemble_hw_pps(struct rkvdec2_ctx *ctx,
> > +			    struct rkvdec2_h264_run *run)
> > +{
> > +	struct rkvdec2_h264_ctx *h264_ctx = ctx->priv;
> > +	const struct v4l2_ctrl_h264_sps *sps = run->sps;
> > +	const struct v4l2_ctrl_h264_pps *pps = run->pps;
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =
> > run->decode_params; +	const struct v4l2_h264_dpb_entry *dpb =
> > dec_params->dpb;
> > +	struct rkvdec2_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
> > +	struct rkvdec2_sps_pps *hw_ps;
> > +	dma_addr_t scaling_list_address;
> > +	u32 scaling_distance;
> > +	u32 i;
> 
> ....
> 
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
> > +			      &h264_ctx->regs.common,
> > +			      sizeof(h264_ctx->regs.common));
> 
> This will limit the driver to arm64 which is not great. Rockchip is still
> inventing (vision) SoCs based on arm which might want to use this driver as
> well. So there should be at least an alternative.

I see, I can maybe simply use memcpy_toio on arm. It wasn't working on arm64 
because it wasn't only writing 32 bits values. IT can be a start at least for 
supporting future arm devices.

> Alex


--nextPart5548811.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZwRZMACgkQ5EFKUk4x
7bbaTggAig5cKulFhsr9FlruZoi9QuVQpw8EIKIVPGqpHR9acZMxKp+UJjY2ZiYw
7B8uaZ/Lfot6r9ynjDwb0bVMuo341Trg+dybOPhCc7v7TVP07sQNpQ/mAe9bhcmH
c6K4RcoZsSdyuvFkkQroZNhvXloB83sfcgJXJZzLPUAnGyvmoe0OxDFDtnyEDEOE
DtSmkro7c1rgKUnSRgTs3q8UvqM3wa2HZ3pCBHhZ/6/JgQ3x5k/kNJIWLc8IPwJx
V1CPMcg7UZooKfkChHFwtphfP6HHW6iK8Ek7Qzwma0VXjmMChn2iPH8gJasNSYCM
A1j1KeWoT0YkFam5TondWkLBf7lI3A==
=Eu7y
-----END PGP SIGNATURE-----

--nextPart5548811.5fSG56mABF--




