Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9AE3483EB
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 22:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbhCXVna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 17:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbhCXVnG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 17:43:06 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A629C06174A;
        Wed, 24 Mar 2021 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=QFgVVgriQ2DVZGqVL0Pa8QfVVvMJAo0S5tQkn+hRDzE=; b=XorqIpX3jcWXGuSxz493ZHVf5N
        BXU4P0rlgR+rvhsPcTCfV7aoMksCzA7/d6a9f6POE6uDL++yl5dE+ld7IBDk3JshsLy2c78ij/ga4
        ksW+sRm1oZGS1uaQy9TYnYgG6wmeCoI6mQ4SEsGQePl5hOLlmPMV14PA5Fv6ZP7Go8N3cAk3RRHlL
        POf5b+j+teXMHlSNN08CtqbK5ohMlgvRG/RoULUHTelfOzigTHDbUZ0FTGoXb6rnAMGU5e83sEbmF
        U0kC00DC4ZM1jmqR6nE+6D/TchMTaFKjYGyXe+wVrblG9TybfPYT/9kyZG2/iSTsAD0fmAcrcpyzb
        B+PJjMzg==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPBHJ-000FeJ-Pa; Wed, 24 Mar 2021 21:43:03 +0000
Subject: Re: [PATCH] media: atomisp-ov2680: A trivial typo fix
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20210324135642.30054-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <07445fb3-959d-3399-f86b-0ce98d43f731@infradead.org>
Date:   Wed, 24 Mar 2021 14:42:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324135642.30054-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/24/21 6:56 AM, Bhaskar Chowdhury wrote:
> 
> s/miror/mirror/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/staging/media/atomisp/i2c/ov2680.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 49920245e064..889395933099 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -627,7 +627,7 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
>  	{0x5706, 0x0c},
>  	{0x5707, 0x78},
>  	{0x3820, 0xc0},
> -	{0x3821, 0x00}, //miror/flip
> +	{0x3821, 0x00}, //mirror/flip
>  	// {0x5090, 0x0c},
>  	{}
>  };
> --


-- 
~Randy

