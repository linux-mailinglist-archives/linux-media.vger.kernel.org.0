Return-Path: <linux-media+bounces-56381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IQ/JnlgvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:45:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784A2D2583
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B3B31EC8C2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA583F87F6;
	Thu, 19 Mar 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QyowdJ9m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B63A63F6
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952516; cv=none; b=FNqZYCSIakYcf8NbL5p2Zu1mwe2KTMcWT/iTBR0ZBqoOr4cOUVSKFQnPscMBr/KZNRLBXm4pUHj8GFTE1senDIh+Wz3JxK7Tp4G5OmbFHGS9P/YYt1FK5z0bujly49sQKwIJjiwX2pqEhpAl13INXvoMBT31I9lZxOjzivSW42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952516; c=relaxed/simple;
	bh=rJ8d2dpwOb+UnFtOBT1brM+gkjc70JaCQeE/DiwBuX8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sWKPcEVeeK1AISWiOu1Oas0LhuI0TxVQjg/1FZS6Gc4rp8wfSfSZ7Htr1Ug7w85mHnlS6gjSjJXjieAYuVhH36fblxpVPwa6vsumM+rqeXZe8vohzNJ8Pr7lJe3k7xY6D3eE8WEDLtBLs0OaN96lGEFcQp4uTjNsw27KOTvTqss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QyowdJ9m; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50b2b289925so8536301cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773952513; x=1774557313; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=QyowdJ9mTCmCGTGHTYn7miXgFZpZ0dMpqw9CPNNQU/Sac/7B+2UCzO5U8w8XlgyzRa
         rq5nuuBMLwimFapJoV/0PhQXaBFR83vf+1gCV+NDrgnGsVhbxpTE4rTL6hitSq6as5Bh
         Dn8ufcgesKI4e2GKgeYv3q072et5RTVSUkRwrDhfRQs/P5UsAT9VTCBNkh3nBxKMXzy6
         q7gEl2zGO/dIcvaK48zfik7NVo3ZE2cB+HjLPuKNh7jh4eeOoeDXbyqkKtGAKpBgVswF
         zs5nRrGykxAHU+FzchkiktMiWJM2c01oup56b1JWKZUS3+Q1p81AFC9tmb4ytrTwk9n3
         RBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952513; x=1774557313;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=P0htQUyIquIX4FFNX6hcZb48mkBeSVjLslDX8pTd2CH9RJwmmE7sAJlMoAzvij5L/4
         A8liQBIJvnjtnSVrZcr2ugT2fJo8PK1X1AZ9+mGKvzRW4RVeEpls0Nfo8MiFaEtTCKuR
         jmc3m/mcHRjtCRIZHiZPfAe/b4S6i1s2+oO6A8xWDbyl9JdEOPZ1VORaCb49R/Kr04tk
         iZiBMGlku2cDsWdGl8q4mcxpzpMExAnltDHSZfF8hXPAuisUbELYivLFrEzvmUtQyKdD
         XkaYPNmOq9ujbH/8UE189d+Qitohwzg1YKaEUP6CoWfgjNj+qpbMcfObvtjxTjMTcr2c
         095A==
X-Forwarded-Encrypted: i=1; AJvYcCULutFgbEQSCEdeAjdLMZAB7RnDjSLx7lronscJhGo/+6ibfBBMFJvthe9VhXosIlo61ckrZmfx9XW1Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/JyklqrTvBtJhIXhVQr/rDgBWj1jWhyt3CQQnmZbToyqhOk+
	6v6xhg1iz28ZdwrduFnIMVKlh0uoID/UINe3KODZy8jB7fspjr98IGuGWwaUzv4Ujss=
X-Gm-Gg: ATEYQzzClXonOr0ow8tSNY1UbFnvLIMDPenFN2fuw/MUfEIW6gszpWXELR0wTFygi3a
	rMrJnjO94GbraOVLjzkp1fwQ2zipvGRwQjaMOxDcVOXCxB+QYB/I+79WGktpixvQuJ0PgYhBLn8
	OadIIKxSgHAFkIO8f5IaPij5mhD3i3OPEG9dPQY8BJjb5+BeiVScq6mELk+9IhN27/wEr1uhpLM
	cNe/sg8ui0USa/Xyh/Z9hp8xr858pzRJPgwtf7YWjvsRJyGwzT1yGvDPwAFoBtgBZ9CPhtMxCsD
	FH5ZEd1ct4r+QOdPonVkNpwlu8zzHrKtSLTN4Wt1JlKd5ciGVGg6ggziTh/fqJ27vemmxz8SsfD
	wL4RttM7+w9ujotxEklAyehDB/E0xothxYu0Ahe91EV0Mxv0FE6E8xS0f8QyhCoencAfsjx/0JM
	gbnulIvydBlrE5IyMnZBTa5aWXpQYe
