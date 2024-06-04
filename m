Return-Path: <linux-media+bounces-12531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 301ED8FB52F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87B31F2327B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D045C12D203;
	Tue,  4 Jun 2024 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsR9JZTo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA412B14F
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511104; cv=none; b=rmykl+8onqD1k3rt35mWOrwTyI5UkmC0aV/o1L8/EB0xj6lQOvq2x/hTRwzNYGHgh+de9Z0/hs2YHsF0eN5LmFvPwkcfjmZwj1bitP5ZmkcA8oMdFxrYnJ5Qmn5inWthOgbftMfAR1TKPmHsi/PtdTeV1JLOUKuD59E2+lx2DTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511104; c=relaxed/simple;
	bh=g7HwtyuvYTBo2rej/G5YfeusZ14WNDzVGFKH0/WwBXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNk9iaw+Iwy/5LaZO1wJUoKfoU9+6CmQdX+/8ercs2EkR1QYAEZAK95Jm0kXqaiprmtasVukHKRyxHCctkuUGLEg0rF/KZfaKxFSxgDdBJEOnG3ZCjvt/wsheFltVEVUGlkE9xV/U25Ank+Fo+zaiujOVpFULvmT8+BOV+PLhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsR9JZTo; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-795186ae415so43536485a.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717511102; x=1718115902; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3+7ucRN6SOyS+e3mibEJsTCMuvSYJSeNULQZ9UJG6/E=;
        b=EsR9JZTofDLXFG4mQ72/7JJ+mvysiI37otGFB/g6AFDsRRs7GgZ/kVB6y/myiTepZY
         +m2bdHYZlDP/jzSK/G/d/5FDBWy2V5KQD5pUQhCnuLLFd5/Zz2Ucdng5e6Ra8sA/ltku
         +XR85fDOBjufJSDl7NFHbpNwfqgrTNLolLDcu/6ojg2j8LNWmYKTRZ4SXi1yfmBPmpyr
         k7LTWh2MhEuYaDtQWF2K7WA+vAI3fNDyNWK7Vx6W8mELdulHSKEajyPDcZXQMWGKsIk3
         jKqDMfJluHfGBlX8/foEtCtT5O9Jhfx5I9DvqA1GmAAuw/tizmdMriUJsoYKGyn1iYuS
         loaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511102; x=1718115902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+7ucRN6SOyS+e3mibEJsTCMuvSYJSeNULQZ9UJG6/E=;
        b=U7PTnswl50xfXielQOar6MAbLUSnCyxKctcFYQh5O7VAQ0/C3iy505qjqHyfj6vDIY
         ucOX7sCrcMCzfflen0gonW7el6T+m/XOdOxjNRt2gslzIS2hKHFwlAkggQz+Nmg3kHZV
         Hj+ivxipLBfMDFt2kDa2LyTdy7ebOenmWGpB3TO6dxLySuImcR91v5K97fRjK7Ydaxo8
         EppQaG3T14R1vBOhHGcHQ8CjdIS3ResZXy/BDVMv7xw9TxwBypkDgctSVSyIYOO9y646
         +cItkDmPcMVFXpmw40Cq5NfoRaDexAMWz4S0kgyjv7iBp0Vj/c6O7BSVBSDNWt2s9h6k
         lPoA==
X-Gm-Message-State: AOJu0YyauJg4gtkUl0goHrOTIbXSQgWA14uqnSZNZvPfnH808qU2Rcw7
	CZJVfCMvShS76PD+BFdqaxbQDp8DVKKul8lewfR3HaIF/O/qWi+q
X-Google-Smtp-Source: AGHT+IE3+9BZ5y349FHsh8U+bdmSsNzzPatwboP/Fkky+PG17kis8RzxrrU2nUHYNwUmRgovETYslw==
X-Received: by 2002:a05:620a:11a4:b0:795:1dc1:3b18 with SMTP id af79cd13be357-7951dc13b75mr102483885a.29.1717511101648;
        Tue, 04 Jun 2024 07:25:01 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2efc66fsm366399585a.19.2024.06.04.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:25:01 -0700 (PDT)
Message-ID: <62b33f6b3552bd54e2743238a3a24387e8422493.camel@gmail.com>
Subject: Re: [PATCH] media: verisilicon: Use fourcc format string
From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
 ezequiel@vanguardiasur.com.ar,  p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	kernel@pengutronix.de, mtr@pengutronix.de
Date: Tue, 04 Jun 2024 10:25:00 -0400
In-Reply-To: <20240528130314.464867-1-m.tretter@pengutronix.de>
References: <20240528130314.464867-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 28 mai 2024 =C3=A0 15:03 +0200, Michael Tretter a =C3=A9crit=C2=A0=
:
> There is a fourcc format string for printing formats. Use it instead of
> open coding the conversion.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index df6f2536263b..62d3962c18d9 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -303,11 +303,7 @@ static int hantro_try_fmt(const struct hantro_ctx *c=
tx,
> =20
>  	coded =3D capture =3D=3D ctx->is_encoder;
> =20
> -	vpu_debug(4, "trying format %c%c%c%c\n",
> -		  (pix_mp->pixelformat & 0x7f),
> -		  (pix_mp->pixelformat >> 8) & 0x7f,
> -		  (pix_mp->pixelformat >> 16) & 0x7f,
> -		  (pix_mp->pixelformat >> 24) & 0x7f);
> +	vpu_debug(4, "trying format %p4cc\n", &pix_mp->pixelformat);
> =20
>  	fmt =3D hantro_find_format(ctx, pix_mp->pixelformat);
>  	if (!fmt) {


