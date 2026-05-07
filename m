Return-Path: <linux-media+bounces-60882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDyADgsg/WlTYAAAu9opvQ
	(envelope-from <linux-media+bounces-60882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:28:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F170C4F0151
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54433046E99
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 23:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C464D35DA56;
	Thu,  7 May 2026 23:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="o2PziQfx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27DC2C21C5
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196450; cv=none; b=sA1kGoRZAFK3dwnY+xZl20QUHrVd/8uKzzSb/rXdfx7BTkEJFuUeklgVqKG9oyBSyQdNc1U8qwsNW/J09nXJV28wSLorA33Bq1xRKqVKFnE2MBUvTzhrbUmaBJuakki8mzFBe8pg+Pv73Y37TLIAFbYhQ2meg7Qxeb8aFXySD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196450; c=relaxed/simple;
	bh=yL3ozqXIvNHQL09rzJqznkF0RKFhQNFidnZSc4uHoEg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9kPUZi0em/nbez8+PDWxZf3q27xboQmctW9hCtD4dYl2gX3pWF4nNCX9gGzWH0ZAj3g0TzxaCr3qSnobKNpORz5rLcvLO1oeytvLrBpb9dZ9/PyoMW4fdonZ+huFeHeL6J7eu4WQaBZEisbnfN4KJNHkjuLaXMdJ29tLfvswfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=o2PziQfx; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so19795686d6.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778196448; x=1778801248; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b6U2uX4TwvjS/3Q0UsrL7npn0f3jqdHzvW4G7Vy/bgI=;
        b=o2PziQfxEBqYHyZYXBh+8XjFezWv8IHNgKmoRh+JnwZwuZTHtO6zayqMaaRvBjE0hx
         bZYSyknVQt6UwbtmXxFkMAI9SmZiudgFAejZmKXggycy4ICx1irhykzBh77CJ1CW5uTA
         1u9z7pijicY5JyZxUxbUwEM9iCz54Ny5lR0hKWxpH2UWOSWcLUtCAA811/Zm5YO+NOoY
         jBolf7AuNEVJ0+8R6+jn4CSUBqG4p0dsA/DNue2WSq+iYsF5XSAPIoffv8wUIPMcEQqS
         Hlp3zv+vbA2Q71BiAS/CaeFjSV/ZGoQfWoFl3la/3eGNSkeZf8AVi2FAJBHnpcUCIrRu
         eCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196448; x=1778801248;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6U2uX4TwvjS/3Q0UsrL7npn0f3jqdHzvW4G7Vy/bgI=;
        b=g9BMx+w0sZ+khPfOlAr0M+kG64nixuikD5MogLA4mv+fEr2e2jh5zkXOuVracwJTbr
         Twvda44PNLNlv9/evdxPE0y5QJT7BZk/8Il1B1uqBMmQyCjyf6vRnOqqNBdDKEeNIZ40
         Q9Mgfn9robapvJvuIhL5rS+qU4n4WD9EKLyfvxD8VSEtclfBRH9+yiUDGpg8IlAg2hDL
         WJ2EHJUU/W06REttPB0r0yWem7AuT0ubGh0A0w5/SHGzXe+rTUYM4Jf+ttT26IyCwCSE
         UCQ+wpKB33qFxwmbqcNkP3UezdXFodyy77AgA+cSF+zzI0xj7iwzR3bEZd+FLcsE8fHR
         Di3A==
X-Gm-Message-State: AOJu0YzjfstxlmyD8h9xzRK6mF9uw4PGlMZK/GFUNexcOLT4f6VdaaML
	XGONKSj2NQB029IXKyca5mDzB86nibB4w9mvyQ4sQG50591bWo9HTa0eN47Y4ff0cXKpd/44lHu
	v8GJ2aVif+A==
X-Gm-Gg: Acq92OHfav8KgSsmhUqH4eY7OwaO+7W9+nE1CL3KT7Rg4lIXhZQxNV3ltKZ3wv8gE52
	5MGCRF7J/uqTqnsJxtEokQue/XruOPxIusqA0ZyB+h1Hdj7cn/lPhlCanp2l8OoW20u9M+jE5MQ
	oGAsPtFojKFEiY8g8LhUkbqII4nMwiQunBdA4d4ri2Q9ilVQeTB2cbfx7+HSdB69QZLA6hrpcQv
	I/9sKh7+Q4/H4X+PCru3I+t2abczgJXwlN+3+GHg5/yacCaMHZ0UztmElPtoPHO4P3LzcCTMFwQ
	9q58hSRnMT6sw5WsDngqawnKOSKPb+iDRv6ZwndRgzt6s1G/wk8mmGlla+FsHJPq+g5N2u/hWqB
	g5d5oguNwAhXt2z8UW9art1UrSmj2K5LYnhK+avJnSlH7ToSpnR7Yt6+bGJL7wtHtfE5Gk9nlCJ
	/CGnpFfx4EumCVQmVHVyfp4t1AS7j3
X-Received: by 2002:a05:6214:627:b0:8ac:a689:34ce with SMTP id 6a1803df08f44-8bc4600fe8bmr158890996d6.45.1778196447798;
        Thu, 07 May 2026 16:27:27 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a43636fsm2179986d6.21.2026.05.07.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:27:26 -0700 (PDT)
Message-ID: <2e891600319c2fd4219ed32d884c2b5bd975c3d0.camel@ndufresne.ca>
Subject: Re: [PATCH v4 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
 <hverkuil@kernel.org>, Nas Chung	 <nas.chung@chipsnmedia.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, Yong Zhi
 <yong.zhi@intel.com>,  Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>
Date: Thu, 07 May 2026 19:27:24 -0400
In-Reply-To: <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
	 <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kS8qr0UdOx8Un+zOSSmW"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: F170C4F0151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60882-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-kS8qr0UdOx8Un+zOSSmW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 07 mai 2026 =C3=A0 20:58 +0000, Ricardo Ribalda a =C3=A9crit=C2=A0=
:
> If the driver's dec_output_info contains invalid data the driver can
> write in invalid memory. Add a range check for that.
>=20
> This fixes this smatch error:
> drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588
> wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' =
64 <=3D
> 127
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

It theoretical, but considering its a warn_on, I'm fine with it.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 ++++++=
+++--
> =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index d26ffc942219..f77abd5e122a 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -584,8 +584,15 @@ int wave5_vpu_dec_get_output_info(struct vpu_instanc=
e
> *inst, struct dec_output_i
> =C2=A0		p_dec_info->num_of_decoding_fbs : p_dec_info-
> >num_of_display_fbs;
> =C2=A0
> =C2=A0	if (info->index_frame_display >=3D 0 &&
> -	=C2=A0=C2=A0=C2=A0 info->index_frame_display < (int)max_dec_index)
> -		info->disp_frame =3D inst->frame_buf[val + info-
> >index_frame_display];
> +	=C2=A0=C2=A0=C2=A0 info->index_frame_display < (int)max_dec_index) {
> +		u32 idx =3D val + info->index_frame_display;
> +
> +		if (WARN_ON(idx >=3D MAX_REG_FRAME)) {
> +			ret =3D -EINVAL;
> +			goto err_out;
> +		}
> +		info->disp_frame =3D inst->frame_buf[idx];
> +	}
> =C2=A0
> =C2=A0	info->rd_ptr =3D p_dec_info->stream_rd_ptr;
> =C2=A0	info->wr_ptr =3D p_dec_info->stream_wr_ptr;

--=-kS8qr0UdOx8Un+zOSSmW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf0f3AAKCRDZQZRRKWBy
9CNGAP9gRqo81pnTjYo/Dv0B+1g35GzQWjGMHtczGWARA6nZpQEAt4GJoVEZNftD
pcOsX6aYlBZ5WpmmaVt+Vnn1wqk5ZAg=
=l+59
-----END PGP SIGNATURE-----

--=-kS8qr0UdOx8Un+zOSSmW--

