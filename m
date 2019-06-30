Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561845AF38
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2019 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfF3HXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jun 2019 03:23:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33223 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jun 2019 03:23:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id x15so5014105pfq.0;
        Sun, 30 Jun 2019 00:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e52sskDaY8O7yqS5NxNuV7bUhO1cLfPhjc5I1rr6rnY=;
        b=peE4X3XDICVXlJEtIvk/EL5Ewm6mvCDiPCOQaGFhZxr6zhAQmF4A5l0ngpIuY8Wif+
         fcXG/GstSAyMLtaznvMlima8mZJVWSjl7HRAc8bN2NfrVgq/Y9B3sjTDRCpt//0D/Bl0
         VBBtTZ9HMj6AHbbZ7CjOKt0aAYqhmoUf7WQ+WHK7AKg+Pit0mr3EGk4Z9dTEU/HC+VSv
         iuL9li126wvQyzKgWgmEJObcRKiMFvn4mpX6y4ehKtksLpC5wyYm5CUF2O7ZcnLTYtmC
         Gq3HXyHfjhiya9q8WKgtRQpxlZv1RlD0+YHvl6Oh16ssKuzyxH6Ycr4ASunurJk1a2Ke
         o4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e52sskDaY8O7yqS5NxNuV7bUhO1cLfPhjc5I1rr6rnY=;
        b=BKMPA7+O2ClnYz9Vnl2aQdD+thbWgRAV7CEDpM6yqCevqRGxnqHZ2F2k5wfyzbi4AA
         HikfXWPm9dM497hBdTT/5uLGDadFyjOEdrPtSlmRzaSMUHaMimeD9Im2rOHdVMeHAPjb
         AHNOhTH5pZXaM8+JOWD+cYUGkdAZNY8DN2iU2KAETGmr9rylsxrobV6gQGmdhETjrTrJ
         rMywRGsGQvdSnDjR51PyFLEZNgwAqg9v6dTg4zCNrWdl2LmV5TLPBc9foxGaKu31tDRY
         t4zJm+bBWvxkxJOTKqVnF+BrT3Qx5NkzhugqdMSt29c1V7Wmw6ypGuCoWEs4FC3JbSQP
         AsWw==
X-Gm-Message-State: APjAAAWiLPr911geHCOqNSmFQ5SuPG7RcpNLi35G+YecG+r7Pks0HXqu
        KZjs1KbZgKA78vscUtZhgiE=
X-Google-Smtp-Source: APXvYqxUz97jco4tSdj/sipvzahORyUn4kl9XgYeOQiAaWy3ISZP/v5bByDOX6kV+D16XiPr0ad3fQ==
X-Received: by 2002:a65:4387:: with SMTP id m7mr17649851pgp.287.1561879409114;
        Sun, 30 Jun 2019 00:23:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 64sm9431145pfe.128.2019.06.30.00.23.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:23:28 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:23:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Florian Echtler <floe@butterbrot.org>
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
Message-ID: <20190630072326.GE91171@dtor-ws>
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 26, 2019 at 11:52:16AM +0200, Hans Verkuil wrote:
> This driver set the colorspace to SRGB, but that makes no sense for
> a touchscreen. Use RAW instead. This also ensures consistency with the
> v4l_pix_format_touch() call that's used in v4l2-ioctl.c.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Dmitry, do you want to take this, or shall I? I have no preference.

Please take it.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
> index 00cb1ba2d364..3fd3e862269b 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -186,7 +186,7 @@ static const struct v4l2_pix_format sur40_pix_format[] = {
>  		.width  = SENSOR_RES_X / 2,
>  		.height = SENSOR_RES_Y / 2,
>  		.field = V4L2_FIELD_NONE,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.colorspace = V4L2_COLORSPACE_RAW,
>  		.bytesperline = SENSOR_RES_X / 2,
>  		.sizeimage = (SENSOR_RES_X/2) * (SENSOR_RES_Y/2),
>  	},
> @@ -195,7 +195,7 @@ static const struct v4l2_pix_format sur40_pix_format[] = {
>  		.width  = SENSOR_RES_X / 2,
>  		.height = SENSOR_RES_Y / 2,
>  		.field = V4L2_FIELD_NONE,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.colorspace = V4L2_COLORSPACE_RAW,
>  		.bytesperline = SENSOR_RES_X / 2,
>  		.sizeimage = (SENSOR_RES_X/2) * (SENSOR_RES_Y/2),
>  	}

-- 
Dmitry
