Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89872487577
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 11:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237382AbiAGK1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 05:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbiAGK1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 05:27:18 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6F9C061245
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 02:27:18 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l10so10173315wrh.7
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=6fvnfCcgHTVD21BABpUSMgE3sZTecBjD8MVblWXg7/0=;
        b=cjNzEgmwwT6/2unkW+RuDhFn3MsWmILnI04v3lqlvcUB02xwVAkrpf90V+qzLdGIep
         PO0exmSTfvms+jVvm4ibDCLHKTSGJHRPbFs9UjQlRNB8rLqB8bNegv2vdUVguphFSwdr
         eT1eHhG+sZz6VfuZ419RL03URyFbjoO712eX5Fep+ooaD36MmUATe9aH0aiqsJo8gxfr
         2863XkctLpK30ahOYdmi8otMq+WBwS0f36tCmof/O36rkKaK6qH+8AKDGfkJvFgxR3CN
         mHx06cRItu6eJqjIXkuWg6GbA9wGUHvyGO4DZK5vdQB8OWE1qKhNAvDcSSokMoKiQuO2
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=6fvnfCcgHTVD21BABpUSMgE3sZTecBjD8MVblWXg7/0=;
        b=SCVGZf4NCzYcmd5XSDMbTNrWnYDI/JgoMyHsVnipFB0gXFvogM5mcwq/p7RwJWpW4X
         FY0JlFmXXCjPFJ1FEaPc+E9g3/BiCN9T149SEcRMHBhbqA3mtfNuWvg6vcycK/cr+Wpj
         789H2Af4MjjRQFHbJe5TkQzJEDivRZLCnxMW0eQ/7+aV9+YLTlUIBUpEhF0f5U+zT966
         aRseXumdRI4GpupMZ8jskZlBX1MqgtQyxhu1TjTAJWGWtMjcXOASQ6W6mFjfGbL2eVjf
         Qxz+0dS4g6X+Nifj968uOVrY/S17lAx15ZWE9Ux5zmZazpBKO2EH37AhPKlHbJkbHfQp
         F2BQ==
X-Gm-Message-State: AOAM532OOv1RGdzuLCEVmedR7TltcOGOhQuiDq6jm/xeNpdnjDvtOge2
        ZaWULn8gZaVnXAS5qrLShWPk9aq5Txw=
X-Google-Smtp-Source: ABdhPJzZlefZjkszZvu5FLRZvVGBr6IGUh4pH9kPmnHH99VZlZbzXajchrYqQ8lc+nZ0GaYLVONfZw==
X-Received: by 2002:a05:6000:181b:: with SMTP id m27mr52057442wrh.43.1641551236861;
        Fri, 07 Jan 2022 02:27:16 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id bh10sm7406864wmb.12.2022.01.07.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:27:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 07 Jan 2022 10:27:15 +0000
Message-Id: <CGZDCIRYLPQT.217SV6EJC52BS@arch-thunder>
Cc:     "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_Brunet?= <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 1/3] staging: media: imx: imx7-mipi-csis: Dump
 MIPI_CSIS_FRAME_COUNTER_CH0 register
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
 <20220106172441.7399-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220106172441.7399-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu Jan 6, 2022 at 5:24 PM WET, Laurent Pinchart wrote:

> The frame counter is useful debugging information, add it to the
> register dump printed by mipi_csis_dump_regs().
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
LGTM

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index 2b73fa55c938..c9c0089ad816 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -211,6 +211,8 @@
>  #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
>  #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
> =20
> +#define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
> +
>  /* Non-image packet data buffers */
>  #define MIPI_CSIS_PKTDATA_ODD			0x2000
>  #define MIPI_CSIS_PKTDATA_EVEN			0x3000
> @@ -773,6 +775,7 @@ static int mipi_csis_dump_regs(struct csi_state *stat=
e)
>  		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
>  		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
>  		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
>  	};
> =20
>  	unsigned int i;
> --=20
> Regards,
>
> Laurent Pinchart



