Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D1B761FE7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 19:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjGYROu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 13:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjGYROt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 13:14:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297E9BC
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 10:14:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24AC7558;
        Tue, 25 Jul 2023 19:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690305228;
        bh=CeQZKRVq+rVX0P/DghHdyilwi75rHmyyU2RFZq4uxzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wf9+JbSa4xCw95uDuVB7UvbqC1H4ZpzFvo0liGogHpKXIL7C8rVv28NWZbTgevBg8
         uXH/j9sUVARYhcKDm82ULcpdtT7oylA9vj980wb2L6QT6yL77MekBPCQzl5/NFMcvH
         7SVCQ+Bvy7yCFjSyQ8woUAULnp7B+5cnktOF+8GA=
Date:   Tue, 25 Jul 2023 20:14:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, c.hemp@phytec.de,
        s.riedmueller@phytec.de, guoniu.zhou@nxp.com
Subject: Re: [PATCH] media: nxp: fix wrong return pointer check in
 mxc_isi_crossbar_init()
Message-ID: <20230725171454.GP31069@pendragon.ideasonboard.com>
References: <20230725130024.568452-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230725130024.568452-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Tue, Jul 25, 2023 at 09:00:24PM +0800, Yang Yingliang wrote:
> It should check 'xbar->inputs', when allocate memory for it.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")

I'll add

Cc: stable@vger.kernel.org

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index f7447b2f4d77..9fcfc3925733 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -483,7 +483,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  
>  	xbar->inputs = kcalloc(xbar->num_sinks, sizeof(*xbar->inputs),
>  			       GFP_KERNEL);
> -	if (!xbar->pads) {
> +	if (!xbar->inputs) {
>  		ret = -ENOMEM;
>  		goto err_free;
>  	}

-- 
Regards,

Laurent Pinchart
