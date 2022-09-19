Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5195BCDF6
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiISOGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiISOFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:05:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D663F31DED
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:05:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 080269BA;
        Mon, 19 Sep 2022 16:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663596341;
        bh=mKcHs70/thjF5TpQoKZX+TsIT3X+gfiauXED5J6GnH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e23aoXeNOBvYtA+qqdni9XEsUz9X6g9r3UwglpVIC+Y/DX0BYYLZbp6wzMaQWZzZf
         Y4EkzhcPg7YWr3tYc8OIB9DVCwpb3vlcP/HqKTrWMUjPDh5vSMJyAopu0VVSKOPdVz
         cdSjIXWaDG2txxHgTG5WWwBBYl5JNP09CXRTbR7I=
Date:   Mon, 19 Sep 2022 17:05:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 08/13] media: omap3isp: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh3J9dehjoZ46H7@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-9-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-9-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:19PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti/omap3isp/isp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index a6052df9bb19..5d6867b8f197 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -1886,8 +1886,7 @@ static int isp_initialize_modules(struct isp_device *isp)
>  
>  	ret = omap3isp_ccp2_init(isp);
>  	if (ret < 0) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(isp->dev, "CCP2 initialization failed\n");
> +		dev_err_probe(isp->dev, ret, "CCP2 initialization failed\n");
>  		goto error_ccp2;
>  	}
>  

-- 
Regards,

Laurent Pinchart
