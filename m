Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA444EE1B
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 21:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhKLUtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 15:49:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235716AbhKLUtU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 15:49:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDC3360E8D;
        Fri, 12 Nov 2021 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636749989;
        bh=m5K02cTVPRzI5GNSUzaxA5GJcxhlRvjYoYYq9bPD2Fg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s2JQJO3BwKHk6LI6jzCIFGp5Q32WWX4pdO8OB/KOq0iLbF3HMcHVKhpTeLqOc7my2
         S3QhDF70CjMxqTeR/5zc4q1nMSosgLStfhFwdUbKId/8lB1o+/rjWVPCEUSUBtmiue
         D12VMjyPw41JoN2pOWWZTjfgxJ+ktRzPYX0EIL3C+Id3vW5tD4OuwLARIiQMLc25fb
         x+0lVZJ16G+kUbGiBbNFjv5cBQID7yvQbd/rMn54pJyn1cYpTYKf6EzXQ01LtuVqoj
         UyZxsxEQlEO300BIpY9l4e73BySy0FZ7C7TE8KvrJ2Qf1HEG7Cta2phyS2hb5Aq/Gc
         z7nynO74LigRA==
Date:   Fri, 12 Nov 2021 13:46:23 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Beatriz Martins de Carvalho 
        <martinsdecarvalhobeatriz@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tom Rix <trix@redhat.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] media: atomisp-gc2235: drop an unused var
Message-ID: <YY7Sn6yW9jRKHkWl@archlinux-ax161>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <81245e1273f2e0e96a520b9d00cd415f65d37b48.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81245e1273f2e0e96a520b9d00cd415f65d37b48.1636672052.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:08:52PM +0000, Mauro Carvalho Chehab wrote:
> Fix this clang Werror with W=1:
> 
> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:573:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret = -1;
>             ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/
> 
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 5e7085264189..0e6b2e6100d1 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -570,14 +570,16 @@ static int power_ctrl(struct v4l2_subdev *sd, bool flag)
>  static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  {
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
> -	int ret = -1;
> +	int ret;
>  
>  	if (!dev || !dev->platform_data)
>  		return -ENODEV;
>  
> -	ret |= dev->platform_data->gpio1_ctrl(sd, !flag);
> +	ret = dev->platform_data->gpio1_ctrl(sd, !flag);
>  	usleep_range(60, 90);
> -	return dev->platform_data->gpio0_ctrl(sd, flag);
> +	ret |= dev->platform_data->gpio0_ctrl(sd, flag);
> +
> +	return ret;
>  }
>  
>  static int power_up(struct v4l2_subdev *sd)
> -- 
> 2.33.1
> 
> 
