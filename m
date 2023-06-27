Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA7673FD78
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjF0OMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjF0OLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:11:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AEA359B;
        Tue, 27 Jun 2023 07:11:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [193.85.242.128])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C7D110A;
        Tue, 27 Jun 2023 16:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687875055;
        bh=7Hc1d8oOHgOBTbIRoH4a/Rzr0+yr4EjZFHs0CndgT6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aQnQiQkUeicZnNgvNfR0+mZyn8vSSicvCKEoXBvk3AssJOPsg6XAKz2OgBDTGLwyw
         dgxYs1I8a/BkwAFknjrGDWYZbw3p4ztAQwDUPYrj9+tsb6TSxvW2O0N9x5BtbyEi6u
         F6kx0DyyQmkZ3s5i54T6J++yUfxHsX4SWo1V6hDg=
Date:   Tue, 27 Jun 2023 17:11:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Message-ID: <20230627141133.GC14185@pendragon.ideasonboard.com>
References: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
 <20230627062017.1135114-4-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230627062017.1135114-4-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

Thank you for the patch.

On Tue, Jun 27, 2023 at 02:20:17PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> i.MX93 use a different gasket which has different register definition
> compared with i.MX8. Hence implement the gasket callbacks in order to
> add ISI support for i.MX93.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 20 ++++++++++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 12 +++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 21 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index d645b2f6fa5a..24c40e4cfef5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -313,6 +313,25 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> +static const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> +	.enable = mxc_imx93_gasket_enable,
> +	.disable = mxc_imx93_gasket_disable,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx93_data = {
> +	.model			= MXC_ISI_IMX93,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8mn_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> +	.buf_active_reverse	= true,
> +	.gasket_ops		= &mxc_imx93_gasket_ops,
> +	.has_36bit_dma		= false,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -524,6 +543,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 4f920d650153..f5be5394981e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -73,6 +73,11 @@ struct v4l2_m2m_dev;
>  #define GASKET_HSIZE				0x0004
>  #define GASKET_VSIZE				0x0008
>  
> +/* dispmix_GPR register (i.MX93 only) */
> +#define DISP_MIX_CAMERA_MUX                     0x30
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +
>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>  
> @@ -172,6 +177,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX93,
>  };
>  
>  struct mxc_isi_plat_data {
> @@ -407,6 +413,12 @@ int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
>  			   const unsigned int port);
>  void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
>  
> +int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> +			    const struct v4l2_mbus_frame_desc *fd,
> +			    const struct v4l2_mbus_framefmt *fmt,
> +			    const unsigned int port);
> +void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
> +
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  void mxc_isi_debug_init(struct mxc_isi_dev *isi);
>  void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index 39f8d0e8b15d..a81c4249a26f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -30,3 +30,24 @@ void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port)
>  {
>  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
>  }
> +
> +/* Configure and enable gasket for i.MX93 */
> +int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> +			    const struct v4l2_mbus_frame_desc *fd,
> +			    const struct v4l2_mbus_framefmt *fmt,
> +			    const unsigned int port)
> +{
> +	u32 val;
> +
> +	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> +	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> +
> +	return 0;
> +}
> +
> +void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> +			      unsigned int port)
> +{
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
> +}

-- 
Regards,

Laurent Pinchart
