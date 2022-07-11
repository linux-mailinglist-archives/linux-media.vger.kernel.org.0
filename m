Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1F7570D86
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 00:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbiGKWoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 18:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiGKWoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 18:44:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD9376EAB
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 15:44:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93B4B30B;
        Tue, 12 Jul 2022 00:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657579447;
        bh=eKeNrlltdMposcLLDJRwcgcJvDjSvgD+ti2EY3/qM3c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFPKh1ONPPo61a5KS+UuiH6Ayw70mrepYE7sORlvI1Ci9PNAo706cS/oArfNKml9f
         /8Xt0z0YUIPXvD6s5jJlyjIiWf6i1lpX/PlkopQNd8mOOjcYKu1xpUY8RKvZQdAHT2
         8Cx3e9mMxq95et9C0EzxXgGPnDVAHn1OUAGQUAe4=
Date:   Tue, 12 Jul 2022 01:43:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] staging: media: imx: imx7-media-csi: Increase
 video mem limit
Message-ID: <YsynnMUcdhDBIIIz@pendragon.ideasonboard.com>
References: <20220709073100.158374-1-petko.manolov@konsulko.com>
 <20220709073100.158374-2-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220709073100.158374-2-petko.manolov@konsulko.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Thank you for the patch.

On Sat, Jul 09, 2022 at 10:31:00AM +0300, Petko Manolov wrote:
> Some high resolution (like Sony IMX492 47Mpix) sensors requre large amount space
> for buffering.  64MB is far from sufficient so this patch increases the limit to
> 512MB.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 0066af8d111f..c62f893cd769 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -160,7 +160,7 @@
>  
>  #define IMX7_CSI_VIDEO_NAME		"imx-capture"
>  /* In bytes, per queue */
> -#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
> +#define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_512M

The limit is really something that the V4L2 core should handle (or
assist with). In the meantime,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
>  
>  #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8

-- 
Regards,

Laurent Pinchart
