Return-Path: <linux-media+bounces-18213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76971976AFF
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76F31C2386D
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169611BD039;
	Thu, 12 Sep 2024 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9jud47o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692071BD023;
	Thu, 12 Sep 2024 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148451; cv=none; b=UKPKy6e5puoUOkskLluZR4yYUtVHET59+wIYWvcCPHEmcsGxa/cEIuR3VQSWK8P1zIP/2wML5uhbPWa7EZ3zq2k5Hi6+RxoxU6L6b3iFFEmWxIaXchGg9Oj45wBCFgVz7IKLckY2tDDAXMg1RpzNFxu7FInkavt9bUIuIhMdvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148451; c=relaxed/simple;
	bh=R9tAX9aaSwPbnFZpW4q5nFs0907fZ8SErJ3Ztm7AhmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFyGMXbDU2o9jWNkmmHWTVjhAN5cDZTF5k3Q0VfOKRbtoO6yExuEJIscVnrXy2AOcXUiCHhyoKUYFwk9gkmnBUIIymRQnHvjk8L+1/iTr5ZHzka5lIB6wh9uRrGSGTPm+4NQneFrFObO9BLLEc+LuO4/ifedB3hNYC1o9sYLB1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9jud47o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5BEC4CECC;
	Thu, 12 Sep 2024 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148450;
	bh=R9tAX9aaSwPbnFZpW4q5nFs0907fZ8SErJ3Ztm7AhmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E9jud47ouK79VzZrYktenTM3Y2fehkXSgb+0PXCYx3eUPy4u3cphdsuRawccQeu1z
	 MfbpvmLDM5Lum2qIWNPL65jYwzhSMyDsY1ujqtaicZFNP1DdM6jPmvXVhKQPEZKTvI
	 vePfQkaJoAI2XZm+2dQfMnG7nFinHXBZQjNl89tSCVWMYPi+LfG8sc68O44MF0TEqy
	 EXjcDU9hUpIQ4ZVKOFEt5Q/OYz/9DZ4MSzVbLGVsbQdjxSDsXAsHIQ6kRSD0y2z5D1
	 EW5N4VWLJLMOo5w4P+1VZvS9svpT+2bXOHgTUkKxjbWUrGvNW+12aNejiN9Zkh/pnP
	 VKQRh7rZk7jlQ==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-710e489860bso439243a34.1;
        Thu, 12 Sep 2024 06:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuLO9/GnTNU5XZqWqDn0Nqb9dIrkvotWFBRT2y1N7KGj3SG4QHqSXUaaVfHv4Y4BB4my7l3s6/S1iqHBs=@vger.kernel.org, AJvYcCXGH328ULH0681OcUPZYKBlVPH7dU3ORABh/e+ADSn6r0q+657AWZj51mq75bsuVbhUj3OaRHe6sQqdEaA=@vger.kernel.org, AJvYcCXTSWAxvq7hkCX7miK5QiWve4U6I1RKXeKykzMf3N18lskJApiN1XaTZIJ9T/00lZnxYm0j1sta2esTV0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOmlAozVrI3CShULSLA65w0oaBjUqK2EJjWi7jS8zWceT2JS/
	JtcKN675zn3kDDQ1V4sSiU58OO0TqrVbu/7XEgK3tmkdmlxT8jOghcif8LFsDgwhsrSZIn19WJC
	alZmZLrW+Aki72uq4cX9uq1ocjPI=
X-Google-Smtp-Source: AGHT+IEX+HeSyhmoH2U+UnAc09NReaImcbF92SlNzOwp9B+vmOjdU4ANnWjBbv9wCSq+K121NIxebA+gtfodJVVa3Rw=
X-Received: by 2002:a05:6830:4112:b0:710:f3ea:c30 with SMTP id
 46e09a7af769-711094aa606mr2769814a34.21.1726148450249; Thu, 12 Sep 2024
 06:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-2-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-2-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:33 +0200
X-Gmail-Original-Message-ID: <CAPybu_2SaRHzGzb2xy7x4xLMjW40Lah0i63YOztby6hTkrPRrw@mail.gmail.com>
Message-ID: <CAPybu_2SaRHzGzb2xy7x4xLMjW40Lah0i63YOztby6hTkrPRrw@mail.gmail.com>
Subject: Re: [PATCH 02/13] media: i2c: imx214: Remove unneeded goto
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Andre

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Simplify the imx214_start_streaming() by removing unneeded goto
> statements, and the corresponding error label.

Could you squash this patch with the previous one?

Thanks!


>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 58f3c3f67e0d..283d4783c22e 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -776,7 +776,7 @@ static int imx214_start_streaming(struct imx214 *imx2=
14)
>         ret =3D imx214_write_table(imx214, mode_table_common);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent common table %d\n", =
ret);
> -               goto error;
> +               return ret;
>         }
>
>         mode =3D v4l2_find_nearest_size(imx214_modes,
> @@ -785,22 +785,17 @@ static int imx214_start_streaming(struct imx214 *im=
x214)
>         ret =3D imx214_write_table(imx214, mode->reg_table);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sent mode table %d\n", re=
t);
> -               goto error;
> +               return ret;
>         }
>         ret =3D __v4l2_ctrl_handler_setup(&imx214->ctrls);
>         if (ret < 0) {
>                 dev_err(imx214->dev, "could not sync v4l2 controls\n");
> -               goto error;
> +               return ret;
>         }
>         ret =3D regmap_write(imx214->regmap, IMX214_REG_MODE_SELECT, IMX2=
14_MODE_STREAMING);
> -       if (ret < 0) {
> +       if (ret < 0)
>                 dev_err(imx214->dev, "could not sent start table %d\n", r=
et);
> -               goto error;
> -       }
> -
> -       return 0;
>
> -error:
>         return ret;
>  }
>
>
> --
> 2.46.0
>
>

