Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8047545F598
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238060AbhKZUDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:03:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45364 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbhKZUBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:01:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E28B62281;
        Fri, 26 Nov 2021 19:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFFBC9305B;
        Fri, 26 Nov 2021 19:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637956720;
        bh=IFf1ecMh4Bnw18fc4ZMs3yGyZLJiuftziq4tzCLWrV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IIRppV9siSt/nW0sPBkDKeEAg7JUZxVafoEAFe56ZjOQu696KkByvquN6v+M4OsUC
         uB0FGbJli+z88/WgzUMKVl5cZqY729me6tUY/2FK4gwvJveJNXW2HcRM8XDcjohEkk
         dxzZNNGmTiMNsIjMjU0WIyeyqTXAz6Uj4ywHQWiYtB+JgOWatVUa7zOPTZAOddw0eI
         DF4/Eq0Pc7JXEtsNd0z29z6XJlQ3d4ILPExI62P9/sP9kx+QpYvVijLt0xLhSTD6EE
         dnaBj9+NUP0eyM9fnnxTFZDHPrAyfdxwd+iNU0uqRmlv49MOtxzvriDsdRRuLcZfKi
         ctkpssoZ98Rbw==
Date:   Fri, 26 Nov 2021 12:58:33 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 08/20] media: solo6x10: add _maybe_unused to currently
 unused functions
Message-ID: <YaE8aRz1OIJ+x5P5@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <18daa194878d8815beef39d6fed2a838e1c2cb68.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18daa194878d8815beef39d6fed2a838e1c2cb68.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:11PM +0100, Mauro Carvalho Chehab wrote:
> There are several unused helper macros there, meant to parse some
> fields.
> 
> While there's not wrong with that, it generates clang warnings
> with W=1, causing build to break with CONFIG_WERROR.
> 
> So, add __maybe_unused to fix such warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I'll comment on this one patch but my opinion applies for all the
patches adding '__maybe_unused' to truly unused functions.

I agree with Laurent's comment [1]: unless this code is going to be used
soon, it should be deleted and resurrected when it is actually needed.
We have git for a reason and by adding this attribute, you are making it
harder to catch and eliminate unused functions, as no compiler will
catch them with an unused attribute (it is possible other static
analysis tools will but I doubt those are run as frequently as compilers
with W=1).

However, you are the maintainer so if you really want to keep these
around, I would recommend adding '__always_unused' instead of
'__maybe_unused' for documentation and auditing purposes, even though
they evaluate to the same thing:

$ rg __always_unused | wc -l
337

$ rg __maybe_unused | wc -l
4335

[1]: https://lore.kernel.org/r/YZtpnjPcGxVwhe61@pendragon.ideasonboard.com/

Cheers,
Nathan

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> index 0abcad4e84fa..85eaf5d00e9b 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> @@ -391,12 +391,12 @@ static int solo_send_desc(struct solo_enc_dev *solo_enc, int skip,
>  }
>  
>  /* Extract values from VOP header - VE_STATUSxx */
> -static inline int vop_interlaced(const vop_header *vh)
> +static inline __maybe_unused int vop_interlaced(const vop_header *vh)
>  {
>  	return (__le32_to_cpu((*vh)[0]) >> 30) & 1;
>  }
>  
> -static inline u8 vop_channel(const vop_header *vh)
> +static inline __maybe_unused u8 vop_channel(const vop_header *vh)
>  {
>  	return (__le32_to_cpu((*vh)[0]) >> 24) & 0x1F;
>  }
> @@ -411,12 +411,12 @@ static inline u32 vop_mpeg_size(const vop_header *vh)
>  	return __le32_to_cpu((*vh)[0]) & 0xFFFFF;
>  }
>  
> -static inline u8 vop_hsize(const vop_header *vh)
> +static inline u8 __maybe_unused vop_hsize(const vop_header *vh)
>  {
>  	return (__le32_to_cpu((*vh)[1]) >> 8) & 0xFF;
>  }
>  
> -static inline u8 vop_vsize(const vop_header *vh)
> +static inline u8 __maybe_unused vop_vsize(const vop_header *vh)
>  {
>  	return __le32_to_cpu((*vh)[1]) & 0xFF;
>  }
> @@ -436,12 +436,12 @@ static inline u32 vop_jpeg_size(const vop_header *vh)
>  	return __le32_to_cpu((*vh)[4]) & 0xFFFFF;
>  }
>  
> -static inline u32 vop_sec(const vop_header *vh)
> +static inline u32 __maybe_unused vop_sec(const vop_header *vh)
>  {
>  	return __le32_to_cpu((*vh)[5]);
>  }
>  
> -static inline u32 vop_usec(const vop_header *vh)
> +static inline __maybe_unused u32 vop_usec(const vop_header *vh)
>  {
>  	return __le32_to_cpu((*vh)[6]);
>  }
> -- 
> 2.33.1
> 
> 
