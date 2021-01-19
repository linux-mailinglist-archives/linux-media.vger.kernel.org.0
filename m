Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB2D2FB3C4
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 09:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731303AbhASHmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 02:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730738AbhASHld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 02:41:33 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988A9C061575
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 23:40:52 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id m6so11722525pfm.6
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 23:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9avt2pOBcvJfq1YOSVtKJyXRfPA6gi4W3HN8JdFkr7E=;
        b=H7u0aSET/08uKmaL90MaLtrCKKWIVTcDGAfQcXL7yEfeXS2W1ILnwX5b28nS5cuogI
         FcX5aPzkZvPi18mXmJ8dIcmiYm1Ry0ItT9HUaM/o+iXs6Kp8Dk20cz+ysMedb2uH112p
         xogjdOySkTDvzejIdx3dWdt5599EyodIBlZC79zC0RUqMJ7hgu8ZEdSbu5aPq+JUNOfd
         NuuWtk9YYCO8MJJpBHSZM/jazTzJB19IfAtzHHcOZ2HiiGGzrKBTIizgKCZ9J0MF5k/x
         HOaYdH1e3/Cx0i4n1C936ALNLfxuBo2AaPD6H7EVJC24AWaJDv91/PIWMxc3/HEHdsdQ
         z+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9avt2pOBcvJfq1YOSVtKJyXRfPA6gi4W3HN8JdFkr7E=;
        b=dS4JuW/9q4M7VqxOtUpyKP88ex+sUIE+Vt7HME1gUucxX1KKT+T2uYTTmWaCT2kml0
         xNpWo/o+7QPFZ8fP9hkR8dzyFomNBWbdT1AdEK+NyreUMG+6WL3vpumlw3+/0hnyQ+RH
         hQ/YQexaLZujN8LQIazxx9/owf7JyYEb9zq1H18uxCadU34cRuOiOG0NTpjCkeqesQia
         wFCOkrr70VwzRR7tOFUnKSOy8h2224rqGEIvLaePTrGtRR6CBrQFgZ1a42gCSnqN6ssx
         x+55r5MCcSRXc/oAIdqOTTdxVQoqv+rcg58oT+tcEXeJfwGFjNnvAegRt22FLnrT6W0F
         yepA==
X-Gm-Message-State: AOAM532wJHEmYSwVGp5RHvkGaxX8WgQ6/sLVBvwp4hP+k/1eQpg84xQ4
        GlGhThG1nxw9/Ymihm31822hPA==
X-Google-Smtp-Source: ABdhPJy90mTIjMN6C//R3eawLVr0JtAtTzJ6ix8X3qtKcBMdssq6bTuEaSVX+ktT80LWYM9GFCIWNg==
X-Received: by 2002:a65:5244:: with SMTP id q4mr3354534pgp.50.1611042052159;
        Mon, 18 Jan 2021 23:40:52 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fh15sm2057724pjb.32.2021.01.18.23.40.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jan 2021 23:40:51 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:40:45 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
Message-ID: <20210119074044.GB17701@dragon>
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 21, 2020 at 11:58:20AM +0200, Stanimir Varbanov wrote:
> With TZ system reboot cannot finish successfully. To fix that
> enable core clocks by runtime pm before TZ calls and disable
> clocks after that.
> 
> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Hi Mauro,

Could you help pick this fix up?

Shawn

> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bdd293faaad0..7233a7311757 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -349,8 +349,10 @@ static void venus_core_shutdown(struct platform_device *pdev)
>  {
>  	struct venus_core *core = platform_get_drvdata(pdev);
>  
> +	pm_runtime_get_sync(core->dev);
>  	venus_shutdown(core);
>  	venus_firmware_deinit(core);
> +	pm_runtime_put_sync(core->dev);
>  }
>  
>  static __maybe_unused int venus_runtime_suspend(struct device *dev)
> -- 
> 2.17.1
> 
