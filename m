Return-Path: <linux-media+bounces-56573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAhpHrCuvWnIAQMAu9opvQ
	(envelope-from <linux-media+bounces-56573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:31:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D315A2E0DBE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5781E30870EF
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D4A34DCDF;
	Fri, 20 Mar 2026 20:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l5NhhSRt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10368346AE5
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038657; cv=none; b=aPxuzcUV6iIQz44K58/gdV++oGI7xEalFQlfS3L/r32jyE9qlsL6j90CxZ/0PFI0l2FFVEHZX20YRkxSj3GXvxzLxvm1iN130+gDGrhvT0urGm3v1NRf2D7IwKXpqp0nmRph6N3pL2fY+U0rW6yBZEP12+x75h/Nb6SJsRvs00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038657; c=relaxed/simple;
	bh=w7cU4jVnutXMzxVYwQT18xtZpb1wAmTQujc/XIAICN0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=pI2TfO+M43gOZukGqIHr3XOfZ6Ds/pmA/s6w7/3MSGyIWdJ6NTzqbTg2Lnf4c/MhrIFtF8BGwL/nKIb1WakBGU4ETw2N+hCy3rRUDb9xgvfIKWc6J6hHpnVnKy/vGE/8g4UuOUE3WQB90JRsHnJKYDzSsWkTx7v0IBpGUgpZKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l5NhhSRt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774038654;
	bh=w7cU4jVnutXMzxVYwQT18xtZpb1wAmTQujc/XIAICN0=;
	h=Subject:From:To:Cc:Date:From;
	b=l5NhhSRtb2joG5ixzr3FGiiuK7Y7GvWaEgfndODsdvlYeJqY3hjMJT/3QirNFqHbI
	 5Qv3ksjlYmPmllN/vuPfmk81NhkaUHJO2dtu56NMt8TMzOS+LLt++dIy+Jajvm2mwq
	 Fe0166J3xU46m01itYFQnv13gURbnxJUCfr9uSwtJ1R4ENyO2yEJ7f0KVurryg7MHy
	 s2QXvtDszd/nLeONFJt1JoFX5gy453ldjSf4F8ogZ7/Rp4wi+rZFWOEr8l/kEmvijI
	 fADxWhs5Jqive/lYEJnvg8CgjYIlJEeHir1U4bWTvTkrMm1dKVbrmYDTZwqWyr25ZH
	 90NL5LTSTqsKw==
Received: from [IPv6:2606:6d00:11:b76d::c41] (unknown [IPv6:2606:6d00:11:b76d::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3F0B17E0EB4;
	Fri, 20 Mar 2026 21:30:53 +0100 (CET)
Message-ID: <882e638ba642d166cf143ad619e180023887ae7d.camel@collabora.com>
Subject: [GIT PULL FOR 7.1] Media codec for 7.1 2026-03-20
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Cristian Ciocaltea
	 <cristian.ciocaltea@collabora.com>
Date: Fri, 20 Mar 2026 16:30:52 -0400
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
	protocol="application/pgp-signature"; boundary="=-R2tgDxX6AGv6cdiUEHLT"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56573-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D315A2E0DBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-R2tgDxX6AGv6cdiUEHLT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This contains several fixes and improvement in Mediatek, IMX, Amphion and
Chips&Media drivers. Additionally, it includes changes to the RK35xx which
include an DT ABI break. This break was needed since the binding, unfortuna=
tely
picked a bit early, did not position register ranges in the physical order =
(not
visible from a DT Binding text) and did not require names for these registe=
r
ranges (my bad). There was no proper way to fix it without either DT warnin=
g or
rendering the range name useless. I've added Heiko in CC, who needs to know=
 when
its ok for him to include the related DTS changes.

cheers,
Nicolas

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67=
:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (202=
6-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7=
.1-media-codecs-2026-03-20

for you to fetch changes up to 4eeec1a8b0c5ce5f1df29eb59b25d5e19c3022b0:

  media: amphion: Fix race between m2m job_abort and device_run (2026-03-20=
 16:07:35 -0400)

----------------------------------------------------------------
Various codec fix and DT binding ABI break

----------------------------------------------------------------
Cristian Ciocaltea (2):
      media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{7=
6,88}
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order fo=
r RK35{76,88}

Fan Wu (2):
      media: mtk-jpeg: fix use-after-free in release path due to uncancelle=
d work
      media: mediatek: vcodec: fix use-after-free in encoder release path

Haoxiang Li (1):
      media: chips-media: wave5: fix a potential memory leak in wave5_vdi_i=
nit()

Ming Qian (5):
      media: imx-jpeg: Simplify descriptor initialization with memset
      media: imx-jpeg: Use devm_pm_runtime_enable() helper
      media: imx-jpeg: Add encoder ops layer for hardware abstraction
      media: imx-jpeg: Add support for encoder v1 descriptor configuration
      media: amphion: Fix race between m2m job_abort and device_run

Ziyi Guo (2):
      media: chips-media: wave5: add missing spinlock protection for send_e=
os_event()
      media: chips-media: wave5: add missing spinlock protection for handle=
_dynamic_resolution_change()

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml          |  22 =
++++++++++++++--------
 drivers/media/platform/amphion/vpu_v4l2.c                           |   9 =
+++------
 drivers/media/platform/chips-media/wave5/wave5-vdi.c                |   1 =
+
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c            |  14 =
+++++++++++++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c                |   1 =
+
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c |   9 =
+++++++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h                   |   3 =
+++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                      | 117 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++-----------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h                      |  22 =
++++++++++++++++++++++
 9 files changed, 166 insertions(+), 32 deletions(-)


--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-R2tgDxX6AGv6cdiUEHLT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ufAAKCRDZQZRRKWBy
9JxcAP45OZBczoFziAhVS29OpW7dlNINkOkWMR9RVEJPkpc8NQD/Ur+o9zYQ2Hj7
Lsn5C5M6mgUB5BqQcWsJN2axGJE8yAk=
=dZyS
-----END PGP SIGNATURE-----

--=-R2tgDxX6AGv6cdiUEHLT--

