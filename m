Return-Path: <linux-media+bounces-58340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIkTNj6w12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:57:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0D3CBA65
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E79D23054956
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C293D47C6;
	Thu,  9 Apr 2026 13:52:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A23C457A;
	Thu,  9 Apr 2026 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742762; cv=none; b=Hoc902VGdsdWj+1CZ0EkUawoCYbSXdhj2Ecpq+2B/2BswHzMHQqT7AdKtXolfCVGP5vJ5dRbCmSi02sh34c48iza3CCGBGnwWcSRaySVdA73nQ7IoplHFvrpE2f9IVaH0EWof4/LovvbhOSlfqBx5fmxvzddaW+NDLaKt/BFMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742762; c=relaxed/simple;
	bh=xMoo+7vdN5zN6CW5eB6OG8Tf45Ip7hh/OYEdDvr32rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YctevN1elR7o7UU9p4AUGr4y+VNxXifIBde0S5JC33bVNMoHJ8AWpF0FPwAJsfWzsSfrKUTgfsdEtpGNLXd+yDAzbdtBiQshpFrbbld+e3MAoq4ARbznZcjy+2laODtWV6ffIxc/rY4fNgon2m8KijeUyXt95q0sVkyQ0SXWflM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B35F41F80041;
	Thu,  9 Apr 2026 13:52:36 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 14B89B401AE; Thu,  9 Apr 2026 13:52:35 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 9B698B401A7;
	Thu,  9 Apr 2026 13:52:33 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:52:31 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org,
	hverkuil@kernel.org, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, opensource206@gmail.com,
	jernej.skrabec@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference lists
Message-ID: <adevHyqtwtEj2_-l@shepard>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
 <176cfd181e783d2b24fad1a2c7b18425374b4622.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UjZmawpO70FM0398"
Content-Disposition: inline
In-Reply-To: <176cfd181e783d2b24fad1a2c7b18425374b4622.camel@collabora.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58340-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sys-base.io:url]
X-Rspamd-Queue-Id: 7DB0D3CBA65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--UjZmawpO70FM0398
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Mon 23 Mar 26, 09:41, Nicolas Dufresne wrote:
> > +
> > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l0_active_minu=
s1;
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > +			if (p_hevc_slice_params->ref_idx_l0[i] >=3D
> > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > +				return -EINVAL;
>=20
> That one is a breaking change since userspace already passes off limit va=
lues
> such as 0xff when a reference is missing (was lost). See:
>=20
> 	47825b1646a6a9eca0f90baa3d4f98947c2add96
>=20
> The hardware may or may not be capable of doing concealment, but with this
> change, we bring down all drivers to failing the decode completely.

So while some decoders may be able to deal with missing references, it seems
that cedrus should still error out in that case. I don't think it will be v=
ery
happy if we configure the hardware with L0/L1 lists that don't match what w=
as
used for the encode.

But maybe we could pick up another (existing or empty) reference to replace=
 the
missing one, which would be better than failing to decode the frame. IMO th=
is
would be best done by userspace, but maybe we'd need some indication to know
that the hardware cannot deal with missing references.

What do you think?

All the best,

Paul

> > +
> > +		if (p_hevc_slice_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_B)
> > +			break;
> > +
> > +		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=3D
> > +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > +			return -EINVAL;
>=20
> Ack.
>=20
> > +
> > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l1_active_minu=
s1;
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > +			if (p_hevc_slice_params->ref_idx_l1[i] >=3D
> > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > +				return -EINVAL;
>=20
> Same.
>=20
> cheers,
> Nicolas
>=20
> > =C2=A0		break;
> > =C2=A0
> > =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--UjZmawpO70FM0398
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXrx8ACgkQhP3B6o/u
lQz+Xg/8CyaAbUVIQfLJ6+9Z3mBoiBtsd7QNfuqQFxvAqmx8l55AyDlF9MOI4EEi
8RSVxZWl4voBhNmYx32sn6Bcg3we+gHMP9tvv57FFKwHxxQGWuaCoempRM2Da6bp
2XLY6c9DcZHQiYQojuQV/awuDyFPJusd8xUpIUsf4OtAgl0NAvG3IJq1UovmeqSn
pangp59J7XuPsX1xvfeMf7JhwFXkFlJB/p4j6SIyVLOakk0C5hOimVRApApwII3P
5GK4xRLrNv4lvoTfi/i5mezVrBYUiP1EUqgHazeJwVqa4xtnCVlGMXQ8Pfjjq1N2
T0jtx9EIfxNltYrmnRXNfShBSLRwv9WS0bC8CcYb4FBpMVCnq2bOd1niiMsmu+Yt
3IFgzYh2zA25AVo0RdAkzJJ9noi1phvB8L3N9yW3c4B6IvemBgV6aqEvpcFJr4hc
j035FeRVfidTnitYUdpmFnP54/58w1uIX2yFBskiRSZcMHm29+CPLYsKNN5ZWZEo
n4ECuyLx57THicEg6+2T7mTcHmMSPdZifsJfdjfYw3Its+r6wJ3qb8uKe+vMnSpi
g7E5oGTSUI8iqUjlEKgOhp+uhSRMjC9bdqWSPsfjjqJEmppksZJ3MnsU0ZLWf+/G
R4T0zZ3CQB8FE2IrLS3XXF5Lr8uEcvpQ6ql9V3wxbNhKtF7Z0e0=
=v1tP
-----END PGP SIGNATURE-----

--UjZmawpO70FM0398--

