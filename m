Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C34836DCC5
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 18:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240424AbhD1QP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 12:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239915AbhD1QPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 12:15:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FD9C061573;
        Wed, 28 Apr 2021 09:14:40 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id y124-20020a1c32820000b029010c93864955so9600085wmy.5;
        Wed, 28 Apr 2021 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aYKVWAKIY2SVLc5Zm+ilU7xifRJwW77SW1HqG8x0JaA=;
        b=SbSdFVW1uVaKGxNMdvb2zSIxE+zfnIBM1DfXdsREMf2yzLTG9aTam/opWJt6FAR0FO
         IAE2wArZ+XAhqUb/xgr/uPuJnr04OS0Qdgax29qEP1ROdkNK/pAM88TXXuLEKZikbJXC
         uC0GOE6Hg6xdlrN5ZI5FXtrozhpi+ytgPyFouiLIdtCEl30o5gFnW2vMkC/JDNwOhlMb
         C/PAfls4zqUYynpdiP/KEQZmDcHTLpeymfv5e23dTl5Otx3ArQsDvGB/u4wYRRxxc34t
         0xpfBUcexuPemMENQaFf0aTemJQs4UT7OdCKtpw9X8Ol5jQ7Rz52aTDbRw7jKkleMwW2
         AwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aYKVWAKIY2SVLc5Zm+ilU7xifRJwW77SW1HqG8x0JaA=;
        b=jKpWpI5MLno76ukz7wXZLRdJBdhDbVAL4WA8BM05k536VZgJZeKqvNWeLcuGRg1dQX
         05g9MHcnxjbFQvhkMI4xdA+QC5z/oUN/WW1vTMWsw9PhQYvIEPGAeXDexcUBXSRoLyJB
         DzCLpJWo9if0iqNhTXFEKzUpwscQ76+VcyjDmbmT9pqwYMUh/cL4RHWdE5GdphXe0ZqM
         myOpgVSui5GwfnCQX+l+Ct5ybPdrhI4MH0kuj24meA2nobiAv+72W8v+F6zdW+JAY5+f
         ybanH3RuEE1cJZifyrmYO9rWLYTHTfZGr3beSrHLMR2yY5tKVdIL3itWYWnlRXldjg1h
         G1qw==
X-Gm-Message-State: AOAM530SdM8+uGexZcnxRD02oHYp3ffYhbwDD3HwrUBdeHUL1e5dqgMP
        zlXJwjlJ+AUj9OVhFSewN1mn9BWzAlH8iesh
X-Google-Smtp-Source: ABdhPJwVj5FDMqGLOFFmQahABCgh5yKpcSSFoypgvL/bqC3d1eLkEXCrKRmL9dNVkzTLXDaBCynX0g==
X-Received: by 2002:a05:600c:4f45:: with SMTP id m5mr5399854wmq.132.1619626479138;
        Wed, 28 Apr 2021 09:14:39 -0700 (PDT)
Received: from 192.168.10.5 ([39.46.118.120])
        by smtp.gmail.com with ESMTPSA id p7sm280375wrt.24.2021.04.28.09.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 09:14:38 -0700 (PDT)
Message-ID: <2b5365025e7a9162aae111b1c5134430a37e6ff8.camel@gmail.com>
Subject: Re: [PATCH] media: siano: use DEFINE_MUTEX() for mutex lock
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:SIANO DVB DRIVER" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        zhengyongjun3@huawei.com, kernel-janitors@vger.kernel.org,
        colin.king@canonical.com, dan.carpenter@oracle.com
Cc:     musamaanjum@gmail.com
Date:   Wed, 28 Apr 2021 21:14:34 +0500
In-Reply-To: <20210405205219.GA687366@LEGION>
References: <20210405205219.GA687366@LEGION>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reminder!

On Tue, 2021-04-06 at 01:52 +0500, Muhammad Usama Anjum wrote:
> mutex lock can be initialized with DEFINE_MUTEX() rather than
> explicitly calling mutex_init().
> 
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  drivers/media/common/siano/smscoreapi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index 410cc3ac6f94..7f5b638d2458 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -414,10 +414,10 @@ struct smscore_registry_entry_t {
>  
>  static struct list_head g_smscore_notifyees;
>  static struct list_head g_smscore_devices;
> -static struct mutex g_smscore_deviceslock;
> +static DEFINE_MUTEX(g_smscore_deviceslock);
>  
>  static struct list_head g_smscore_registry;
> -static struct mutex g_smscore_registrylock;
> +static DEFINE_MUTEX(g_smscore_registrylock);
>  
>  static int default_mode = DEVICE_MODE_NONE;
>  
> @@ -2123,10 +2123,7 @@ static int __init smscore_module_init(void)
>  {
>  	INIT_LIST_HEAD(&g_smscore_notifyees);
>  	INIT_LIST_HEAD(&g_smscore_devices);
> -	mutex_init(&g_smscore_deviceslock);
> -
>  	INIT_LIST_HEAD(&g_smscore_registry);
> -	mutex_init(&g_smscore_registrylock);
>  
>  	return 0;
>  }

