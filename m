Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D64B640E
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 08:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbiBOHNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 02:13:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbiBOHNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 02:13:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB52B150B
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 23:12:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDF68315;
        Tue, 15 Feb 2022 08:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644909171;
        bh=4kFMB/5UvwoYw/mOv1FDH9t4bxS/bNvj7bYI2KQR6NU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vs+OO9DncyuX6BGPzAnh14JwBsCWfY3+TKsAtWaKSZcuceQUWdLxvuHGtVkuqI/lp
         f3Frzvp3JLRI326LOrGz6PyeAOvf8AajeH0b5YX5aymwjfj2bgBsFrqBx51nhDDwQ5
         0pkNFq8hThcLcOqmcUDK8UfBQyxcOj5fongrcruI=
Date:   Tue, 15 Feb 2022 09:12:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] staging: media: imx: Use DUAL pixel mode if available
Message-ID: <YgtSbEjr9KID81eI@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214184318.409208-6-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 14, 2022 at 07:43:15PM +0100, Jacopo Mondi wrote:
> The pixel sampling mode controls the size of data sampled from the CSI
> Rx queue. The supported sample size depends on the configuration of the
> preceding block in the capture pipeline and is then dependent on the SoC
> version the CSI peripheral is integrated on.
> 
> When capturing YUV422 data if dual sample mode is available use it.
> 
> This change is particularly relevant for the IMX8MM SoC which uses the
> CSIS CSI-2 receiver which operates in dual pixel mode.
> 
> Other SoCs should be unaffected by this change and should continue to
> operate as before.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 112096774961..a8bdfb0bb0ee 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -426,6 +426,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  {
>  	struct imx_media_video_dev *vdev = csi->vdev;
>  	struct v4l2_pix_format *out_pix = &vdev->fmt;
> +	struct imx_media_dev *imxmd = csi->imxmd;
>  	int width = out_pix->width;
>  	u32 stride = 0;
>  	u32 cr3 = BIT_FRMCNT_RST;
> @@ -436,7 +437,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  	cr18 &= ~(BIT_CSI_HW_ENABLE | BIT_MIPI_DATA_FORMAT_MASK |
>  		  BIT_DATA_FROM_MIPI | BIT_BASEADDR_CHG_ERR_EN |
>  		  BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> -		  BIT_DEINTERLACE_EN);
> +		  BIT_DEINTERLACE_EN | BIT_MIPI_DOUBLE_CMPNT);
>  
>  	if (out_pix->field == V4L2_FIELD_INTERLACED) {
>  		cr18 |= BIT_DEINTERLACE_EN;
> @@ -500,6 +501,13 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		case MEDIA_BUS_FMT_YUYV8_2X8:
>  		case MEDIA_BUS_FMT_YUYV8_1X16:
>  			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> +
> +			/* If dual mode is supported use it. */
> +			if (imxmd->info->sample_modes & MODE_DUAL) {
> +				cr18 |= BIT_MIPI_DOUBLE_CMPNT;
> +				cr3 |= BIT_TWO_8BIT_SENSOR;
> +			}

I would implement this differently:

		case MEDIA_BUS_FMT_UYVY8_2X8:
		case MEDIA_BUS_FMT_YUYV8_2X8:
			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
			break;

		case MEDIA_BUS_FMT_UYVY8_1X16:
		case MEDIA_BUS_FMT_YUYV8_1X16:
			cr3 |= BIT_TWO_8BIT_SENSOR;
			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B
			     |  BIT_MIPI_DOUBLE_CMPNT;
			break;

This would support either option here. What you will then need to change
is imx7_csi_enum_mbus_code() and imx7_csi_try_fmt(), to allow/disallow
the 2X8 and 1X16 variants based on the SoC. This is important for the
i.MX7, which has both a CSI-2 input and a parallel input. When using the
CSIS it can (and should) use double component mode, while when using the
parallel input it can work in 8-bit or 16-bit mode depending on how the
sensor is wired.

> +
>  			break;
>  		}
>  	}

-- 
Regards,

Laurent Pinchart
