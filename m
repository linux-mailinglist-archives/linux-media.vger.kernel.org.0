Return-Path: <linux-media+bounces-56105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC5NIP2HuWmTJAIAu9opvQ
	(envelope-from <linux-media+bounces-56105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:57:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC92AEAF6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7644D31942AE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E963F54BE;
	Tue, 17 Mar 2026 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WAJi00KC"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3063F23D6
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766066; cv=none; b=lISQTuFKliix6cWhHyISZ2wERJ4DVvkR8/lKuEeLe53Av8C4pDsseg6+aNqXQ4R3d0lvwqTwQllnZJkr17FFaHKA2H8um1u1DRg3Mmai4tCh2umc/VuqAqoL/Ww9IghxOCMfIyj+Dm2pJ/HfSwpjb4wm1EeKUtBcPTVsc81Ko2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766066; c=relaxed/simple;
	bh=DvMZA6rRq5Dp85Y4ASJcgtw5s/lPSJDsS85L9OHtbh8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Z69tEH8EchqH2Wd7mcGRBzW+uErq3RTiHvSNSaSoww1JYMXGFt5AVQrQPyMAKy1NuZ2mirmfA2xkJrQWu1J9pCdXrh42HJvefQU2BaXDSddKLtRIJmelL/ZW+sIlWyXDu9Q0nlZPMTi7jyJd1v1cLrx9cjcaCXVAjOVDPkxswZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WAJi00KC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773766063;
	bh=DvMZA6rRq5Dp85Y4ASJcgtw5s/lPSJDsS85L9OHtbh8=;
	h=Subject:From:To:Date:From;
	b=WAJi00KCG/jZmNtmyW7Brx/Cangr2yBuF2bourBLC9nP15BRC3biGnw2YdemFKtHc
	 5Ls2TV3hEdKW4tBBZ4d07BL029iEvL46sAVfkhPoEQfRI7YitkW5BjJiLduNFB6FYm
	 MnIFF1wa+8eGcEt8IP5uvE+dOV7dmAgHgZHLPiMamCg/b7xeYf1LucsykwHcYv1m72
	 L7Tn4klL2e00gcXxtbgU/kk4ShoiIvDaygfGOUcoNwZS/lugP8jqiQrwk7sqXFK+Ig
	 OPDgv4vDnlxdY66G4CgV2IjXSnlCfKAFSQBdJ29FWOPOYAK/GhMhaTl70ou4na9YVJ
	 EWkPdHew0X45w==
Received: from [IPv6:2606:6d00:11:b76d::c41] (unknown [IPv6:2606:6d00:11:b76d::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16CE317E0619
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:47:42 +0100 (CET)
Message-ID: <aa6d174a3c3af78fb3023ceec1d351269784f5aa.camel@collabora.com>
Subject: [GIT PULL FOR 7.0-rc5] Media codec fixes for 7.0-rc5
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Tue, 17 Mar 2026 12:47:40 -0400
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
	protocol="application/pgp-signature"; boundary="=-NbE2S9ET5InYQpTXFBG1"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-56105-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: D7FC92AEAF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-NbE2S9ET5InYQpTXFBG1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This pull request is for the "fixes" branch. It includes a single fix for a
kernel panic when the Hantro VPU driver is built as module. Hopefully it ca=
n be
picked on time.

cheers,
Nicolas

The following changes since commit 883d9ac20824e991f6945448165fa8a1b74dd5e5=
:

  media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl() (20=
26-03-11 08:05:48 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/fixes=
-for-7.0-media-codecs-2026-03-17

for you to fetch changes up to ab2e204b1e76e1a85ff75592dcbfefa3d783a683:

  media: verisilicon: Fix kernel panic due to __initconst misuse (2026-03-1=
6 14:02:51 -0400)

----------------------------------------------------------------
Fix RO data location for Hantro driver as module

----------------------------------------------------------------
Ming Qian (1):
      media: verisilicon: Fix kernel panic due to __initconst misuse

 drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-NbE2S9ET5InYQpTXFBG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabmFrQAKCRDZQZRRKWBy
9GviAQDWDiYliGa6N63TBHAstUuAmT59qBsURuYfozsOzTmpawEApsSH8LP+Am01
q7UyHviIhkOaLlfsUxhuWA9Fvr6zJg0=
=vglH
-----END PGP SIGNATURE-----

--=-NbE2S9ET5InYQpTXFBG1--

