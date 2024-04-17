Return-Path: <linux-media+bounces-9685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF18A8B8A
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 20:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9CB6B25DBB
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 18:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF1A171A5;
	Wed, 17 Apr 2024 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fXj8RIQO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD62032A
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 18:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713379724; cv=none; b=YYgaHeKsmUfGIDxMlDCbO91+zuPqgzz0/RsU72+vvakLZvAntpv00e8HUcB2OLrZ7U8zdFR7vANiNUWHQhZcKEYVV1B58gZ/vOYrDzpxSLnm/jYmPjNvxz6zMJKqcQ/kofwKJjjvqPopavTQRyKkbWaTTFpn4uz6VvdgyLqgBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713379724; c=relaxed/simple;
	bh=rutsOn/f39LcCOHC2CAWzop5cfLJktAPax9ROiVqARI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhuhbctKktEPD/6Tr7cNKhgqf1iZbnQ7QQqSTT/2lu7kTMPmbjuTo2X/csUZadcpD+2URrGGxz7FwhAx+PgKVicHjLvZzrSmym0lcS+CCMgg6nK13k/IF7Y4Tl8jpHoxs+uUtJNaKgga9UUE5Zr1YiLa0xdCKOP8oOUHT7XRwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fXj8RIQO; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-479d1454cb4so23007137.2
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 11:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713379721; x=1713984521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i3Ps7dtRF5OPrxcjL1/j+nNKltItcMv5lBmuac1kY1k=;
        b=fXj8RIQOM1/eQ3FKPRD6YIVhxJ/uFHAtGRsdo/GXZ9yFFPyJMMlFbR49N0B+T9CGWl
         UlqTqtOy3vnPVrB4cyXsrg7sJaU4KwJkzjOGjO5sJn8CjmTcOFTqBr7TGiCR1dxJ3yiw
         B0zcCB4mCg4qYq53E3aGLv1lrk6/FfrsySAzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713379721; x=1713984521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3Ps7dtRF5OPrxcjL1/j+nNKltItcMv5lBmuac1kY1k=;
        b=vmq+DB4t2sTT0SD9LAhcNHiC/Oi8DRc4xWzY2fmdBRF8RexPpLGH+1CR5BC5w2Q+NR
         RiZQ+dzPIsCyJ0bEXj9JlL7h7iohnFLuA+mvheeKEMt0SjgA233IJ8QVvHU4VFAf9XGC
         HdJKsuzs8THRqVEhEZu3SNYa7gtzW0N/pt/h1kGA6kWUvT7MeHcBdrk+ODzo310S3QMH
         9t2+I5DWcCTA9Dna8Qmafz6WQswDhi0A2TP+VUGRdYzrGfL9++SoxKEYj31POYjafqeY
         WGuJmVikic75Qt3LvX1nwBGZPcSbLLAPXFj9+cuPwdhzM94cUVdLi0edrS/lrgUcLTRc
         BUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPTHGKmAIalajp13Iqn7nRik+f33N5Y8/iMUFp2nyK3m+eKm/C42X7DtPO9QdVUNVNjpdqQDAPB1ZNWx+cFksTFirySxK2jT0TmZE=
X-Gm-Message-State: AOJu0YxTRwxEWtggbEKHMhMJbob/LzZUd4uOeQIb3+1x6XwLWmpGP4Pz
	k9LcWi4nqHzall9LO0/BKtrfZ+lMOxktoZrX6DtjwnTBmZdhVMsNDvkJYQwYS0oNLtMtwJYFwg8
	JHQ==
X-Google-Smtp-Source: AGHT+IE8vFggff6GTu1T+ySVx2E+nVYr+JVv1Ytuh4DUdPHAgaRGNLGbq9jvNpCdV65S6vaITVmA3g==
X-Received: by 2002:a05:6102:149e:b0:47a:316c:2e19 with SMTP id d30-20020a056102149e00b0047a316c2e19mr668264vsv.23.1713379720800;
        Wed, 17 Apr 2024 11:48:40 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id j10-20020ac806ca000000b00436b6e6d26asm5799069qth.0.2024.04.17.11.48.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 11:48:40 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e05b1ef941so3026241.3
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 11:48:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgea7K4IXeTKMPE8G3koYd0OH71jEy3p/FDa87Ovq0Ie4ii1DoDjrmVgGVAetnY1kXn2lGot8mUp+wKkrS0E5LK1o36NZxGqhwC5E=
X-Received: by 2002:a05:6122:252a:b0:4d8:75d1:f733 with SMTP id
 cl42-20020a056122252a00b004d875d1f733mr476748vkb.11.1713379719654; Wed, 17
 Apr 2024 11:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab56c444-418a-423d-8528-cf04d5d458ef@moroto.mountain>
In-Reply-To: <ab56c444-418a-423d-8528-cf04d5d458ef@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 17 Apr 2024 20:48:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCvGc2hv-6+THH28vE6uaTL+go7144hSYafkhp21uaM1Cg@mail.gmail.com>
Message-ID: <CANiDSCvGc2hv-6+THH28vE6uaTL+go7144hSYafkhp21uaM1Cg@mail.gmail.com>
Subject: Re: [PATCH] media: stk1160: fix some bounds checking in stk1160_copy_video()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <elezegarcia@gmail.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Wed, 17 Apr 2024 at 19:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The subtract in this condition is reversed.  The ->length is the length
> of the buffer.  The ->bytesused is how many bytes we have copied thus
> far.  When the condition is reversed that means the result of the
> subtraction is always negative but since it's unsigned then the result
> is a very high positive value.  That means the overflow check is never
> true.
>
> Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This patch is untested, I just spotted it in review.
>
> When this bug is fixed, the two checks for negative values of "lencopy"
> could be removed.  I wrote a version of this patch which removed the
> checks, but in the end I decided to leave the checks.  They're harmless.
>
>  drivers/media/usb/stk1160/stk1160-video.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 366f0e4a5dc0..bfb97ea352e7 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -139,8 +139,8 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>          * Check if we have enough space left in the buffer.
>          * In that case, we force loop exit after copy.
>          */
> -       if (lencopy > buf->bytesused - buf->length) {
> -               lencopy = buf->bytesused - buf->length;
> +       if (lencopy > buf->length - buf->bytesused) {
> +               lencopy = buf->length - buf->bytesused;
>                 remain = lencopy;
>         }

I think it is a bit more complicated than bytesused.

bytesused does not take into consideration the actual position where
it is going to write.

What we really want to check is if

offset = dst - buf->mem;
if (offset + lencopy > buf->length) {
  lencopy = buf->length - offset;
  remain = lencopy;
}

>
> @@ -182,8 +182,8 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>                  * Check if we have enough space left in the buffer.
>                  * In that case, we force loop exit after copy.
>                  */
> -               if (lencopy > buf->bytesused - buf->length) {
> -                       lencopy = buf->bytesused - buf->length;
> +               if (lencopy > buf->length - buf->bytesused) {
> +                       lencopy = buf->length - buf->bytesused;
>                         remain = lencopy;
>                 }
>
> --
> 2.43.0
>


-- 
Ricardo Ribalda

