Return-Path: <linux-media+bounces-62433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGS/Ej3VDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:49:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BF5A2AA4
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A1C3179398
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E30376BEF;
	Thu, 21 May 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JWBCucmL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A136A355;
	Thu, 21 May 2026 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355086; cv=none; b=n3qrgsftgxYZWbEJ+OhpZmg+pUw63ZxJ+nP9en1cvyl4neQvFceyXAgldF+czNef5UAJEX2XHlS6Nc+DdM/hAUYMvQHYfdRpVtA5SuUiP/321Z2tbKGxioCMRUto3IOM/LOq93vVwwQcdLZELOuntiftNu/Q6vcUTTwpUSMvlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355086; c=relaxed/simple;
	bh=iB9jAHKjfyb1yn0BP3YJgPX6Z8FybJBuZEiOoZNCNm8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UcDK0GBo/ZJ5TzFXXDe6ycje83WVpEmWYXl1z3xVVO32UicyMyX5SpTxLAMf8Q6UV4rySHB8vAopOw/B7pOoc0cY+V+vaFpQ7lCP20UmyDImromaMSQhiFLapy5PB1yeEhoOwHPzoCvYLcLkdOd7itAMHrvP4bt2UXT97Zz4dO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JWBCucmL; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260521091750euoutp029019ead77c04b2458adeccf709e02a6d~xigJrSrAF2230022300euoutp02D;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260521091750euoutp029019ead77c04b2458adeccf709e02a6d~xigJrSrAF2230022300euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779355070;
	bh=tla4LIP0HEFHoX1w40Aji8U/IZUoIzvhT3y/D99OCOM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
	b=JWBCucmL7WVMJM9IsjHOplWSYB8TAS+pQfF3q1fVesX3jVDIbFESbMlVhLPvCqoHx
	 N9CWIQ/CTnGFge8SjaB2JJ+AE97haJdA1bK1IIxMCsb6knPRj6qpy5nW36HHbH6vSp
	 S2UTPGvg/kuh2tkLNe2SSiMAQ5d+KQdvZ+0kxBjg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260521091750eucas1p1b3186d0ad37643279c08c842482c461b~xigJGJI1B0858208582eucas1p1H;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260521091750eusmtip1aa20055378fcc28431326a001e937a4c~xigJCdYqo2518325183eusmtip1C;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,  Kamil Debski
	<k.debski@samsung.com>,  Kyungmin Park <kyungmin.park@samsung.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: s5p-g2d: avoid double free on video register
 failure
In-Reply-To: <20260517114642.951949-1-lgs201920130244@gmail.com> (Guangshuo
	Li's message of "Sun, 17 May 2026 19:46:42 +0800")
Date: Thu, 21 May 2026 11:17:49 +0200
Message-ID: <oypijdv7ch86ki.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20260521091750eucas1p1b3186d0ad37643279c08c842482c461b
X-Msg-Generator: CA
X-RootMTR: 20260517114658eucas1p26d540bb0740e60f04f7be661f2991add
X-EPHeader: CA
X-CMS-RootMailID: 20260517114658eucas1p26d540bb0740e60f04f7be661f2991add
References: <CGME20260517114658eucas1p26d540bb0740e60f04f7be661f2991add@eucas1p2.samsung.com>
	<20260517114642.951949-1-lgs201920130244@gmail.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62433-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[l.stelmach@samsung.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:mid,samsung.com:dkim]
X-Rspamd-Queue-Id: A98BF5A2AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was 2026-05-17 nie 19:46, when Guangshuo Li wrote:
> g2d_probe() allocates a video_device with video_device_alloc() and
> releases it from the rel_vdev error path if video_register_device()
> fails.
>
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
>
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
>
>   g2d_probe()
>     -> rel_vdev
>        -> video_device_release(vfd)
>
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free vfd through vdev->release().
> g2d_probe() then releases vfd exactly once from rel_vdev. Restore
> video_device_release() after successful registration so the registered
> device keeps its normal lifetime handling.
>
> This issue was found by a static analysis tool I am developing.

Thank you for taking time to analyze our code. I was going to write
something along the lines Marek Szyprowski has laready written in this
thread https://lore.kernel.org/all/CANUHTR-RfWnoMRRAoDb6CPZsaiAYBLy61dd0P6T=
nKYgjNeBWpA@mail.gmail.com/
Do follow his advise with this one too.

> Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/samsung/s5p-g2d/g2d.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index a18b13db19d5..f38c28abd6d9 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -684,6 +684,7 @@ static int g2d_probe(struct platform_device *pdev)
>  		goto unreg_v4l2_dev;
>  	}
>  	*vfd =3D g2d_videodev;
> +	vfd->release =3D video_device_release_empty;
>  	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
>  	vfd->lock =3D &dev->mutex;
>  	vfd->v4l2_dev =3D &dev->v4l2_dev;
> @@ -711,6 +712,8 @@ static int g2d_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto free_m2m;
>  	}
> +
> +	vfd->release =3D video_device_release;
>  	video_set_drvdata(vfd, dev);
>  	dev->vfd =3D vfd;
>  	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmoOzb0ACgkQsK4enJil
gBDAvwf/UqBCHoEFcpYoctqpNZB9CoQg5p5yFhsNbYNDc15ydTPBINYKGRXBzPLe
U+mHRQeqxMHzlzKnBYGJX7LYWXJyK0HAi0Et+jlb4o/v43eoBTBfaaRrbm+ST3sT
8qVUOcBjdV3AkiXggyGqS5F9XSqEAlcVFc6QJ+YgpIDvu4Kkp6KWBPXqgBT+THPa
6z+mLGHQNX0NNalw1XBLjbNGlbec6UMFMYk8NJgMV1I5sWdIiDuvUCWyk/oiVwOM
FTq/BI8ey1+z1bOCux903ak+3iz22voLKCfQPYESX84hDSRs/gAwOh0x5iM5a6kU
+8oCn5DaDhL/D4jVXb7Dq2PVIWahdA==
=CxIp
-----END PGP SIGNATURE-----
--=-=-=--

