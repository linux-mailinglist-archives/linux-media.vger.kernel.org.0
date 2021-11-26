Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47D645F538
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhKZTgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:36:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbhKZTeD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:34:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D11DC061D70;
        Fri, 26 Nov 2021 10:55:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBBE162325;
        Fri, 26 Nov 2021 18:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793C1C9305D;
        Fri, 26 Nov 2021 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637952954;
        bh=QxvpkoeoPXHKF44a5JmxbPGWCveiZYRK4WpUxai+hE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmnpKyCLljopKULpFvdNNmTA2cgguJ3Wen5AETWjo30qNrabYJsKDqH03reUIiPHD
         0Yna7S8Dy9ORgurq8WVfNWzt+2RYdhIvfByowoPvXyPKiWzJBWPiR4RRBoWBJ3BZq2
         yxeAG6Zij4RBukAEgOLNMvMOjvoELPvp/2Jf2UaRa2N8APzZizE5fnSTXahWfG/AWp
         xEw+gAxljYnR3S6qP/7MLE8587sqmJK9ur32o+aMgvxPzhgbqgvbNDbJUwQNA89smM
         b1O/xVBNPmpUSgOTVS+G/K1qDfMkkGKZ7FZYjRLHtVHWT4+A4R6GsPqQtZt+Vpzl3B
         Ronlc8yGD3New==
Date:   Fri, 26 Nov 2021 11:55:49 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 02/20] media: saa7134-go7007: get rid of to_state()
 function
Message-ID: <YaEttXREXakbI3Md@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <0de4ecd59028848b24cfb57fcf0ac0480d6c7029.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de4ecd59028848b24cfb57fcf0ac0480d6c7029.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:05PM +0100, Mauro Carvalho Chehab wrote:
> This is just an alias for container_of() and it is used only
> on a commented code. The commented code actually is an issue that
> require fixes, so, move the container_of() call to the commented
> code, and drop the unused function.
> 
> This way, a fix for the function could be added later without
> needing to re-add to_state() function.
> 
> This fixes a clang W=1 warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/pci/saa7134/saa7134-go7007.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-go7007.c b/drivers/media/pci/saa7134/saa7134-go7007.c
> index f319edb39c0e..da83893ffee9 100644
> --- a/drivers/media/pci/saa7134/saa7134-go7007.c
> +++ b/drivers/media/pci/saa7134/saa7134-go7007.c
> @@ -56,11 +56,6 @@ struct saa7134_go7007 {
>  	dma_addr_t bottom_dma;
>  };
>  
> -static inline struct saa7134_go7007 *to_state(struct v4l2_subdev *sd)
> -{
> -	return container_of(sd, struct saa7134_go7007, sd);
> -}
> -
>  static const struct go7007_board_info board_voyager = {
>  	.flags		 = 0,
>  	.sensor_flags	 = GO7007_SENSOR_656 |
> @@ -385,7 +380,7 @@ MODULE_FIRMWARE("go7007/go7007tv.bin");
>  static int saa7134_go7007_s_std(struct v4l2_subdev *sd, v4l2_std_id norm)
>  {
>  #if 0
> -	struct saa7134_go7007 *saa = to_state(sd);
> +	struct saa7134_go7007 *saa = container_of(sd, struct saa7134_go7007, sd);
>  	struct saa7134_dev *dev = saa->dev;
>  
>  	return saa7134_s_std_internal(dev, NULL, norm);
> -- 
> 2.33.1
> 
> 
