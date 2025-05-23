Return-Path: <linux-media+bounces-33297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B5AC2C86
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 01:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451CB1BA5F26
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 23:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE552144AE;
	Fri, 23 May 2025 23:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GcuzAvKq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2861D5ACF
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044169; cv=none; b=DkgWbkiEQWRtQc78pAObjifKDlOONIW7RKSdvrHOJZCVE4dqaiBf4RCUX0vJElrEayBEzLtZFzsQpAxI4W+2kKXTmz2R8fqOj2kT1t+lWGAO8Q03GoGn2KrLQH+R9CwrMIk9+fQI7enNggdBmxm6d+Q99A/gB3tiq9Wn31U+sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044169; c=relaxed/simple;
	bh=f26ORO3jX81PquuMo4XTHBE7Mm+ge7RdFpcxKhkqGdM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H740cwjahlKDJAcX3tblK2hhav0EWpkvX9o3rIX94VZUohoxYHgxBuEpwlnP1PXmTsxFkp9BbpxWnZrWufGiDGZFr8Q+fliRpl16Vn25DUgj/TvCYmYcPiFLiP8CDLLSmG50g+NIH8phIKrb8in7702qH6IJzOPdw4Y3dX237Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GcuzAvKq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47698757053so4180101cf.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044166; x=1748648966; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xqjlsa9/FZ9D1FAa7a1DHs9dAsfq4MjISh9P4nEB+jY=;
        b=GcuzAvKqRfh8wzCefQ9B05lnXJyOZdm8wrPt3CITphwn2Y4uzakFwi9+5KE9V6QK0J
         8asFHP7AjdOozmlg2QlMLexWPpPSVl2AELkw3r4kc7GJVg+hv25ZyT/nok6Ws1e1kzHJ
         Xnbq0h85jorThadJ5NRFbS4yW27opNLdd4RioRSPM9/ebuEpxXOA7ia3XP5HcQpc5vo6
         F0ZyDxKVCE0QebRXdpTE6fSDfFU665Emmci594XWygMm2y3OSWxYPkOcB2T+3GngayXZ
         4mUXIfECy5YURoIKSKS34HSKqP4T/uGk9OW02Av1zv73Rq3FL3gXq38FMTIQWIgRXX+B
         tIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044166; x=1748648966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xqjlsa9/FZ9D1FAa7a1DHs9dAsfq4MjISh9P4nEB+jY=;
        b=X1MjRKJe1jC+0LdmVg7UICVRtgjknrP/5VaUsRfc+DxZANUf4AdOlt4aZOSi44auBX
         OrY2k6QoKQBGFBenTtTQCQGbS7XEq9pDoTdMkqQs3GPPRQ3GrriWs9xbWBHvTFo9jriQ
         jnxvBYwJXXdjb2yP+wpJdLYJwUTRxVnR7wYkIXApWPUmaurA8alXFVD67WOoCQ6LE6AT
         5U+nzSU5vNDmyyc2mRCwhrk7Pl8GjghxJr+ZSmsc7BcCiwIQ3uAiJPIYKteggk8W5jsQ
         UmbM4ezIucGNviJuvWOUBvJzljjPpCPtBAku5uH06P7Nd+5keos4ia3cMkE1zYXvGhNK
         ZKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNscltSV2R33Yt5y2dGjOZJ5ekugKxPZN5CSA1Usi8ngx8Fcog99Ft177JVefRVIUb0PhgRH2IEn8HCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+BFC5xfYBevbTet5PwO7ilWHoBtxI17OkXQw94J67NSII0Vu
	xZVRm40eA3zPH1fBm4RGMfpQW/NJK15JPG/+6KNtxfoJzFlmhKloM9/h/cN1x87xoH8=
X-Gm-Gg: ASbGnctElThlBtb23BmR9EeOpBrQh9v5el+PX3oyU1a0s1b18w5+TvrkWgUQQ+8fgKr
	Nkkkc7nCLuVVtNi8sdL9GZy0Xp6cdIY8uKE+n9VMXgIImgWYIpie3rjkYjZgS6CSDbJPcPi7YoV
	Thx3h14J+KSB79qcqcSgOo+fOOYykVcsmngNg8qjW9IeypdVyxPlDRMiOykr6fYgo4slXM0kUyi
	25PYjL94iNydbfHbQDkWdNi8vSajoyUh4wgBvRkmHxpLH2k4fbkwZx5VqGUOGbX8VQs4hCKt0AM
	1Kp3LFaQQaXpEA7DcvAGYITpTfBVE3Vf8ZeMbLmiosUOFrGU3/zLWePd
X-Google-Smtp-Source: AGHT+IFBRgwWsDiBOTSJXB0l4yS8PVXq7cVT5X9FW7UqFFqu1lQ+k3Zc78e4CEVQJ+be+isgAGHW3g==
X-Received: by 2002:a05:622a:418f:b0:490:8ffd:9a90 with SMTP id d75a77b69052e-49f47de53f6mr16731361cf.45.1748044166550;
        Fri, 23 May 2025 16:49:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae42498bsm120366631cf.35.2025.05.23.16.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:49:25 -0700 (PDT)
Message-ID: <90392fc3ef037a5d2878b9f50145304132891e56.camel@ndufresne.ca>
Subject: Re: [PATCH 05/18] media: coda: using threaded_irq for 0 (bit)
 interrupt
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:49:24 -0400
In-Reply-To: <20250314152939.2759573-6-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-6-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> From: Sergey Khimich <serghox@gmail.com>
>=20
> Use threaded_irq for 0 (bit) interrupt instead of lowlevel locked irq.

You omitted a rationale for that, and don't find anything obvious, please
drop or defend this change further. Also, Jackson in Wave5/6 actually
maintain a hard IRQ for status register handling.

I'd say drop, or explain.

Nicolas

>=20
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-
> common.c
> index 64ba17d8adfb..b240091cdc9d 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -3184,8 +3184,10 @@ static int coda_probe(struct platform_device *pdev=
)
> =C2=A0	if (irq < 0)
> =C2=A0		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\=
n");
> =C2=A0
> -	ret =3D devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_NAME "-video", dev);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					coda_irq_handler,
> +					IRQF_ONESHOT,
> +					CODA_NAME "-video", (void *)(dev));
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> =C2=A0		return ret;

