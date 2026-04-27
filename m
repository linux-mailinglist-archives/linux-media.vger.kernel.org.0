Return-Path: <linux-media+bounces-59703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBGpAFag72kcDgEAu9opvQ
	(envelope-from <linux-media+bounces-59703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:43:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F854477D8B
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C69303C41B
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CBD3E51C9;
	Mon, 27 Apr 2026 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E11PyR4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221A33064A
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311624; cv=pass; b=Y/Az8zFdqYbFX0ftxmSp+7bU4fz1xh1JALgpweHcMGwlIfut9Fp6eiG9DkSa+P5om7I+a2F6hsnie3EhL4Pt/9mdXjSFBS3cn30BdiGIkuZaK+E7tdVHs1FgFPdXnV3jTjTddhbFKGirHlgB7C8fkPowZQtL52QU9E2jT1dmEhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311624; c=relaxed/simple;
	bh=sHN++E/dRCSoeOaaRZ1XczpuBNcG4UsKig7f+f4FQAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8tb3MuNJZZIpjVV9CyVYusE0BaP3ImjleKRigjJSd04e/8QFpIYzjbdNkZvFnGErpkBgMEczPX+ekPgj3TVS4NJtH5ipWpmN2JlHiSwfkBAqA+5Qq8LwTQtExxq40wbK/tTi0mh+IV68iD6cKu7MmjvPV7c3MJmrCkBSjTh2fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E11PyR4Q; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so4095e9.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777311621; cv=none;
        d=google.com; s=arc-20240605;
        b=bO/4qh17/IOE03jcNV9pKhTr5G2TcCnca+JyeTAHzsoiH1a6usV4YSAtSl23VwqYfu
         N69RJXImAw15WkmxZLogcEGszR/enuCkcVA/YySpHej64XBRCkFqgTGyUVqirV1sO7+S
         Hgvq+oOV5Ifo4kiaKYh3Gb4QTla3nwMzHsCffXsnuv62Pa4jBt+qj4ItOICay3+LoENb
         EyvqRka6zmr+81BPkb+yD9puVVYWiQTEaePAFoUY8KalYnW/+P1O3gSWSH/DET07EeLo
         ZIz7V2SeddZ9xFi6rt5YeS208mjQuLcdEvacNTF0a0HnVl3zUo7/6Z3Nji4LVqIBmqmu
         nvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQPYpl86S/o4OEYS0Pn9HHusXk6T/j3+DCtfMcETKIE=;
        fh=+7G+sSACq7jJH2N6MneFX8qfMAZ/vCtu2r2du7iytM0=;
        b=dkPI9xL1eqqdxY/QW4c6BYJcVw0ZZB6Ck8j7QNGY/f3Faqod0IrdtQv/rv1Mn1bWH8
         OhNskjMF4Ec0i8jz1jZW/fu0ZYOxEtkhj7PEpwSG8apXR+bKW5hHMdRWVQm9bVmxnyK2
         QC4iBuZJBUpTXAc0p4nVydR25++/E2JVDeZFHozcQPVdrQ5u686esJZDAwHg/P/1kWLm
         hYgxMaWmFGl6+xdKjq45M5g8BKoX2M0ThBJ5mY+IBuh9mFaEkNDYAmKOZSTtGWhN3cJI
         tGDghld9ZZcE4HfXkxKXvywFiui0F8zlhZFGomAxhm5LI/czJ1zGbF1OREa9gCTMyIL0
         Bx6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777311621; x=1777916421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQPYpl86S/o4OEYS0Pn9HHusXk6T/j3+DCtfMcETKIE=;
        b=E11PyR4QugFjrAjWQPk1nWlvHe5B9IblzB5/BCx8HsIYVoEXVPzfujPUUE0oy5ZZ5+
         TbHBhse61dxRM2xJ/fwgZDaYSkfbfPD+2bvJl4so959rA05NmD92rPFadE0tut+vnUcc
         tA7b34Ql3hx54pX5HdPF/FEOWyN7ALk+WAXQmxxvHg0lICYCuMrU31cpIn5asad/GuPa
         xHcXt263yCEURZvY9VMFkdIKNtq4BhNHU5LxMxg4Dbrjnh8QkIG70lbWrnnjLDtL9y/2
         yTYEVve73kCA+z4ZjOCxudo9wdNdweZhmAyr8eBGEmcf2ctJZNiSLv8cUilFVux0NWiR
         fnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311621; x=1777916421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQPYpl86S/o4OEYS0Pn9HHusXk6T/j3+DCtfMcETKIE=;
        b=BzyrZDGa6bAiIIxnVPPKh4VZlCWDkZPaQzT0BHOVk3rbLkuMp/TKpq7BofBXQmrUad
         amzegVP8vKfXodv7ytssKenjTX58W+4BNII5XgKBHizLiRx+8MHV73hAgfRpjsMuJx3v
         ix/kU4wjf4ZDYKXhc4+a/uz9IaTKLCmAHinrgpCZVEyUCsIOtwNx57T5f1ZCsUQU8NCr
         1Y/pH5gm+TObGl2pBsbXZpk+E3HsXL79PMCZsCvjycRh8Or64JoxjQ2tssmtQyZqXeNP
         PHLjU6oop9E3wmporRyaZiU4hOCz0vu4iC8T/nVrm9hFRzVVd2fGPon+Q5+s7c50XexL
         ZjgA==
X-Forwarded-Encrypted: i=1; AFNElJ8N8LDYUorLVal4NC3RDaqOaIC2ZqlIDlklwN2Kh4SZIKiGLbiVDHDbzVC7OPTWJjlF1mmIqH6tAJNxAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw479CD81HqhYx98PbLX8z52KZs+JxLz+b0LhxQsW7/EE+KxSSb
	N/0RWhpYJwxrSH006oGuBT5Hqwd0hQJCA/QaLeEbYTU5PVmpsFYvf8Foi/JyQwavFwfhuofw7aF
	R7U3KQg1vfigVFiMQYvvcvm63PZwsqkPxrdvSfpuwPqhE33kEfXf23Fd8
X-Gm-Gg: AeBDiesFwq1C4vJkOUcDntY4f/qHZs/hyOR8VZMPvBEQqfERubwmpurocNiKC7ONTGD
	EyTEmmaF22BvP4K+4cws2AAaxVqteT/Ayvr4+u8WMKnApDngrEitULySBpvEbVewgc0OgcvPM9U
	mtSMKjwl6uCYfKK7p1xwMYUsHfDZwh71J4XP/bVhzlWgL+AQELwhQKN8/VcGJxS3TL0OfqirU86
	G3Rrbivd00Pq1hScipc7DObkl74KmF7bsCYMGOi649wPVbdKg5ewJZuWBVz80jE3V0oolx6A9PR
	pQ5igD4iPrgJUTc+OO1fCRdL9pW3x2O5XR6b//mwK+KWyteLUpqYwyZz0II=
X-Received: by 2002:a05:600c:1e1c:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48a774024fbmr86295e9.0.1777311620577; Mon, 27 Apr 2026 10:40:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427172519.417333-3-thorsten.blum@linux.dev>
In-Reply-To: <20260427172519.417333-3-thorsten.blum@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 27 Apr 2026 10:40:07 -0700
X-Gm-Features: AVHnY4KrC_-8s-6jQ3WU3OwQLdanE1VG9VKiglfUxWDdXiiJUp5ur2yhP2MZCrM
Message-ID: <CABdmKX1xp1=_EnicNGj1ZOp0dvma-YevvZk1_3V5FZ8ucUK32A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: use max3() in dma_heap_ioctl
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6F854477D8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59703-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 10:26=E2=80=AFAM Thorsten Blum <thorsten.blum@linux=
.dev> wrote:
>
> Replace two nested max() calls with a single max3() in dma_heap_ioctl().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index ac5f8685a649..52eec2ebb2e8 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -153,7 +153,7 @@ static long dma_heap_ioctl(struct file *file, unsigne=
d int ucmd,
>                 in_size =3D 0;
>         if ((ucmd & kcmd & IOC_OUT) =3D=3D 0)
>                 out_size =3D 0;
> -       ksize =3D max(max(in_size, out_size), drv_size);
> +       ksize =3D max3(in_size, out_size, drv_size);

Hi,

Could you add #include <linux/minmax.h> as well? It's currently missing.

With that: Reviewed-by: T.J.Mercier <tjmercier@google.com>

Thanks,
T.J.

