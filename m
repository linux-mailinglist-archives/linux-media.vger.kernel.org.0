Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9196B40CB4A
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 18:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhIOQ6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 12:58:02 -0400
Received: from gofer.mess.org ([88.97.38.141]:35195 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhIOQ6B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 12:58:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7598BC63A9; Wed, 15 Sep 2021 17:56:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631725001; bh=qmMPbXTEEBd+l8VZiHEik6mxVAqlkqu6hfi4tBFy7zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OybuUbikCRLMaHMzS0iJShIqAoCQkHTTKy1h9f++Jos7CYs0r7NtSSkkvAYxxxOyy
         AniCAfp8UUlJN+ZfUCGZ175F0F42yFd6UTEvk3CRtEKCrFrj7UL7zVJXpBBvJM+Xx4
         OJHEBODv+YTsAa/PS9W9aqvYQrhAO0wLks8uSQJ0VRPLmFLLHWPqCCF/gi2orymVNk
         mMOvUTVJQQM+zPexWrJ5JEOV2aPXYE58gc5L/6eRa99bUAJaHY5AUmtcOsQOcmG8gD
         qnv9tJWLlrO2tyOh/rx6O5VZJww81m59tm07YgJYX6kDNQ3egtgjqzFaz6uKpZdVGK
         quCX4fzU3kM4A==
Date:   Wed, 15 Sep 2021 17:56:41 +0100
From:   Sean Young <sean@mess.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: b2c2: flexcop: Convert to SPDX identifier
Message-ID: <20210915165641.GC18319@gofer.mess.org>
References: <20210822040339.1837-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210822040339.1837-1-caihuoqing@baidu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 22, 2021 at 12:03:39PM +0800, Cai Huoqing wrote:
> use SPDX-License-Identifier instead of a verbose license text
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/common/b2c2/flexcop.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
> index cbaa61f10d5f..2eaff1316952 100644
> --- a/drivers/media/common/b2c2/flexcop.c
> +++ b/drivers/media/common/b2c2/flexcop.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Linux driver for digital TV devices equipped with B2C2 FlexcopII(b)/III
>   * flexcop.c - main module part
> @@ -15,16 +16,6 @@
>   *   Uwe Bugla, uwe.bugla at gmx.de (doing tests, restyling code, writing docu)
>   *   Niklas Peinecke, peinecke at gdv.uni-hannover.de (hardware pid/mac
>   *               filtering)
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public License
> - * as published by the Free Software Foundation; either version 2.1
> - * of the License, or (at your option) any later version.

That's LGPL 2.1, not GPL 2.0+.

> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include "flexcop.h"
> -- 
> 2.25.1

Thanks

Sean
