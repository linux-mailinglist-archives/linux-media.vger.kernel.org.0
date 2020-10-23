Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750AA2976B0
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463268AbgJWSNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S371522AbgJWSNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:13:36 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F173C0613CE;
        Fri, 23 Oct 2020 11:13:36 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so3606576ejc.5;
        Fri, 23 Oct 2020 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J4Eh2qaJksTCTY1k45teLXaWXNH/ycvD9ltpm944k0Q=;
        b=lFi+TwD2vaAsrYHdJUzkp6N61fIOnh9+vKHJEudtGhn9CdTxA44JxC28ilTy4/53iD
         ZVNwMOqKf0jPH8k5codeD54T6uVec8mcd9Bk4K5U4bma2IoUpueoyD9uSEy78ml8VzRO
         LNcsCN+TUIF596XouiRcRboHJoyDTnt8yBoYr3qu92wlW8KRgB+TzWYlVReuER3Y9eT2
         jBaT+9DrkKSorVSnG5g4Zfn+XCrfUPJ/o91TjhXX9BrbjUxSp4dT1zTe6EkvYKk2TaPf
         aS6qcZz5zum5mdHIKGuv52mVvYKDP6G+CICO+eYC4YmEc1rzn+QCRmmtN+LFmBJpr+C0
         zX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J4Eh2qaJksTCTY1k45teLXaWXNH/ycvD9ltpm944k0Q=;
        b=knBbwYtSYwd0LSk7WLikukwbQiYOrhDlw4uQPcTrYtujXE3lLVQFr15dpoS6rYOb+U
         dwwF4ECWn7AKPVIYP9HoMySLRVDOEkFKl/Dd2yfP92Zs51jFMyCQAK/o9IAPb2+wTbGN
         7PCkGbkn15y9aXidN77eDFxZs9pHtrhtoayk4D1r1gneuy96i2BZAlx/Kqs5woaQ/liX
         jghI7txD8oxUtJHNjt7LkhuJ4MoYZxYFagisZfgYyfzOQvHB5QadHe05XnnSC6RcXriP
         YJDXcZ94Xr+A0qxGqWlr0wHnWt6NkqzbExgYlra3X0lYZ20Whb9UnBVFgx2oF/Uxqctx
         /XPg==
X-Gm-Message-State: AOAM531xyWfB4yg8rnp+RaxjhlyCsRGESwltdZhmMa0P8H/fy50zAMnM
        4lE23ZULbmmHjiMVvIj4ZCxg7Bz/Pw0m3w==
X-Google-Smtp-Source: ABdhPJw4MiBcK6lhwt3Mpbwm8hf16I6Hw1+0s7bS8R/2YorDzTQE48+QOyklgXhBBgNG0ZQGdqDUyg==
X-Received: by 2002:a17:906:12cf:: with SMTP id l15mr3434340ejb.540.1603476814307;
        Fri, 23 Oct 2020 11:13:34 -0700 (PDT)
Received: from kista.localnet (cpe1-5-97.cable.triera.net. [213.161.5.97])
        by smtp.gmail.com with ESMTPSA id k23sm1231498ejk.0.2020.10.23.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:13:32 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        paul.kocialkowski@bootlin.com
Subject: Re: [linux-sunxi] [PATCH 01/14] phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
Date:   Fri, 23 Oct 2020 20:18:58 +0200
Message-ID: <7673189.jqQXtdQLJ6@kista>
In-Reply-To: <20201023174546.504028-2-paul.kocialkowski@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com> <20201023174546.504028-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne petek, 23. oktober 2020 ob 19:45:33 CEST je Paul Kocialkowski napisal(a):
> As some D-PHY controllers support both Rx and Tx mode, we need a way for
> users to explicitly request one or the other. For instance, Rx mode can
> be used along with MIPI CSI-2 while Tx mode can be used with MIPI DSI.
> 
> Introduce new MIPI D-PHY PHY submodes to use with PHY_MODE_MIPI_DPHY.
> The default (zero value) is kept to Tx so only the rkisp1 driver, which
> uses D-PHY in Rx mode, needs to be adapted.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c |  3 ++-
>  include/linux/phy/phy-mipi-dphy.h         | 13 +++++++++++++

I think some changes are missing in this patch. For example, 
phy_set_mode_ext() must be modified to take another argument, otherwise change 
of rkisp1-isp driver doesn't make much sense.

Best regards,
Jernej

>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/
media/rkisp1/rkisp1-isp.c
> index 6ec1e9816e9f..0afbce00121e 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -902,7 +902,8 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp 
*isp,
>  
>  	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt-
>bus_width,
>  					 sensor->lanes, cfg);
> -	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> +	phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> +			 PHY_MIPI_DPHY_SUBMODE_RX);
>  	phy_configure(sensor->dphy, &opts);
>  	phy_power_on(sensor->dphy);
>  
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-
dphy.h
> index a877ffee845d..0f57ef46a8b5 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -6,6 +6,19 @@
>  #ifndef __PHY_MIPI_DPHY_H_
>  #define __PHY_MIPI_DPHY_H_
>  
> +/**
> + * enum phy_mipi_dphy_submode - MIPI D-PHY sub-mode
> + *
> + * A MIPI D-PHY can be used to transmit or receive data.
> + * Since some controllers can support both, the direction to enable is 
specified
> + * with the PHY sub-mode. Transmit is assumed by default with phy_set_mode.
> + */
> +
> +enum phy_mipi_dphy_submode {
> +	PHY_MIPI_DPHY_SUBMODE_TX = 0,
> +	PHY_MIPI_DPHY_SUBMODE_RX,
> +};
> +
>  /**
>   * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>   *
> -- 
> 2.28.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups 
"linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an 
email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/
linux-sunxi/20201023174546.504028-2-paul.kocialkowski%40bootlin.com.
> 


