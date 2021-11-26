Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3977D45F556
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbhKZTqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:46:08 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:38032 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236633AbhKZToB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:44:01 -0500
X-Greylist: delayed 2741 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 14:44:01 EST
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEE0F62349;
        Fri, 26 Nov 2021 19:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B266C9305E;
        Fri, 26 Nov 2021 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637955644;
        bh=oG8oK2pVUUnHX6IJxtTQVBsz/ygOdYwME2YFP9YtwU4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIxgUV3RtzzoC11+Zri1Dd1KbeT+w2ZJgAOlUAlpgFs73KzC+YGl7ZPBOzdy2rCiH
         H364zFlz5S+/e3lDSy06G9EypaAZU83hVgSASZl95AZ34keoUJUGyWJnu2RQlUYqjo
         VTuU8e5qBngyb4l1g136fWmL2RuKNEhcF/KOyj0nt6WWM4zrzoZjbCPJiu49sDSoUE
         Z2U3RK/JI44ovbH84p/DIbyCVvGvBOk+wnTzCrmt4YSdI26KZyGNwEfKqMgKwusTTx
         vMMbDj2TWzEQqKBhLacSAZU9WellgcIpukyaElgcK0XmClcVxqqHja5C95bLqNDW6c
         rnztxyUJ3glaQ==
Date:   Fri, 26 Nov 2021 12:40:38 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 06/20] media: m88ds3103: drop reg11 calculus from
 m88ds3103b_select_mclk()
Message-ID: <YaE4Nkvp9NCfGItD@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <9e528a0ce280d8ce99f9bfe1a725baafa6bf1408.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e528a0ce280d8ce99f9bfe1a725baafa6bf1408.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:09PM +0100, Mauro Carvalho Chehab wrote:
> This vaklue is never used at the code. So, drop it.

       ^ value

> Solves a W=1 clang warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I would expect GCC to warn about this as well.

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/dvb-frontends/m88ds3103.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
> index 02e8aa11e36e..bce0f42f3d19 100644
> --- a/drivers/media/dvb-frontends/m88ds3103.c
> +++ b/drivers/media/dvb-frontends/m88ds3103.c
> @@ -451,7 +451,7 @@ static int m88ds3103b_select_mclk(struct m88ds3103_dev *dev)
>  
>  static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
>  {
> -	u8 reg11 = 0x0A, reg15, reg16, reg1D, reg1E, reg1F, tmp;
> +	u8 reg15, reg16, reg1D, reg1E, reg1F, tmp;
>  	u8 sm, f0 = 0, f1 = 0, f2 = 0, f3 = 0;
>  	u16 pll_div_fb, N;
>  	u32 div;
> @@ -480,8 +480,6 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
>  	div /= mclk_khz;
>  
>  	if (dev->cfg->ts_mode == M88DS3103_TS_SERIAL) {
> -		reg11 |= 0x02;
> -
>  		if (div <= 32) {
>  			N = 2;
>  
> @@ -532,8 +530,6 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
>  		else if ((f3 < 8) && (f3 != 0))
>  			f3 = 8;
>  	} else {
> -		reg11 &= ~0x02;
> -
>  		if (div <= 32) {
>  			N = 2;
>  
> -- 
> 2.33.1
> 
> 
