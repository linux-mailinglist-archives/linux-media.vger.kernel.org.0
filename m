Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B455DA906
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 11:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392771AbfJQJqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 05:46:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46585 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfJQJqo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 05:46:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so1526600wrv.13;
        Thu, 17 Oct 2019 02:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=HKy0scgKD2Yqtf85mglqediv2brLo+GCB1Q93X6euAo=;
        b=WuaWhX4a2YttbDW1uaoNrQa8MGElT2XHF+EH1vrh+FhKdJ7zerR1iOBaQLR9V4And+
         erCM0k4fsG6I7tXe/gPaplriKFpi/DpIms4+UWhyO2pqsec85FYZ7IV8Q/U9D7EZSpEd
         t0jAjzctzu/mzoif0XszF32ycjQ0+Nx0WpFXKbaDOIfwcWtyPV0ercNjE40OrDdqKyk0
         pnOkfP29TCzKCCAo+9GQwF15UJ+hZ02YJ3UgvX/Rt8LB6aK+PeYivQUHZDhlHDY/eidf
         82uy2VQ8ZWMCPe2sNLnAlOBcYmCOk8DP9tForqbHLWTLfhZVKYG7+m4Jsu5aiHRmkO7Y
         qOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=HKy0scgKD2Yqtf85mglqediv2brLo+GCB1Q93X6euAo=;
        b=Klfd3UWZDrHsk2MV6fPNStIXBtgXKvGQJ4adyw3xhbdUXNnVx+q+exblCYpvjrgyuX
         10IJwFqh1bhn7YpSAEBecBdTPyY630yyEptsGhUAXk1z03y+zn0MKCVT7Ml9uSxq/smW
         Oym+CrT6A4e+XsIVA2S4jLSmSo0jJbizKHLEgUZEO9Vth2z+DQOHnu53WeZTp1jQ9HA6
         nNvbpvi1nadDzZ5bgMe1NMZPjvdLYXRlaFqcq/qHizqBGlZN1bjXuFnCIAPQirlC6ZIj
         Zr+0IMM5eKMc+D20tuvoIf1GqCOK47AwrU0lKm7MwipO4wFFM9gCTeLThj/0OTuR8Zax
         IxtA==
X-Gm-Message-State: APjAAAWL6ZsRM/e4eiG9u1xE82Ph+euxUGO+oSdTUmaSgtjy/mT5O4Oo
        AbXBbd0wuo7zE9lPLPrU78p2qKJBbcU=
X-Google-Smtp-Source: APXvYqxrXHe+FRRJ2WwWs57//iOV5M+rIWiIDpk9WzExeUemaBkFY9x6xk6p7+jfLAgGOzcY00CGjQ==
X-Received: by 2002:adf:f547:: with SMTP id j7mr2346059wrp.26.1571305601811;
        Thu, 17 Oct 2019 02:46:41 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id w17sm1678983wra.34.2019.10.17.02.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:46:41 -0700 (PDT)
References: <20191015135915.6530-1-hslester96@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: imx7-mipi-csis: Add a check for
 devm_regulator_get
In-reply-to: <20191015135915.6530-1-hslester96@gmail.com>
Date:   Thu, 17 Oct 2019 10:46:38 +0100
Message-ID: <m3zhhzr9fl.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,
many thanks for the patch.

On Tue 15 Oct 2019 at 14:59, Chuhong Yuan wrote:
> devm_regulator_get may return an error but mipi_csis_phy_init misses
> a check for it.
> This may lead to problems when regulator_set_voltage uses the unchecked
> pointer.
> This patch adds a check for devm_regulator_get to avoid potential risk.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

> ---
> Changes in v2:
>   - Add a check in mipi_csis_probe for the modified mipi_csis_phy_init.
>
>  drivers/staging/media/imx/imx7-mipi-csis.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 73d8354e618c..e8a6acaa969e 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -350,6 +350,8 @@ static void mipi_csis_sw_reset(struct csi_state *state)
>  static int mipi_csis_phy_init(struct csi_state *state)
>  {
>  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
> +	if (IS_ERR(state->mipi_phy_regulator))
> +		return PTR_ERR(state->mipi_phy_regulator);
>
>  	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
>  				     1000000);
> @@ -966,7 +968,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>
> -	mipi_csis_phy_init(state);
> +	ret = mipi_csis_phy_init(state);
> +	if (ret < 0)
> +		return ret;
> +
>  	mipi_csis_phy_reset(state);
>
>  	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
