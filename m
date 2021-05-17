Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A343829B5
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236291AbhEQKXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhEQKXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:23:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3EDC061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:22:06 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b7so2662679wmh.5
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=76GesynHPkG6x3+8aBakyW0YrBjSZ2oUY2tZIGo0qmA=;
        b=bHjuAIvKfwL3//tJ+cNYiVCNm2QOT72WnckXwvAQqI3ReDbincl4h/2KufFHB1WmIm
         c8VGqQVmrbAWqAUrfdzV/YeAssAadNMVvQjiXEFxzaRP0DEACaEeebkF+uonc8FoP94g
         bZFw3tTyU16RG4RiJ3OrXCTHV0ZtkEhhLgMGws4moIK6NpUZJa7Q3VovYrBoB77CWKve
         HbinnpBNG6J1WUShqk4yxv6r7LY1JRsd+R7EIalrtMkK7r0o0c7Eefz1CUN50b+slUup
         1uG8YZPjUiTBnEYl7TLdK2tvECyySnWF01s7DLfSOnMwPGWNisO80z2PQoE4rwbtjj/R
         fekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=76GesynHPkG6x3+8aBakyW0YrBjSZ2oUY2tZIGo0qmA=;
        b=NzBVRIDfN2ClgRl5G6jiW5Ex2OhGTccZ5GMUOaL/CebxT9xVOsBOUmzMrWxWXSoB9/
         hAACnagz+MlN1MERzhJCjUeOt02T+7OdBKK+GdrnkfcozXBqsywP99OrekMmZyWyzy4E
         K0Fhb4lPAn9GhI36CPAAimK1lUJ3jRSaQOkS+mR2uluVbiSyZ6c19qlGk6jNVXwGpKWo
         1HFX/+jn5kSnliheRv/D9oZpJ0LvvpmYO4U2aywIgocuj+f/OtIYQ1sfBas4B3t8AxCM
         Khe/gg9ab/GEnwhieqG70rP8s0aXoCVwePC2ZoQdCFPDjVfGKP4adKtEziT+SFCwaFsa
         EyyA==
X-Gm-Message-State: AOAM530yXzczOvK/QSyb+80tkUhu5sNPI9zKSoX813Gi0jzTHnSxFrym
        0I/sdotV1A+dF3l2cEaJ0h9uiaAxmcRwWw==
X-Google-Smtp-Source: ABdhPJxz9yT9tsZe5mE5ngDXEAvTcrceEwOE2Y3cop4P28WpelJaTioqzlaaDP4Bb7K0sWErvZ+lGg==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr22772357wmh.69.1621246925719;
        Mon, 17 May 2021 03:22:05 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q20sm22993755wmq.2.2021.05.17.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:22:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 17 May 2021 11:22:04 +0100
Message-Id: <CBFG2JD1VULN.1X0LM7P1K63Q9@arch-thunder>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
Cc:     <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
        <linux-imx@nxp.com>, "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Marek Vasut" <marex@denx.de>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Dorota Czaplejewicz" <dorota.czaplejewicz@puri.sm>
Subject: Re: [RFC PATCH 3/3] media: imx: imx7-media-csi: Don't set PIXEL_BIT
 in CSICR1
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210516024216.4576-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Sun May 16, 2021 at 3:42 AM WEST, Laurent Pinchart wrote:

> The PIXEL_BIT field of the CSICR1 register is documented as setting the
> Bayer data width to 10 bits, and is set by the driver for all non-YUV
> pixel formats. Test code from NXP showed that the bit shouldn't be set
> for Bayer formats, and this was confirmed by experimentation with RAW8
> capture (which doesn't work when setting the field) and RAW10 capture
> (for which setting the field doesn't seem to make a difference) on
> i.MX8MM with an OV5640 sensor connected over CSI-2. Don't set it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging=
/media/imx/imx7-media-csi.c
> index 256b9aa978f0..94ee8d9838ee 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -495,21 +495,6 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  			cr18 |=3D BIT_MIPI_DATA_FORMAT_YUV422_8B;
>  			break;
>  		}
> -
> -		switch (out_pix->pixelformat) {
> -		case V4L2_PIX_FMT_Y10:
> -		case V4L2_PIX_FMT_Y12:
> -		case V4L2_PIX_FMT_SBGGR8:
> -		case V4L2_PIX_FMT_SGBRG8:
> -		case V4L2_PIX_FMT_SGRBG8:
> -		case V4L2_PIX_FMT_SRGGB8:
> -		case V4L2_PIX_FMT_SBGGR16:
> -		case V4L2_PIX_FMT_SGBRG16:
> -		case V4L2_PIX_FMT_SGRBG16:
> -		case V4L2_PIX_FMT_SRGGB16:
> -			cr1 |=3D BIT_PIXEL_BIT;
> -			break;
> -		}

LGTM

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

>  	}
> =20
>  	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
> --=20
> Regards,
>
> Laurent Pinchart



