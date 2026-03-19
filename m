Return-Path: <linux-media+bounces-56372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDKBN19UvGkXwwIAu9opvQ
	(envelope-from <linux-media+bounces-56372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:54:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEA2D1D8D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AB1530185AD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B76D39FCBA;
	Thu, 19 Mar 2026 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Fa2t70jB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827FB32571D
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950025; cv=none; b=XRmNxkXnX+9ILOjdmCBxl9EhoC6tYYwBPBb9nDX3aNyQwf47tUE9WaEYHNA4LhRJnbdN1sGNSeoLZQCp/io7x6h5So6t1jwrEqcEq+DNa2m2TmIUyvy/Nul7H3mq2r1YKAuMhePx+yYdGixNSRIYLmiLs7SK+yWjYG7lqk9K+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950025; c=relaxed/simple;
	bh=v6+Qt58QS3RO8MzE0P2vRxK3tDaBa02ALoenRmy4fBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQo2C+ywdJuG8kNIk8sYW26J7oSqJteSLPBIZwMGcn89XUdib5vyvYaE6B3yXuWWJgdyNKgmbCpoDYkdkCxZXucBrEiqNdM69+EaZIIpsjJgEHEYDQn6hBgC5m64Q8THR3xlV5l+8hfsr0KZ8879mua48Hyk9McNbjzwr33a6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Fa2t70jB; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb5c9ba82bso249540385a.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773950023; x=1774554823; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=Fa2t70jBa7kEL/WY+9ZxhyFtvaouOZ1PwHU9hgiSMceaWEJR+bbzyla0/fHHOZy6+9
         jWqiTqjEr4UmT3G7l3Avb5fqA/W86p5qOh1YRkNCpHVOB4Plrh0gyJUx9aZa2olg97m5
         d+BBGUOzy4oHRrmDSXfKFQD0w1cFokGUH8Z5a/uiRbjfnIotVk9cu6yD5tMSFJfCDxNC
         lVIek9Dyhlr1UdnPQDQlBoac1MJtPSedjZ+LyZ6bPaGl0SuXQiVu5w3SkZpb3R3KpuHe
         T5cLXIZUyvh9Io/JbX/MqSpqk5s3kGoGrLyBR8I1GYNZbK6G3vN5/lqxojYgEr5yjXby
         3FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950023; x=1774554823;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=GdNxamCzpVKk1YaNLEKseVcqQyTyRQRBQE05apV8IeJWij+ouox1MeRuX4rI2zTjas
         fgec5KcpEofsMKof5/HSkWQLCu/pdcFKqnxMDLYBLbhCLoak75Y7eXqz2MAlAox4V45r
         Bb+KtxMraU+DOJ+NvQU88pyZjQeTkKv8D6fg9WC40eKjb0ahEyFFLXj1WkdMnXRraXRY
         eKzQTT+HYF27SP8ZRmaMft2j66MqsErfP6UKqzFk0cMeUtUy0CX2eY3pUhu945uYFWl/
         bfK1eQUSVrMRok8Nqdymq9dd+A/mam04/WmBXYrX1KHq3BsvpiQZCoeRd8Ulr65pFtnS
         XPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3AXj0c3xPV/ZyFjTtA3MxxmpBwV9ZseZicNo2JyExCCOSij6TxP3YRTjq5+/bzqEuo74S5DD3YRusAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xRcdLf1jhNBQ7T8RJm38f1f2Xd6B9hKdHXtonePIJyMqOeMJ
	b1k8nEtqgBUXK0xhFl7JNNl4G37A/ogv0PLQi/RtefmEkVobThbvdOFju/YnjN/uJrE=
X-Gm-Gg: ATEYQzwwannOrumRzW7lhIV/+3tQ3OT2jaO7tXPLUYxqjO7dljiAOSkP4BAHWKuFSfE
	3D7/NJ4xlgxfYKEr1tO/TpLLZNODU7DewyRfdEsPnbUlPEbwyJYIQsEA72gSkGvJLjXTMu9f8F1
	SMYm8Cqk3xp9XmHyOLhvw0SJ2G+lXcvQ3hgdLAU00+KmRYvJVlGyZA8CvFNVrZi0/zxIrwR1HN6
	hX7/PovnjP2I4bplZ68X0KiYRrJbcVywWbEWxZlT8lFFN8t0xYs4JgSJXjZtmOIDZybI9KglzzS
	m8JYmUvprBZZOj4vijpXY4PVu5gGiI6KCNzbSSxGFmS2lrNvirA09lREmQWAUB1UyF0YX12ABAj
	dJGXPzT/KZxfSsOCwJNrz/cjSDvdEe/WfRiD6mlRJGsoHC7XLSXu4bVM695rjXS8fxBSNRxdQnM
	pBlVG6BXLPTt3VQWrWX+ijpz0TBm3r
X-Received: by 2002:a05:620a:708e:b0:8cd:c050:7db6 with SMTP id af79cd13be357-8cfc7f6a470mr74114185a.49.1773950023287;
        Thu, 19 Mar 2026 12:53:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb1c7sm3480885a.35.2026.03.19.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:53:42 -0700 (PDT)
Message-ID: <24867f578a64b1dd6ea55eea47fe7c4a854e5a58.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	Frank.li@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 15:53:40 -0400
In-Reply-To: <20260203082349.1082-3-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
	 <20260203082349.1082-3-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-8ILH7WDBQi0ijJCZzATq"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56372-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,kernel.org,xs4all.nl];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 4FEEA2D1D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-8ILH7WDBQi0ijJCZzATq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 f=C3=A9vrier 2026 =C3=A0 16:23 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
> =C2=A01 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 39022c1bf36d..877e6c4f7406 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device =
*pdev)
> =C2=A0			=C2=A0 jpeg->dec_vdev->minor);
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, jpeg);
> -	pm_runtime_enable(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
> +		goto err_pm;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_pm:
> +	video_unregister_device(jpeg->dec_vdev);
> +	/* set NULL to prevent double-free */
> +	jpeg->dec_vdev =3D NULL;
> =C2=A0err_vdev_register:
> -	video_device_release(jpeg->dec_vdev);
> +	/* Only release if allocation succeeded but registration failed */
> +	if (jpeg->dec_vdev)
> +		video_device_release(jpeg->dec_vdev);
> =C2=A0
> =C2=A0err_vdev_alloc:
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0	mxc_jpeg_free_slot_data(jpeg);
> =C2=A0
> -	pm_runtime_disable(&pdev->dev);
> =C2=A0	video_unregister_device(jpeg->dec_vdev);
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> =C2=A0	v4l2_device_unregister(&jpeg->v4l2_dev);

--=-8ILH7WDBQi0ijJCZzATq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxURAAKCRDZQZRRKWBy
9HGOAP9x9uCXnIeQXoRzJWIGjr07Fij2NUuyHkDuiL5QrZD4tgD+K4d2XKoSsfpX
wea5NI21IVEx5NJdUp7XmXeNCPU7ngY=
=lQDp
-----END PGP SIGNATURE-----

--=-8ILH7WDBQi0ijJCZzATq--

