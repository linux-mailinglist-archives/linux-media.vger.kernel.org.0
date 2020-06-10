Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A9B1F5A39
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgFJRYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgFJRYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:24:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96378C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:24:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so2583687wmj.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6ebCrNxAHQ0gIZe9N5QEwM65lHt3l2UflVFFKH8AQfE=;
        b=DrXye6cjuXzCnAHm14ZUlFQ9UrhRT282GWBt//dETHTCNOsZGe68n0HNTr/lP6l+hh
         aHJAPnZWzba8TmA/Tu+mm45S6HB3hCKZnx1pw1MkR7BB76FjVf2kORmZU3pz5x+dXCeQ
         ZzjbfDjJczEyt9Jw5Z9smO6Hpp8nsaAyrx9KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ebCrNxAHQ0gIZe9N5QEwM65lHt3l2UflVFFKH8AQfE=;
        b=Tw/ltW/Mlrz+BZX3xz3KidXkO9wtQWFQeu5jd1RsDUkRQD24S431oeA3eam3Qli0w4
         0v6knH1DDjSFuMwOxTD57P77G2T9YktFfp59E1rzR7/+iFJBSyZ+H54jIkL93dbmvd1T
         a25++ZoNDZ/TT1OR2iSyye5ulhBQj1pkqA/FwjxE1qu62NOA/H37bD1MSWVEBOp9hCsI
         PUWX9MRP4KV6ZAfo1uspSOHLTWug4Ehv1vzrbW69Cppg7qfy4DjtHWILY3Zdy8BDxU1S
         SqZnqlIyLx7keCXptbYcQXBJY1H6rgqc0O6GkrEEXe4BRhYQJCDfWzRXfMhw9m8YfVRE
         ACqw==
X-Gm-Message-State: AOAM533s/BymKoRIpHyItbkR5mtMD/Z8S8c8eZrQH3AJ3my+D2hJuT+8
        tNdX6DrgNEBcvhhkBURdB6EacQ==
X-Google-Smtp-Source: ABdhPJye6Si80e2SmteHXhfs1v6fReZ/a5P9nbsEUk/JoQcGCjTLd1JJlgSXh4OIthcuN3BEE4YMkg==
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr4330405wmc.80.1591809845242;
        Wed, 10 Jun 2020 10:24:05 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id c143sm8047415wmd.1.2020.06.10.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:24:04 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:24:03 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 3/4] media: staging: rkisp1: rename macros
 'RKISP1_DIR_*' to 'RKISP1_ISP_SD_*'
Message-ID: <20200610172403.GF201868@chromium.org>
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
 <20200609152825.24772-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609152825.24772-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jun 09, 2020 at 05:28:24PM +0200, Dafna Hirschfeld wrote:
> The macros 'RKISP1_DIR_*' are flags that indicate on which
> pads of the isp subdevice the media bus code is supported. so the
> prefix RKISP1_ISP_SD_ is better.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  6 +--
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 42 +++++++++----------
>  drivers/staging/media/rkisp1/rkisp1-resizer.c |  2 +-
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 39d8e46d8d8a..a6cd9fc13b3d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -22,9 +22,9 @@
>  #include "rkisp1-regs.h"
>  #include "uapi/rkisp1-config.h"
>  
> -#define RKISP1_DIR_SRC BIT(0)
> -#define RKISP1_DIR_SINK BIT(1)
> -#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
> +#define RKISP1_ISP_SD_SRC BIT(0)
> +#define RKISP1_ISP_SD_SINK BIT(1)
> +#define RKISP1_ISP_SD_SINK_SRC (RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC)

nit: It might be just me, but this feels to me like obfuscating the
code, because it hides the fact that it's a mask. If changing this
already, could we remove this one and just OR the two bits explicitly?

Best regards,
Tomasz
