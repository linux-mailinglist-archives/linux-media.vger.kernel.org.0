Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C4945F53B
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbhKZThU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236499AbhKZTfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:35:20 -0500
X-Greylist: delayed 82 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Nov 2021 10:58:07 PST
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67335C061D7C;
        Fri, 26 Nov 2021 10:58:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E805FB82869;
        Fri, 26 Nov 2021 18:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CC1C93056;
        Fri, 26 Nov 2021 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637953084;
        bh=kGidO4zuFh4BMthEhvCDY4o9ykONd2hx9jR7ofbAhaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cEbRMurWmo6CV6alcv/WnqFevTnmP8zpc6cQtNn98/jVkQOWZuIPUP8KUp1gbR518
         4sqUUVlofHxjoDmmPFxGxDZq8cca3pSXqX0bB6jVd9OTfzW4RLRErObWBVM8Sx1viY
         uMPRX74mX+sckUQvVaRSeU0RHPglK6boYCh2dHgBeczRekrRVIElFud98mv1fAZ5K1
         sEUY2SQNFYkiZ3PV4jt5lSjQzMvA5jxhwoIsfwsv42c4qhONQHUrVpz+qCmB+b7h18
         jX3HCtDSQPOmqkrzUDU2LosZpYsHbDKMaG702Gb3O6i89H2svj3jY1HGglrXBa48qz
         1rQiulBwon49A==
Date:   Fri, 26 Nov 2021 11:57:59 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 04/20] media: drxd: drop offset var from
 DownloadMicrocode()
Message-ID: <YaEuN/RLRFptXkHP@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <f4d081b88635e114d69cda30526fa04927be89d2.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4d081b88635e114d69cda30526fa04927be89d2.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:07PM +0100, Mauro Carvalho Chehab wrote:
> The offset is not needed, and it is never used, as the pointer
> itself is already incremented.
> 
> So, drop it, in order to solve a W=1 clang warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I would expect GCC to warn about this as well.

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/dvb-frontends/drxd_hard.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
> index a7eb81df88c2..9860cae65f1c 100644
> --- a/drivers/media/dvb-frontends/drxd_hard.c
> +++ b/drivers/media/dvb-frontends/drxd_hard.c
> @@ -914,44 +914,36 @@ static int DownloadMicrocode(struct drxd_state *state,
>  	u32 Address;
>  	u16 nBlocks;
>  	u16 BlockSize;
> -	u32 offset = 0;
>  	int i, status = 0;
>  
>  	pSrc = (u8 *) pMCImage;
>  	/* We're not using Flags */
>  	/* Flags = (pSrc[0] << 8) | pSrc[1]; */
>  	pSrc += sizeof(u16);
> -	offset += sizeof(u16);
>  	nBlocks = (pSrc[0] << 8) | pSrc[1];
>  	pSrc += sizeof(u16);
> -	offset += sizeof(u16);
>  
>  	for (i = 0; i < nBlocks; i++) {
>  		Address = (pSrc[0] << 24) | (pSrc[1] << 16) |
>  		    (pSrc[2] << 8) | pSrc[3];
>  		pSrc += sizeof(u32);
> -		offset += sizeof(u32);
>  
>  		BlockSize = ((pSrc[0] << 8) | pSrc[1]) * sizeof(u16);
>  		pSrc += sizeof(u16);
> -		offset += sizeof(u16);
>  
>  		/* We're not using Flags */
>  		/* u16 Flags = (pSrc[0] << 8) | pSrc[1]; */
>  		pSrc += sizeof(u16);
> -		offset += sizeof(u16);
>  
>  		/* We're not using BlockCRC */
>  		/* u16 BlockCRC = (pSrc[0] << 8) | pSrc[1]; */
>  		pSrc += sizeof(u16);
> -		offset += sizeof(u16);
>  
>  		status = WriteBlock(state, Address, BlockSize,
>  				    pSrc, DRX_I2C_CLEARCRC);
>  		if (status < 0)
>  			break;
>  		pSrc += BlockSize;
> -		offset += BlockSize;
>  	}
>  
>  	return status;
> -- 
> 2.33.1
> 
> 
