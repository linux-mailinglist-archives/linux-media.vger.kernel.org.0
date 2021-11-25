Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5294745D657
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 09:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353137AbhKYIlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 03:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353283AbhKYIjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 03:39:35 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EBFC061757
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:36:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id k37so14438218lfv.3
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ADRTBrUjRd1rAOanvGXkScUFM0gsVWmkuqdva+XDWDM=;
        b=7MxVXhzOBPI1WLFJ1LYc2sbO/uR1ZYyn+KzC66T0Fs6gWZudI0M/AZPd+tqnkbfC0J
         NSxuB+HIQ5F+KnM57b9q4JlpFUVwU5V4QVmRUvY9q9HRmZDeexkPPMC+Hh368JqngKi1
         EHrvboah3+7sAn8AFaDzgAU3AnM5Gxsu7jbRJ9oM7bPQhySGkaELEI0I/dzTaumPuRXg
         4y/F8ZAyDc6XWpkC5VTnNY3+SxmOONAcviuBhTU2HWfdVvlM1s9NP8M2YD1i3V0T01B4
         I1iIe1kDDY2xXsgOcFoOg2lGK4qNOB2n+Svo86klEbYszjtUzJmYjAzzIdlM1dxJpR3b
         hBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ADRTBrUjRd1rAOanvGXkScUFM0gsVWmkuqdva+XDWDM=;
        b=RrdRLHubMjot7pqmxV1msu3AFq5Hdj19n9LotpTCUlAVbHa4X3yhxt3BWNAgtrGQ1+
         6K31y+u5EQpbcQksExxhg/0IVN/8rI/h866o4R9ucEYzrUmeZu3c+/LxzA4+tmkVLiiF
         kwg+7ZNRzFeFsGVfBGDm9YQbrg2jutsjoKrCykNCLOpPJ7m/aaEldF3ZZCFwJ5khGdFP
         uCqlgxxniDDdWriSZFQp3qS5zMGa1inM6AB/+3mqmo0Xvq7G9ZDMhA4ySSKHtsSGL6t2
         RAknq2h1yAqRlMf+nhPUQ+nXgfdUu8nmceoSTzAk8JhtYttwz/5Y3jNmiWvaCV7Etb/9
         yelw==
X-Gm-Message-State: AOAM531YkcxabdGagcIBbJYbvBzSbbKqQtvuDY8Yi7MM5CgdjFdSAwIq
        o+wnsvcP0dxZsT7s/JO6FJSfDg==
X-Google-Smtp-Source: ABdhPJyJ3FfAm0lbVXXHIYabujh2mQ2IQwaE/Ii+KLYpOULik/cHZzqrE6uXVv1twRcod1g2b+UJZw==
X-Received: by 2002:a05:6512:230e:: with SMTP id o14mr22942804lfu.490.1637829381595;
        Thu, 25 Nov 2021 00:36:21 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id c2sm189576ljf.50.2021.11.25.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 00:36:21 -0800 (PST)
Date:   Thu, 25 Nov 2021 09:36:20 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 25
 [drivers/staging/media/max96712/max96712.ko]
Message-ID: <YZ9LBN3UeGSqRVd7@oden.dyn.berto.se>
References: <20211125160957.4ffdeb88@canb.auug.org.au>
 <4c2aabad-bf41-efc0-c9ba-da4a330e9015@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2aabad-bf41-efc0-c9ba-da4a330e9015@infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

Thanks for your bug report.

Sakari have fixed this problem, but it seems to be some confusion in 
patchwork.

https://patchwork.linuxtv.org/project/linux-media/patch/20211101132502.700505-1-sakari.ailus@linux.intel.com/

On 2021-11-24 22:57:12 -0800, Randy Dunlap wrote:
> On 11/24/21 9:09 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20211124:
> > 
> 
> on x86_64:
> 
> WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
>   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
>   Selected by [m]:
>   - VIDEO_MAX96712 [=m] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=m] && I2C [=y] && OF_GPIO [=y]
> 
> and then
> 
> ERROR: modpost: "v4l2_ctrl_handler_free" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_new_std_menu_items" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_new_std" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_handler_init_class" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/staging/media/max96712/max96712.ko] undefined!
> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
> 
> 
> Full randconfig file is attached.
> 
> -- 
> ~Randy



-- 
Kind Regards,
Niklas Söderlund
