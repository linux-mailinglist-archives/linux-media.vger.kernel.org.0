Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2436644EE0F
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 21:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235789AbhKLUqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 15:46:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:53586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235790AbhKLUqt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 15:46:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D7F960E98;
        Fri, 12 Nov 2021 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636749838;
        bh=44Grebjtn08PPJK53+7UCVpYeLQZNqJn0FxDmRp79Uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P0anhKlJK4yFjNGc3nDLR600JzbqH3mRSg/M7qQspD4r1KQQpQ8/0VI6fnk4CZ0xA
         G7Ap62puS0BBr5VE2xqL5wZPWYBxiXTuWhT2rNjDF0s3kab8wWngTw1k8jTn4cFB6O
         GrCUc6CuisQO0JHvn/79ujd72TCavoJEY6ald8UEjkLXuuLqA91BAFiFZyCDjODezv
         3i/58hp/WVdH1qNqJ0GILJ62GzCHLOfZEWct4DB9GB30xEI8cDPmC/a8clHM08XZHn
         k8F1Yi7sqc2um3rm4gFeTJ0p7KLycIVNciZHrmooeWjcZSVv/j0b+TI9+MVUihSA/x
         NXlS0pUFPCkAg==
Date:   Fri, 12 Nov 2021 13:43:53 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] media: ipu3: drop an unused variable
Message-ID: <YY7SCZ7jAu2RVYvN@archlinux-ax161>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:08:51PM +0000, Mauro Carvalho Chehab wrote:
> Fix this clang Werror with W=1:
> 
> 	drivers/staging/media/ipu3/ipu3-css-params.c:774:8: error: variable 'pin_scale' set but not used [-Werror,-Wunused-but-set-variable]
> 	                        int pin_scale = 0;
> 	                            ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/
> 
>  drivers/staging/media/ipu3/ipu3-css-params.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index e9d6bd9e9332..d9e3c3785075 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -771,7 +771,6 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
>  		 */
>  		{
>  			unsigned int i;
> -			int pin_scale = 0;
>  			/*Input resolution */
>  
>  			stripe_params[s].input_width = stripe_input_width_y;
> @@ -791,8 +790,6 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
>  						reso.pin_height[i];
>  					stripe_params[s].output_offset[i] =
>  						stripe_offset_out_y;
> -
> -					pin_scale += frame_params[i].scaled;
>  				} else {
>  					/* Unscaled pin */
>  					stripe_params[s].output_width[i] =
> -- 
> 2.33.1
> 
> 
