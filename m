Return-Path: <linux-media+bounces-54360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G9/HffepmlkYAAAu9opvQ
	(envelope-from <linux-media+bounces-54360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:15:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48F1F0081
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FC343088703
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5F7423A77;
	Tue,  3 Mar 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f062MBur";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ilwTP5bJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95F421F1F
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543589; cv=none; b=Rj10SScTM8Ih+4wM+wPmF99Q7aHhoDylBcMCH3IeSBc+k9o42HfUK+U9QfBCI7x2CnZMOtm1WeE8Gpakimoe/H5vAXZ6WIAjviSX2SbHY6exfZqaGYTMUnn3pExkbWx6hJfZjEhI+qSCu3oHMb0taLugV0/xxv5BXLxs7RWc44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543589; c=relaxed/simple;
	bh=L11CgpOsvWjy//OKwmDKit419j3ro/+KfnYSmwS3d4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2rO8pWASnzcVXBwnWbxgSBHLrTT4pUv+gjggTWqnPNlFyppNSVxabVHgec3JEvzqAqs3iCCZNAigU5KKd3Wr8szAMErOpqssOH0qNnEIpt7/88tXEqdYWrL2xPQVGjqVrDJ+syj9b1AEFTuzJtdbsGFh9t/GwbHLVFn8JZoEMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f062MBur; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ilwTP5bJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772543587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
	b=f062MBurugz94+nJwzN8eKrz3ldAidzMeD7Tf9N7NeBw+F9wKhT/YU1DVDZ+LFyDE81wm6
	b9dSS7xcqDsLdMfCRodFP2L386hdZok7f+W3+HVIyCQubhcIXvQhUe6FFFFSdhhCAo5m+q
	1JL1+8PsfKkyZ3tNK8a+oFJ5/Mc6mXY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-_wJb3HNSNMWtqHPm_4Wj6w-1; Tue, 03 Mar 2026 08:13:06 -0500
X-MC-Unique: _wJb3HNSNMWtqHPm_4Wj6w-1
X-Mimecast-MFC-AGG-ID: _wJb3HNSNMWtqHPm_4Wj6w_1772543585
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-483101623e9so50509595e9.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 05:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772543585; x=1773148385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
        b=ilwTP5bJSFLfF57/ToXUx9mciV1ZG5P6Pns+pbNeLrIjs3WaGxelMa+LUlgIthv4LY
         NfgublTptb+T6xplj6Tp2CSVaUvAqUNrfBc85hynnqxB5t3o7cklQdIJqCw1r5yAN0Ft
         kuSiKBm1qA+TDnrRi2gwO61o2FoclLlxeB94ZvBBc1l6APUZX7YUJy04s842tH+w5X7R
         RspEEy+oX3Bzmj+sR5mNhkUaj4HMavIqbCsjWGHTHWFcqKr4Eo+bsi1a5NZTFcS5hDnX
         xyVtGls9JxkvZlxDEzksuqDGsW7In7rUj2n7U0unoewaMQv26iNG40uql4s2axYyV2+c
         NjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543585; x=1773148385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYfoI6IhVhwhSZGcHAz8lUbAzhXZJ/rjYc5L9rs8fk=;
        b=rfs+d4LWu1a3gUJ8UyUWjvOXDPwGjvpfJBX3K3uVegC4R+cGdOJP2v24bmxpqMBs6L
         jTzxP4qLx76801toA7/c92HeZ8mQ+tJHqtMtoKCjjzmBG5T3y2mDtUTACetxRySJDU5f
         hkZQsb8Tdv9H9Tu/M5fJOabRMIQl/SABBD7gwnOEcP0oZxQBpsGjDAag+7VOM68DIgHZ
         YRix3cWNdz9mxn0bDKE6pdskp4Hmp0uq7/d44WKfY7JiyWDQF2peOrzvlmvXgkwaqgR+
         baiByMOAuTzbR7V+rQhfPHql2UQXER25CYTzaCvSEO2p2M4kz7AMb7YzH5eMMDQ74Pxe
         czKA==
X-Forwarded-Encrypted: i=1; AJvYcCUjP4p6Vr9g3QfgG4RsE8I4A3aGqe4rLE42loz5nwBOJpMKcqicRmE2Pe065d/KMqCGKyoUXbmmk4bk/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLH8trn4crApYgzIvuPM4eDGRrtc7HygigTEvqhzeUzhzSosqY
	4K6a/QLWHqg5yZJ+rbCprn6i2w/9Nl42Ba+tZ9eCSmxcyifW/XahHQjVEwHKb/uE73u6wPKT3AU
	LPKJHODYNHwH+NP3DUnMJb9dYWiIYLKbzCeJy5VbLMeaFyXCx4rmphPzPXc5AAd5F
X-Gm-Gg: ATEYQzyyZ/nwfd0ABvRYOB178T0KRruA/UQzyjLiIk35HguOe1yuDJ7IN8nJpM3NZVP
	iK/y1/vaU/zGO7wVXevG/R9X3XQfBy22FMjUiLYRx7dJHVMx4jGA1R2lyZXXR8/pKtBMNGl/7zS
	UH0jlkFydKKhLILScAB+suaZneF7ixLOOToYjSZLTEm0OomI1ixz9efPK6BmQOHek4P8HnQOmc/
	x/o7LdAztzaN/iBthfkpceoIXM8dGhbV+Jx2cDaZikgadfsXzwZ6zobjTbE9cxa9/bcPF+/uZFG
	5JKPbjolxV0yc0X/THeC/ukYR6IpOQs9hTHhxat+/Xnp4e17WPJTm5EeMfDBIGMBVnxR6WFNkw=
	=
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c9c1f8fcmr272330205e9.26.1772543584819;
        Tue, 03 Mar 2026 05:13:04 -0800 (PST)
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c9c1f8fcmr272329585e9.26.1772543584305;
        Tue, 03 Mar 2026 05:13:04 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512692c14sm17392055e9.7.2026.03.03.05.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:13:03 -0800 (PST)
Date: Tue, 3 Mar 2026 14:13:02 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem
 device_init op
Message-ID: <20260303-weightless-crafty-hyrax-bdf1ca@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6eyb3mm7ilqztbmi"
Content-Disposition: inline
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
X-Rspamd-Queue-Id: EA48F1F0081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54360-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


--6eyb3mm7ilqztbmi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem
 device_init op
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 01:33:46PM +0100, Albert Esteve wrote:
> Add a helper function wrapping internal reserved memory
> device_init call and expose it externally.
>=20
> Use the new helper function within of_reserved_mem_device_init_by_idx().
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/of/of_reserved_mem.c    | 27 +++++++++++++++++++++++----
>  include/linux/of_reserved_mem.h |  8 ++++++++
>  2 files changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 1fd28f8056108..3a350bef8f11e 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -605,6 +605,28 @@ struct rmem_assigned_device {
>  static LIST_HEAD(of_rmem_assigned_device_list);
>  static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
> =20
> +/**
> + * of_reserved_mem_device_init_with_mem() - assign reserved memory regio=
n to
> + *					    given device
> + * @dev:	Pointer to the device to configure
> + * @rmem:	Reserved memory region to assign
> + *
> + * This function assigns respective DMA-mapping operations based on the
> + * reserved memory region already provided in @rmem to the @dev device,
> + * without walking DT nodes.
> + *
> + * Returns error code or zero on success.
> + */
> +int of_reserved_mem_device_init_with_mem(struct device *dev,
> +					 struct reserved_mem *rmem)
> +{
> +	if (!dev || !rmem || !rmem->ops || !rmem->ops->device_init)
> +		return -EINVAL;
> +
> +	return rmem->ops->device_init(rmem, dev);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_with_mem);
> +
>  /**
>   * of_reserved_mem_device_init_by_idx() - assign reserved memory region =
to
>   *					  given device
> @@ -643,14 +665,11 @@ int of_reserved_mem_device_init_by_idx(struct devic=
e *dev,
>  	rmem =3D of_reserved_mem_lookup(target);
>  	of_node_put(target);
> =20
> -	if (!rmem || !rmem->ops || !rmem->ops->device_init)
> -		return -EINVAL;
> -
>  	rd =3D kmalloc_obj(struct rmem_assigned_device);
>  	if (!rd)
>  		return -ENOMEM;
> =20
> -	ret =3D rmem->ops->device_init(rmem, dev);
> +	ret =3D of_reserved_mem_device_init_with_mem(dev, rmem);
>  	if (ret =3D=3D 0) {
>  		rd->dev =3D dev;
>  		rd->rmem =3D rmem;

I think you need to take the allocation of rd, and everything below.
Otherwise, your device, despite being attechd, wouldn't be listed
anywhere.

Maxime

--6eyb3mm7ilqztbmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaabeWQAKCRAnX84Zoj2+
dobdAYD53cfYylVyAMmjYQNu5L2HhH4nvwgXPsXDn+F4I5VP5R8b4pw9vf6buYC3
VoNwMQ4BfRUwUB8fZ2DXMX2IzVK3CXj6DaDP6OvnbvuzEI1Mw7ev9Mpzd14engew
qmADP+lGrA==
=WwGV
-----END PGP SIGNATURE-----

--6eyb3mm7ilqztbmi--


