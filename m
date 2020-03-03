Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416B6177266
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 10:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgCCJai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 04:30:38 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44343 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgCCJai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 04:30:38 -0500
Received: by mail-pl1-f194.google.com with SMTP id d9so1048427plo.11
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pTPwe4y24U/X1iWLz8tlILWPDO9YviDHvNO01+EudEk=;
        b=Ms2G4Mn/boKXUl4HFcduqKyv5toEdpqlODG9UHfAX6ZqACbjU7HlrPQ5r/tx61QUGx
         L2JTh3/5JgSpKlaWsBEAPoBMkhifYd7GMJxYdlXGrelGOxFKU6El3L4cG0zLKEv/jl1a
         A5pJhjuFhM/Llkeus4QvgoMJ/qvYPGwM7t4UbhYSSHwhAagZM93i5Ac+W7rrzCwgSpz4
         E7iB65JDslJEkLeRD4I0FqrdaXd9ajom6lFsLPlek4UrRSpjU4esOavBIwflM+7SFFzy
         o905a1TJxyxkbku401WiRQmeZbiQVvVQ7KhrdyPqZO/E0YskbmbcNsnbqOWnrCc15+z8
         s/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pTPwe4y24U/X1iWLz8tlILWPDO9YviDHvNO01+EudEk=;
        b=BWVoWh9P9Y8sM+6HFA3b+Ikn2wvs4eGF1VNeOtUKTowtVsYHNMbeSE3V221ZArJ/xm
         BU3OBIRP/2uD/x6PFM4nAslnvKjyeRK9d7PZevyVIiOBBodprc+wuKdyjRVeemwRLDU6
         fnnjiHsxqajdti7eBG53aGtsTCfAqVQdU3dlN3rG2+nOTbTyKp7W91d6cTquEhWNKVAo
         V1Xay2be23xQZmcOwBbPlPU8I6jpuD11QLp//e6oumKA+M+eqYUo0tjSBBHIYFca//zj
         Y3bHi+wQCrA3t/VvJhsOrVUDjLB6Hl3duut9EVDJu5yb0NRp97IuqpIh/YjPdRFhUEwB
         RQ3Q==
X-Gm-Message-State: ANhLgQ2SxKW/n1t86qWaJsDYhCjELmX99ly4c1Nb/g3QelRYYrTKoLpO
        R7dH9gMgK8wTnOsJhHtQNetQ7CNdesK+
X-Google-Smtp-Source: ADFU+vutqnNjj27PZQaQyfC1m/kiD62QMscPP+fE1GRambUxN4RN2yrGOjP1LOyCuvHzq1hsNfqMyg==
X-Received: by 2002:a17:90b:3011:: with SMTP id hg17mr3091673pjb.90.1583227835889;
        Tue, 03 Mar 2020 01:30:35 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id b15sm23877419pft.58.2020.03.03.01.30.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 01:30:35 -0800 (PST)
Date:   Tue, 3 Mar 2020 15:00:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, peter.griffin@linaro.org
Subject: Re: [PATCH 1/3] media: i2c: imx290: set the format before
 VIDIOC_SUBDEV_G_FMT is called
Message-ID: <20200303093028.GA16981@mani>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
 <20200226215913.10631-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226215913.10631-2-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 12:59:11AM +0300, Andrey Konovalov wrote:
> With the current driver 'media-ctl -p' issued right after the imx290 driver
> is loaded prints:
> pad0: Source
>              [fmt:unknown/0x0]
> 
> The format value of zero is due to the current_format field of the imx290
> struct not being initialized yet.
> 
> As imx290_entity_init_cfg() calls imx290_set_fmt(), the current_mode field
> is also initialized, so the line which set current_mode to a default value
> in driver's probe() function is no longer needed.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/media/i2c/imx290.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index f7678e5a5d87..2d8c38ffe2f0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -722,9 +722,6 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_err;
>  	}
>  
> -	/* Set default mode to max resolution */
> -	imx290->current_mode = &imx290_modes[0];
> -
>  	/* get system clock (xclk) */
>  	imx290->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(imx290->xclk)) {
> @@ -809,6 +806,9 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_ctrl;
>  	}
>  
> +	/* Initialize the frame format (this also sets imx290->current_mode) */
> +	imx290_entity_init_cfg(&imx290->sd, NULL);
> +
>  	ret = v4l2_async_register_subdev(&imx290->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Could not register v4l2 device\n");
> -- 
> 2.17.1
> 
