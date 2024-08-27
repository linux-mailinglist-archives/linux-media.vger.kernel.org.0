Return-Path: <linux-media+bounces-16878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A8960433
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A151C223E3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CAC193433;
	Tue, 27 Aug 2024 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iFgxyKp2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EEC54F87
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746785; cv=none; b=mcL2sp/8X5VY2qVFB6gL/PVV9cVUMMN9TvU7tsVlE9bJmG1QFcWVq3KbJbjv4+HQW50QNmEk+Ud8SHYWN4CUFV/HaS6bn+Ok7OsATRrzybR6ByWSGSbt33zd8qd34rsdf6nH8QHY/nevtba/HPRYgbuHFUPGkzDlIVrIwWVxiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746785; c=relaxed/simple;
	bh=spR3CGSFlcWxd61znYrOMywbunOudD26HRQTshpPnAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtmO1JNxE4/GBv53+lUNxwUotAZvs0Cp+h4Zq6J6D2fQ44K/ZYkjA3stIhpLYPiiOfADDh5yOR6RNbGPCSOg3xJjlX/2Mimv8758dng2ANMkkTPqBp9EuyQd3Ue4+PofFzhYfPmAL22qxpX/MwJWB6klSsJ3/R0ALf+LlKY0VCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iFgxyKp2; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-27026393c12so4258902fac.2
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724746783; x=1725351583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huD3ev31mLebmA06NYxn0TFHXgDRdCiQozZGR5G/ENM=;
        b=iFgxyKp2Jp1jrjiJCGOqeDCqzu22EdQX5fHSaCaxx7eiu1a4aoJDChFZLTXmQw/Or9
         6CxpdvdysCvmA84B7wSb34K1fZ9JTqLzZW65oIolMqSsvL/V3TTOvdtLffaKnvJwuMCl
         19jUCQn/UThCGdj0gY0K+7cTlIrXlBnrpaPOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724746783; x=1725351583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huD3ev31mLebmA06NYxn0TFHXgDRdCiQozZGR5G/ENM=;
        b=ViI1arUnIhiSkCIJ/Q1WlaBIzlcouSOCSrKbh904t/OSawia8ZQ9yCxPMfv25VxlE1
         QUsRlH4lrG76Ouq2lL9a9GK2Cttnf6YHd+kU4aVWN9owGxa3SYL5ZoljPP+hLVdEIutd
         S7ELTQVks3P3DL7zl4B26gVWv6AK4uMjwI6WkPx/ccSZXLb0LgCXagIao6/Su5Vc1jNQ
         qvhL1tJM6QjoNWBZrEf5sR63MAmEHU7E5d+jkfi3xO+pQRgLuGetPRoqfM7w5waSrAiZ
         LgslrVLz7rqjjKSFeKvqw4qY0lYp2J+KJzuIHIKGBLscnRfpD/JAyUsEGFBTnsZCRYsX
         OZVw==
X-Gm-Message-State: AOJu0YyRCt+4HDzGqHvgSA/FHtlpf+jEI5SEpFTNWW6G711Qtuz8ipRS
	y0hCvFO9NKoDMv/PIy9Ej57kFpw59U/1LJjnErV34wsaGbtcVcOGloO9KN5maUDzIF8loIfLcAr
	iIwKc
X-Google-Smtp-Source: AGHT+IF4vtiASKMe+3JFWOao1hM7sScjyDn0DmL88b3wNf0ZPiBXhZfS4NPyatraZdWQp5fBATjGOA==
X-Received: by 2002:a05:6870:c154:b0:261:10b2:7bc1 with SMTP id 586e51a60fabf-2775a000a21mr2714780fac.31.1724746782730;
        Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343388e0sm8142639b3a.195.2024.08.27.01.19.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20353e5de9cso157695ad.0
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 01:19:42 -0700 (PDT)
X-Received: by 2002:a17:902:e5d2:b0:1f9:bc99:d94a with SMTP id
 d9443c01a7336-204e4c627fdmr1870895ad.5.1724746781507; Tue, 27 Aug 2024
 01:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 27 Aug 2024 17:19:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DDwFTX48EPksjqQ5bdRWUkQn+ZCBUbKid2H1GeZZSzOg@mail.gmail.com>
Message-ID: <CAAFQd5DDwFTX48EPksjqQ5bdRWUkQn+ZCBUbKid2H1GeZZSzOg@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Drop minimum allocation requirement of
 2 buffers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 8:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> When introducing the ability for drivers to indicate the minimum number
> of buffers they require an application to allocate, commit 6662edcd32cc
> ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
> structure") also introduced a global minimum of 2 buffers. It turns out
> this breaks the Renesas R-Car VSP test suite, where a test that
> allocates a single buffer fails when two buffers are used.
>
> One may consider debatable whether test suite failures without failures
> in production use cases should be considered as a regression, but
> operation with a single buffer is a valid use case. While full frame
> rate can't be maintained, memory-to-memory devices can still be used
> with a decent efficiency, and requiring applications to allocate
> multiple buffers for single-shot use cases with capture devices would
> just waste memory.
>
> For those reasons, fix the regression by dropping the global minimum of
> buffers. Individual drivers can still set their own minimum.
>
> Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field =
to vb2_queue structure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 500a4e0c84ab..29a8d876e6c2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
>         if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>                 return -EINVAL;
>
> -       /*
> -        * The minimum requirement is 2: one buffer is used
> -        * by the hardware while the other is being processed by userspac=
e.
> -        */
> -       if (q->min_reqbufs_allocation < 2)
> -               q->min_reqbufs_allocation =3D 2;
> -
>         /*
>          * If the driver needs 'min_queued_buffers' in the queue before
>          * calling start_streaming() then the minimum requirement is
>
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

Thanks for the patch!

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

