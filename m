Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9CA45F5F4
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239501AbhKZUlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbhKZUjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:39:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1415C061757;
        Fri, 26 Nov 2021 12:29:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 58816B82878;
        Fri, 26 Nov 2021 20:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F5DC004E1;
        Fri, 26 Nov 2021 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637958582;
        bh=Soaqu6tNzNEipc/mjxI8QZXWeB4QtTPXfbivf/RMguM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qG0iQZl9v1M/ajoY1HipuwZIiE70L/SzFnt67FFeJ9bcaGVUyGEzwiG0UJ0nNRE/U
         SU7vVy6H5rJg2XMiKRpID5bHWyI5V3Oy/HYttGhWetF6xrGmG2/qyb0qpi6kcuWBHD
         gmpLFD5AmY89Yj8nt4nWPWmyp1p30qxinzD9DR7h6SwyhoR094hYwggmSLkSq1OOJZ
         7Z9Zyu+hNf5c7N6VfF4uyZt89RTbaFzriKaP+Ca32sOYSg6O9dkdAZ5erg/PBtIwkj
         gMrPaRjxNwvuXliocJrWi0gTkOf6h1/3uOqAsX+kfxLQCcB5nZ6TADMzofFT/Kdgmq
         u0UbZ2j/REzXg==
Date:   Fri, 26 Nov 2021 13:29:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 19/20] media: cobalt: drop an unused variable
Message-ID: <YaFDsZrPOO5gshoi@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <ed14f3d4d03fbeb8d42d1bc6ffcb4d49ee18a8d2.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed14f3d4d03fbeb8d42d1bc6ffcb4d49ee18a8d2.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:22PM +0100, Mauro Carvalho Chehab wrote:
> The clock_control value is read but never actually used. Based on
> a comment at the code, it has to be reset at the function.
> 
> So, drop the variable that stores its value.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/pci/cobalt/cobalt-cpld.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/cobalt/cobalt-cpld.c b/drivers/media/pci/cobalt/cobalt-cpld.c
> index 3d8026483ac3..fad882459d23 100644
> --- a/drivers/media/pci/cobalt/cobalt-cpld.c
> +++ b/drivers/media/pci/cobalt/cobalt-cpld.c
> @@ -236,7 +236,6 @@ bool cobalt_cpld_set_freq(struct cobalt *cobalt, unsigned f_out)
>  	u8 n1, hsdiv;
>  	u8 regs[6];
>  	int found = 0;
> -	u16 clock_ctrl;
>  	int retries = 3;
>  
>  	for (i = 0; i < ARRAY_SIZE(multipliers); i++) {
> @@ -260,9 +259,7 @@ bool cobalt_cpld_set_freq(struct cobalt *cobalt, unsigned f_out)
>  	hsdiv = multipliers[i_best].hsdiv - 4;
>  	rfreq = div_u64(dco << 28, f_xtal);
>  
> -	clock_ctrl = cpld_read(cobalt, SI570_CLOCK_CTRL);
> -	clock_ctrl |= S01755_REG_CLOCK_CTRL_BITMAP_CLKHSMA_FPGA_CTRL;
> -	clock_ctrl |= S01755_REG_CLOCK_CTRL_BITMAP_CLKHSMA_EN;
> +	cpld_read(cobalt, SI570_CLOCK_CTRL);
>  
>  	regs[0] = (hsdiv << 5) | (n1 >> 2);
>  	regs[1] = ((n1 & 0x3) << 6) | (rfreq >> 32);
> -- 
> 2.33.1
> 
> 
