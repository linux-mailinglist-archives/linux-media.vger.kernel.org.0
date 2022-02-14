Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762534B4D4C
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 12:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349767AbiBNKzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 05:55:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349788AbiBNKzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 05:55:04 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAE77D281
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 02:21:00 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p9so13463196ejd.6
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=3acC942XOkSMbMJ+3TBUiXHSvzV2i5tsHNRcDSPAh74=;
        b=HiDzzFzDboiPPjHWFFslX/Ug7hj3iXoU3sa846oVoeHBryTRX8IywRo67+QMdKB1z4
         ZH4kTbK83O3cwUEcfOfhaCTyhymPNLeSpYUVumdcZ23GFWn9eOGevULbQvdEMPOgSPlh
         YIrXwsRL/Behvu69lFzsLZP0ONE8W3GnxtnNLXy73I6wfoque8o+cpHo49rJT4a/ShjX
         FM9IpEetlzQpzjA21Qbke/dcFImPQJSrYznZAOVMl5S6aZDpr+Q0xQ9SRC6J7XcJqh7J
         KdsjMzF43WicGJrNPgxfHjIUjIsjj7WJpeXb6n/NEl+IUP/bdffjNn0liQrxIZpD+q5I
         swYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=3acC942XOkSMbMJ+3TBUiXHSvzV2i5tsHNRcDSPAh74=;
        b=FHxdCqdCgD2WBFlJ/qInbkaedPfOAb6nfdadcLbsYfKbN9mgQ5K9Rtg6oR0STpjCN4
         HtkmcwcDTLSbnsaFV6doOONFnKF3L+VQ8PtvvzcRWm/OIkhdK3sbbkeiF5+7JvmAy3wJ
         Nz9fFB2gnFMZYmAt5LYELNhlLeXUWgWbxm/znrnipppxA1Tuee2C9DStZqo7jNxpfsG3
         lo/EOPgwDjTRb1QGQBEAAxpMyyXxL8m9ahmzW6FiuDkw3Qno741mUR0xfiXTSB4NnkyM
         rWBinhN3OYRWNDVw27NoevrVMC2O5RwT3QD1q4YUVdWm+X2tmPVPnG+addVxjzJNQw2D
         QZ3g==
X-Gm-Message-State: AOAM531lvPM8w4ZuJ0dejOZmB943S8XiqK6oRZ1ZoNWFadjnwJeJ2Y3L
        DVexLYGw6uwVMZ85EYHwrL0=
X-Google-Smtp-Source: ABdhPJwvBnVyU5QPkbEJVYpg7/PgRa1gL06w4Xg9ZZIxt03PD9/YJgSW4GQoC/KmmRxXVHLO+Jh6JA==
X-Received: by 2002:a17:906:7497:: with SMTP id e23mr4685706ejl.403.1644834059047;
        Mon, 14 Feb 2022 02:20:59 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id d4sm7758736eje.21.2022.02.14.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:20:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 14 Feb 2022 10:20:57 +0000
Message-Id: <CHVP0EFTUAMC.2NPFPZMC5ACNW@arch-thunder>
Cc:     <kernel@pengutronix.de>, <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Jacopo Mondi" <jacopo@jmondi.org>, <slongerbeam@gmail.com>,
        <p.zabel@pengutronix.de>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <festevam@gmail.com>,
        <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <martin.kepplinger@puri.sm>,
        <xavier.roumegue@oss.nxp.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jacopo,
I think you by now saw the kernel test report.

You miss the rename in the makefile also.

------
Cheers,
     Rui
On Fri Feb 11, 2022 at 6:02 PM WET, Jacopo Mondi wrote:

> Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
>
> The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> specify a SoC version number in the driver name.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                                     | 2 +-
>  .../media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c}    | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c=
} (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bdb8c881b0b..7def3b7d56bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> +F:	drivers/media/platform/imx/imx-mipi-csis.c
>  F:	drivers/staging/media/imx/imx7-media-csi.c
> =20
>  MEDIA DRIVERS FOR HELENE
> diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/=
platform/imx/imx-mipi-csis.c
> similarity index 100%
> rename from drivers/media/platform/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx-mipi-csis.c
> --=20
> 2.35.0



