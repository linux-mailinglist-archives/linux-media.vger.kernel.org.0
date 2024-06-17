Return-Path: <linux-media+bounces-13455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E090B4CE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A456A1F21237
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC8A178CCB;
	Mon, 17 Jun 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0uL5g/p1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE2153BFD
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637014; cv=none; b=twJBCGVvnOIUUDU/WTklbCYiPcW2ui+hWFrQGi3qzYReFY3QcE0m5HTzs51XNhGHAsI6Og9/z082MbolMtUDy6o8B90SRqosbG6FHJhUEUiAVYhvq9y4CZcppD6R2ParSF4xp0w0EqENGF8W9xtfZrH5GSRk32x5H8lMZbfFQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637014; c=relaxed/simple;
	bh=x6sAvfSV1Rm7bfxx2phEc85cOwKmxIGQAmFwgc5OD44=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWRi652NzSVOLxHj1TY4JcvMoFOVixem1c8+Dp/NQ5NZc4LrOJBOIVlPxN2zLiWm+taxKTJ5Mz9VPN0QWx4GFwrYpMk2RVmDc/YK84GvnnVjY6rzMJdGz9K494p7LZCkue9BFf3DquxJfGDGf+9ghLeqmK2PIGWErVoEFjRskpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0uL5g/p1; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-440556a5cbdso26895671cf.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718637010; x=1719241810; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e1NpQn9hDfqqSTgxiqFruC89sWAItGyC7wDbD1bCDzs=;
        b=0uL5g/p1nHzwgjZgitzqS4ZW2iftVwwreliQCsLNyONwvL/lmIcfLWSOKgOHs7HR/Z
         e/pi4cjL2PPxYkGs0opNIo/DQvuBGp87Fqs+Nvkdo692ZK7OunjDdsvzJku2yXeu7A9X
         6iOKebhZaqpky+hqVb5wx9p9iomNPDZHqvrnklenD4KIBETCoSZkI4iyxwUIGcgKhqWN
         yMPwa3iGVzXZY/WqoN/wCMN1pXQ9vqyWKyYssG9Jo6CiZLPWEG2/DKWi43NXo6IGm1yu
         ugCPUGvdHT3iJlqACfrBGln0+sKMQhASVYLToJHK1wCTnc+2TuD5rymnkCOFWYQmkstN
         Capg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637010; x=1719241810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1NpQn9hDfqqSTgxiqFruC89sWAItGyC7wDbD1bCDzs=;
        b=gQntwZ8MELiWZse6fqcVgxL0lk3uNFfgqzvmyOyHSiQVByqhEhuH0O3HnZbubmA2/q
         qR/Ke3kkhLMyY9hN1gKFh/rU09+9bFvK+kt3ik++Ya7s0rMUVjwG/MhWuZ2rUQSHVTof
         YPb7XpFVUjZil24yXKggFIAWGt8W5P8BFLKOWX8REOERR1USeCy1VqTwMEEsV08DFQim
         V3rf2T08a9CCDD5i9q0ZVFFl26wnxQJcChhKB8G5jQ3l5kXDv6nuoOQQKplcRfjY4Eeg
         DoOlsVJaVMXkx+9S8JcEnDZHAIkkTQCFSBqGLNllSzo2LGcqU0paIRn/d3x20AX/O/q+
         iHSg==
X-Forwarded-Encrypted: i=1; AJvYcCXsDMsfPkcv8GPZ9Au6OqzOGMM0f5TB5gDBbB7UYMMBM+qGIs8N/bb7AF5gwuRQy8yL0PA6yhHJMZ6DIQBYDFq688P4/YEhw7dKOB4=
X-Gm-Message-State: AOJu0YxpaBRHKLGnP6wRm4WJIW0PinwdFzpdBcNkNTMy3VwCMCT5SRkP
	Bj2+uLJtuG2b6vgaVZoFpUG6LQW6zNfMYcvNggg0BfUC1zCdVDvbgv8G5Vb3caI=
