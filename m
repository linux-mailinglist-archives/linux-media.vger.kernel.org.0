Return-Path: <linux-media+bounces-66779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4oLD0HGS2oyaAEAu9opvQ
	(envelope-from <linux-media+bounces-66779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:14:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 366287126DF
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:14:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=uvpSVavQ;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66779-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66779-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A3D3310C20C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4903A75A3;
	Mon,  6 Jul 2026 14:22:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F2379C32
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 14:22:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347761; cv=none; b=qVBycsQGRr7TBQE52iax9bV3x0320UU0wJh+/HBMzZv0iRSnXlHvaUu9OnaoOxX9x6BPH7agEdeL7RiJyNMJ82qghekrW6O2Oc3P0sbbT8a18Eb9dW37hZ09IwjEqRKb/Ut0G1hRSx9uTnYpYGgDbpJ41SL7tDdCx7Lcb7j+1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347761; c=relaxed/simple;
	bh=EFJbdj8G9/8FT2Pz03JTkkjxpF2xPVkRSKJF4qj/JaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jy5uhFVuIecLUd/dKCfbRHDkZAErtrQetf4yW5nOfGohLfB1IfqciSm0mWwYf4cPpSht33LQzn/s4SBqWl3ujucHQIHQ/TBTRecijiv5JUu9PHJgNPvscdHm99tw2CDL4nZKsfaFoiSmVDc4Uhpjnkz11fzDfvclpblmqhX42vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=uvpSVavQ; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bc4a1130adso635913e0c.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783347757; x=1783952557; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MVNfxXIhfRbzejobq0Bw+fm1oMgBFxUSiDv+/DvkLmA=;
        b=uvpSVavQ0DUptzEzxZVLvWYqDfnXhqWB2yuHAOjYlVaN1qvREyHHeh4JjCceZe8bNf
         YHjRwNf5k2yHTiohrHakUsK2wpf3mjWxcQU/qIvIchvenJDWT0tdpGVPdq6yW9NIgkvU
         3ywxb6o1dQJ19PpO0UDkiG2+pYc0r/iM7Mgs4+R6q8biiotHe03NB9kubcjuzpTLrRlP
         zGzPkSzb+JsL+6RnnWuqAGQQqzMgThtVI7+vpEl/WgBXt3tCfZuwxG9iEXtrerGj3Gdr
         w5p/ncsoQzaQl3X5U7e6xqa6HJuSNq/A0SqeMKTdXG0RekRDwz+9LW38qQIWpBF+phDN
         eAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347757; x=1783952557;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVNfxXIhfRbzejobq0Bw+fm1oMgBFxUSiDv+/DvkLmA=;
        b=rP9i4HCA9g8DotZi2tG0voJfuu34jJTHLxWfR861F8/JTMQ88J4RUsHsLLjbiIsSk6
         L0LX3O0/Gx/g87U6TbTY2DPTA7PKc8BoCBChrelrMCU30oj5uZCmNvvnF9fIdwx5pVf6
         iyktZYDxrhwwEaapNjR74xfFwB5IMEDC4ksJCYbjIvOsb6kMt9T3GOioamBHjTw0edgC
         coHETVWGttPH9T+4OHzITqGmIuCqp10h0FBiZb4UOLrxAseFGz8mgiBqYMLL4FllDeXb
         iNsPwvFzib21LuyfWbJDLLb38q0httdqr2etdGM84Y9F1njMPRqQlX3SGQOmx3p67aWS
         QeGw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlxe7v488I4x1Qny69Ktwd7rORKCtPMsCR85W5DXH2jL4GYjB+oXEzJ5jb1i2zXBPatB4om50GKfIYnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiTSmDbJxKs/MQkNkayDTf0wdybURWsup+r68x/ZCuiFG5zK7
	hm0VgdIsVfvR4lTJleb/zJ6R+TkCQamfMjmQkqFMM0GMAyJryc+CjE7bEd+nSMZNqaE=
X-Gm-Gg: AfdE7cl0MdOddlh1qTQ36NakniN2vE3AqzZtXX9kRIsnzu0qWQletEaQwj/4Q1+sUbj
	pUY4qzccaYmyfUXazCSkdujgOwalS+hiJs7wzPXKvYpDvg17O5wrHiR8CR8btjPk7fMVsRjyoeS
	DNK4ni+2EbJ8/HG2q52t+5pL0FQZhPK8hrKa3wcjraVk3LPy36cj8+waAQS8OifVxq5QaKMLhHu
	qbxaK/Ae61p4z5I7gJ0wJA0pVtXcok20r8PYM/FiSDVBdy3xsDXFzKZmZc+JRsJdE04wYoXtzN7
	MGTH4ARXajyH3CCCsBawRNDFeawudk094N5VN+lvL9vbffX/KIRRddoDuYKa7sLLVqkGFsT6zGf
	w2DKlJB0L+c5MBjbF4Ya5XGAmlRUIFfCOeXUV22FljKet8Y6PQklw7jQ/CAMYn7FmKwZ42bopH+
	IyvawZh382kpHWm65wOQ==
X-Received: by 2002:a05:6122:3386:b0:5bd:a214:c933 with SMTP id 71dfb90a1353d-5be909062cfmr455408e0c.14.1783347757252;
        Mon, 06 Jul 2026 07:22:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838c1449sm5287075241.5.2026.07.06.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:22:36 -0700 (PDT)
Message-ID: <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, jacob-chen@iotwrt.com, 
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 06 Jul 2026 10:22:34 -0400
In-Reply-To: <20260704022853.77291-1-fanwu01@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-IuzSpdkevxjAGzKTKZh1"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-66779-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,ndufresne.ca:from_mime,ndufresne-ca.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 366287126DF


--=-IuzSpdkevxjAGzKTKZh1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit=C2=A0:
> rga_probe() requests the interrupt with devm_request_irq(), so devres
> does not release the IRQ until after rga_remove() returns. rga_remove()
> currently releases rga->m2m_dev before that point.
>=20
> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
> leaving a window where an interrupt can run after the m2m device has been
> released.

I have a doubt that this can really happen for this type of hardware. Its n=
ot a
free-running HW that emits IRQ randomly, plus we have the abort sequence th=
at
ensure all jobs are completed before we pull it down.

>=20
> Unregister the video device first to stop new userspace submissions, then
> free the devm-managed IRQ explicitly before releasing the m2m device. Mov=
e
> the command buffer release after the IRQ teardown as well, so it is not
> released while a completion interrupt can still arrive.
>=20
> Store the IRQ number in struct rockchip_rga so rga_remove() can free the
> IRQ without looking it up again.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>=20
> ---
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d..118887a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> +	rga->irq =3D irq;
> +
> =C2=A0	ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(rga->dev), rga);
> =C2=A0	if (ret < 0) {
> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device *pdev=
)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> =C2=A0
> -	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> -
> =C2=A0	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =C2=A0
> -	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0	video_unregister_device(rga->vfd);
> +
> +	/*
> +	 * The IRQ was requested with devm_request_irq() and is freed by devm
> +	 * only after this function returns. Free it explicitly here, after the
> +	 * video device is unregistered, but before v4l2_m2m_release() frees
> +	 * rga->m2m_dev, which rga_isr() dereferences via v4l2_m2m_job_finish()=
.
> +	 */
> +	devm_free_irq(rga->dev, rga->irq, rga);

I'm not saying we cannot do that, but its quite verbose for something that
probably can't happen in practice.

Nicolas

> +
> +	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga->cmdbuf_phy, DMA_ATTR_WRITE_C=
OMBINE);
> +	v4l2_m2m_release(rga->m2m_dev);
> =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> =C2=A0
> =C2=A0	pm_runtime_disable(rga->dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b1..f76c45b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -81,6 +81,7 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> +	int irq;
> =C2=A0	struct clk *sclk;
> =C2=A0	struct clk *aclk;
> =C2=A0	struct clk *hclk;
>=20

--=-IuzSpdkevxjAGzKTKZh1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaku6KgAKCRDZQZRRKWBy
9JZSAQC1dbw91+G7+3PPOBNBtgKbdRlVtvIxd5JJz6bxqWFUcAD8D8YnicY3DZw9
ETebtopePbd1jSVCQw+7hxWTjoNzVw8=
=N0fp
-----END PGP SIGNATURE-----

--=-IuzSpdkevxjAGzKTKZh1--

