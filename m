Return-Path: <linux-media+bounces-61528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLgtCLzdBGoMQAIAu9opvQ
	(envelope-from <linux-media+bounces-61528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:23:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92F53A717
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B3DC3050A5F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714F03B95F6;
	Wed, 13 May 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRbzyrBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FC3ADB8F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778703785; cv=none; b=Oz3ieyuBzHOEoEiDGVNYJgA/lEJ873m7IzPHAyiL7Qu0is8cQ1sqENItE5N9GBWu4weFEgpsXwM5petGvh64KqtVyUWiR4K2UmQWIjscIzSt249ZxbwN9fPO/XbJkakes+S4NyF975MZPQixc7K7NXZNVXLHf6xl5bE+mOQbBq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778703785; c=relaxed/simple;
	bh=8VoltUrLdbwL0jcfEn9k3774FHuaNiE9Y3fSoTK1IBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyCeBWGKbYHziOGXGNua/nqoaGuqKs2IKLXztVsOl5qR411U5fOj7trBmRIGW88rhuusN4ktWL+vCgumAEymmG48BdKq4Pq7PRCrpge3jKYnrJtaktdhvaEWP2nP0pUnDq2oADhsFMPBh8swI06qHm/5BV3ya3XTAeSDuwoXFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRbzyrBr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44e5624c053so4071980f8f.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778703783; x=1779308583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=cRbzyrBro4Op7tYb5YLQlIVphHhLiPbf4TnrRFknDk9uHfQOj/qCZ1fX9caVT+GD46
         1ftRzeqyrXsqtN64PNQobBNW1UPsnFbgewuQhBYNbs7PE2l84vP5669fnbepUlyE2Q8J
         eO3CDY7VvLjaqd7EhQzEBom0ll9iatcVdzLLF3YgFKzGAQb/Ol+T0O3V279BRhQUqG77
         1YsAIBLzeLvPRzfwr4TXBdUeVBxkhnzDT+ykHozAbYKVFeB18K6jpSGNBCHi1BBBSUEd
         Eo78+zvGDJhzwczX9wCsVD1tyYTGVk0tLpZis1+N5GXNngQOqDmLRwRnmxR+8xtoWahl
         vMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778703783; x=1779308583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=U+g2Tj+505UoVjVwNAKXcfAFTMtimcALBwEJFOtcAb+gFD1NEWka8RZ9kpSh8/lUxA
         QaV6RNHVkwqD+pgp7qs6iwxoTolt+qjMdpNtgIvyS7cy2H4/7fvEbfTqQvsGtxB4HhPI
         v+zJ4LB1b4pGD0rMT/veaMaaGBB/3RlWa4ab7WjTPzUJct80ZRENIfpK98q/2kQQnH2/
         Y1VDArjhlBMUNglMcKAfggSSeiB4fPmkwnjDv+KxKGjqujTRLTaCSq9NejKFLi2ChLX8
         fZxbMDkyke8cd8dmepvDbtIquYmWUJB1eWvAL712HeStLrgr8+rXv8dVWztXaLpRRQyw
         h4pg==
X-Forwarded-Encrypted: i=1; AFNElJ/7xCvA8I/QAn0Tmbx5kBpOgz5h7NedtD1NQZ5LA7CImUL+S81b5ak/1jR+NOtRiQodC/cGI7QzRf8RXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBiNN3DnJN/Fdmaff6pZ5Uxw2iUD1yMXdiKAfIMchyN0w7v3X
	h46s6gkSYQ1ZHquPoAaUHbfasQGB2psi4hzY9t0NMx1TxChkTxGeT8vKCKELkQ==
X-Gm-Gg: Acq92OHKGBBNMowxKaqXfZPQzGi8L/zQYSdKGVMWO0Aj9ztU6d9YvrBLUxCYzrl6+2+
	SvZKi4jyz9iDwHHYQtD1Zksza50NuOxxfq48nFrdTtjw6OJMJGzP957b9Gjw38fq3UzTDDUk2mU
	l540sg/GwkbPsZSGAt2RMVNFZqrSLg+E+104BWhK7YhLzZTBTHWVFhHuWTvdY6aXDgARNzRPRm+
	N89HZIVbQop4WBoj1VHXi0V/s9P9gNyzfqA9UZ3+ZZx24z4S5e3zolgZQP/eXFziN9h+53MGsfw
	KDakdrOfzwhyAm03E8uQdBQgQlvTrmJS44yUaqAtMyGvixqy8T07jFRorl7a734pUjJIhuB4Kdr
	s6jWfGiJmfI6gNDvUw64lZskF2Artv8XVoZiLgSreUdgy0zokT/nh4Ppt8DnnopaFtBvGu7v+nM
	BV57ZF0/yQPUE7yYgLMlbCc6AeJ6ElI2q2hN7FFOud4iHT5R5j5JI0QKmJg6u/8sIOybHnPl1An
	BySsI4N
X-Received: by 2002:a05:6000:24c6:b0:45c:154d:6387 with SMTP id ffacd0b85a97d-45c7a7dc6a2mr7430880f8f.37.1778703782701;
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm1279025f8f.15.2026.05.13.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
Subject:
 Re: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 22:23:00 +0200
Message-ID: <YRYbhQnwRdCZPKQIjbWE2A@gmail.com>
In-Reply-To: <20260424000000.558-1-mhun512@gmail.com>
References: <20260424000000.558-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 7C92F53A717
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61528-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mess.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Dne sreda, 13. maj 2026 ob 09:11:03 Srednjeevropski poletni =C4=8Das je =EB=
=B0=95=EB=AA=85=ED=9B=88 napisal(a):
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> After rc_register_device() succeeds, later probe failures must undo the
> registration with rc_unregister_device(). The current error path jumps to
> the allocation cleanup label and only calls rc_free_device(), leaving the
> rc device registration and resources created by rc_register_device()
> behind.
>=20
> Add a registered-device unwind label for the IRQ lookup, IRQ request, and
> hardware initialization failure paths. Keep rc_free_device() for failures
> before rc_register_device() succeeds.
>=20
> Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 92ef4e7c6f..cc64a68dfe 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *p=
dev)
>  	ir->irq =3D platform_get_irq(pdev, 0);
>  	if (ir->irq < 0) {
>  		ret =3D ir->irq;
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, i=
r);
>  	if (ret) {
>  		dev_err(dev, "failed request irq\n");
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D sunxi_ir_hw_init(dev);
>  	if (ret)
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
> =20
>  	dev_info(dev, "initialized sunXi IR driver\n");
>  	return 0;
> =20
> +exit_unregister_dev:
> +	rc_unregister_device(ir->rc);
> +	return ret;

This return should not be here.  Device must be freed too.

Best regards,
Jernej

> +
>  exit_free_dev:
>  	rc_free_device(ir->rc);
> =20
>=20





