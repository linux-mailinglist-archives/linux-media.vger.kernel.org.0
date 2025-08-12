Return-Path: <linux-media+bounces-39590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E4B2281C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5FD566668
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2D3265CD8;
	Tue, 12 Aug 2025 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bt6LA9bS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE8243399;
	Tue, 12 Aug 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755004064; cv=none; b=oha3o7aeTqpZrgah/tbvUyhmdLG6wONzX8DIyeGKIceWn2WtZBuHzoti9bHPy1jO8lz0MpN5HThtskgNhGn7xiP0/AEmWgxnBpucjDP4WSBantje9b/8Ah2dZLom/kzfV1q/0D2k7OOC0rOf4VHW3FAiDLaiUgwBPQm+8TIxwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755004064; c=relaxed/simple;
	bh=4Gj6R3r+s4AiXFAJyzvVKq4uLzNrC9RYFtzw3QwX2II=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tsuIceIvXF2n9Ut7qNk33NyymC/jy5EUCXMAJ83VQ0tl/jkEPzyBCQKdrX7Pd0oENhuzzMAlmxRUJxhHh8ECCwYVI1DAh3Rp3nZ563VO0rX7uqDFy8Ii9tfr61bTJ3OxLqJTP8qNE2/ATg8nWTj/3f4j5YvhNQuoznOnL2KSMjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bt6LA9bS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755004060;
	bh=4Gj6R3r+s4AiXFAJyzvVKq4uLzNrC9RYFtzw3QwX2II=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Bt6LA9bSK69wsq8XLSg0b9YR9I75zsmk5oq4B1cd/rPz/jgH/7JhyGaqp2TlUAqhM
	 t516R65PRno7dx2c/tNYFusX10fFO8Msa49vwIB/TzIK9caMv21wZ4BcGRWL5uaX3S
	 yHrPyDI7co9ywogZerO2JW8nxo2uF0anofW/AgN/+vUSCW2jmBEe/U9b/jRGpfAz0y
	 nW03OaAlJGC6fXmUvM8/PFHkBeK9KIunQoi0R/aZxXYKGYL13hYPwmxyX0mCLmJw8F
	 dl+gsCAj1Bwx/908gXKtr84Vq9Tsumph/NWbGo86tr4vSXckRJL1PkNhbdCqGwb6Z+
	 AtGvae2TbwSlQ==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D515217E04C0;
	Tue, 12 Aug 2025 15:07:38 +0200 (CEST)
Message-ID: <d180f611d37a85017044cbaf003d140807bf5a97.camel@collabora.com>
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alex Bee
	 <knaerzche@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 09:07:33 -0400
In-Reply-To: <4b3c409b-5f10-4aa0-996f-1dc2d28816ef@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-2-jonas@kwiboo.se>
	 <bdb53663ab741fbc70dd83fb858432b838736219.camel@collabora.com>
	 <4b3c409b-5f10-4aa0-996f-1dc2d28816ef@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-cjacriCPzbKW0PtJPR3b"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cjacriCPzbKW0PtJPR3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 02:58 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 8/11/2025 11:07 PM, Nicolas Dufresne wrote:
> > First pass of review,
> >=20
> > There is obvious conflict between Detlev RK3388/3576 series, please coo=
rdinate.
> > By picking the same direction, the common code can be split from platfo=
rm code,
> > and then both sets can share that common code and avoid conflicts.
>=20
> Yes, it is very unfortunate that Detlev did not base the work on v1 of
> this series, this has been sitting idle on the list for almost 2 years
> only waiting on its dependent H264 High10/4:2:2 series to be merged.
>=20
> Most feedback for v1 was related to unstaging and the series could be
> applied clean until iommu detach/attach was introduced very recently.
>=20
> This series has also been referenced in multiple threads related to
> rkvdec2 work, most recent at [1]. Unfortunately, I have missed both v1
> and v2 of Detlev's new rkvdec2 series, and was not able to send a v2 of
> this until now due to family tragedy.
>=20
> I will take a closer look at Detlev's new rkvdec2 series and see what I
> can do in a v3 to ease any merge conflicts.

All in all, I'd like to have both of these series ready for 6.18. To avoid =
the
need for dependant series, I can pick top patches if the preparation is pro=
perly
split from the platform specific code. Please make you recommendation.

