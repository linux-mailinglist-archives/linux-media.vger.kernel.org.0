Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842646E5D81
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 11:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjDRJed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 05:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjDRJeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 05:34:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C28A6E8E
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 02:34:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCA06127D;
        Tue, 18 Apr 2023 11:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681810454;
        bh=DcyR3TugJBSvWYo6H5+J4MYHNLWI7TCjYdL4toCds1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S2AN13RC2z+Raz07Laph9QkNIAU2LbsJO1Im+Sd1kBWBiL9/Yhi/68vdQdCy3C+p5
         zSsRSEe+FYXLFnPQ8eMsf2LS5pnY+HNWl0p8BzhAfnbQqBt+aUlxPIaKB1VRN60o6l
         84iTGvvFw05+IARu1BpGbQuoFgzzAjUpjLRTjOvU=
Date:   Tue, 18 Apr 2023 12:34:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] media: imx: imx7-media-csi: Remove interlave
 fields
Message-ID: <20230418093431.GA11510@pendragon.ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
 <20230418071439.197735-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418071439.197735-3-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Tue, Apr 18, 2023 at 09:14:38AM +0200, Alexander Stein wrote:
> Interlaced mode is currently not supported, so disable fields in try_fmt.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index bd649fd9166fd..1508f6ba20e91 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1178,6 +1178,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,

You should also drop the following code in the same function:

	/* Allow IDMAC interweave but enforce field order from source. */
	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
		switch (pixfmt->field) {
		case V4L2_FIELD_SEQ_TB:
			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
			break;
		case V4L2_FIELD_SEQ_BT:
			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
			break;
		default:
			break;
		}
	}

>  	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);
>  	pixfmt->bytesperline = stride;
>  	pixfmt->sizeimage = stride * pixfmt->height;
> +	pixfmt->field = V4L2_FIELD_NONE;
>  
>  	if (compose) {
>  		compose->width = pixfmt->width;

-- 
Regards,

Laurent Pinchart
