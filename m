Return-Path: <linux-media+bounces-58328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLk3OMur12kMRQgAu9opvQ
	(envelope-from <linux-media+bounces-58328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:38:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E613CB5C3
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA213063D74
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A97D2DCF61;
	Thu,  9 Apr 2026 13:33:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59040DFA4;
	Thu,  9 Apr 2026 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741602; cv=none; b=BE80x8yv9UqQLGtDTXIQrLYncLsKl+fqVDaw/B4SbwfbZpYBZrAZ9pv7Z4dxGsUmWskiNuLtpfA2Js36TCM9wkLeIFR9/MGklaNIcKXvQnFAELzwwwoB6dsBxgrW+j0stwvesaObRJV0V/4gT1bBoxsrmZns2bdOTjj6D1Ggoqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741602; c=relaxed/simple;
	bh=Vk3pPD/Gc1p88nyH4rzkDAj4Wlf9h7ovPxfYHM4QgZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWWAq3kjvtw2elN/Ht9rguuN3U346gcMTkrTv6BS4bCI33+64K43KM0N4PgaHOjFS4CukeOdbfYhPKZgMy1HrGRApLugtgIC40uTwVsScKdapWVGu6G3LlarYtlN8sb+KXMHsOSZIccJGGeQUKpQIJ0+gM/dugiAUkf3QT84SrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 470561F8005E;
	Thu,  9 Apr 2026 13:33:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 63F63B401AE; Thu,  9 Apr 2026 13:33:10 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E0762B401A5;
	Thu,  9 Apr 2026 13:33:08 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:33:06 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <adeqkmA9VhaPkSAk@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcME/vMivydd7zm5"
Content-Disposition: inline
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58328-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,sholland.org,collabora.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,paulk.fr:url,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 33E613CB5C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qcME/vMivydd7zm5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 24 Mar 26, 16:08, Pengpeng Hou wrote:
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.

Could you explain why it is legitimate that userspace would pass indices th=
at
are not in the dpb list? As far as I remember from the H.264 spec, the L0/L1
lists are constructed from active references only and the number of items t=
here
should be given by num_ref_idx_l0_active_minus1/num_ref_idx_l1_active_minus=
1.
We can tolerate invalid data beyond these indices, but certainly not as part
of the indices that should be valid.

However I agree that cedrus_try_ctrl is maybe not the right place to check =
it
since I'm not sure we are guaranteed that the slice params control will be
checked before the new DPB (from the same request) is applied, so we might =
end
up checking against the dpb from the previous decode request.

But I think we should error out and not just skip the invalid reference.

All the best,

Paul

>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
>  		u8 dpb_idx;
> =20
>  		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			continue;
> +
>  		dpb =3D &decode->dpb[dpb_idx];
> =20
>  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> --=20
> 2.50.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qcME/vMivydd7zm5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXqpIACgkQhP3B6o/u
lQzEug/+L0i5WTWsYIfonjrs2jQjpLwvRKyR7+XhxwJUfL+txU8E2UXge7nNq3ja
ArsUnJXyjCzhaj1Tot8ptBKjfcSYOjbsFYHeiUIHvHNIm56Q0G1k+801TVEWRcXQ
LwKfkyBAl9HMf4FtR++yMoZ4f90tSJzpQJqjp04pTxQKErxB2S8V3HeW85m7qs/y
tORRrEawCMgs8J/Wn23IAl5j7mJKE9BK4WMasgmTqOG1qmTpw7FzyOR4peCD/pUx
L+QonrV1TRVGR3HW2ICL4Gmmu7utCzdgy7Sy/JN1wMgM1mLIEhIz+YuMmMjUVR+o
/yae3q+Ht3a2L/+nm4fhpElg2AVi/Eo0YpIrdE7TqqmHMxtY5sXllJBZGUHwdr/L
wF2XxBcP7bNx4IfBwkT62iAVxGaag4fzRsYGr3uG3En8i9Oo96p4rD8cDRS1/l8N
3WSYF8oVIG7hkaiqX4drUkqXGkt14HLB8+iNPz8a5cE9WW9CYeYwVJ2IC9F0DEgW
PbAvNDNpaCLdJjNxV0eFdggl0Ipq94xALhjOSFobhOlJjreOqNjLrsKpynsnD5K6
FWAw+Pj/fPDMhZvj8lfW3RW4T6pZ/KTFHzZ9wWjEgCiTbFNtjOxWc2V2CY9Q2YNI
3fDtG+tv1cKs0uLyMdwLLYcyo8BdtoCuTQas99LdqZv4TTKafxU=
=1orP
-----END PGP SIGNATURE-----

--qcME/vMivydd7zm5--

