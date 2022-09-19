Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8176E5BCDC9
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 15:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiISN7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 09:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbiISN7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 09:59:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470AB3136D
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 06:59:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55106D02;
        Mon, 19 Sep 2022 15:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663595946;
        bh=bTSfOkwFwD0DNmF4qEaYSoFCB7Xa0v30F/fNlfbT6o4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TUCZHavh5nlQalFJ4I+ZovwcjaiFpUOA9ppo5Nhrt3J21KdzfCjLEiCp/I6tHYMK3
         0ToLlA+W+YlyT3IkFZTOgVYo0aHNCn/Y0Wf4kK8osyv5Fv/gJ9zABb4nMGJR/sIISC
         IjmZP1VjZ4gjxGJIXQeZms4F6cYoVL8/cjIGI8M8=
Date:   Mon, 19 Sep 2022 16:58:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 09/13] media: xilinx: csi2rxss: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh1nMNj1IvLGVM9@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-10-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-10-yangyingliang@huawei.com>
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

On Thu, Sep 15, 2022 at 11:03:20PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 29b53febc2e7..080e2483cc92 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -976,11 +976,9 @@ static int xcsi2rxss_probe(struct platform_device *pdev)
>  	/* Reset GPIO */
>  	xcsi2rxss->rst_gpio = devm_gpiod_get_optional(dev, "video-reset",
>  						      GPIOD_OUT_HIGH);
> -	if (IS_ERR(xcsi2rxss->rst_gpio)) {
> -		if (PTR_ERR(xcsi2rxss->rst_gpio) != -EPROBE_DEFER)
> -			dev_err(dev, "Video Reset GPIO not setup in DT");
> -		return PTR_ERR(xcsi2rxss->rst_gpio);
> -	}
> +	if (IS_ERR(xcsi2rxss->rst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(xcsi2rxss->rst_gpio),
> +				     "Video Reset GPIO not setup in DT");
>  
>  	ret = xcsi2rxss_parse_of(xcsi2rxss);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
