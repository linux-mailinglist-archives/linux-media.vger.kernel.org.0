Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDDE342E7A
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 17:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhCTQ6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 12:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTQ6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 12:58:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C8FC061574
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 09:58:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B884F1F45E6C
Message-ID: <c13dc9e059909fc176eb3866dcd29fe49bd2e1e4.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Remove of_match_ptr()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl
Cc:     boris.brezillon@collabora.com, linux-media@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Date:   Sat, 20 Mar 2021 13:58:03 -0300
In-Reply-To: <20210320122152.203446-1-festevam@gmail.com>
References: <20210320122152.203446-1-festevam@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-03-20 at 09:21 -0300, Fabio Estevam wrote:
> When building with CONFIG_OF not set, the following clang
> build warning is seen:
> 
> > > drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]
> 
> Fix the warning by removing the unnecessary of_match_ptr().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 225eeca73356..0ff013c1fc38 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -1092,7 +1092,7 @@ static struct platform_driver rkvdec_driver = {
>         .remove = rkvdec_remove,
>         .driver = {
>                    .name = "rkvdec",
> -                  .of_match_table = of_match_ptr(of_rkvdec_match),
> +                  .of_match_table = of_rkvdec_match,
>                    .pm = &rkvdec_pm_ops,
>         },
>  };

Looks good.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

