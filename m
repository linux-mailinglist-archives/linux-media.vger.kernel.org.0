Return-Path: <linux-media+bounces-21027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2719BFA42
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 00:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 912D31C21FBF
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 23:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12FA20E00A;
	Wed,  6 Nov 2024 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T+YlYY5N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C565D201029
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730936510; cv=none; b=Wa2QFQQMIXJHmJe7Yvo7s7Wqy58YwVQlkGzhstsly9Bznj8Ot5WKTLZhEtbWyezJ3B8TKev7E+n5f4an+vHmHg7CmQBomQzY6bggo1KoYP8A9tLADh6ttzFC70ejxHG0BAeSpE9kDf8CqFby0BBG4hVMy5rYPorLCBngUVxuk7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730936510; c=relaxed/simple;
	bh=Jb8BAyvd4oz2mGslbPXUUxqw+BIR393RplBHuFXMRjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUATxtYbaIka5wi7Ktwjv/MBb84nP4/5DIG/ZyhTuEfCa9kprXT54xejfnKMQwNnruEN9ta7Ad3WYH7fb2Ho7hkSlHUkV8Klc/nzK+pJbN33mT7LuESl64qMZ9OFozIr4YJ7n+owHDWxuX0r+gvMaoZxq0SIvD/+K9LNVy95v1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T+YlYY5N; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7eae96e6624so306717a12.2
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 15:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730936508; x=1731541308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUIxV8/idxeTiaY7TjZoSjaAKD90iyIZAKQ4e5QblXw=;
        b=T+YlYY5NE2V/hojWGZ7lXS3Uw3UgGZPq3svoUVwCGJlyL++Pq+VugY0IYuCY2//UNx
         6BZBW7Ktj0LUtTjtxogy3Nk0PYt5LiswrRnJO6uxH3j/jg1TbBlObv1N9AU3/J1I4C0+
         IuyuaBjZ3vS36UhGCcszCSmV08mHYfPgBh7Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730936508; x=1731541308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUIxV8/idxeTiaY7TjZoSjaAKD90iyIZAKQ4e5QblXw=;
        b=Em8MKxUnjB8zuQytGXsQEE6SHXXi/05KfFWpFov0BUZNfPF4z7qCZ6pHFtPNbD+dyN
         87cig7aqVQ4ZTwnHtkGe99kmUc5ZHnFInKKacD3afCufvtxhoURRr1EyrFdIrOn1PWX1
         vGf5Ae3LGiAqCsEfcV58ZaONkg5rlABIpmmHW7puAgVJUg6Btiinf4tpu+6frA+C4Lur
         8XoTPwfuaD7bmpNd959d//f2vGgFv00gwRbDQeRAlNmzCur0ykacM7WZL3b2sHzmceQB
         j5AWwMnsouzvJZ1bwGY0O6f5YjqqgzGnFYxxetwWrq+R74oma8vULy7XieR2smudu5bZ
         sM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXadgRIDQz14SU5R4LoUidu3AOHeIR8ropYRzhFmHHhKSfZ7qHmhyCkKj21RMB8bU83Jvblp/m24CgykA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNs+cYPbEuOhnRDA13dOnQcS4V3T6ZwdbbRzomlwv8p8MNzN6
	HdwfMXPesEOGdE1djo8fy79MyMPSpyvbPCSJsmAbm0c4At2yQLZBM1WWS2xw1dA6eamhZm482Pt
	lcw==
X-Google-Smtp-Source: AGHT+IFbuyHOKjVm/4xAo0vbPW9TukitzD2A+dgH09S2QAFKBL510HsMHop0pLmIWkTdYB3KRMSV7Q==
X-Received: by 2002:a05:6a21:7885:b0:1db:efca:7bc9 with SMTP id adf61e73a8af0-1dbefca7befmr12646326637.25.1730936507771;
        Wed, 06 Nov 2024 15:41:47 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f65d358sm64643a12.84.2024.11.06.15.41.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 15:41:46 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c87b0332cso33805ad.1
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 15:41:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQKlsadESUm4PpXwudxmHWuURyGj9FFrpinPhG116w1xbMNM07KNA+/VO3KBzvdU5SEsScGbKQt55f7g==@vger.kernel.org
X-Received: by 2002:a17:903:2285:b0:1f7:34e4:ebc1 with SMTP id
 d9443c01a7336-211748fa9f8mr1764415ad.5.1730936505431; Wed, 06 Nov 2024
 15:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
In-Reply-To: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 7 Nov 2024 08:41:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Message-ID: <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-core: copy vb planes unconditionally
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, yunkec@chromium.org, 
	hverkuil@xs4all.nl, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 9:18=E2=80=AFPM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Copy the relevant data from userspace to the vb->planes unconditionally
> as it's possible some of the fields may have changed after the buffer
> has been validated.
>
> Keep the dma_buf_put(planes[plane].dbuf) calls in the first
> `if (!reacquired)` case, in order to be close to the plane validation cod=
e
> where the buffers were got in the first place.
>
> Cc: stable@vger.kernel.org
> Fixes: 95af7c00f35b ("media: videobuf2-core: release all planes first in =
__prepare_dmabuf()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 28 ++++++++++---------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>

Thanks for the fix.

Acked-by: Tomasz Figa <tfiga@chromium.org>

(We probably need some tests to verify this behavior... It seems like
the way v4l2-compliance is implemented [1] would only trigger the
!reacquired case on most drivers.)

[1] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-t=
est-buffers.cpp#n2071
(just queuing all imported buffers in order and re-queuing them
exactly as they are dequeued [2])
[2] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-t=
est-buffers.cpp#n1299

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index f07dc53a9d06..c0cc441b5164 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1482,18 +1482,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
>                         }
>                         vb->planes[plane].dbuf_mapped =3D 1;
>                 }
> +       } else {
> +               for (plane =3D 0; plane < vb->num_planes; ++plane)
> +                       dma_buf_put(planes[plane].dbuf);
> +       }
>
> -               /*
> -                * Now that everything is in order, copy relevant informa=
tion
> -                * provided by userspace.
> -                */
> -               for (plane =3D 0; plane < vb->num_planes; ++plane) {
> -                       vb->planes[plane].bytesused =3D planes[plane].byt=
esused;
> -                       vb->planes[plane].length =3D planes[plane].length=
;
> -                       vb->planes[plane].m.fd =3D planes[plane].m.fd;
> -                       vb->planes[plane].data_offset =3D planes[plane].d=
ata_offset;
> -               }
> +       /*
> +        * Now that everything is in order, copy relevant information
> +        * provided by userspace.
> +        */
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               vb->planes[plane].bytesused =3D planes[plane].bytesused;
> +               vb->planes[plane].length =3D planes[plane].length;
> +               vb->planes[plane].m.fd =3D planes[plane].m.fd;
> +               vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> +       }
>
> +       if (reacquired) {
>                 /*
>                  * Call driver-specific initialization on the newly acqui=
red buffer,
>                  * if provided.
> @@ -1503,9 +1508,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                         dprintk(q, 1, "buffer initialization failed\n");
>                         goto err_put_vb2_buf;
>                 }
> -       } else {
> -               for (plane =3D 0; plane < vb->num_planes; ++plane)
> -                       dma_buf_put(planes[plane].dbuf);
>         }
>
>         ret =3D call_vb_qop(vb, buf_prepare, vb);
> --
> 2.47.0.199.ga7371fff76-goog
>

