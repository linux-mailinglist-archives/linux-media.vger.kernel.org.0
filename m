Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1432A841
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237394AbhCBRXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238849AbhCBAZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:25:50 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64541C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 16:25:04 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id t26so12724258pgv.3
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 16:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6EMqrTTrgNC2xctCEAubbV8im+J11oh49im2xq8p+ts=;
        b=aMmfJxHzZ6UPnrqao0O8uty+RWTXndWJBAL7LahmHzBsfH+WqI5MI1jKWH8nt2t2mK
         S7v//W65XMcIYcG9rgtf9mAl9xtojliPWfbFzmnIBtRcNEglTGYYK6zQFRNfMN8t949m
         XQs78M+zcUX+0Ic1VBfVHeI5IdvC7x+D+bK9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6EMqrTTrgNC2xctCEAubbV8im+J11oh49im2xq8p+ts=;
        b=LP76Yeguzo0CtvLLDUDpuLJL3e2c1sZj4mwKILwfQzlA/VMpkVfDFD+24ogtJXUfpc
         5dnfO9Ltu8X/EFfd/IP2OD83gEp5OspJKwLQKdI1bBM0PCXHoWwcQwQSsExTZ+atHpdb
         F+VfDeJ/DVEznYMuZGrP6XT4jIW4aDsHMeYjs/JFAk3PVPy0oypdZca5ffFXf5LCPmd3
         EGBLEFYIgvoHgHRvlszXl3civl+DOyn1HlsDNRdBew7325HjAjm4eAafhBTTeCUnsUHA
         gzkpfbBz9mUaL0HQYSrxXiMHMuJLGXvwosY4LTxf2bMxSslTlwJHnkRSPhPw0ojR/+Bb
         LSOw==
X-Gm-Message-State: AOAM533ZDy+v7+Km6tAgZ6f9iamyDh/7qxv6mcrIDX0+RNuM1jQgJra9
        p6JtkxfZEWvVizOWB9R6uexztj0svaghbQ==
X-Google-Smtp-Source: ABdhPJwAJh5ZUzLwoXFWE4WOF1pjRs/ClkDYlMnfOIsM1wa331rh6AGEGy3MY2j7tX63gBF6rXsvMQ==
X-Received: by 2002:a65:5643:: with SMTP id m3mr15787580pgs.91.1614644703341;
        Mon, 01 Mar 2021 16:25:03 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id a1sm14798645pff.156.2021.03.01.16.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 16:25:02 -0800 (PST)
Subject: Re: [PATCH] Make V4L2_MEM2MEM_DEV manually selectable.
To:     Wren Turkal <wt@penguintechs.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210301235216.81150-1-wt@penguintechs.org>
Cc:     linux-media@vger.kernel.org
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <11f394e0-cf56-4503-fb53-df04a0aae933@penguintechs.org>
Date:   Mon, 1 Mar 2021 16:25:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301235216.81150-1-wt@penguintechs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro,

I think I should have sent the original mail to you. If this is
incorrect, I apologize as this is my first attempt to
propose a patch for Linux. PTAL or help me find the right
way forward.

Thanks,
wt

On 3/1/21 3:52 PM, Wren Turkal wrote:
> The V4L2_MEM2MEM_DEV config item enables the mem2mem framework
> in the v4l2 core code. This framework is used by mem2mem drivers.
> I would like to be able to turn this feature on in order to
> expose the related symbols so that I can work on a module that
> is not yet ready to be submitted for inclusion itself.
>
> Signed-off-by: Wren Turkal <wt@penguintechs.org>
> ---
>   drivers/media/v4l2-core/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index bf49f83cb86f..25004137a982 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -54,7 +54,7 @@ config V4L2_H264
>   
>   # Used by drivers that need v4l2-mem2mem.ko
>   config V4L2_MEM2MEM_DEV
> -	tristate
> +	tristate "V4L2 mem2mem framework support"
>   	depends on VIDEOBUF2_CORE
>   
>   # Used by LED subsystem flash drivers

