Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D7936B157
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 12:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbhDZKL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 06:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhDZKL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 06:11:57 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1784C061574;
        Mon, 26 Apr 2021 03:11:15 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e5so26574385wrg.7;
        Mon, 26 Apr 2021 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=6QJuBXRzJn2AF9buhoiLcgCgPyLx4ghe04B214br8tk=;
        b=bmowWUwJPdLle6EVB+jkPN3+4gi1p99iRZVN9vq7P3avoRZQRJ3TsIdOegV46+FQkh
         go+MXbeLjk2E2rncmkHnArovf1hnt2sn8/pknG4+WXCqX3l0Dv7KR1wqjdpCOJPzfYaA
         /DtY+4zkL0gDI5tUKgNwjuL921ejoi7/5R5WPzYXvt829R5JWqwXoKQhyKW8y1oCwzAX
         4EvueEoFP1U3bEPBXdZvMMJiGavh718lBxN37vrUoVFQF802sZFnxrRYPfs9pcbK2poJ
         wFiM9cbT1sFp/w2uFyfeFdc4aCqyXcBjXJb0vp+GmM9bcas88qdNY9bWzCLHbW8L12wd
         wZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=6QJuBXRzJn2AF9buhoiLcgCgPyLx4ghe04B214br8tk=;
        b=qeRcVvkDlnF+sD7taTCM60QVl/EpRfGc/ctJTzrMqSVGGh6HC1p9MlhrXuL6nck11P
         tTYcB8DTj4ZsaG8LgDOncDyX8sQi0TCRB1uMs7mzmkcG6RjyRZjoVZhbgeSjrCePEiKa
         lqru8ixJQKz0PXY6Nba0sqMXb5fWtgNy9uITRSUDgk9Rj/Sbjd7QksMpVBPv9Ei23n2q
         6jzcPPC0ssx1KTIe1kCLi75LLKFZ8VjLc4L1OplzR6Oo/ymF+WSU+5pXyCuAky1Yu1Q0
         mFf/iCoLClpvb+IFWxde3V5h7+1cyeHSqi8Bm/pSij5/Y0BBZvymYnpbAYUhzE3Sr6GR
         AF1A==
X-Gm-Message-State: AOAM531+mU74k42hDQmxBZzeQkvR0zyvcS1BZu2bm1SHGe9aqReB+xoG
        y7c2iZRcWZvLEb1Y7XJt0GM=
X-Google-Smtp-Source: ABdhPJzDZ3attoVnXeyn+fChhpBJF1lVz+ag12kYIzWsOz4Xclar1aHxa9Q2LuDCRIipxhRncod7dw==
X-Received: by 2002:a5d:47cc:: with SMTP id o12mr21898459wrc.227.1619431874480;
        Mon, 26 Apr 2021 03:11:14 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g6sm7391184wrr.63.2021.04.26.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 03:11:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 26 Apr 2021 11:11:13 +0100
Message-Id: <CAXKOS5IEQ7O.393TTUPR42AWE@arch-thunder>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        <devel@driverdev.osuosl.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 14/78] staging: media: imx7-mipi-csis: use
 pm_runtime_resume_and_get()
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <d5f5cb75e48ef7386f83ed023ec3dc1f5be5d08f.1619191723.git.mchehab+huawei@kernel.org>
In-Reply-To: <d5f5cb75e48ef7386f83ed023ec3dc1f5be5d08f.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,
On Sat Apr 24, 2021 at 7:44 AM WEST, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal =
with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, looks good.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
	 Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index 025fdc488bd6..1dc680d94a46 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *m=
ipi_sd, int enable)
> =20
>  		mipi_csis_clear_counters(state);
> =20
> -		ret =3D pm_runtime_get_sync(&state->pdev->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_noidle(&state->pdev->dev);
> +		ret =3D pm_runtime_resume_and_get(&state->pdev->dev);
> +		if (ret < 0)
>  			return ret;
> -		}
> +
>  		ret =3D v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>  			goto done;
> --=20
> 2.30.2


