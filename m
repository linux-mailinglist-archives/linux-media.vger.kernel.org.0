Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80F9589939
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 10:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbiHDIXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Aug 2022 04:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiHDIXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Aug 2022 04:23:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC82A4C636
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 01:23:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 873F6B8243C
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 08:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE67C433D6;
        Thu,  4 Aug 2022 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1659601425;
        bh=Xhc5rJ02ivNxgg+cJzHeDv7qIuRBaz1s8ilrV+6MIEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SJ3F4v1jdzdKN7FvEIhGvDkNRAJzmb2n5pWQH/YFhDq8qkeVlTOb3TY3KBra1A3Rn
         FGTGRKeNY/ka8rMKhLpvb2jJPm7bsQfBXssLdLSI1kE+E3cVmgkpRNSVKIbnVCHhOx
         9xc0JTZsrnNqRYvbLPeLuILgO8l7i5SRsF8HDFEk=
Date:   Thu, 4 Aug 2022 10:23:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chen Shi <shichen01@baidu.com>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: media: imx: imx7-media-utils: Fix a
 coding style problem
Message-ID: <YuuCDsMej1FYrSF7@kroah.com>
References: <20220804071046.31520-1-shichen01@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804071046.31520-1-shichen01@baidu.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 04, 2022 at 03:10:46PM +0800, Chen Shi wrote:
> Add parentheses to enclose macros with complex values.

Why?

> 
> Signed-off-by: Chen Shi <shichen01@baidu.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 294c808b2ebe..c94013175181 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -7,7 +7,7 @@
>  #include <linux/module.h>
>  #include "imx-media.h"
>  
> -#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> +#define IMX_BUS_FMTS(fmt...) {(const u32[]) {fmt, 0}}

What does this change?  Why make this change at all?

confused,

greg k-h