My main concern at the moment is the back and forth from register to struct=
ure,
Detlev already ported everything else to structures, so porting a single co=
dec
for a single SoC seems like the least amount of work. I'd like to ear if an=
y of
you would be willing to convert it. This way I can land the conversion earl=
y,
and we remove one massive clash between the two sets.

Nicolas

>=20
> [1] https://lore.kernel.org/linux-media/a787e6e0-d4ce-45e3-8263-2489585d3=
ec0@kwiboo.se/
>=20
> >=20
> > Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=
=A9crit=C2=A0:
> > > The Rockchip VDEC supports the HEVC codec with the Main and Main10
> > > Profile up to Level 5.1 High tier: 4096x2304@60 fps.
> > >=20
> > > Add the backend for HEVC format to the decoder.
> > >=20
> > > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > ---
> > > Changes in v2:
> > > - Use new_value in transpose_and_flatten_matrices()
> > > - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> > > - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> > > ---
> > > =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +-
> > > =C2=A0.../rockchip/rkvdec/rkvdec-hevc-data.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1848 +++++++++++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 817 ++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 2 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0=
=C2=A0 76 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> > > =C2=A06 files changed, 2745 insertions(+), 1 deletion(-)
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc-data.c
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc.c
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/driver=
s/media/platform/rockchip/rkvdec/Makefile
> > > index cb86b429cfaa..a77122641d14 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> > > +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> > > @@ -1,3 +1,3 @@
> > > =C2=A0obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) +=3D rockchip-vdec.o
> > > =C2=A0
> > > -rockchip-vdec-y +=3D rkvdec.o rkvdec-h264.o rkvdec-vp9.o
> > > +rockchip-vdec-y +=3D rkvdec.o rkvdec-h264.o rkvdec-hevc.o rkvdec-vp9=
.o
>=20
> [snip]
>=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/d=
rivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > new file mode 100644
> > > index 000000000000..1994ea24f0be
> > > --- /dev/null
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > @@ -0,0 +1,817 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Rockchip Video Decoder HEVC backend
> > > + *
> > > + * Copyright (C) 2023 Collabora, Ltd.
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sebastian Fricke <sebastian.fricke@=
collabora.com>
> > > + *
> > > + * Copyright (C) 2019 Collabora, Ltd.
> > > + *	Boris Brezillon <boris.brezillon@collabora.com>
> > > + *
> > > + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> > > + *	Jeffy Chen <jeffy.chen@rock-chips.com>
> > > + */
> > > +
> > > +#include <media/v4l2-mem2mem.h>
> > > +
> > > +#include "rkvdec.h"
> > > +#include "rkvdec-regs.h"
> > > +#include "rkvdec-hevc-data.c"
> > > +
> > > +/* Size in u8/u32 units. */
> > > +#define RKV_SCALING_LIST_SIZE		1360
> > > +#define RKV_PPS_SIZE			(80 / 4)
> > > +#define RKV_PPS_LEN			64
> > > +#define RKV_RPS_SIZE			(32 / 4)
> > > +#define RKV_RPS_LEN			600
> > > +
> > > +struct rkvdec_sps_pps_packet {
> > > +	u32 info[RKV_PPS_SIZE];
> > > +};
> > > +
> > > +struct rkvdec_rps_packet {
> > > +	u32 info[RKV_RPS_SIZE];
> > > +};
> > > +
> > > +struct rkvdec_ps_field {
> > > +	u16 offset;
> > > +	u8 len;
> > > +};
> > > +
> > > +#define PS_FIELD(_offset, _len) \
> > > +	((struct rkvdec_ps_field){ _offset, _len })
> > > +
> > > +/* SPS */
> > > +#define VIDEO_PARAMETER_SET_ID				PS_FIELD(0, 4)
> > > +#define SEQ_PARAMETER_SET_ID				PS_FIELD(4, 4)
> > > +#define CHROMA_FORMAT_IDC				PS_FIELD(8, 2)
> > > +#define PIC_WIDTH_IN_LUMA_SAMPLES			PS_FIELD(10, 13)
> > > +#define PIC_HEIGHT_IN_LUMA_SAMPLES			PS_FIELD(23, 13)
> > > +#define BIT_DEPTH_LUMA					PS_FIELD(36, 4)
> > > +#define BIT_DEPTH_CHROMA				PS_FIELD(40, 4)
> > > +#define LOG2_MAX_PIC_ORDER_CNT_LSB			PS_FIELD(44, 5)
> > > +#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	PS_FIELD(49, 2)
> > > +#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			PS_FIELD(51, 3)
> > > +#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			PS_FIELD(54, 3)
> > > +#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	PS_FIELD(57, 2)
> > > +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		PS_FIELD(59, 3)
> > > +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		PS_FIELD(62, 3)
> > > +#define SCALING_LIST_ENABLED_FLAG			PS_FIELD(65, 1)
> > > +#define AMP_ENABLED_FLAG				PS_FIELD(66, 1)
> > > +#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		PS_FIELD(67, 1)
> > > +#define PCM_ENABLED_FLAG				PS_FIELD(68, 1)
> > > +#define PCM_SAMPLE_BIT_DEPTH_LUMA			PS_FIELD(69, 4)
> > > +#define PCM_SAMPLE_BIT_DEPTH_CHROMA			PS_FIELD(73, 4)
> > > +#define PCM_LOOP_FILTER_DISABLED_FLAG			PS_FIELD(77, 1)
> > > +#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	PS_FIELD(78, 3)
> > > +#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		PS_FIELD(81, 3)
> > > +#define NUM_SHORT_TERM_REF_PIC_SETS			PS_FIELD(84, 7)
> > > +#define LONG_TERM_REF_PICS_PRESENT_FLAG			PS_FIELD(91, 1)
> > > +#define NUM_LONG_TERM_REF_PICS_SPS			PS_FIELD(92, 6)
> > > +#define SPS_TEMPORAL_MVP_ENABLED_FLAG			PS_FIELD(98, 1)
> > > +#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		PS_FIELD(99, 1)
> >=20
> > Detlev is moving to structures and memcpy, with a minor performance gai=
n, this
> > is the way to go, I can understand if this is quite involving, but one =
of you
> > will have to do it.
>=20
> Sure, and this was the the main reason why I mentioned this incoming
> series back in [1], to consider this series before doing too much
> re-work on a future rkvdec1 + rkvdec2 merge series.
>=20
> As mentioned above, I will take a closer look at Detlev's new rkvdec2
> series and see what I can do in a v3 to ease any merge conflicts.
>=20
> >=20
> > > +/* PPS */
> > > +#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 6)
> > > +#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(134, 4)
> > > +#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		PS_FIELD(138, 1)
> > > +#define OUTPUT_FLAG_PRESENT_FLAG			PS_FIELD(139, 1)
> > > +#define NUM_EXTRA_SLICE_HEADER_BITS			PS_FIELD(140, 13)
> > > +#define SIGN_DATA_HIDING_ENABLED_FLAG			PS_FIELD(153, 1)
> > > +#define CABAC_INIT_PRESENT_FLAG				PS_FIELD(154, 1)
> > > +#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			PS_FIELD(155, 4)
> > > +#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			PS_FIELD(159, 4)
> > > +#define INIT_QP_MINUS26					PS_FIELD(163, 7)
> > > +#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(170, 1)
> > > +#define TRANSFORM_SKIP_ENABLED_FLAG			PS_FIELD(171, 1)
> > > +#define CU_QP_DELTA_ENABLED_FLAG			PS_FIELD(172, 1)
> > > +#define LOG2_MIN_CU_QP_DELTA_SIZE			PS_FIELD(173, 3)
> > > +#define PPS_CB_QP_OFFSET				PS_FIELD(176, 5)
> > > +#define PPS_CR_QP_OFFSET				PS_FIELD(181, 5)
> > > +#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	PS_FIELD(186, 1)
> > > +#define WEIGHTED_PRED_FLAG				PS_FIELD(187, 1)
> > > +#define WEIGHTED_BIPRED_FLAG				PS_FIELD(188, 1)
> > > +#define TRANSQUANT_BYPASS_ENABLED_FLAG			PS_FIELD(189, 1)
> > > +#define TILES_ENABLED_FLAG				PS_FIELD(190, 1)
> > > +#define ENTROPY_CODING_SYNC_ENABLED_FLAG		PS_FIELD(191, 1)
> > > +#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	PS_FIELD(192, 1)
> > > +#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		PS_FIELD(193, 1)
> > > +#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		PS_FIELD(194, 1)
> > > +#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		PS_FIELD(195, 1)
> > > +#define PPS_BETA_OFFSET_DIV2				PS_FIELD(196, 4)
> > > +#define PPS_TC_OFFSET_DIV2				PS_FIELD(200, 4)
> > > +#define LISTS_MODIFICATION_PRESENT_FLAG			PS_FIELD(204, 1)
> > > +#define LOG2_PARALLEL_MERGE_LEVEL			PS_FIELD(205, 3)
> > > +#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	PS_FIELD(208, 1)
> > > +#define NUM_TILE_COLUMNS				PS_FIELD(212, 5)
> > > +#define NUM_TILE_ROWS					PS_FIELD(217, 5)
> > > +#define COLUMN_WIDTH(i)					PS_FIELD(256 + ((i) * 8), 8)
> > > +#define ROW_HEIGHT(i)					PS_FIELD(416 + ((i) * 8), 8)
> > > +#define SCALING_LIST_ADDRESS				PS_FIELD(592, 32)
>=20
> [snip]
>=20
> > > +/*
> > > + * Creation of the Reference Picture Set memory blob for the hardwar=
e.
> > > + * The layout looks like this:
> > > + * [0] 32 bits for L0 (6 references + 2 bits of the 7th reference)
> > > + * [1] 32 bits for L0 (remaining 3 bits of the 7th reference + 5 ref=
erences
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 + 4 bits of the 13th reference)
> > > + * [2] 11 bits for L0 (remaining bit for 13 and 2 references) and
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 21 bits for L1 (4 references + first bit =
of 5)
> > > + * [3] 32 bits of padding with 0s
> > > + * [4] 32 bits for L1 (remaining 4 bits for 5 + 5 references + 3 bit=
s of 11)
> > > + * [5] 22 bits for L1 (remaining 2 bits of 11 and 4 references)
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 lowdelay flag (bit 23), rps bit offset lo=
ng term (bit 24 - 32)
> > > + * [6] rps bit offset long term (bit 1 - 3),=C2=A0 rps bit offset sh=
ort term (bit 4 - 12)
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 number of references (bit 13 - 16), remai=
ning 16 bits of padding with 0s
> > > + * [7] 32 bits of padding with 0s
> > > + *
> > > + * Thus we have to set up padding in between reference 5 of the L1 l=
ist.
> > > + */
> > > +static void assemble_hw_rps(struct rkvdec_ctx *ctx,
> > > +			=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> >=20
> > Rockchip calls this one the swp_rps, in the sense the the slice header =
and its
> > enclosed reference are parsed by software. Detlev implements the HW RPS=
 (which
> > requires an extended control) since SW RPS wasn't documented and this
> > implementation did not work for newer chip. We have no information that=
 HW RPS
> > would work on RK3399 and older, I'm just asking to rename to we can
> > differentiate it.
>=20
> Sure, I can rename this this assemble_sw_rps or similar in a v3.
>=20
> >=20
> > > +{
> > > +	const struct v4l2_ctrl_hevc_decode_params *decode_params =3D run->d=
ecode_params;
> > > +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> > > +	const struct v4l2_ctrl_hevc_slice_params *sl_params;
> > > +	const struct v4l2_hevc_dpb_entry *dpb;
> > > +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> > > +	struct rkvdec_hevc_priv_tbl *priv_tbl =3D hevc_ctx->priv_tbl.cpu;
> > > +	struct rkvdec_rps_packet *hw_ps;
> > > +	int i, j;
> > > +	unsigned int lowdelay;
> > > +
> > > +#define WRITE_RPS(value, field) set_ps_field(hw_ps->info, field, val=
ue)
> > > +
> > > +#define REF_PIC_LONG_TERM_L0(i)			PS_FIELD((i) * 5, 1)
> > > +#define REF_PIC_IDX_L0(i)			PS_FIELD(1 + ((i) * 5), 4)
> > > +#define REF_PIC_LONG_TERM_L1(i)			PS_FIELD(((i) < 5 ? 75 : 132) + ((=
i) * 5), 1)
> > > +#define REF_PIC_IDX_L1(i)			PS_FIELD(((i) < 4 ? 76 : 128) + ((i) * 5=
), 4)
> > > +
> > > +#define LOWDELAY				PS_FIELD(182, 1)
> > > +#define LONG_TERM_RPS_BIT_OFFSET		PS_FIELD(183, 10)
> > > +#define SHORT_TERM_RPS_BIT_OFFSET		PS_FIELD(193, 9)
> > > +#define NUM_RPS_POC				PS_FIELD(202, 4)
> > > +
> > > +	for (j =3D 0; j < run->num_slices; j++) {
> > > +		uint st_bit_offset =3D 0;
> > > +		uint num_l0_refs =3D 0;
> > > +		uint num_l1_refs =3D 0;
> > > +
> > > +		sl_params =3D &run->slices_params[j];
> > > +		dpb =3D decode_params->dpb;
> > > +
> > > +		if (sl_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_I) {
> > > +			num_l0_refs =3D sl_params->num_ref_idx_l0_active_minus1 + 1;
> > > +
> > > +			if (sl_params->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B)
> > > +				num_l1_refs =3D sl_params->num_ref_idx_l1_active_minus1 + 1;
> > > +
> > > +			lowdelay =3D 1;
> > > +		} else {
> > > +			lowdelay =3D 0;
> > > +		}
> > > +
> > > +		hw_ps =3D &priv_tbl->rps[j];
> > > +		memset(hw_ps, 0, sizeof(*hw_ps));
> > > +
> > > +		for (i =3D 0; i < num_l0_refs; i++) {
> > > +			const struct v4l2_hevc_dpb_entry dpb_l0 =3D dpb[sl_params->ref_id=
x_l0[i]];
> > > +
> > > +			WRITE_RPS(!!(dpb_l0.flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFEREN=
CE),
> > > +				=C2=A0 REF_PIC_LONG_TERM_L0(i));
> > > +			WRITE_RPS(sl_params->ref_idx_l0[i], REF_PIC_IDX_L0(i));
> > > +
> > > +			if (dpb_l0.pic_order_cnt_val > sl_params->slice_pic_order_cnt)
> > > +				lowdelay =3D 0;
> > > +		}
> > > +
> > > +		for (i =3D 0; i < num_l1_refs; i++) {
> > > +			const struct v4l2_hevc_dpb_entry dpb_l1 =3D dpb[sl_params->ref_id=
x_l1[i]];
> > > +			int is_long_term =3D
> > > +				!!(dpb_l1.flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE);
> > > +
> > > +			WRITE_RPS(is_long_term, REF_PIC_LONG_TERM_L1(i));
> > > +			WRITE_RPS(sl_params->ref_idx_l1[i], REF_PIC_IDX_L1(i));
> > > +
> > > +			if (dpb_l1.pic_order_cnt_val > sl_params->slice_pic_order_cnt)
> > > +				lowdelay =3D 0;
> > > +		}
> > > +
> > > +		WRITE_RPS(lowdelay, LOWDELAY);
> > > +
> > > +		if (!(decode_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC))=
 {
> > > +			if (sl_params->short_term_ref_pic_set_size)
> > > +				st_bit_offset =3D sl_params->short_term_ref_pic_set_size;
> > > +			else if (sps->num_short_term_ref_pic_sets > 1)
> > > +				st_bit_offset =3D fls(sps->num_short_term_ref_pic_sets - 1);
> > > +		}
> > > +
> > > +		WRITE_RPS(st_bit_offset + sl_params->long_term_ref_pic_set_size,
> > > +			=C2=A0 LONG_TERM_RPS_BIT_OFFSET);
> > > +		WRITE_RPS(sl_params->short_term_ref_pic_set_size,
> > > +			=C2=A0 SHORT_TERM_RPS_BIT_OFFSET);
> > > +
> > > +		WRITE_RPS(decode_params->num_poc_st_curr_before +
> > > +			=C2=A0 decode_params->num_poc_st_curr_after +
> > > +			=C2=A0 decode_params->num_poc_lt_curr,
> > > +			=C2=A0 NUM_RPS_POC);
> > > +	}
> > > +}
>=20
> [snip]
>=20
> >=20
> >=20
> > Looks good otherwise. Please let me know your plan to combine or prepar=
e for
> > both series.
>=20
> I will take a closer look at Detlev's new rkvdec2 series and see what I
> can do in a v3 to ease any merge conflicts.
>=20
> I am just a little bit sad that this series has been completely ignored
> for the continued work with rkvdec2, the new series even seem to
> implement a slightly different variant system when this has been here
> waiting all this time :-/
>=20
> Regards,
> Jonas
>=20
> >=20
> > Nicolas

--=-cjacriCPzbKW0PtJPR3b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs8lQAKCRBxUwItrAao
HJ6pAJ4rNWW5wjoSr4qBFwPBwz8wCWmnHgCeJarcBSZhnBjd4n6FAaUoQV7ryvU=
=jPzx
-----END PGP SIGNATURE-----

--=-cjacriCPzbKW0PtJPR3b--