X-Received: by 2002:a05:622a:4c0b:b0:509:2d05:6979 with SMTP id d75a77b69052e-50b3748dfabmr9614041cf.26.1773952512773;
        Thu, 19 Mar 2026 13:35:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb3c91sm5393191cf.4.2026.03.19.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:35:11 -0700 (PDT)
Message-ID: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of
 vdec_open
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan
 <mjourdan@baylibre.com>, Hans Verkuil	 <hverkuil@kernel.org>, "open
 list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, "open list:STAGING
 SUBSYSTEM"	 <linux-staging@lists.linux.dev>, "moderated list:ARM/Amlogic
 Meson SoC support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 19 Mar 2026 16:35:10 -0400
In-Reply-To: <20260304100557.126488-1-linux.amoon@gmail.com>
References: <20260304100557.126488-1-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-cIsShmpVIGkp2hMkk7aV"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-56381-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 3784A2D2583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-cIsShmpVIGkp2hMkk7aV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit=C2=A0:
> If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> during vdec_open fails, the control handler allocated for the session
> is not released. This causes a memory leak of the v4l2_ctrl_handler
> and its associated control objects.
>=20
> Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> path to ensure resources are properly reclaimed.
>=20
> unreferenced object 0xffff0000205d6878 (size 8):
> =C2=A0 comm "v4l_id", pid 5289, jiffies 4294938580
> =C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0 40 d2 49 18 00 00 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @.I.....
> =C2=A0 backtrace (crc d3204599):
> =C2=A0=C2=A0=C2=A0 kmemleak_alloc+0xc8/0xf0
> =C2=A0=C2=A0=C2=A0 __kvmalloc_node_noprof+0x60c/0x850
> =C2=A0=C2=A0=C2=A0 v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> =C2=A0=C2=A0=C2=A0 vdec_open+0x1f4/0x788 [meson_vdec]
> =C2=A0=C2=A0=C2=A0 v4l2_open+0x144/0x460 [videodev]
> =C2=A0=C2=A0=C2=A0 chrdev_open+0x1ac/0x500
> =C2=A0=C2=A0=C2=A0 do_dentry_open+0x3f0/0xfe8
> =C2=A0=C2=A0=C2=A0 vfs_open+0x68/0x320
> =C2=A0=C2=A0=C2=A0 do_open+0x2d8/0x9a8
> =C2=A0=C2=A0=C2=A0 path_openat+0x1d0/0x4f0
> =C2=A0=C2=A0=C2=A0 do_filp_open+0x190/0x380
> =C2=A0=C2=A0=C2=A0 do_sys_openat2+0xf8/0x1b0
> =C2=A0=C2=A0=C2=A0 __arm64_sys_openat+0x13c/0x1e8
> =C2=A0=C2=A0=C2=A0 invoke_syscall+0xdc/0x268
> =C2=A0=C2=A0=C2=A0 el0_svc_common.constprop.0+0x178/0x258
> =C2=A0=C2=A0=C2=A0 do_el0_svc+0x4c/0x70
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 4b77ec1af5a7..a5ab0c2390f5 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_m2m_release:

This goto is used twice. The second time is when vdec_init_ctrls() fails, a=
nd in
that case the v4l2_m2m_ctx is leaded. Can you add the missing label and cal=
l
v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit again=
.

regards,
Nicolas

> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> =C2=A0err_free_sess:
> =C2=A0	kfree(sess);
> @@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_fh_del(&sess->fh, file);
> =C2=A0	v4l2_fh_exit(&sess->fh);
> =C2=A0
>=20
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af

--=-cIsShmpVIGkp2hMkk7aV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxd/gAKCRDZQZRRKWBy
9PaoAP9PoxyrdYiXm0RCBS8FInF86DoW/B9AvzEmZ/gHCIdlSQD/dYT0Q3twNY80
YmxdwR1+9TJyEj0XviEmd4JDTuYSxQQ=
=SUeq
-----END PGP SIGNATURE-----

--=-cIsShmpVIGkp2hMkk7aV--

