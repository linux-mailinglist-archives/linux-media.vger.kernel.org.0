Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F57D2BA245
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 07:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKTGZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 01:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgKTGZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 01:25:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDA6C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 22:25:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ccmkj1dy1z9sTL;
        Fri, 20 Nov 2020 17:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1605853535;
        bh=/UKIi79q6Eu95MhQTC3KHQ2vQz9Gi8asFIpqVebEfbg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Za5GnF8SgpLmYK0mvMRfCH7z8RFRMHJC1OhlUvmo58HebyiQlAnuz3F67jHbT/xTb
         TepHetkIKvT9+mwXnmp2rhN4mCvnR/g61MN3C0S6qayV+zWmxpxSCLtyuS3XfQJ/4G
         hT7A77XscWQh7tSEn2I/5GKOxmQwSML8JNrVibzcX7WVytrpf1Iz6XWupcWiFk9YXg
         xRfmDa4DTn8J4akmJqOoHz0JR9ncSjF5dRPyDgQ5hvrdsLKIyUj67J7cvTzigld1bE
         OmGbri57OjObyQ1wT9XWqzKQCIORzrS2NuTF7LDBdhoukWFNgc855KBTBZ1U3a29m4
         I2hkqH1yDkwvQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org
Cc:     hverkuil@xs4all.nl, paulus@samba.org,
        Fabio Estevam <festevam@gmail.com>, geert@linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: fsl-viu: Use proper check for presence of {out, in}_be32()
In-Reply-To: <20201120001509.15155-1-festevam@gmail.com>
References: <20201120001509.15155-1-festevam@gmail.com>
Date:   Fri, 20 Nov 2020 17:25:29 +1100
Message-ID: <87ima01r52.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fabio Estevam <festevam@gmail.com> writes:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>
> When compile-testing on m68k or microblaze:
>
>     drivers/media/platform/fsl-viu.c:41:1: warning: "out_be32" redefined
>     drivers/media/platform/fsl-viu.c:42:1: warning: "in_be32" redefined
>
> Fix this by replacing the check for PowerPC by checks for the presence
> of {out,in}_be32().
>
> As PowerPC implements the be32 accessors using inline functions instead
> of macros, identity definions are added for all accessors to make the
> above checks work.
>
> Fixes: 29d750686331a1a9 ("media: fsl-viu: allow building it with COMPILE_TEST")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> [fabio: adapt to mainline]
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/powerpc/include/asm/io.h    | 14 ++++++++++++++
>  drivers/media/platform/fsl-viu.c |  5 +++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index 58635960403c..fcb250db110d 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -194,6 +194,20 @@ static inline void out_be64(volatile u64 __iomem *addr, u64 val)
>  #endif
>  #endif /* __powerpc64__ */
>  
> +#define in_be16 in_be16
> +#define in_be32 in_be32
> +#define in_be64 in_be64
> +#define in_le16 in_le16
> +#define in_le32 in_le32
> +#define in_le64 in_le64
> +
> +#define out_be16 out_be16
> +#define out_be32 out_be32
> +#define out_be64 out_be64
> +#define out_le16 out_le16
> +#define out_le32 out_le32
> +#define out_le64 out_le64

I'd rather not have to carry this in arch code just for one driver.

> diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
> index 4f2a0f992905..bb6c291ed6dc 100644
> --- a/drivers/media/platform/fsl-viu.c
> +++ b/drivers/media/platform/fsl-viu.c
> @@ -31,9 +31,10 @@
>  #define DRV_NAME		"fsl_viu"
>  #define VIU_VERSION		"0.5.1"
>  
> -/* Allow building this driver with COMPILE_TEST */
> -#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
> +#ifndef out_be32
>  #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
> +#endif
> +#ifndef in_be32
>  #define in_be32(a)	ioread32be((void __iomem *)a)
>  #endif

Can't the driver just use ioread/write32be() on all platforms?

cheers
