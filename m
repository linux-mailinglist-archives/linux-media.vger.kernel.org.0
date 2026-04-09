Return-Path: <linux-media+bounces-58345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPAlI1yx12mxRggAu9opvQ
	(envelope-from <linux-media+bounces-58345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:02:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 027CA3CBB80
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9D0B30038D2
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 14:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D77B3DB628;
	Thu,  9 Apr 2026 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YsbZZX96"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C53DB647;
	Thu,  9 Apr 2026 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743259; cv=none; b=JtLf/HSkQZ1k93qL1N0Pk3Xa5osZTiJ3Ef/uNGuyY49lhvVo/HQxrq9yAaW+QD5JmOr8GDhfCeZyuj6EbRrQWmvL5xUa1pW+XQxK3/DO/YtsgxGV0sVEUAuulWJS3KQ/NKcH0iDKwNEkcfRbrQ4M2GcUENXJg1q5j8tkctKRa+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743259; c=relaxed/simple;
	bh=8kQcmwdG6QXGNqHhvyATkAq0gNlzbTkugog2hKOxlQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k4+HxaMWlZ/mozScwHh48VfNnhRViZ088tm8F3qlziRXGRoeVjjCmS1vDf0zDJBipRS6YVgeNdzwNqoJa5NSHrfDCZqz+LKTiRw7y7llCAR51bYEaiARu80u9FPldswz5T8evE3ZyUljFdVH5mCqy/YC2X2V7gLF15fwqettnZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YsbZZX96; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775743247;
	bh=8kQcmwdG6QXGNqHhvyATkAq0gNlzbTkugog2hKOxlQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YsbZZX967IbI31BbbquqZ1PcEV/O5Tsa6A7f2P1bl11OYlZGG3GZk8YNTjAp1qKWf
	 t0/cIInrE5IlfZ2R8gOKUWCj/EvfIq4hqUThaMO+6eYf/7MbX9znGPxiVtdK0h6JPC
	 3Bd1yvTz12d9caUXF/e+zfAdb0pIM7KShrsvnAR5KyR8Pv3/h0INsuNPOZIgLcv3qe
	 MkrCliVR6W7eglK6vhLvwnUmWG6R/ZiPd2Zb5YhF6f26GmkbC7tX7eRHwR8r4QKDDO
	 S7P6pq73R65MQtk9EieW3tvaGOR9Yb9e/giJmwWQF2fPB5Fk27xGb0Cu7BP87Qs/rq
	 ETVYncB2jjnKA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F47217E0C83;
	Thu,  9 Apr 2026 16:00:45 +0200 (CEST)
Message-ID: <f18928df8aeb6afb27b88a15cfdde99ec632e266.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland	 <samuel@sholland.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:00:44 -0400
In-Reply-To: <20260409223000.0-cedrus-h264-active-reply-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <20260409223000.0-cedrus-h264-active-reply-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-5OVr67ceBJnzsgX5dAdF"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58345-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 027CA3CBB80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-5OVr67ceBJnzsgX5dAdF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 22:30 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> Hi Paul,
>=20
> Thanks, that makes sense.
>=20
> I agree Cedrus should not silently skip an invalid index in the active
> portion of ref_pic_list0/ref_pic_list1.
>=20
> I'll respin this to keep the check at the Cedrus use site rather than
> cedrus_try_ctrl(), but return -EINVAL when one of the active reference
> entries points past V4L2_H264_NUM_DPB_ENTRIES. Entries beyond
> num_ref_idx_l0_active_minus1 / num_ref_idx_l1_active_minus1 will still
> be ignored as before.

Please, let the discussion continue before respinning.

Nicolas

>=20
> Thanks,
> Pengpeng
>=20

--=-5OVr67ceBJnzsgX5dAdF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadexDAAKCRDZQZRRKWBy
9OpVAQCP3WR3RB5KJ7O/QZ7D8FigNAJs7B9yunh7U+RQR3hX9AEA+EjzVzLfQMAu
cRpZtv69oZ3RMZw21gi99TaCU4LTiwA=
=YIxt
-----END PGP SIGNATURE-----

--=-5OVr67ceBJnzsgX5dAdF--

