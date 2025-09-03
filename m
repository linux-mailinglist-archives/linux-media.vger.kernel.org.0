Return-Path: <linux-media+bounces-41729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC328B42973
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEC63BD558
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 19:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26E52D94B9;
	Wed,  3 Sep 2025 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kFOTzPxB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC31E7C03
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926309; cv=none; b=aNLJ36xjbMocwFcCoK6X1wUAULiKSPOHRYM0JaPbY5AxEcZaFps3CyLtfrQmxDvR9IFpBXvDa4vddj3oZw3pgvrikrNF340gwPO8Gr92MNxryUUkyend5ia7JD3O4TlDBvF0ssO6kXDL0clxhByE0lo/0ELKB5LWmQI731GpON4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926309; c=relaxed/simple;
	bh=kqtgK1JOKfJ2iyX2Ydu4f/IiPzFy37HE2ApFNMcBb6Q=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=SW6PTcNKhBDx4CWb15tunry+PTgF8iUDu1C0mb/PypITMyVBnZg/VriL6JvfrNTE8uCVKB97GSBnNJhhafCQrb9pAp51sJmqqQSuizLAg45IWCRKS2vX57nX+opDoeuu8mzjyia+b8oUoSZU1Le7s4W8k1E5YQdMw6ghOFU0yG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kFOTzPxB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756926305;
	bh=kqtgK1JOKfJ2iyX2Ydu4f/IiPzFy37HE2ApFNMcBb6Q=;
	h=Subject:From:To:Date:From;
	b=kFOTzPxB4F8g/haMgqiA9S+otGKzGdogJViEkxIgjGDx/zh/GV/eMtKDMpIhYtrGG
	 IrtO1j9SH3Qo08wzIWD9F94LM/VT0wnh+djibkTasaBQMIzunzYeanDmZ5y4LwA3cY
	 7BTAjEeYVcoMwLQUENGXiRXg2RJy++vK/ltV6mmRHCmCuzypq/I3BMQ/WI9e0TDZnB
	 VUobT+S0jck4s9q0AKkXd6D2vVDhTuPibpUfBgOEUVlQOXyhB1fHas7lZx3WNKsbMl
	 9gn3vzpckcTOOnZMisVfu6TPksEZ08HXxE3pj5l40p5JDRWwx5jn1IFFXeq2bueO/Q
	 5fugLI5AN0eZw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E7A317E1283
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:05:05 +0200 (CEST)
Message-ID: <dd469ea1001160b5cf7b7bf4f44dfdda8d2d27ce.camel@collabora.com>
Subject: [GIT PULL FOR 6.18]  Media Codec Fixes 2025-09-03
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Wed, 03 Sep 2025 15:05:02 -0400
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
	protocol="application/pgp-signature"; boundary="=-h1vkNIvyuAFolaPUD9mJ"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-h1vkNIvyuAFolaPUD9mJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Mauro, Hans,

I collected the easy stuff I had in queue, so we have code clean and just o=
ne
fix for the MT8188 MDP3 M2M driver.

cheers,
Nicolas

---

The following changes since commit 603957ae903e81fb80d3788297c0f58a68802dfc=
:

  media: rkisp1: Add support for multiple power domains (2025-08-31 11:10:0=
7 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6=
.18-media-codecs-2025-09-03

for you to fetch changes up to aa067d8de6e85c90a92c4281235c5cb6d7651fb5:

  media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-03 13:08:2=
3 -0400)

----------------------------------------------------------------
Code cleanup and MT8188 MDP3 fix

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node =
address

Liao Yuanhong (1):
      media: chips-media: wave5: Remove redundant ternary operators

Lukas Bulwahn (1):
      MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER

N=C3=ADcolas F. R. A. Prado (1):
      media: platform: mtk-mdp3: Add missing MT8188 compatible to comp_dt_i=
ds

Paul Kocialkowski (3):
      media: verisilicon: imx8m: Use the default Hantro G1 irq handler
      media: verisilicon: Explicitly disable selection api ioctls for decod=
ers
      media: uapi: v4l2-controls: Cleanup codec definitions

 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml |  2 =
+-
 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml |  2 =
+-
 MAINTAINERS                                                          |  9 =
+--------
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c             |  2 =
+-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c                 |  3 =
+++
 drivers/media/platform/verisilicon/hantro_drv.c                      |  2 =
++
 drivers/media/platform/verisilicon/hantro_v4l2.c                     |  6 =
++----
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c                    | 20 =
+-------------------
 include/uapi/linux/v4l2-controls.h                                   | 23 =
+++++++++++------------
 9 files changed, 23 insertions(+), 46 deletions(-)


--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-h1vkNIvyuAFolaPUD9mJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLiRXgAKCRDZQZRRKWBy
9A7pAQDA/QW56bfldlm4ubTI/HRpYkb1vG2n+WumCh5otknazgD9GefCmfU+YHyV
P8u7I2GjPM0Ubra/xkcuU0ylH69yhQE=
=G3gC
-----END PGP SIGNATURE-----

--=-h1vkNIvyuAFolaPUD9mJ--

