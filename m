Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2EA6C2E09
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 10:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjCUJiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 05:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjCUJiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 05:38:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095532F7B7
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 02:37:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2719A496;
        Tue, 21 Mar 2023 10:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679391471;
        bh=cCHwQxhNTRriBl3uBijGqtpqmS6HWZUMxP7sK9K/wL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SeUT0JzburiGqjVFS8NysbHRabRcLCOzqPL8bukrGvpeahY7CViHgcpTbfDiOasd0
         pjea+qhXd0h+Z8l65bFuiMRrdTFV/PKuwaoeR7ShBqb0TTyQq1sKUITzf2ywEPfnq0
         KQ/vOfC9sKCktK/ASyUV26xb4x01sCPEl2iynDhc=
Date:   Tue, 21 Mar 2023 11:37:57 +0200
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
Subject: Re: [PATCH v2 1/2] media: imx: imx7-media-csi: Fix mbus framefmt
 field init
Message-ID: <20230321093757.GZ20234@pendragon.ideasonboard.com>
References: <20230321072707.678039-1-alexander.stein@ew.tq-group.com>
 <20230321072707.678039-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230321072707.678039-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Tue, Mar 21, 2023 at 08:27:06AM +0100, Alexander Stein wrote:
> 'field' is zero-initialized to V4L2_FIELD_ANY, which is an invalid value
> to return to userspace. Instead fefault to non-interleaving.

I prefer defaulting to non-interleaving instead of fefaulting :-) I'll
fix the typo in my tree.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index c22bf5c827e7..3e97b9f2ff69 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
>  	format.code = IMX7_CSI_DEF_MBUS_CODE;
>  	format.width = IMX7_CSI_DEF_PIX_WIDTH;
>  	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
> +	format.field = V4L2_FIELD_NONE;
>  
>  	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
>  	csi->vdev_compose.width = format.width;

-- 
Regards,

Laurent Pinchart
