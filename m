Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A026C45F5BA
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhKZUXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239486AbhKZUVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:21:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742F2C061784;
        Fri, 26 Nov 2021 12:16:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A98D62289;
        Fri, 26 Nov 2021 20:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B959C9305B;
        Fri, 26 Nov 2021 20:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637957791;
        bh=D43dJxH63xJnkFSZ3x1saj+JMV8TNEEF45D6HTba0io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tGBct4B5ez1IrJQl1a4ZtyZJ88pmVIy3QqSYazWf1vt+q59xPQX+E5AAEEgCQvjKM
         L7r9CLS8pPwMFBvSUwUvncNzfrGClskuMmP/9TLbFJIGX42PWiHFjV6Zp1dpX0cCci
         NeQr3oitQATqi2jhtI7IbErUBBtU/NO74i26U3g8HW1888IoDZNGPHqkG8eNv92Y9E
         0RIbLS2tDAEzqdIZj07j+I7mBYs4xX5nUOh2QYnaq63f8UlKpVQV7qkK5tsIccDFOf
         DmmqGq1TT+ipmZ7ty8TeM9Fj+b8Tk7M+bgx/rAihTjstfwEomXRm3iZYjJJ3rIt9hr
         2GjMglxuz9JFw==
Date:   Fri, 26 Nov 2021 13:16:25 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 11/20] media: lmedm04: don't ignore errors when setting a
 filter
Message-ID: <YaFAmTnfcoBi447U@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <7da947b5433ecdd9cf1f2a50f4ae5cbc493dc844.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da947b5433ecdd9cf1f2a50f4ae5cbc493dc844.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:14PM +0100, Mauro Carvalho Chehab wrote:
> Solves a clang warning
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/usb/dvb-usb-v2/lmedm04.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> index fe4d886442a4..8a34e6c0d6a6 100644
> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> @@ -423,6 +423,9 @@ static int lme2510_pid_filter_ctrl(struct dvb_usb_adapter *adap, int onoff)
>  
>  	mutex_unlock(&d->i2c_mutex);
>  
> +	if (ret)
> +		return -EREMOTEIO;
> +
>  	return 0;
>  }
>  
> -- 
> 2.33.1
> 
> 
