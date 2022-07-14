Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D48574AA9
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiGNKc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238171AbiGNKc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:32:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEB947B9A;
        Thu, 14 Jul 2022 03:32:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 570D3383;
        Thu, 14 Jul 2022 12:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657794776;
        bh=HnMIUFCJLTwFru36b+GIG3S0tJwBq2H0q0ZrpPHJrdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t2UeNFZMtJP5YlYXobm18dvciheT6VlHptNiWqPc939uH8nrxxX3ZsurpkVYN/JQu
         QCle0fHApePISQrr+8y4wiBcuKoulNMmtXypCj6A11PlkkELfa07L4gzNF9hD54VCv
         c2rkYzSQkPKnotWeAl+QKWE5IwEd83ElYLuHUheI=
Date:   Thu, 14 Jul 2022 13:32:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Volodymyr Kharuk <vkh@melexis.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: xilinx: csi2rxss: Add 1X12 greyscale format
Message-ID: <Ys/wuXUh6Ub40Qp6@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <68fc9d4edfff563995a1b3d452b57735b00ab364.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68fc9d4edfff563995a1b3d452b57735b00ab364.1657786765.git.vkh@melexis.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

Thank you for the patch.

On Thu, Jul 14, 2022 at 11:34:43AM +0300, Volodymyr Kharuk wrote:
> Extend the csi2rxss with Y12_1X12 greyscale format
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 051c60cba1e0..67574244eb2b 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -188,6 +188,7 @@ static const u32 xcsi2dt_mbus_lut[][2] = {
>  	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SBGGR12_1X12 },
>  	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGBRG12_1X12 },
>  	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_SGRBG12_1X12 },
> +	{ MIPI_CSI2_DT_RAW12, MEDIA_BUS_FMT_Y12_1X12 },
>  	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SRGGB16_1X16 },
>  	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SBGGR16_1X16 },
>  	{ MIPI_CSI2_DT_RAW16, MEDIA_BUS_FMT_SGBRG16_1X16 },

-- 
Regards,

Laurent Pinchart
