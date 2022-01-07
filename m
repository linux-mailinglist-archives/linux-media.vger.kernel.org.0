Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA762487579
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 11:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346679AbiAGK1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 05:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbiAGK1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 05:27:40 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15289C061245
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 02:27:40 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h10so11904wrb.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=HdaFw92WZVFceIic2qaZlW0CNDac7tpvaX7wj/hCx3c=;
        b=mB80gQYCZIoNVsan93acHI15teiUgQJsaNtWmjOI+AR0LxNLVYYW5Qx/6g0nvdCmiC
         9LM+tJErhz0lEpdZZXNlJxYusDulrkKNmfLEVu+G2aivqTu3Ig97ay9fH68W1c09fcpQ
         IMUJBebZH2S+OvUnHilkmz2AYH4Wj5q9tn/IuU1vGNzHu+C5VaZO8+PdOZGPPQujTQM6
         hNCVGoIFVvuR7t8eMg76C02bZK7AvFfGyP4xet4oLxUD451D5Kb8Lf/95cczOeLB5f+k
         Bb3H4J1ZTgCEh+jsYtLnFmmNu4ZLQSY5TRowqNTrg+r79Mgvxl7leFu9ubw0T/cWum1b
         fhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=HdaFw92WZVFceIic2qaZlW0CNDac7tpvaX7wj/hCx3c=;
        b=fJUAjnFdR6b5ILwhMKY7VTwoYvrKLhk0oarmQGSOKB9TmSJmf59ENWifGEk+Fnz8UZ
         7VQAXFIK6v8gZMZCRCQ3mt2XRWJ5/CygpIniGjK+xxFt+IWaW0SWlivq2N3XiPgr2PIp
         0X2NF4FYiyePbhJxrC3edLCNH5fTlvUGXPJJgjn9i1mNSeP+2HulcVS+rMsTMWXP0AcE
         OyRTAh4RU8C8/LrkKaD6IpZttFzfK4Fp40QitcJZxqKadq0HtSKNnZvufF47I0qeYca0
         z2MrQ+i9IvTVe6n0E1GYBoaQaS9xtm8IBDUJpisFj4j3mwJ/L5iyo4V3tydi+3WCVzeu
         vydQ==
X-Gm-Message-State: AOAM5301VG3kCXwgVHfKKHprDtz5u1I3GXSbG5NN5YrkkAgfaoUfP1He
        fb6ATfHTvzjjk8vCcLDgr0xFMCFu3pfvSA==
X-Google-Smtp-Source: ABdhPJzqY6NDxC1Dt9S/IqDYL/LYgSMLKW4r8lqWxn0x/r/1v4a+YCht+eEXKqjT1KpPaO/WiokEzQ==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr5486410wrm.368.1641551258627;
        Fri, 07 Jan 2022 02:27:38 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id e13sm7546707wmq.10.2022.01.07.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:27:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 07 Jan 2022 10:27:37 +0000
Message-Id: <CGZDCSRXA4WH.2JN40TTYH62UX@arch-thunder>
Cc:     "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_Brunet?= <jbrunet@baylibre.com>,
        "Sakari Ailus" <sakari.ailus@iki.fi>
Subject: Re: [PATCH v1 3/3] staging: media: imx: imx7-mipi-csis: Make subdev
 name unique
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
 <20220106172441.7399-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220106172441.7399-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for the patch.

On Thu Jan 6, 2022 at 5:24 PM WET, Laurent Pinchart wrote:

> When multiple CSIS instances are present in a single graph, they are
> currently all named "imx7-mipi-csis.0", which breaks the entity name
> uniqueness requirement. Fix it by using the device name to create the
> subdev name.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Maybe a Fix tag here to make sure it is backported, since this look to
me a legit bug fix for multiple instances.

Other than that LGTM.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index d7bcfb1a0c52..6443cca817fe 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -32,7 +32,6 @@
>  #include <media/v4l2-subdev.h>
> =20
>  #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
> -#define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
> =20
>  #define CSIS_PAD_SINK				0
>  #define CSIS_PAD_SOURCE				1
> @@ -313,7 +312,6 @@ struct csi_state {
>  	struct reset_control *mrst;
>  	struct regulator *mipi_phy_regulator;
>  	const struct mipi_csis_info *info;
> -	u8 index;
> =20
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
> @@ -1329,8 +1327,8 @@ static int mipi_csis_subdev_init(struct csi_state *=
state)
> =20
>  	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
>  	sd->owner =3D THIS_MODULE;
> -	snprintf(sd->name, sizeof(sd->name), "%s.%d",
> -		 CSIS_SUBDEV_NAME, state->index);
> +	snprintf(sd->name, sizeof(sd->name), "csis-%s",
> +		 dev_name(state->dev));
> =20
>  	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sd->ctrl_handler =3D NULL;
> --=20
> Regards,
>
> Laurent Pinchart



