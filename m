Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2393C4F013A
	for <lists+linux-media@lfdr.de>; Sat,  2 Apr 2022 13:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242238AbiDBLpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Apr 2022 07:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbiDBLpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Apr 2022 07:45:13 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D699FF46
        for <linux-media@vger.kernel.org>; Sat,  2 Apr 2022 04:43:21 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-df22f50e0cso5451755fac.3
        for <linux-media@vger.kernel.org>; Sat, 02 Apr 2022 04:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zDeq4rONH6kZy4OqueUxodt8EaZ1bHVdVMLdkgTUfr8=;
        b=Ls5gHOoVh5s5wiPi5i/cUv0HvC3mJV5kdwdu4dAvNkMthRySFcAO6BHM978/wcb/bu
         G1aUsCSl/3zNQHVllcUAOePpT+qve9CpbiGD+igkMU8BRqA/hKgqL1B6B3lF5deDRsH5
         OQ1JaJBIFiN4TKG1FkM6UYk2UzaBcGZ0/qkBz9e5tWG85sdDpoXE9ZMp14FXQdswfw+h
         eNXeQtIBEL8V+35NLpVgcN+n38dkAmFN76Yrs4mAT7EeUNfsGZgQfvLMSxUicVlrCULx
         TUv1ulwWOW1NBMhCmOBy4NVNXJ8I6KUqzdRhEE9iksP62yMbK76Ejl5i/qCChwu5cawy
         LAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zDeq4rONH6kZy4OqueUxodt8EaZ1bHVdVMLdkgTUfr8=;
        b=XNQjD8kwA5XR55Ql9lmhe9I+wHLLtW+6P/MA0vAmJrVXo2TU+Vay/ARoeTks93pctt
         PtAjgFrJWxmB/xadZkyhkKD9cE8fS+2/72b1BQO3KBZdBO/ayuRTXLiqYXGmm18aQ+Rm
         068FbcLBJxV2oi2+zmlcxDREdRKaFwKoGj6K3ZB829eiRkjdfUQTavjggTLLkEiZhCIQ
         A1xXOzGODH8W197LUuyiI+k8CA4TWS8qQ8O4iwqDrJ3BZ/Qpw+WV/LTY1v5ILmPqX8FB
         hElh3ftepHZzCfaKpfEzaXtzDZlq6P72gSMQkpKw2F5bLYLbqorDi448i8JcS+YxfFzF
         xQPg==
X-Gm-Message-State: AOAM530+1+xRa0Uw2HKBDfbZYWSSF8pmCxMZ57HrM+jXl6CwcBrpyia6
        lhT+Ep0KH/5JpCgApgb3Y6g0mpaM16K4VA==
X-Google-Smtp-Source: ABdhPJxaZ/qczgDDjSpriwmuWcnUbHkLyZrQksNr95+5LT4xljPnVv4S6uS0T++J3zvESLvryniwMQ==
X-Received: by 2002:a05:6870:b686:b0:dc:a9f4:90a2 with SMTP id cy6-20020a056870b68600b000dca9f490a2mr6980875oab.243.1648899801224;
        Sat, 02 Apr 2022 04:43:21 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id g6-20020a056870a24600b000da0df8b3cesm2043700oai.20.2022.04.02.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:43:20 -0700 (PDT)
Date:   Sat, 2 Apr 2022 08:43:16 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: platform: imx-mipi-csis: Add dependency on
 VIDEO_DEV
Message-ID: <Ykg21DbuHMRvJrcK@eze-laptop>
References: <20220331123151.1953-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331123151.1953-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Mar 31, 2022 at 03:31:51PM +0300, Laurent Pinchart wrote:
> The imx-mipi-csis driver (VIDEO_IMX_MIPI_CSIS) lost its dependency on
> VIDEO_DEV in commit 63fe3d27b226 ("media: platform/*/Kconfig: make
> manufacturer menus more uniform"). This causes build failures with
> configurations that don't have VIDEO_DEV set. Fix it by restoring the
> dependency.
> 
> Fixes: 63fe3d27b226 ("media: platform/*/Kconfig: make manufacturer menus more uniform")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
> Mauro, this fixes a regression in Linus' master branch, and is thus a
> candidate fix for v5.18.
> ---
>  drivers/media/platform/nxp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 28f2bafc14d2..5afa373e534f 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -7,6 +7,7 @@ comment "NXP media platform drivers"
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> 
> base-commit: 787af64d05cd528aac9ad16752d11bb1c6061bb9
> -- 
> Regards,
> 
> Laurent Pinchart
> 
