Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8D61772B4
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 10:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgCCJjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 04:39:55 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39388 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgCCJjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 04:39:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id s2so1277565pgv.6
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 01:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M9rD3i3rhRcLgP0HZHr9NIn6EzGhxSoMSIXcBEByB2k=;
        b=oXrQoGUkBqixYP6Rwk58WW0v/OajWnckpF+y4+p0Ek9qToCm8R55YSS2hd8eNth8XR
         69aD83+RCMuErtq+vVFS3XrlIYSUS5GyE0/mz1pgqRfXJ3kRF0JP4Sl30pF2ozqFn5Dy
         PM8xLQSQIhlKIkQTqCRMBrbvQtq0A8fI9bzxU9sNWsUyL8wh5NcT/eyxyYyJsxR/SJz+
         yuHKKdvtKmhvki7/nD85Bgm2DE2tNi/wEpKJadsGgfdW13/+2wF5G+ivbpNc2Ue6yh3Y
         WRcJENrP68xh7Sa9TQ67BMMHv/DeVkO0ZmFXE55ceqi+h/H3V2VYSivYyNzLejn1MLmb
         Mw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M9rD3i3rhRcLgP0HZHr9NIn6EzGhxSoMSIXcBEByB2k=;
        b=eD23oSLud/ZyZVvRVjaBq+IDptWWrGcsIrnc/+51D8foDSkVDelWrl/GONmOWQdXR5
         l/1nQMcH+Uqabdo3xmbaxtPlwZnCMI8mGxhYEDpqnLr7eNC+1X7d5I/XRqK94IC2dQkT
         IRucXURXs+2DOY4rF1KfzYckbT4gjyd+hEw04hx1nYhAnGaunXGwiOI1HSkvh04Ut4tI
         e6Mp2tX8WM5zNslNsSdRAIi2h+tinAGn+fpbg2JRv1Ps7xCZRsv+mq9VgCdtRoeUVKQh
         HH86NJ13E62nNRmbF8xL3eSvs4t54OUXDCNw65Zuh1DxRyaZq6trAjMPg9I9SLz0G7ni
         +grw==
X-Gm-Message-State: ANhLgQ0NEkLKqg4htNs+KZ1onPit3aitbRrnapGCn1jKznLWi05Vd+kD
        GQ+HJcq2faVzdn1+6DvCBjAD
X-Google-Smtp-Source: ADFU+vuYD0qdifriDBViubgTs7Q/VJ+CdNP8Ng8ao2xzKmn/U5RNvGcFuav2QlMe7POLLSOZvdAXOA==
X-Received: by 2002:a63:ce42:: with SMTP id r2mr3457272pgi.106.1583228393902;
        Tue, 03 Mar 2020 01:39:53 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id o12sm11466766pfp.1.2020.03.03.01.39.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 01:39:53 -0800 (PST)
Date:   Tue, 3 Mar 2020 15:09:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, peter.griffin@linaro.org
Subject: Re: [PATCH 2/3] media: i2c: imx290: fix the order of the args in
 SET_RUNTIME_PM_OPS()
Message-ID: <20200303093946.GB16981@mani>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
 <20200226215913.10631-3-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226215913.10631-3-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 12:59:12AM +0300, Andrey Konovalov wrote:
> This macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
> so imx290_power_off must be the 1st arg, and imx290_power_on the 2nd.
>

Oops. That's a mistake.
 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/media/i2c/imx290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 2d8c38ffe2f0..d0322f9a8856 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -648,7 +648,7 @@ static int imx290_power_off(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops imx290_pm_ops = {
> -	SET_RUNTIME_PM_OPS(imx290_power_on, imx290_power_off, NULL)
> +	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
>  };
>  
>  static const struct v4l2_subdev_video_ops imx290_video_ops = {
> -- 
> 2.17.1
> 
