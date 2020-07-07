Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DE8217703
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgGGSsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgGGSsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:48:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AC9C08C5DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:48:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so46322365wrs.11
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sz1Hi8LN71IdWVES3Rm3QlYRfh+YKsdF8gF0JiM3gaE=;
        b=m57SDtNZKCtFUfyMe3NixudgPZws0KiaL4eNZHocOVf7klivgwwS09j3LTW5D2EtFc
         tzV1xkLMRz9mYiCEUAVFdC1iPN1IxgIHfaNZSXVZewMVDnfFF6ZqKpQdkcEiDmwKT5X2
         bFoh8H9aZtWv1aaYOqO4rK5jguz1j2+MhNW5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sz1Hi8LN71IdWVES3Rm3QlYRfh+YKsdF8gF0JiM3gaE=;
        b=cuHQc1Jr3XdZi0RkPGvpexc6or0otso70MqGNEFOhKv3vxhCJPOCHqYfzFxy7UOKKi
         enUL/lqDNyZHoPCfsYzX/VsgO5Jiofosm2+9H9v54vI5HxZe4NXrTujamxQ3gMO91mWi
         6II5r+dTH7X6r2WsYIWHMMlsqnD3zUMdqpmPt84A7hmBI6A6kggyNXnN0huEnWTaue+z
         yETlhcGoW4chPrp3cxPELPQKCLMRiZxdA6rubhP8pdC7HA9nNcDm9qKjyqaIGyLYoslM
         2sb08esnUvcDunU05sFiSkk0KfaN3RLCUtHchCewXsCPUoppHMkuO+BL2mLrWOpEz7VY
         cgMg==
X-Gm-Message-State: AOAM530uGPwiMQRWWuNu25DoLklSW/cw+/hvxjXZEoF2cAiDVsvyVjqY
        aXtFlGs1sR2QmUEhwhh2mbZCPw==
X-Google-Smtp-Source: ABdhPJxUJIVtwy2M2e2+H9SMcZh+a4/o3zUBegF6p+4tc2+h43CG5r/DLgIuUiVzlSGfYPS4GxSZCA==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr54954998wrn.395.1594147689016;
        Tue, 07 Jul 2020 11:48:09 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d13sm2190919wrn.61.2020.07.07.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:48:08 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:48:07 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] media: exynos4-is: Correct parallel port probing
Message-ID: <20200707184807.GK2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660A14860692EAB2A658AEFA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

On Sat, Apr 25, 2020 at 07:26:50PM -0700, Jonathan Bakker wrote:
> According to the binding doc[1], port A should be reg = 0
> and port B reg = 1.  Unfortunately, the driver was treating 0
> as invalid and 1 as camera port A.  Match the binding doc and
> make 0=A and 1=B.
> 
> [1] Documentation/devicetree/bindings/media/samsung-fimc.txt
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 18 +++++++++++++-----
>  drivers/media/platform/exynos4-is/media-dev.h |  1 +
>  include/media/drv-intf/exynos-fimc.h          |  2 +-
>  3 files changed, 15 insertions(+), 6 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index a87ebd7913be..9c4fdf726b92 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -418,13 +418,21 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
>  		return ret;
>  	}
>  
> -	if (WARN_ON(endpoint.base.port == 0) || *index >= FIMC_MAX_SENSORS) {
> -		of_node_put(ep);
> -		return -EINVAL;
> +	if (fimc_input_is_parallel(endpoint.base.port)) {
> +		if (WARN_ON(*index >= FIMC_MAX_PARALLEL)) {
> +			of_node_put(ep);
> +			return -EINVAL;
> +		}

This check seems to be generic, so could we just move it above the
if/else block?

> +		pd->mux_id = endpoint.base.port;
> +	} else {
> +		if (WARN_ON(endpoint.base.port == 0 ||

Isn't this impossible, since if port == 0, the 'then' branch would've been
taken instead?

Best regards,
Tomasz
