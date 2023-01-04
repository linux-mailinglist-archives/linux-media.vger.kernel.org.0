Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7CB65D293
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 13:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjADM1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 07:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239269AbjADM0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 07:26:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455D5A462
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 04:26:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09696C7;
        Wed,  4 Jan 2023 13:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672835213;
        bh=NuuP4pm3SjM0NwlEUC0rw58OZmtBU2fSFpDAMciA7TI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ep+qRuDmQGBI2WkiMclF5MUMkqyQ7Nr1lWPqjbZP9uknLQ8iohPsGzoHQuzF1vA8K
         aLJ6aNVdLRqMt1UMv7g/oOE075WBzwZCmnm/J4l+bTxYKDoliwTf9MnOwAofe/MnqG
         SfLmRdxRGj3mcpGg11pFYwN66r5kw7q8BWRUOmxk=
Date:   Wed, 4 Jan 2023 14:26:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, rmfrfs@gmail.com,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Subject: Re: [PATCH] media: imx: imx7-media-csi: fix missing
 clk_disable_unprepare() in imx7_csi_init()
Message-ID: <Y7VwiXftRADhWXb6@pendragon.ideasonboard.com>
References: <20230104093921.2570431-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230104093921.2570431-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Wed, Jan 04, 2023 at 05:39:21PM +0800, Yang Yingliang wrote:
> Add missing clk_disable_unprepare(), if imx7_csi_dma_setup() fails
> in imx7_csi_init().
> 
> Fixes: ff43ca911978 ("media: imx: imx7-media-csi: Move CSI configuration before source start")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 886374d3a6ff..1ef92c8c0098 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -638,8 +638,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
>  	imx7_csi_configure(csi);
>  
>  	ret = imx7_csi_dma_setup(csi);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		clk_disable_unprepare(csi->mclk);
>  		return ret;
> +	}
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
