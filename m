Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33D538900F
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347137AbhESOOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347100AbhESOON (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:14:13 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38F8C06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:12:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id c14so12411787wrx.3
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:from:to:cc
         :subject:references:in-reply-to;
        bh=qtTj51Rg40m22tvnirlYlgibzuBz0a9pjWW5YuuFc54=;
        b=WIdssvvWzZ5RXXcI5Ylo2bm9JT/prcmmNP+ZciF93gFo/vFSAYqDjGQ/BPsgiXZ84S
         QLhP/wu80htNd3T9L5cPrU9cKukHxRmOsQ4P3sOhFbiDFwyj6KKmuzNmX9AWh3k2j6R6
         Ndgxwxoe9jdxxRfTjcEHIOpJ7g/un9RqN71s9h4U7irbLD7e1DLQxJ5+0DZArEs5y5Ml
         Ov9dM5YTCw+stQay/Y2cTk60u2la5EbYXOGXgUF8uyieBkKBAEW7wcyAZ3YtLLBP0D3W
         Kvt9URQ5wqxstKappiXIkY374NvCmQCMmdpBgUOK9fzTjxNEo6rlYmLsQIfqYOKz8RIq
         60kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:from:to:cc:subject:references:in-reply-to;
        bh=qtTj51Rg40m22tvnirlYlgibzuBz0a9pjWW5YuuFc54=;
        b=FOY4M/WyiSDCMmCX6Sq7fn/i3VvA7CITjlyNv4E178ZkvwwSa8Eqx4riowD3S4nFeI
         deWVY9wyiiAoBFWPcbY2+zPYYvlRRjyTDMauiZfIi86nQrVd80BoipVCv60KIBduG5WK
         0+NwhONw4yBDJlJDFcj32RgQ4DENBG+uVMjViDSSmuxl8+4ujJtfYuayRHlWSpgCozuy
         1K6+10nz8KM6mF7J7msumO++moBic3WIV246K3prdUjGV0US76XEtNCXE3Rxs5GYUxNH
         MF9RUhZLIQwQtrZ5sCRbsYpTgArj5emfX452wGBPpG8gBQ7A0E+2dwlfWTkJ+0K273Mz
         kO/w==
X-Gm-Message-State: AOAM5310fASOAyV+QfXFl1XfrIpixVVmoUYChPPEyEViZZKbpQ9aX5kR
        QJeLXLeQIqmWnNlN5HCis2Y=
X-Google-Smtp-Source: ABdhPJzC8U6Bxrq7f23I8fCuAmuseJapLm/ju0s2HhIQlyLXKrihCUXCc6WyXs8OSnY1xxyD0wXsOw==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr10768696wru.275.1621433572565;
        Wed, 19 May 2021 07:12:52 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b81sm7604873wmd.18.2021.05.19.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:12:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 19 May 2021 15:12:51 +0100
Message-Id: <CBHA8BLTAJM1.1DIYC729ZMAYY@arch-thunder>
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
Cc:     "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Marek Vasut" <marek.vasut@gmail.com>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Wed May 19, 2021 at 1:58 AM WEST, Laurent Pinchart wrote:

> When the stream fails to start, the first two buffers in the queue have
> been moved to the active_vb2_buf array and are returned to vb2 by
> imx7_csi_dma_unsetup_vb2_buf(). The function is called with the buffer
> state set to VB2_BUF_STATE_ERROR unconditionally, which is correct when
> stopping the stream, but not when the start operation fails. In that
> case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.

Did not know this one. Thanks for the fix.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index f644a640a831..da768ea21d03 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_=
csi *csi,
> =20
>  			vb->timestamp =3D ktime_get_ns();
>  			vb2_buffer_done(vb, return_status);
> +			csi->active_vb2_buf[i] =3D NULL;
>  		}
>  	}
>  }
> @@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi *csi)
>  	return 0;
>  }
> =20
> -static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
> +static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
> +				 enum vb2_buffer_state return_status)
>  {
> -	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
> +	imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
>  	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
>  }
> =20
> @@ -526,9 +528,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
>  	return 0;
>  }
> =20
> -static void imx7_csi_deinit(struct imx7_csi *csi)
> +static void imx7_csi_deinit(struct imx7_csi *csi,
> +			    enum vb2_buffer_state return_status)
>  {
> -	imx7_csi_dma_cleanup(csi);
> +	imx7_csi_dma_cleanup(csi, return_status);
>  	imx7_csi_init_default(csi);
>  	imx7_csi_dmareq_rff_disable(csi);
>  	clk_disable_unprepare(csi->mclk);
> @@ -691,7 +694,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, =
int enable)
> =20
>  		ret =3D v4l2_subdev_call(csi->src_sd, video, s_stream, 1);
>  		if (ret < 0) {
> -			imx7_csi_deinit(csi);
> +			imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
>  			goto out_unlock;
>  		}
> =20
> @@ -701,7 +704,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, =
int enable)
> =20
>  		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
> =20
> -		imx7_csi_deinit(csi);
> +		imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
>  	}
> =20
>  	csi->is_streaming =3D !!enable;
> --=20
> Regards,
>
> Laurent Pinchart



