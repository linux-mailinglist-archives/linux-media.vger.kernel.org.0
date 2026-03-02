Return-Path: <linux-media+bounces-54231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+cDMoFpmkzJAAAu9opvQ
	(envelope-from <linux-media+bounces-54231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 22:48:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B11E4125
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 22:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7461135FF4BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 21:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED3C3A2547;
	Mon,  2 Mar 2026 21:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AiFm0DT5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E413E3A2565
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772486127; cv=none; b=LBNVq6kSf3ETUtLya1ZTRSZHUymOXMQS4v9+FdKfRkxohGeRGmRXNVUgQ8oyHM2fOwB9rCu5VSAhB/lbjVjPOe2KfRK7NKzbrb3PuFzyppJ+YGmBnNpzHup596ke9ddZAOHmJluw6L3N+MdkwnZE/lRO5HphM6fkm6Dag8yN7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772486127; c=relaxed/simple;
	bh=45z5yciKt3Oy6ZbCauJrqViKv+7G0YzNd45U0Q8WcM8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=YhJ2BJhMqfWRWSXO9MZIeog7VlVUmt5+ydTNc+QqOQ0dUULf9LZy2JFtA53BYiVAAcOUJgaFPCbLMKUnllo7A2mj0WJUAdFgsBPsy2Ny7N5swzAlDGn97V9bkOCRJH6jUFmjYRWmwSt7EmEK7Q2LVsnHRPoYFnJrEoC94tAUKRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AiFm0DT5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772486124;
	bh=45z5yciKt3Oy6ZbCauJrqViKv+7G0YzNd45U0Q8WcM8=;
	h=Subject:From:To:Date:From;
	b=AiFm0DT53ZCSEQjBAoC/Q4h2FrQeULP2LuGpXeyPCloPXvcsJsHIfL1mqHE4tRVge
	 yuxonqQUKirhfu/MBKnHTnkbMX66v1e84tPDQJKhaPDNFB5KOFXacQEFIw8NJyys5X
	 YeRz/GGuVNRwXI2N52w1vx+YZVD40N1fDXFlx/ZYedxdAr6hIlpoeKctwm5KvYxRDw
	 Ln2jq2I1uUerEsMv1T5AaupqA/R61tnjQH4Qk0805NgTEwwhs3kE44WyFu8kDBMHEC
	 4p+M/Jg1PbtMijoUIDtH21EeUdGf+mTQgIXUc5LATzmaoMCLxCFhYW8lJvOx5CPmgn
	 U+hMZevdlOb3g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E69AD17E09AC
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 22:15:23 +0100 (CET)
Message-ID: <2074ba5a5d05e239f432d176eb051105f7e692f9.camel@collabora.com>
Subject: [GIT PULL FOR 7.0-rc1] Media codec fixes for 7.0-rc1
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Mon, 02 Mar 2026 16:15:21 -0500
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
	protocol="application/pgp-signature"; boundary="=-na1FkJR79OpkvijAHBlc"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8D5B11E4125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-54231-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action


--=-na1FkJR79OpkvijAHBlc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This pull request is for the "fixes" branch. It includes build issue and a =
fix
for initialized variable. Both problems got introduce in 7.0-rc1 and that s=
hould
be address before the final release.

cheers,
Nicolas

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/fixes=
-for-7.0-media-codecs-2026-02-02

for you to fetch changes up to 29e7687edc82d32dfbb55ab5eaa94880851c83b5:

  media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl() (20=
26-03-02 09:47:46 -0500)

----------------------------------------------------------------
Important codec fixes against 7.0-rc1

----------------------------------------------------------------
Arnd Bergmann (2):
      media: rkvdec: reduce excessive stack usage in assemble_hw_pps()
      media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()

Detlev Casanova (1):
      media: rkvdec: Improve handling missing short/long term RPS

 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  4 ++++
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 50 ++++++++=
+++++++++++++++++++-----------------------
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c          |  3 ++-
 3 files changed, 33 insertions(+), 24 deletions(-)


--=-na1FkJR79OpkvijAHBlc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaX96QAKCRDZQZRRKWBy
9BQzAQCvVKMdoYAP3qLEKR/Zhklv26xBqDcMKaLMaF7NOw6XOAD7BR9kh2nkq3fF
fLwHkqXdJJv6I3Q16s19gQNu0eSMCAg=
=Zb7f
-----END PGP SIGNATURE-----

--=-na1FkJR79OpkvijAHBlc--

