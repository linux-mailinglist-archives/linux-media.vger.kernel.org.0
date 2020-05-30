Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FAE1E8D47
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 04:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgE3C4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 22:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgE3C4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 22:56:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C668FC03E969;
        Fri, 29 May 2020 19:56:52 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y11so1937262plt.12;
        Fri, 29 May 2020 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pd/e7eNS71jRXfS6WeolyrknIqfCh6tgL92AqzRruI4=;
        b=TyC/IG6fw37NElc8jDyVbfuTyWpAYf4mk38N68MtLvgGFxe/58gXeXwruIlPg7BmIl
         p16yr04cA/rDrIqjAK5APxP+FWlnVWI5elWy6NfRVkgMwd4xRzu/N9jg5QHkMpFV36ic
         yVaPWrtRKADpZGhLP8XYVoKYYJw6pBtMdbz3hqcRRr/cpvuZdEHOlwYd8mr8DfzEQ1J9
         w7qkmNdY7AkmVuI9AM0a8JaRLl8noiBjVcYji0LOLSHinxQu6w9SkZZvGIgkarmqXnt4
         O8O0nNc+0QST1Lz9Kf/vt94D7pF6LNeI/2lyXif+8jZy3O+oLQYQVV1ARGL6HU0+VerG
         vr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pd/e7eNS71jRXfS6WeolyrknIqfCh6tgL92AqzRruI4=;
        b=sypKMT7gmiiJVWyotwLhOOXhAryyJ2udyeC+HyjPVwxdHyMhlPCYUyN8E2QAX9DXFx
         U3l62LuFcjc8IsFU2Sxdlhx06bCt7Vo9BaVy5RkvxQRFUG6nh0Vwmi51pRHt7tzT7nCA
         Hx8Pj/lD0LRcBMhf+uOHFAHi5l07rYpfWTUcdj+P9HAU6xBsoEKRHb1CjlbkARN75f/A
         kpVqP3twPwN/9qc0YGq6k18vtu8xJxXwHLepeubUqu60ltHIZXw8hqZytfrpt16CUomV
         N/V48SKbbQK7YcEsLQyRRnAWdSnOGkueR0vDnFtz4dSYzDQVA2zKW3OizLlVtkAxp6D9
         gEfg==
X-Gm-Message-State: AOAM532QNTyXPKe/Ww78Fq3QYfo6zJ9ypN/GY5iYtrWII5BVNNpKh6r5
        3NXAbIhAGy0HmnQmuctamcg=
X-Google-Smtp-Source: ABdhPJzyFsisx0c0FZbMcBEf0y2rZ3v3nLsapbiP38Ipd4ZWp51m456PvBFXlrcjLQWeZat6e/cvog==
X-Received: by 2002:a17:90a:2a03:: with SMTP id i3mr12315626pjd.29.1590807412075;
        Fri, 29 May 2020 19:56:52 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y9sm647001pjy.56.2020.05.29.19.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 19:56:51 -0700 (PDT)
Date:   Fri, 29 May 2020 19:56:49 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 3/9] staging: media: atomisp: annotate an unused function
Message-ID: <20200530025649.GB1367069@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
 <20200529200031.4117841-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529200031.4117841-3-arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:00:25PM +0200, Arnd Bergmann wrote:
> atomisp_mrfld_power() has no more callers and produces
> a warning:
> 
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: error: unused function 'atomisp_mrfld_power' [-Werror,-Wunused-function]
> 
> Mark the function as unused while the PM code is being
> debugged, expecting that it will be used again in the
> future and should not just be removed.
> 
> Fixes: 95d1f398c4dc ("media: atomisp: keep the ISP powered on when setting it")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Mauro fixed this in his experimental branch:

https://git.linuxtv.org/mchehab/experimental.git/commit/?id=dbcee8118fc9283401df9dbe8ba03ab9d17433ff

> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 694268d133c0..10abb35ba0e0 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -761,7 +761,8 @@ static void punit_ddr_dvfs_enable(bool enable)
>  		pr_info("DDR DVFS, door bell is not cleared within 3ms\n");
>  }
>  
> -static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> +static __attribute__((unused)) int
> +atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  {
>  	unsigned long timeout;
>  	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
> -- 
> 2.26.2
> 
