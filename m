Return-Path: <linux-media+bounces-60938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMieDmok/mlTnQAAu9opvQ
	(envelope-from <linux-media+bounces-60938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 19:59:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8564FA4AA
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 19:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7630F3008CA1
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 17:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063D241322D;
	Fri,  8 May 2026 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="l4Z6LaYO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F2359A68
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263136; cv=none; b=RkvUCHLULYF0+0svColdFMunIlWCqjyfZtIIGxCz205sL9EgbM9te0TMA6x1mBac71SGdGTtgJkpLsd4FOr749hCyKKmFxYSk8OBa58ISUIlso0i2gPMa2mjlOgAlly13vqDCcwRIe9x0PCvG8I0F/pKiYUsSRgGDdkdoidch5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263136; c=relaxed/simple;
	bh=Bx7obrnEMz/0J+55OaMLyw7MVpmUbgAokSapGCLEtNg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o3rjI3mq2Ly7MjwfOTOil5QYD3NEySok3/9+88bXSqFvnI5w0KdecQerWgzhTd+BeZWJCk8YnghPP3oF62HeKTU1Sn8c1lvM8bD8jYx/tvUwF+fOJI5mhRynVMYkFslT7w5cc9z9vYjWty5hlszeuZVBptQhxoqpHD3zCCGKS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=l4Z6LaYO; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8ea8563c693so247876985a.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778263134; x=1778867934; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IEzQxhdIrgs8qVdjonR+CtIhh7E7By7r+yqbMW6WaoE=;
        b=l4Z6LaYOLfAWvtJlM1Nw/lMs2AmVe5DVRooWoLYe0tlyEyX5stFQYNyMgCsz052LED
         Sq1AKryNTBcFxdapfLqeJEpUjrtzmrXtDjGs/pLa3T0nEJhbUM65Y++9KV3sP8jnCKtQ
         ZGdP2WV949mKSioZqZ1PMkBJ0qbk/fghMaVmu/tGP1stCjBBbBqLzsi6IHBCe4xxHIqh
         OZl/OKuoX/2QLZx++YkGMiSbYNXIKBadUKWp2iGQO0Fmll0cKGloQnx9qO/SbVrzfXdY
         5qBucjtFKP5w6KBssT8Nm7EEgrHjn8vZ1jhq8E5N0Ju1XuA5mERMM42fYcYUTUUB6Lbu
         PJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778263134; x=1778867934;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEzQxhdIrgs8qVdjonR+CtIhh7E7By7r+yqbMW6WaoE=;
        b=jOBy15MpNBDf9yMsl7sVgDPE1ceHaClztO3is36s+gsJKabFAfa+BXdUj/sg+t+apP
         P3wsUN5LJBk8x+Z07B+ovMsRb0fLlmAq2JIyJz1pesVzaM2ZPL+6QpDusYkNbIYCou9F
         MK0rroqDN2zTR4C8oXSmZhzObqgKESYREjE+LG51Kd4gj7poL66T3UalwA7CaZdVEcaC
         T05hetcEE9nUtZTkU6hubLysJE9+wA77X8uLF9piaX5VehjPwrf523/xMFJiAXsCuRKG
         +yI2dZ9kosS4//01wqDRuT9doDcWz+tFD2fEZP4BZ28VklFPz4+YsZDTeL2hwZK1yHoa
         pkbg==
X-Forwarded-Encrypted: i=1; AFNElJ+5BzQchEbGoU46luE0qyXBzIVoj8N53mPyKdTRslZOfH81BsHXk4YMAM/8Uw+CB21Czz1OMAiIiY1r2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFKxksCvenwKupIDPGeLPr0qq9W+/phnjjnh4KnhF6JIoETKS
	J02lSiaI/UYTVCv7eKdsSjSk3EvlcIMgNG9M09MWrNEbJ5vf8rxi5t4XiHI7ZehjAFi50kqNrDG
	oCPMhBXjwUXNM
X-Gm-Gg: AeBDietNIfit3CTFiWUdgovkjIhHh3oyYkOV8OsRop5J5CigOosoF9bzWQLzGdEoEcu
	ZlKy+bzH7ZD5WvBPqcKYoI+tP6/NDiTAFUcAB8MhQ+0roBY5coE92Zg/kFZY0suXBOyJd8hRHVk
	eL8pDcz4CNT7v0oXw8qMNjFxuIxfP4wIiA2Kr3GZ88CRdhl2WGQp6m+z4upkCsRgqZ+D2pAFaX/
	JirmwZdZnX6qrlGcAL2SNK0PZkNob9dbQtPEL3ImjWS/WwUfx/F5LdoU2z/DWJKR0q1gFiwsz8K
	vIfIbdX9EXsLEpxm2Gqti203MZWHy93+hfDb4Crn9TgLfkR+b/ZwVD1Ycyn9YpW2ftLHMYwebmg
	m0wH6x/2+4qeKJOI5T25v/VY7SW1qEnmhIcdjA6+hkaNHqrQ74ZJ626mdjMShFsmK/b5P1zGKEZ
	AGs3sw6aIELciC+Ba2kULZnHMB4Wzv
X-Received: by 2002:a05:620a:2584:b0:8f8:d217:f46a with SMTP id af79cd13be357-904d3fa500bmr1997866885a.8.1778263133866;
        Fri, 08 May 2026 10:58:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm270004885a.19.2026.05.08.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:58:53 -0700 (PDT)
Message-ID: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of
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
Date: Fri, 08 May 2026 13:58:51 -0400
In-Reply-To: <20260321065408.209723-1-linux.amoon@gmail.com>
References: <20260321065408.209723-1-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-3VX71bn7qLKjvDPsQYLL"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6F8564FA4AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60938-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14]
X-Rspamd-Action: no action


--=-3VX71bn7qLKjvDPsQYLL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

sorry I missed your patch, catching up now.


Le samedi 21 mars 2026 =C3=A0 12:24 +0530, Anand Moon a =C3=A9crit=C2=A0:
> The vdec_open and vdec_close functions in the Meson VDEC driver failed
> to release several resources, leading to memory leaks and potential
> use-after-free scenarios.
>=20
> This patch addresses:
> - Missing v4l2_ctrl_handler_free() in both the close path and error
> =C2=A0 exit of the open path, preventing control memory leaks.
> - A leak of the M2M context if vdec_init_ctrls() failed.
>=20
> The error labels in vdec_open() have been reordered to ensure a proper
> Last-In-First-Out (LIFO) teardown of all initialized resources.
>=20
> This was identified via kmemleak:
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
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail=
.com/
> =C2=A0=C2=A0 tried to address the issue reported by Nicolas
> =C2=A0=C2=A0 improve the commit message.
> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
> =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a76..3a5e4ebe0b34c 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
> =C2=A0	if (IS_ERR(sess->m2m_dev)) {
> =C2=A0		dev_err(dev, "Fail to v4l2_m2m_init\n");
> =C2=A0		ret =3D PTR_ERR(sess->m2m_dev);
> -		goto err_free_sess;
> +		goto err_m2m_release;

If m2m_dev creation failed, why do you want to call v4l2_m2m_release() ?

> =C2=A0	}
> =C2=A0
> =C2=A0	sess->m2m_ctx =3D v4l2_m2m_ctx_init(sess->m2m_dev, sess,
> m2m_queue_init);
> @@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
> =C2=A0
> =C2=A0	ret =3D vdec_init_ctrls(sess);
> =C2=A0	if (ret)
> -		goto err_m2m_release;
> +		goto err_m2m_ctx_release;
> =C2=A0
> =C2=A0	sess->pixfmt_cap =3D formats[0].pixfmts_cap[0];
> =C2=A0	sess->fmt_out =3D &formats[0];
> @@ -913,9 +913,11 @@ static int vdec_open(struct file *file)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_m2m_ctx_release:
> +	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0err_m2m_release:
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> -err_free_sess:
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	kfree(sess);
> =C2=A0	return ret;
> =C2=A0}
> @@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_fh_del(&sess->fh, file);
> =C2=A0	v4l2_fh_exit(&sess->fh);
> =C2=A0
>=20
> base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7

--=-3VX71bn7qLKjvDPsQYLL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf4kWwAKCRDZQZRRKWBy
9B5rAP9MVO41rRXQ4VKCwIshF3QfT75K/0d2qKK2EUMjAEW/SwEA2/UqAeSY68BC
VhnK/FFYRn0PpC4HYZLbmtXFz58mBwE=
=4xTS
-----END PGP SIGNATURE-----

--=-3VX71bn7qLKjvDPsQYLL--

