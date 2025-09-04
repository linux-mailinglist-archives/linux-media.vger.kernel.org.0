Return-Path: <linux-media+bounces-41770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311EB43BC2
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 14:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC76EA00088
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68C2FF673;
	Thu,  4 Sep 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y+KDlRhR"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380F2F4A06
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756989372; cv=none; b=WihLfHHO+oTlYPKP2sOxCb4+YHnJ879XEQwV3VfeSZ6x+lxcc3OT0qEZqgnIw/6EsP4EM3f/wNZyIqDQqlwypGOz7XHGmgnX0vIYRMz1J64bxCfea8Tt9BLP1m5a31+NYf3lHnaJgQU0f5kfI+E9qN60V0arcE5YdNwIfzWwijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756989372; c=relaxed/simple;
	bh=EOS/6zEAAb3zRMjBAB/SaTn6fBz48FB5QgIuG3xWAOw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1fjRnH2b1iLlTPXlvQT037SAepvmoKwN6LuaG8jJ8TE7EKcJ9L0TjrhG08FlfU4tpE9ZAfAID5QO5N27eOXCITWE2AALDfFglTqqhxN07IXjEdVWQCqiXzdyGwBsVU+twibExQ2GaFU3OTecSoLHrEoHMHjiFxdg66wV0pBQKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y+KDlRhR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756989368;
	bh=EOS/6zEAAb3zRMjBAB/SaTn6fBz48FB5QgIuG3xWAOw=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Y+KDlRhRGPhCdbQUyUPXzl8n5YTOl9FMqJ+iS7psmipIBf5l1SI/h9bxGMnXkVkH8
	 yMAZ/UlePIzLUrCe1YeShmjoch8HjnKTkIndiMNROg5KqM+eGkL7KgO7A7bjl4NlP4
	 3z5V1Rc/Ht3gK5zKQqmRE5kii6ZmTf4JHLF/k5FgvC+QLqVC6hG0kYDIaNThSXYmXa
	 aZ8b7t9I+fgcCvAt17jxxu1nooLxXvOrMzw4wUPlk115rVyJC0QRUW7RBvSRobfASK
	 Si09PJ5mVg5ewXi4K1t5eTuIUsHeD6k72I+8fp2rLSYDAhUYkaeXJDpFptxHWEFkxG
	 2Iq4htQEUrIKg==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 171A817E00A6;
	Thu,  4 Sep 2025 14:36:07 +0200 (CEST)
Message-ID: <ba96a0168da7df58b7f27377f48d259d4c6495c4.camel@collabora.com>
Subject: Re: [GIT PULL FOR 6.18] Media Codec Fixes 2025-09-03
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Date: Thu, 04 Sep 2025 08:36:05 -0400
In-Reply-To: <18806e61-3890-4d2d-9740-a1aee00d6884@kernel.org>
References: <dd469ea1001160b5cf7b7bf4f44dfdda8d2d27ce.camel@collabora.com>
	 <18806e61-3890-4d2d-9740-a1aee00d6884@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-60TTso7ArabOZCHzjAeo"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-60TTso7ArabOZCHzjAeo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Le jeudi 04 septembre 2025 =C3=A0 10:39 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> On 03/09/2025 21:05, Nicolas Dufresne wrote:
> > Hey Mauro, Hans,
> >=20
> > I collected the easy stuff I had in queue, so we have code clean and ju=
st one
> > fix for the MT8188 MDP3 M2M driver.
> >=20
> > cheers,
> > Nicolas
> >=20
> > ---
> >=20
> > The following changes since commit 603957ae903e81fb80d3788297c0f58a6880=
2dfc:
> >=20
> > =C2=A0 media: rkisp1: Add support for multiple power domains (2025-08-3=
1 11:10:07 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> > =C2=A0 https://gitlab.freedesktop.org/linux-media/users/ndufresne.git=
=C2=A0tags/for-6.18-media-codecs-2025-09-03
> >=20
> > for you to fetch changes up to aa067d8de6e85c90a92c4281235c5cb6d7651fb5=
:
> >=20
> > =C2=A0 media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-0=
3 13:08:23 -0400)
> >=20
> > ----------------------------------------------------------------
> > Code cleanup and MT8188 MDP3 fix
> >=20
> > ----------------------------------------------------------------
> > AngeloGioacchino Del Regno (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: media: mediatek,mt8195-jpeg=
: Allow range number in node address
>=20
> This one is missing the SoB of the devicetree maintainers. I'm dropping i=
t from this
> PR, but will apply the other patches.

Since its bindings, DT folks don't take them. I usually wait for a Rb from
devicetree folks, but since Angelo is Mediatek tree maintainer he really kn=
ows
what he's doing. The <name>@<number>,<number> instead of hex address seems
fairly common.

>=20
> I also noticed that it wasn't delegated to ndufresne in patchwork, perhap=
s this was
> mistakingly added to the PR?

I normally only take what I delegated to me indeed, and when I did a final
review from my tag I didn't realized this one mas missing. I did review tha=
t
regex and it does what the comment says.

Now I got tricked though, the DTS don't yet utilize the new form of
jpegdec@<number>,<number>, so its not really fixing a DTS check issue, but =
a
check issue that would occur if this was being used.

Anyway, no worries, nothing is broken, I'll ask Angelo to chase a DT mainta=
iner
to Rb this patch.

regards,
Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > Liao Yuanhong (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: chips-media: wave5: Remove redund=
ant ternary operators
> >=20
> > Lukas Bulwahn (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAINTAINERS: merge sections for ROCKCHIP=
 VIDEO DECODER DRIVER
> >=20
> > N=C3=ADcolas F. R. A. Prado (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: platform: mtk-mdp3: Add missing M=
T8188 compatible to comp_dt_ids
> >=20
> > Paul Kocialkowski (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: imx8m: Use the defau=
lt Hantro G1 irq handler
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: Explicitly disable s=
election api ioctls for decoders
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: uapi: v4l2-controls: Cleanup code=
c definitions
> >=20
> > =C2=A0Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.y=
aml |=C2=A0 2 +-
> > =C2=A0Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.y=
aml |=C2=A0 2 +-
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +=
--------
> > =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> > =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +++
> > =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++----
> > =C2=A0drivers/media/platform/verisilicon/imx8m_vpu_hw.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +-------------------
> > =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +++++++++++------------
> > =C2=A09 files changed, 23 insertions(+), 46 deletions(-)
> >=20
> >=20

--=-60TTso7ArabOZCHzjAeo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLmHtQAKCRDZQZRRKWBy
9OixAQCii5end4ZkKQ4yxESMsIWl9J2S13AdTUbglvAN3spCBgD+OBTHajA86kJB
fEzPtZBIfDQp1u+z1hLOyADvhhod7Qg=
=cnCS
-----END PGP SIGNATURE-----

--=-60TTso7ArabOZCHzjAeo--

