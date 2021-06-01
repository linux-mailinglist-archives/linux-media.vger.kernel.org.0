Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D933A397200
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhFALFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 07:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFALFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 07:05:42 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C2FC061574;
        Tue,  1 Jun 2021 04:04:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h3so7901987wmq.3;
        Tue, 01 Jun 2021 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=UIeev169KsjRHIHSK44fgwRCcjF3oL63Fw85uvXExqs=;
        b=KvzCCTj/0TGGXpfZKR9UGY0wC/FftejkhUxjOm+geMYWUYljCPae/mROSOWpu+UYrb
         ShBHZcRmnjjg767XGrE08i5WsakGc4dJrIV1HLAgvLnRcOsYkOm9/f1550HkKqTgub2U
         ZV6JfcJRs75dXucvlyNBM1aMcIopYauMEB3q1VgzRWfS4oE/9JfbNo27tCyXR4Ujb1MZ
         n51p12Lg4PJ1jondTA91Ml45ze1QTPqZ9Lvej+jyD5AIYm3o1a4+/pZ/52/UmUDspqBz
         Len4mSE2cglioc2E8Lko+dUCpKqSO/bb+ZwVKn3za2eiPjyBa+KLE6e13oSbpfYWXh8L
         dl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=UIeev169KsjRHIHSK44fgwRCcjF3oL63Fw85uvXExqs=;
        b=I2+mN9wpydkMT0mnNLfjblc7Zjgyv3+59jN//QjejMYxj+WOapEaNZh+mVfyI7+Om9
         jsgVZY9QxxtxEhD2FJJzFRL4eR8v9MQ1C6t0lUEUn7lJhjdGbMcx5deoa0iJwGFW1j1x
         jP0XI5OWEuO7vKeoUpjZanQYaW+lYjBKtgUw/WsBsxb918j433j820fX36rAvF8YMQdY
         3bvNS8TayGOUyh/WHJiw8v0DU6ioCvAwXj4N+c1bMc8jih27Ry/gnvd0FVNzqCOhPTIi
         OgpRwqp992ore7nPR2p1Bc7ZMjZDokWq4Hm+3miZlj9HAQd5lgO/vWm4t26vCqfhqbDT
         ljEA==
X-Gm-Message-State: AOAM532pOqEVTjClRV7a5rZX7tC6rMNfLWi5nkkLbAOOIaEi9Gr7btz/
        tEZb5h8MxnKDp5OK93aMK4M=
X-Google-Smtp-Source: ABdhPJzNJTzJo1iWAFdFFiIgWC2+hfB9CM4LEfJWadWMhzsrL8GS7Czqs8kzSnzTDLb/ygH3MQYjfQ==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr14625537wme.154.1622545440071;
        Tue, 01 Jun 2021 04:04:00 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t14sm2755228wra.60.2021.06.01.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 04:03:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 01 Jun 2021 12:03:59 +0100
Message-Id: <CBS8CSIHJTXJ.1HWQ3AWYCC1V8@arch-thunder>
Cc:     <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx: imx7_mipi_csis: convert some switch cases
 to the default
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     <trix@redhat.com>, <laurent.pinchart@ideasonboard.com>,
        <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>,
        <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>
References: <20210531174300.2594109-1-trix@redhat.com>
In-Reply-To: <20210531174300.2594109-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tom,
Thanks for the patch.

On Mon May 31, 2021 at 6:43 PM WEST,  wrote:

> From: Tom Rix <trix@redhat.com>
>
> Static analysis reports this false positive
> imx7-mipi-csis.c:1027:2: warning: 4th function call argument is
>   an uninitialized value
>
> The variable 'align' is falsely reported as uninitialized.
> Even though all the cases are covered in the
> 	switch (csis_fmt->width % 8) {
>
> Because there is no default case, it is reported as uninialized.
>
> Improve the switch by converting the most numerous set of cases
> to the default and silence the false positive.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

It solves that, looks good to me.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index d573f3475d28..330f283030ec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1016,10 +1016,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *s=
d,
>  	case 6:
>  		align =3D 2;
>  		break;
> -	case 1:
> -	case 3:
> -	case 5:
> -	case 7:
> +	default:
> +		/* 1, 3, 5, 7 */
>  		align =3D 3;
>  		break;
>  	}
> --=20
> 2.26.3



