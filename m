Return-Path: <linux-media+bounces-18136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07A9743A7
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 21:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C961F267AE
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEC51A76DF;
	Tue, 10 Sep 2024 19:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qUQ+iyly"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014B12CD96
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725997493; cv=none; b=JT32h9KQ0eHS3zW/1c+TwWQGM75Fvb3huzL/QZMDDaTlG9GzSt3xs0MrTn6aaDcftK6Zea36g6QHPP/ZrklCkbABxTkCAL1RzKgX2cF+g38v8hBs3swQlVqN45nyL7BQO7TDEmTcNBI+9Xu210d2k9XfJliqaTyepU1SM7BAsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725997493; c=relaxed/simple;
	bh=bMaAsqxpDzNR4JWuJkohtjEPlfLsDwYUOKeLbpg5/O0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fu3D2Ij9Of2HSR0ct3RZ+VtlPtOEK67ZYnUfriZfZq0uCZSdrjLo8sS3y7xKSliUfLxh7+Jd7riSr71gIFJ1J5urRZ3QV0vqK7oiUzZbfPNNzWlvMGA+iDJeQUHhm1C1USXK3ranH8fS3S3/ieVakVbz02yJ1RvU25Cag5RN/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qUQ+iyly; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-846c59979efso282038241.3
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725997489; x=1726602289; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=paDdDLZuWPg2gJJW4B+S1cFVaWCPfU31jT9c47Deq1c=;
        b=qUQ+iylyy2Z6YIXN3bi4VGgSs+vtcXs+KAlXO45f8DqQILlqzPgnm8B33tbx1EDWOh
         qIqsiLcx0jv2RyXJZiPICBBf24nhdhWTYLHFYPWue5wmPEke216R49wtlf/XqxIDsxN9
         /cky4PKFSCPv9jGpaFttW88/8a1cW3aCHS6C+svlwK5k4OLE0z9peVXKK9AyPHhpqr75
         fz7bO0VdE/sGGdzbIeF4blKXsLCZT6bRl6dSi2oxMHZLGjlbqTeIX0QOf+1JM7O0aGHA
         aw3vz4tdXKRrLSASCPyG88snIU+BNLqeSfxWa6/VqsUTdeFDYhRioRLQQcybKxxqoM3i
         fkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725997489; x=1726602289;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paDdDLZuWPg2gJJW4B+S1cFVaWCPfU31jT9c47Deq1c=;
        b=CEWKVMhjw0oozkB2XgevyQV8ihDzfU78mk2gsEpIAiyHzEIxyFVsxlzJ56lLRCpzTh
         MpMoh+LUFS6c0OukHQUBgDQqrbdLb3s2rOSKlaNCqQlg0Z4fkk7Js6gd9ky825J6QVLG
         LmoaHniJ+dVu86GyVZXqWnwEUsBionBi4Dm+GwX+0YrnbirP5MJ/cS5DNav4TH+aQ3U6
         XqB77rfd/WLtvNcAyLkOdYBW5tKAj9WIv16/ou32buZFM8WTKgj0CsQFOj/FrxZnOGDv
         GMJPEcB/3Di3Gf/3Y1HXC2S+z69oi83y1khy4/oNVbFIgYV/tk5ZddKvaHAixl726Qx7
         CgZw==
X-Gm-Message-State: AOJu0Yz/OPT82N/zRrfjwmeJqs4cb+Tko5KLmjL7orMg0XSGR0bMRlZS
	Z5Vqn7BdRUtKhesxzYJLv6ONgPfkgAnEWQXJZfi7EhjdLOXqwknlY3fjfcHg1h0=
X-Google-Smtp-Source: AGHT+IFg9JLqxdW3sXfJRhqrKXQcUosatQMw8YzACBm6eCw99hRxZNZ+Q4Fu0IP4u78spQSl2exOIw==
X-Received: by 2002:a05:6102:d86:b0:493:d3ec:76e5 with SMTP id ada2fe7eead31-49c2423d34bmr1186558137.18.1725997489510;
        Tue, 10 Sep 2024 12:44:49 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53432dee3sm33173866d6.8.2024.09.10.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:44:49 -0700 (PDT)
Message-ID: <10f107089cf679bcabd03e49fc469bb89518deeb.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: av1: Fix reference video buffer
 pointer assignment
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Tue, 10 Sep 2024 15:44:47 -0400
In-Reply-To: <01020191dc45365b-26b103cd-153a-4b74-a663-ed7beecc1713-000000@eu-west-1.amazonses.com>
References: 
	<01020191dc45365b-26b103cd-153a-4b74-a663-ed7beecc1713-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 10 septembre 2024 =C3=A0 14:10 +0000, Benjamin Gaignard a =C3=A9cr=
it=C2=A0:
> Always get new destination buffer for reference frame because nothing
> garanty the one set previously is still valid or unused.

Mind documenting here which tests got fixed with this change ?

>=20
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 372dfcd0fcd9..2b9a1047479c 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -161,8 +161,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct h=
antro_ctx *ctx,
>  		av1_dec->frame_refs[i].timestamp =3D timestamp;
>  		av1_dec->frame_refs[i].frame_type =3D frame->frame_type;
>  		av1_dec->frame_refs[i].order_hint =3D frame->order_hint;
> -		if (!av1_dec->frame_refs[i].vb2_ref)
> -			av1_dec->frame_refs[i].vb2_ref =3D hantro_get_dst_buf(ctx);
> +		av1_dec->frame_refs[i].vb2_ref =3D hantro_get_dst_buf(ctx);

Good catch, would still be nice to improve the commit message.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =20
>  		for (j =3D 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
>  			av1_dec->frame_refs[i].order_hints[j] =3D frame->order_hints[j];