X-Google-Smtp-Source: AGHT+IGlAT7gcU5RGxdGg800SoXmHs22WJ9QhXRntaY3M+D59UH4qtXrjws3FWB+85Wio2ktlivfkw==
X-Received: by 2002:ac8:7dc4:0:b0:43f:ecb3:14f6 with SMTP id d75a77b69052e-442168a8473mr112799541cf.3.1718637010241;
        Mon, 17 Jun 2024 08:10:10 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:57da::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2fd334bsm46829471cf.69.2024.06.17.08.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:10:09 -0700 (PDT)
Message-ID: <3a5de947c428c2936e98de26b7005870420259e8.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alex Bee <knaerzche@gmail.com>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>, Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Diederik de Haas
 <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Date: Mon, 17 Jun 2024 11:10:08 -0400
In-Reply-To: <f301fb0b-bf87-49ef-847c-dbfae00f3a11@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
	 <20240615015734.1612108-2-detlev.casanova@collabora.com>
	 <f301fb0b-bf87-49ef-847c-dbfae00f3a11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alex,

Le lundi 17 juin 2024 =C3=A0 06:49 +0200, Alex Bee a =C3=A9crit=C2=A0:
> Hi,
> Am 15.06.24 um 03:56 schrieb Detlev Casanova:
> > This driver supports the second generation of the Rockchip Video
> > decoder, also known as vdpu34x.
> > It is currently only used on the RK3588(s) SoC.
> >=20
> > There are 2 decoders on the RK3588 SoC that can work in pair to decode
> > 8K video at 30 FPS but currently, only using one core at a time is
> > supported.
> >=20
> > Scheduling requests between the two cores will be implemented later.
>=20
> Regarding the cores:
> Did anyone of you ever check the CCU (which I tink stands for central
> control unit). This feature doesn't seem to be implemented by the BSP
> (neither kernel nor mpp), but the configuration workflow is described
> pretty well in RK3588's TRM v 1.0 ("5.6.5 VDPU381 CCU configuration flow"=
,
> page 676): It "sounds" a lot like with this enabled you do not even haven
> to care about scheduling/concurrency ... whatever for the cores - you're
> just saying how much cores you want to use and the rest is done by this H=
W
> block. I'm mentioning this early in the iterarration of this series as is

I saw the reference in the documentation, but could not understand how the
scheduler there can work. I believe we are missing the documentation for th=
e CCU
configuration binary that needs to be passed to sw_ccu_llp_cfg_addr. The CC=
U
also seems to have a sequence to apply this configuration (see
RKVDEC_CCU_SWREG3_CCU_CONFIG_DONE register), this is also not clear to me.

Overall, its not clear to be that the CCU can actually schedule multiple st=
reams
concurrently. The biggest hint toward this is that it reports the completio=
n
base on the frame number, a method that completely fall appart if you have
multiple streams. Until Rockchip demonstrate how this chip can work, I don'=
t
think we'll have much success. This might also mean that link mode is somet=
hing
to be ignored for now.

> it might / would infect DT modeling. The same is true, btw., for the 4
> hantro H1 encoder cores: They can also be controled by a (own) CCU.

The CCU seems to be only usable for the RKVDEC IP, I don't believe you can =
use
it for the modified Hantro H1 encoders array.

As scheduling will be needed anyway for the Hantro H1 array, to fix issues =
with
Mediatek VCODEC dual stages (with a core per stage), and even possibly for
future upstreaming of RPi4/5 HEVC decoder which has dual stage, 1 core.

Intermediate implementation can simply schedule different streams to differ=
ent
cores concurrently, with 4K limitation, that would be the same method for H=
1
array. Scheduling a mix of 8K + <4K streams is slightly more complex, as yo=
u
want  a way to not starve the 8K streams.

>=20
> > The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> > currently only supports H264.
> >=20
> > The driver is based on rkvdec and they may share some code in the
> > future.
> > The decision to make a different driver is mainly because rkvdec2 has
> > more features and can work with multiple cores.
> >=20
> > The registers are mapped in a struct in RAM using bitfields. It is IO
> > copied to the HW when all values are configured.
> > The decision to use such a struct instead of writing buffers one by one
> > is based on the following reasons:
> >   - Rockchip cores are known to misbehave when registers are not writte=
n
> >     in address order,
>=20
> Could you please outline what makes you come to that conclusion?

