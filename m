Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F305F574AC6
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbiGNKhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiGNKhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:37:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3574B49F;
        Thu, 14 Jul 2022 03:37:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4EA7383;
        Thu, 14 Jul 2022 12:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657795022;
        bh=ZNJKxj8dPKz9a/sjGzScCu7YyGk1pfDSv59mnPohi/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Piaj4HamSjpaaOfpLGySbir7ziLgnQgUTypOaS8JTkYi35/g2V2ixbNts8VY5xMoJ
         nY4cF913MGzbxMRNUQlxq0iZ+ndtu7/GwZoDSmWzE+2LEWWJNxbcGzAVbY5HXokZye
         rGglwU94E60soETmL9PNrfzV5S4VHx/yqGtF/wrc=
Date:   Thu, 14 Jul 2022 13:36:31 +0300
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
Subject: Re: [PATCH v2 2/6] media: xilinx: video: Add 1X12 greyscale format
Message-ID: <Ys/xr5LmbI83JeDc@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <e2ea1840b666ad0b4ff169b4f58c85bc0291af59.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2ea1840b666ad0b4ff169b4f58c85bc0291af59.1657786765.git.vkh@melexis.com>
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

On Thu, Jul 14, 2022 at 11:34:44AM +0300, Volodymyr Kharuk wrote:
> Extend the xilinx video driver with Y12_1X12 greyscale format
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-vip.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
> index a0073122798f..5b214bf7f93a 100644
> --- a/drivers/media/platform/xilinx/xilinx-vip.c
> +++ b/drivers/media/platform/xilinx/xilinx-vip.c
> @@ -40,6 +40,8 @@ static const struct xvip_video_format xvip_video_formats[] = {
>  	  1, V4L2_PIX_FMT_SGBRG8 },
>  	{ XVIP_VF_MONO_SENSOR, 8, "bggr", MEDIA_BUS_FMT_SBGGR8_1X8,
>  	  1, V4L2_PIX_FMT_SBGGR8 },
> +	{ XVIP_VF_MONO_SENSOR, 12, "mono", MEDIA_BUS_FMT_Y12_1X12,
> +	  2, V4L2_PIX_FMT_Y12 },
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
