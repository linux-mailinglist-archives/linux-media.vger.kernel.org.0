Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF4E3D7F8A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 22:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhG0UwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 16:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhG0UwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 16:52:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79170C061757;
        Tue, 27 Jul 2021 13:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Fq6S4w4nEQQZrAxDSBIsga9g3jtsYB15MhkfRjqeXRY=; b=UZFZN2G47QoudeUbhHEl8mirU9
        qW3v9bN+CCf472/fuvE7Hm0iX3s5m/Ox6/Gfg9hj+fCB6RgCfEr8Fcpg5ei0q70ivWhzuGvcgvCc2
        pcSetvoGgTqCCaa/lZDK3sxtnh9oyRTNqqn0dlB/7ThgjhW5L3rorQMFR0n6+viacjrea3j2P707H
        Ixsijlgq9yESbhGm0jMkO1CATA5eWKSv0AT550CoUFLnITWTcPxYiMGlhoW13T0A6vwMalzGHqnMf
        NgwmDkORHSM+iVcsOl9MgbK5flhHHTgO5z12RBQ5INGaRtZqNQRxe9y7zTjdF/kgnfas5JDLxsgNp
        RghRdw8w==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8U3b-00GHCy-Lm; Tue, 27 Jul 2021 20:52:07 +0000
Subject: Re: [PATCH] media: s3c-camif: Remove unused including
 <linux/version.h>
To:     Cai Huoqing <caihuoqing@baidu.com>, sylvester.nawrocki@gmail.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210727054032.760-1-caihuoqing@baidu.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e09e8157-ff37-ba76-49a8-c6c2f84725b4@infradead.org>
Date:   Tue, 27 Jul 2021 13:52:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727054032.760-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/26/21 10:40 PM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

as reported by 'make versioncheck':

../drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
>  drivers/media/platform/s3c-camif/camif-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
> index e1d51fd3e700..64078cbfd7f9 100644
> --- a/drivers/media/platform/s3c-camif/camif-core.c
> +++ b/drivers/media/platform/s3c-camif/camif-core.c
> @@ -23,7 +23,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> -#include <linux/version.h>
>  
>  #include <media/media-device.h>
>  #include <media/v4l2-ctrls.h>
> 


-- 
~Randy