Should be rephrased, since its Hantro core that is known having side effect
while writing the registers:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D1b3bb574569e5fe5aeb0a9c73848430b7e271c20

But we all noticed how similar RKVDEC IP can be, and we can combine with th=
e
fact that this is also what the mpp services driver do, meaning how the HW =
has
been validated to work.

>=20
> >   - Those cores also need the software to write all registers, even if
> >     they are written their default values or are not related to the tas=
k
> >     (this core will not start decoding some H264 frames if some VP9
> >     registers are not written to 0)
> >   - In the future, to support multiple cores, the scheduler could be
> >     optimized by storing the precomputed registers values and copy them
> >     to the HW as soos as a core becomes available.
> >=20
> ....
>=20
> > +/*
> > + * Constant CABAC table.
> > + */
> > +static const u32 rkvdec2_h264_cabac_table[928] =3D {
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x2117330=
7,
> > +	0x00150217, 0x31000901, 0x390576db, 0x41f54ef3, 0x310c3e01, 0x321149f=
c,
> > +	0x2b094012, 0x431a001d, 0x68095a10, 0x68ec7fd2, 0x4ef34301, 0x3e0141f=
5,
> > +	0x5fef56fa, 0x2d093dfa, 0x51fa45fd, 0x370660f5, 0x56fb4307, 0x3a00580=
2,
> > +	0x5ef64cfd, 0x45043605, 0x580051fd, 0x4afb43f9, 0x50fb4afc, 0x3a0148f=
9,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x4efc2d0=
0,
> > +	0x7ee560fd, 0x65e762e4, 0x52e443e9, 0x53f05eec, 0x5beb6eea, 0x5df366e=
e,
> > +	0x5cf97fe3, 0x60f959fb, 0x2efd6cf3, 0x39ff41ff, 0x4afd5df7, 0x57f85cf=
7,
> > +	0x36057ee9, 0x3b063c06, 0x30ff4506, 0x45fc4400, 0x55fe58f8, 0x4bff4ef=
a,
> > +	0x36024df9, 0x44fd3205, 0x2a063201, 0x3f0151fc, 0x430046fc, 0x4cfe390=
2,
> > +	0x4004230b, 0x230b3d01, 0x180c1912, 0x240d1d0d, 0x49f95df6, 0x2e0d49f=
e,
> > +	0x64f93109, 0x35023509, 0x3dfe3505, 0x38003800, 0x3cfb3ff3, 0x39043ef=
f,
> > +	0x390445fa, 0x3304270e, 0x4003440d, 0x3f093d01, 0x27103207, 0x34042c0=
5,
> > +	0x3cfb300b, 0x3b003bff, 0x2c052116, 0x4eff2b0e, 0x45093c00, 0x28021c0=
b,
> > +	0x31002c03, 0x2c022e00, 0x2f003302, 0x3e022704, 0x36002e06, 0x3a02360=
3,
> > +	0x33063f04, 0x35073906, 0x37063406, 0x240e2d0b, 0x52ff3508, 0x4efd370=
7,
> > +	0x1f162e0f, 0x071954ff, 0x031cf91e, 0x0020041c, 0x061eff22, 0x0920061=
e,
> > +	0x1b1a131f, 0x14251e1a, 0x4611221c, 0x3b054301, 0x1e104309, 0x2312201=
2,
> > +	0x1f181d16, 0x2b122617, 0x3f0b2914, 0x40093b09, 0x59fe5eff, 0x4cfa6cf=
7,
> > +	0x2d002cfe, 0x40fd3400, 0x46fc3bfe, 0x52f84bfc, 0x4df766ef, 0x2a00180=
3,
> > +	0x37003000, 0x47f93bfa, 0x57f553f4, 0x3a0177e2, 0x24ff1dfd, 0x2b02260=
1,
> > +	0x3a0037fa, 0x4afd4000, 0x46005af6, 0x1f051dfc, 0x3b012a07, 0x48fd3af=
e,
> > +	0x61f551fd, 0x05083a00, 0x120e0e0a, 0x28021b0d, 0x46fd3a00, 0x55f84ff=
a,
> > +	0x6af30000, 0x57f66af0, 0x6eee72eb, 0x6eea62f2, 0x67ee6aeb, 0x6ce96be=
b,
> > +	0x60f670e6, 0x5bfb5ff4, 0x5eea5df7, 0x430956fb, 0x55f650fc, 0x3c0746f=
f,
> > +	0x3d053a09, 0x320f320c, 0x36113112, 0x2e07290a, 0x310733ff, 0x2909340=
8,
> > +	0x37022f06, 0x2c0a290d, 0x35053206, 0x3f04310d, 0x45fe4006, 0x46063bf=
e,
> > +	0x1f092c0a, 0x35032b0c, 0x260a220e, 0x280d34fd, 0x2c072011, 0x320d260=
7,
> > +	0x2b1a390a, 0x0e0b0b0e, 0x0b120b09, 0xfe170915, 0xf120f120, 0xe927eb2=
2,
> > +	0xe129df2a, 0xf426e42e, 0xe82d1d15, 0xe630d335, 0xed2bd541, 0x091ef62=
7,
> > +	0x1b141a12, 0x52f23900, 0x61ed4bfb, 0x001b7ddd, 0xfc1f001c, 0x0822061=
b,
> > +	0x16180a1e, 0x20161321, 0x29151f1a, 0x2f172c1a, 0x470e4110, 0x3f063c0=
8,
> > +	0x18154111, 0x171a1417, 0x171c201b, 0x2817181c, 0x1d1c2018, 0x39132a1=
7,
> > +	0x3d163516, 0x280c560b, 0x3b0e330b, 0x47f94ffc, 0x46f745fb, 0x44f642f=
8,
> > +	0x45f449ed, 0x43f146f0, 0x46ed3eec, 0x41ea42f0, 0xfe093fec, 0xf721f71=
a,
> > +	0xfe29f927, 0x0931032d, 0x3b241b2d, 0x23f942fa, 0x2df82af9, 0x38f430f=
b,
> > +	0x3efb3cfa, 0x4cf842f8, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64af=
c,
> > +	0x43f747f7, 0x42f83dff, 0x3b0042f2, 0xf3153b02, 0xf927f221, 0x0233fe2=
e,
> > +	0x113d063c, 0x3e2a2237, 0x00000000, 0x00000000, 0x3602f114, 0xf1144a0=
3,
> > +	0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x19163307, 0x00100022, 0x290409f=
e,
> > +	0x410276e3, 0x4ff347fa, 0x32093405, 0x360a46fd, 0x1613221a, 0x0239002=
8,
> > +	0x451a2429, 0x65f17fd3, 0x47fa4cfc, 0x34054ff3, 0x5af34506, 0x2b08340=
0,
> > +	0x52fb45fe, 0x3b0260f6, 0x57fd4b02, 0x380164fd, 0x55fa4afd, 0x51fd3b0=
0,
> > +	0x5ffb56f9, 0x4dff42ff, 0x56fe4601, 0x3d0048fb, 0x3f002900, 0x3f003f0=
0,
> > +	0x560453f7, 0x48f96100, 0x3e03290d, 0x33070f0d, 0x7fd95002, 0x60ef5be=
e,
> > +	0x62dd51e6, 0x61e966e8, 0x63e877e5, 0x66ee6eeb, 0x50007fdc, 0x5ef959f=
b,
> > +	0x27005cfc, 0x54f14100, 0x49fe7fdd, 0x5bf768f4, 0x37037fe1, 0x3707380=
7,
> > +	0x35fd3d08, 0x4af94400, 0x67f358f7, 0x59f75bf3, 0x4cf85cf2, 0x6ee957f=
4,
> > +	0x4ef669e8, 0x63ef70ec, 0x7fba7fb2, 0x7fd27fce, 0x4efb42fc, 0x48f847f=
c,
> > +	0x37ff3b02, 0x4bfa46f9, 0x77de59f8, 0x14204bfd, 0x7fd4161e, 0x3dfb360=
0,
> > +	0x3cff3a00, 0x43f83dfd, 0x4af254e7, 0x340541fb, 0x3d003902, 0x46f545f=
7,
> > +	0x47fc3712, 0x3d073a00, 0x19122909, 0x2b052009, 0x2c002f09, 0x2e02330=
0,
> > +	0x42fc2613, 0x2a0c260f, 0x59002209, 0x1c0a2d04, 0xf5211f0a, 0x0f12d53=
4,
> > +	0xea23001c, 0x0022e726, 0xf420ee27, 0x0000a266, 0xfc21f138, 0xfb250a1=
d,
> > +	0xf727e333, 0xc645de34, 0xfb2cc143, 0xe3370720, 0x00000120, 0xe721241=
b,
> > +	0xe424e222, 0xe526e426, 0xf023ee22, 0xf820f222, 0x0023fa25, 0x121c0a1=
e,
> > +	0x291d191a, 0x48024b00, 0x230e4d08, 0x23111f12, 0x2d111e15, 0x2d122a1=
4,
> > +	0x36101a1b, 0x38104207, 0x430a490b, 0x70e974f6, 0x3df947f1, 0x42fb350=
0,
> > +	0x50f74df5, 0x57f654f7, 0x65eb7fde, 0x35fb27fd, 0x4bf53df9, 0x5bef4df=
1,
> > +	0x6fe76be7, 0x4cf57ae4, 0x34f62cf6, 0x3af739f6, 0x45f948f0, 0x4afb45f=
c,
> > +	0x420256f7, 0x200122f7, 0x34051f0b, 0x43fe37fe, 0x59f84900, 0x0407340=
3,
> > +	0x0811080a, 0x25031310, 0x49fb3dff, 0x4efc46ff, 0x7eeb0000, 0x6eec7ce=
9,
> > +	0x7ce77ee6, 0x79e569ef, 0x66ef75e5, 0x74e575e6, 0x5ff67adf, 0x5ff864f=
2,
> > +	0x72e46fef, 0x50fe59fa, 0x55f752fc, 0x48ff51f8, 0x43014005, 0x4500380=
9,
> > +	0x45074501, 0x43fa45f9, 0x40fe4df0, 0x43fa3d02, 0x390240fd, 0x42fd41f=
d,
> > +	0x33093e00, 0x47fe42ff, 0x46ff4bfe, 0x3c0e48f7, 0x2f002510, 0x250b231=
2,
> > +	0x290a290c, 0x290c3002, 0x3b00290d, 0x28133203, 0x32124203, 0xfa12fa1=
3,
> > +	0xf41a000e, 0xe721f01f, 0xe425ea21, 0xe22ae227, 0xdc2dd62f, 0xef29de3=
1,
> > +	0xb9450920, 0xc042c13f, 0xd936b64d, 0xf629dd34, 0xff280024, 0x1a1c0e1=
e,
> > +	0x370c2517, 0xdf25410b, 0xdb28dc27, 0xdf2ee226, 0xe828e22a, 0xf426e33=
1,
> > +	0xfd26f628, 0x141ffb2e, 0x2c191e1d, 0x310b300c, 0x16162d1a, 0x151b161=
7,
> > +	0x1c1a1421, 0x221b181e, 0x27192a12, 0x460c3212, 0x470e3615, 0x2019530=
b,
> > +	0x36153115, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64afc, 0x43f747f=
7,
> > +	0x42f83dff, 0x3b0042f2, 0xf6113b02, 0xf72af320, 0x0035fb31, 0x0a44034=
0,
> > +	0x392f1b42, 0x180047fb, 0x2afe24ff, 0x39f734fe, 0x41fc3ffa, 0x52f943f=
c,
> > +	0x4cfd51fd, 0x4efa48f9, 0x44f248f4, 0x4cfa46fd, 0x3efb42fb, 0x3dfc390=
0,
> > +	0x36013cf7, 0xf6113a02, 0xf72af320, 0x0035fb31, 0x0a440340, 0x392f1b4=
2,
> > +	0x00000000, 0x00000000, 0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe=
4,
> > +	0x36ff35fa, 0x101d3307, 0x000e0019, 0x3efd33f6, 0x101a63e5, 0x66e855f=
c,
> > +	0x39063905, 0x390e49ef, 0x0a142814, 0x0036001d, 0x610c2a25, 0x75ea7fe=
0,
> > +	0x55fc4afe, 0x390566e8, 0x58f25dfa, 0x37042cfa, 0x67f159f5, 0x391374e=
b,
> > +	0x54043a14, 0x3f016006, 0x6af355fb, 0x4b063f05, 0x65ff5afd, 0x4ffc370=
3,
> > +	0x61f44bfe, 0x3c0132f9, 0x3f002900, 0x3f003f00, 0x560453f7, 0x48f9610=
0,
> > +	0x3e03290d, 0x58f72207, 0x7fdc7fec, 0x5ff25bef, 0x56e754e7, 0x5bef59f=
4,
> > +	0x4cf27fe1, 0x5af367ee, 0x500b7fdb, 0x54024c05, 0x37fa4e05, 0x53f23d0=
4,
> > +	0x4ffb7fdb, 0x5bf568f5, 0x41007fe2, 0x48004ffe, 0x38fa5cfc, 0x47f8440=
3,
> > +	0x56fc62f3, 0x52fb58f4, 0x43fc48fd, 0x59f048f8, 0x3bff45f7, 0x3904420=
5,
> > +	0x47fe47fc, 0x4aff3a02, 0x45ff2cfc, 0x33f93e00, 0x2afa2ffc, 0x35fa29f=
d,
> > +	0x4ef74c08, 0x340953f5, 0x5afb4300, 0x48f14301, 0x50f84bfb, 0x40eb53e=
b,
> > +	0x40e71ff3, 0x4b095ee3, 0x4af83f11, 0x1bfe23fb, 0x41035b0d, 0x4d0845f=
9,
> > +	0x3e0342f6, 0x51ec44fd, 0x07011e00, 0x4aeb17fd, 0x7ce94210, 0xee2c251=
1,
> > +	0x7feade32, 0x2a002704, 0x1d0b2207, 0x25061f08, 0x28032a07, 0x2b0d210=
8,
> > +	0x2f04240d, 0x3a023703, 0x2c083c06, 0x2a0e2c0b, 0x38043007, 0x250d340=
4,
> > +	0x3a133109, 0x2d0c300a, 0x21144500, 0xee233f08, 0xfd1ce721, 0x001b0a1=
8,
> > +	0xd434f222, 0x1113e827, 0x1d24191f, 0x0f222118, 0x4916141e, 0x1f13221=
4,
> > +	0x10132c1b, 0x240f240f, 0x15191c15, 0x0c1f141e, 0x2a18101b, 0x380e5d0=
0,
> > +	0x261a390f, 0x73e87fe8, 0x3ef752ea, 0x3b003500, 0x59f355f2, 0x5cf55ef=
3,
> > +	0x64eb7fe3, 0x43f439f2, 0x4df647f5, 0x58f055eb, 0x62f168e9, 0x52f67fd=
b,
> > +	0x3df830f8, 0x46f942f8, 0x4ff64bf2, 0x5cf453f7, 0x4ffc6cee, 0x4bf045e=
a,
> > +	0x3a013afe, 0x53f74ef3, 0x63f351fc, 0x26fa51f3, 0x3afa3ef3, 0x49f03bf=
e,
> > +	0x56f34cf6, 0x57f653f7, 0x7fea0000, 0x78e77fe7, 0x72ed7fe5, 0x76e775e=
9,
> > +	0x71e875e6, 0x78e176e4, 0x5ef67cdb, 0x63f666f1, 0x7fce6af3, 0x39115cf=
b,
> > +	0x5ef356fb, 0x4dfe5bf4, 0x49ff4700, 0x51f94004, 0x390f4005, 0x4400430=
1,
> > +	0x440143f6, 0x40024d00, 0x4efb4400, 0x3b053707, 0x360e4102, 0x3c052c0=
f,
> > +	0x4cfe4602, 0x460c56ee, 0x46f44005, 0x3805370b, 0x41024500, 0x36054af=
a,
> > +	0x4cfa3607, 0x4dfe52f5, 0x2a194dfe, 0xf710f311, 0xeb1bf411, 0xd829e22=
5,
> > +	0xd130d72a, 0xd82ee027, 0xd72ecd34, 0xed2bd934, 0xc93d0b20, 0xce3ed23=
8,
> > +	0xec2dbd51, 0x0f1cfe23, 0x01270122, 0x2614111e, 0x360f2d12, 0xf0244f0=
0,
> > +	0xef25f225, 0x0f220120, 0x19180f1d, 0x101f1622, 0x1c1f1223, 0x1c24292=
1,
> > +	0x3e152f1b, 0x1a131f12, 0x17181824, 0x1e18101b, 0x29161d1f, 0x3c102a1=
6,
> > +	0x3c0e340f, 0x7bf04e03, 0x38163515, 0x21153d19, 0x3d113213, 0x4af84ef=
d,
> > +	0x48f648f7, 0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf=
2,
> > +	0xfe0944f5, 0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x25f947f=
7,
> > +	0x31f52cf8, 0x3bf438f6, 0x43f73ff8, 0x4ff644fa, 0x4af84efd, 0x48f648f=
7,
> > +	0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf2, 0xfe0944f=
5,
> > +	0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x00000000, 0x0000000=
0,
> > +	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x0000330=
7,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000000=
0,
> > +	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x37010b0=
0,
> > +	0x7fef4500, 0x520066f3, 0x6beb4af9, 0x7fe17fe5, 0x5fee7fe8, 0x72eb7fe=
5,
> > +	0x7bef7fe2, 0x7af073f4, 0x3ff473f5, 0x54f144fe, 0x46fd68f3, 0x5af65df=
8,
> > +	0x4aff7fe2, 0x5bf961fa, 0x38fc7fec, 0x4cf952fb, 0x5df97dea, 0x4dfd57f=
5,
> > +	0x3ffc47fb, 0x54f444fc, 0x41f93ef9, 0x38053d08, 0x400142fe, 0x4efe3d0=
0,
> > +	0x34073201, 0x2c00230a, 0x2d01260b, 0x2c052e00, 0x3301111f, 0x131c320=
7,
> > +	0x3e0e2110, 0x64f16cf3, 0x5bf365f3, 0x58f65ef4, 0x56f654f0, 0x57f353f=
9,
> > +	0x46015eed, 0x4afb4800, 0x66f83b12, 0x5f0064f1, 0x48024bfc, 0x47fd4bf=
5,
> > +	0x45f32e0f, 0x41003e00, 0x48f12515, 0x36103909, 0x480c3e00, 0x090f001=
8,
> > +	0x120d1908, 0x130d090f, 0x120c250a, 0x21141d06, 0x2d041e0f, 0x3e003a0=
1,
> > +	0x260c3d07, 0x270f2d0b, 0x2c0d2a0b, 0x290c2d10, 0x221e310a, 0x370a2a1=
2,
> > +	0x2e113311, 0xed1a5900, 0xef1aef16, 0xec1ce71e, 0xe525e921, 0xe428e92=
1,
> > +	0xf521ef26, 0xfa29f128, 0x11290126, 0x031bfa1e, 0xf025161a, 0xf826fc2=
3,
> > +	0x0325fd26, 0x002a0526, 0x16271023, 0x251b300e, 0x440c3c15, 0x47fd610=
2,
> > +	0x32fb2afa, 0x3efe36fd, 0x3f013a00, 0x4aff48fe, 0x43fb5bf7, 0x27fd1bf=
b,
> > +	0x2e002cfe, 0x44f840f0, 0x4dfa4ef6, 0x5cf456f6, 0x3cf637f1, 0x41fc3ef=
a,
> > +	0x4cf849f4, 0x58f750f9, 0x61f56eef, 0x4ff554ec, 0x4afc49fa, 0x60f356f=
3,
> > +	0x75ed61f5, 0x21fb4ef8, 0x35fe30fc, 0x47f33efd, 0x56f44ff6, 0x61f25af=
3,
> > +	0x5dfa0000, 0x4ff854fa, 0x47ff4200, 0x3cfe3e00, 0x4bfb3bfe, 0x3afc3ef=
d,
> > +	0x4fff42f7, 0x44034700, 0x3ef92c0a, 0x280e240f, 0x1d0c1b10, 0x24142c0=
1,
> > +	0x2a052012, 0x3e0a3001, 0x40092e11, 0x61f568f4, 0x58f960f0, 0x55f955f=
8,
> > +	0x58f355f7, 0x4dfd4204, 0x4cfa4cfd, 0x4cff3a0a, 0x63f953ff, 0x5f025ff=
2,
> > +	0x4afb4c00, 0x4bf54600, 0x41004401, 0x3e0349f2, 0x44ff3e04, 0x370b4bf=
3,
> > +	0x460c4005, 0x1306060f, 0x0e0c1007, 0x0b0d0d12, 0x100f0f0d, 0x170d170=
c,
> > +	0x1a0e140f, 0x28112c0e, 0x11182f11, 0x16191515, 0x1d161b1f, 0x320e231=
3,
> > +	0x3f07390a, 0x52fc4dfe, 0x45095efd, 0xdd246df4, 0xe620de24, 0xe02ce22=
5,
> > +	0xf122ee22, 0xf921f128, 0x0021fb23, 0x0d210226, 0x3a0d2317, 0x001afd1=
d,
> > +	0xf91f1e16, 0xfd22f123, 0xff240322, 0x0b200522, 0x0c220523, 0x1d1e0b2=
7,
> > +	0x271d1a22, 0x151f4213, 0x32191f1f, 0x70ec78ef, 0x55f572ee, 0x59f25cf=
1,
> > +	0x51f147e6, 0x440050f2, 0x38e846f2, 0x32e844e9, 0xf3174af5, 0xf128f31=
a,
> > +	0x032cf231, 0x222c062d, 0x52133621, 0x17ff4bfd, 0x2b012201, 0x37fe360=
0,
> > +	0x40013d00, 0x5cf74400, 0x61f36af2, 0x5af45af1, 0x49f658ee, 0x56f24ff=
7,
> > +	0x46f649f6, 0x42fb45f6, 0x3afb40f7, 0xf6153b02, 0xf81cf518, 0x031dff1=
c,
> > +	0x1423091d, 0x430e241d, 0x00000000, 0x00000000
> > +};
>=20
> If I'm seeing it correctly the H.264 CABAC table it the same like for the
> old rkvdec version. Boris did such a great job with constructing it based
> on the standard. Please reuse it instead of pasting blobs.

I agree, lets do that. If we could have only 1 standard copy and translate =
from
it, that would be even better, though many have tried and failed already.

>=20
> > +
> > +static void assemble_hw_pps(struct rkvdec2_ctx *ctx,
> > +			    struct rkvdec2_h264_run *run)
> > +{
> > +	struct rkvdec2_h264_ctx *h264_ctx =3D ctx->priv;
> > +	const struct v4l2_ctrl_h264_sps *sps =3D run->sps;
> > +	const struct v4l2_ctrl_h264_pps *pps =3D run->pps;
> > +	const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->decode=
_params;
> > +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> > +	struct rkvdec2_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> > +	struct rkvdec2_sps_pps *hw_ps;
> > +	dma_addr_t scaling_list_address;
> > +	u32 scaling_distance;
> > +	u32 i;
>=20
> ....
>=20
> > +	__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
> > +			      &h264_ctx->regs.common,
> > +			      sizeof(h264_ctx->regs.common));
> This will limit the driver to arm64 which is not great. Rockchip is still
> inventing (vision) SoCs based on arm which might want to use this driver =
as
> well. So there should be at least an alternative.
>=20
> Alex
>=20
>=20


