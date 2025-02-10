Return-Path: <linux-media+bounces-25952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7DA2F82C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 20:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795E23A15CF
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 19:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7901F4637;
	Mon, 10 Feb 2025 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="B4uYTsKJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA70191F77
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214374; cv=none; b=Wud/xgaXrX3gZDM5EkTmM1wlFarqdJp4LMRvfmFxXYoAmPK3YoDok5x5JDG52s+6TR6uBotMtOn4EJqtgFMLiJm6MMygeCPKszmpOBhZoFkCWSiEAGBAsP9/vcXtcA2zWuvqfH34jPn5KU0h7J5PJcCBvHHX/Rf9l51zVWyFlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214374; c=relaxed/simple;
	bh=BbE1NPV6pkAhM8QjnUZu8drl74MJljLQIQHTE0TQfJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mm3lbDiotEGLFC5e2Wj994Pnko54L+6OMuPqr/x32a9tfwpXHj0ilP/jiNOjh+v65iBMmhI6GUX20Xx0EbQITVY4BJCRdAUS2mYqgR2nnJP+osVBv9i89R+GlysLjYn3PcGuXCPyeUNWsnYY2Tc7bT2VdZ3IekVRCKz0eYFCyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=B4uYTsKJ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e589c258663so5012700276.1
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739214372; x=1739819172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQHvYxw9TC0a/hgF8QnKVxqks9sj1+2Y1os4NAgJLRk=;
        b=B4uYTsKJPuOqYyET0lzjHDLGqgc6OBc6cvV20CqkJIOxosUyEhIAXhxVsdukBWErBF
         555jleNEWX0MDk6tJO+ai1JXlZSDR2Hi3pgO+wyXu4QquC6RhWKZlVjkyMLGejuf+ysg
         1S5NhbWEOt3UZ/7ny4BZWeNdeVaxgMRH8XJEoNoCJ+uBab31cnmbK6rgjARh4oUN4rag
         9e+m9+5A/yxRVzQ1h/bOFqjMtIxnD2k5w5HRU6bDTj9Q6jCqOT6zGh2sK4GRjwdOieDn
         lycoMWtfuGOvSNAmiYwaesSCKsMWWhzMyEuBxLH9MJ25WuJeqb6UA85QA/cTUmK6GcvF
         y/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214372; x=1739819172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQHvYxw9TC0a/hgF8QnKVxqks9sj1+2Y1os4NAgJLRk=;
        b=hEXd9dK0sFo5Dk04WFoRFdMHbDxSU2NtxtLxKZsqIOKq6ukfvfip8hxQE5QcbVBnhz
         mbTEu3Qlx6wA8HpLZFrbCL04l0ykbHg/j3KaVqbwpMNkFuY7jsTC9EJaCJZ2WDes4Se5
         32YuDA4lRwKBfvtXf+7QcLJ/10Aitb6NdWiCzMVTYLEynRaOgoP/iwH9FZPqlVTEIW5/
         309+UqSvnI/apAPmuPxJInnMPuSdwrQFL4bMKHTeNg9cFobpwIp6RjR223hXRegHPD/9
         6+q+H6UYHy2j3lISbkoz03AqqN4D1U3ubVZyirdl6K8PltyWv8i7rnmdlOYlSfc9UTkp
         ScQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnRma0Ibmpv6JNIwnvQQFHCs9bp4KU5lUwT9eABxIggHhY1hmWrsjIdTde6LS4qt0bukB7t5Dr9kwhDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYungmvygywKoN7WDUDjMb4f/w1LQ8LXnW263BGV+w4RKdFFAT
	uOV74z7z1UrLyRC+Om5r1gbJwUbUtlSlKbvwFoSatecc59VrWcGcqqKXDUPmsKjGcOfOoK4xUS8
	FpTzh1s3Zk0gO/r0pTWFNpwlBBTfG+N6hgNO2EkxM7maa+h5GfJA=
X-Gm-Gg: ASbGncvVxry4UAg4ZhOphqHtUC1b3hA5qOZt9cHPe6+/X2Zu6Y5iIsyvRBmIdo8pcwT
	dCr7IoDDCda+izw6Sb01wQUWhW6iekDe6oiNuNyn8RXZdttAmLC0q6+A4FIi4VhdK+Nm0/W3QIk
	CH5UkojOtiriBxZUuVwvJBNfHZIY1e
X-Google-Smtp-Source: AGHT+IF0tZL586tW8GGxeKA1tKG8GTUu6ZxMVARFBs0eFcDGr5bElYO+qGMDJQAhG35dHcXOrlWVp0l/WbPydKTEpSI=
X-Received: by 2002:a05:690c:4444:b0:6f9:ac35:4483 with SMTP id
 00721157ae682-6f9b29e5926mr121879627b3.25.1739214371748; Mon, 10 Feb 2025
 11:06:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com> <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 10 Feb 2025 19:05:52 +0000
X-Gm-Features: AWEUYZnA3pQgJDo0ZfsATW499IeRezl6cMBBmQLRAPfYQOID6yvwO8rhTG10ULk
Message-ID: <CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Thanks for the patch

On Tue, 4 Feb 2025 at 07:05, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> The sensor's internal ADC supports a minimum line length of 3448 pixels,
> which may be too small to use with analog binning, where ADC operates on
> two lines together. Switch to a higher minimum line length of 3560
> pixels to fix the blocky artefacts seen with analog binning [1].
>
> To keep the same default framerate as before for all the modes, lower
> the default fll value to compensate for the increase in llp.

Extending the line length as you've done reduces the maximum frame
rate of all modes by ~3%.
Why do we need to reduce the max frame rate for non-binned modes which
have no artefacts?

Default frame rate is a relatively useless setting - any sensible
application should be setting the blanking controls to configure the
frame rate that it wants.

The datasheet does list line_length_pix default value as 3448 (0xd78),
and 3448 is mentioned numerous times throughout the datasheet for
calculations. Deviating from it for all modes is a brave move IMHO.

  Dave

> [1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..e4aa6e66b673bb7a8942bf8daf27267c2884ec95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_FLL_MAX                 0xffff
>  #define IMX219_VBLANK_MIN              32
>  #define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
> -#define IMX219_LLP_MIN                 0x0d78
> +#define IMX219_LLP_MIN                 0x0de8
>  #define IMX219_LLP_MAX                 0x7ff0
>
>  #define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
> @@ -286,25 +286,25 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 8MPix 15fps mode */
>                 .width = 3280,
>                 .height = 2464,
> -               .fll_def = 3526,
> +               .fll_def = 3415,
>         },
>         {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>         {
>                 /* 2x2 binned 30fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>         {
>                 /* 640x480 30fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .fll_def = 1763,
> +               .fll_def = 1707,
>         },
>  };
>
>
> --
> 2.48.1
>

