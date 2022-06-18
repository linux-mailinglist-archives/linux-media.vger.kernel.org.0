Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECFA5500BC
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383687AbiFQX0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbiFQX0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:26:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7F16622D
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:26:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0B2B383;
        Sat, 18 Jun 2022 01:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655508394;
        bh=o+r2KdCWEcp02NRnDAXWwerltH9tsnM+Z0GU1n+UE4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FRbXAr7k9iwTVFHwaz8onrtAUWPjGYDGN1ZkU458DNspYwU9rVJLNYglUWH54vJLN
         d0CRm8Osz7fCqXVx/hG3QnWIyjxLnEsR2vkki1oL88ATy4rxUVz/TMLd2DRuODhMSA
         PuGk9mpnejj/+5xE8VaYfKkd7Q1BLL5x84GoTnEE=
Date:   Sat, 18 Jun 2022 02:26:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 48/55] media: rkisp1: Add match data for i.MX8MP ISP
Message-ID: <Yq0NnksDldH1PDfp@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-49-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-49-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Wed, Jun 15, 2022 at 04:11:20AM +0900, Paul Elder wrote:
> Add match data to the rkisp1 driver to match the i.MX8MP ISP.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++++++++++
>  include/uapi/linux/rkisp1-config.h            |  3 +++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 62fa2bd275fe..3a0115bdcee5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -486,6 +486,24 @@ static const struct rkisp1_info rk3399_isp_info = {
>  	.features = RKISP1_FEATURE_MIPI_CSI2,
>  };
>  
> +static const char * const imx8mp_isp_clks[] = {
> +	"isp",
> +	"hclk",
> +	"aclk",
> +};
> +
> +static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> +	{ NULL, rkisp1_isr },
> +};
> +
> +static const struct rkisp1_info imx8mp_isp_info = {
> +	.clks = imx8mp_isp_clks,
> +	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> +	.isrs = imx8mp_isp_isrs,
> +	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> +	.isp_ver = IMX8MP_V10,
> +};
> +
>  static const struct of_device_id rkisp1_of_match[] = {
>  	{
>  		.compatible = "rockchip,px30-cif-isp",
> @@ -495,6 +513,10 @@ static const struct of_device_id rkisp1_of_match[] = {
>  		.compatible = "rockchip,rk3399-cif-isp",
>  		.data = &rk3399_isp_info,
>  	},
> +	{
> +		.compatible = "fsl,imx8mp-isp",
> +		.data = &imx8mp_isp_info,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 583ca0d9a79d..40677d47825c 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -140,12 +140,15 @@
>   * @RKISP1_V11: declared in the original vendor code, but not used
>   * @RKISP1_V12: used at least in rk3326 and px30
>   * @RKISP1_V13: used at least in rk1808
> + * @IMX8MP_V10: used in at least imx8mp
>   */
>  enum rkisp1_cif_isp_version {
>  	RKISP1_V10 = 10,
>  	RKISP1_V11,
>  	RKISP1_V12,
>  	RKISP1_V13,
> +	/* TODO Choose a better version for this */
> +	IMX8MP_V10,

Time to address this ? :-)

Does anyone know where the current versioning scheme come from ?

>  };
>  
>  enum rkisp1_cif_isp_histogram_mode {

-- 
Regards,

Laurent Pinchart
