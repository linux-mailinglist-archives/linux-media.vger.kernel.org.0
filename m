Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FE545E290
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 22:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349911AbhKYVgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 16:36:12 -0500
Received: from iodev.co.uk ([46.30.189.100]:59072 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244970AbhKYVeL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 16:34:11 -0500
X-Greylist: delayed 707 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Nov 2021 16:34:11 EST
Received: from pirotess (104.red-83-50-135.dynamicip.rima-tde.net [83.50.135.104])
        by iodev.co.uk (Postfix) with ESMTPSA id 1B5966D0E4;
        Thu, 25 Nov 2021 22:19:08 +0100 (CET)
Date:   Thu, 25 Nov 2021 22:18:51 +0100
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 08/20] media: solo6x10: add _maybe_unused to currently
 unused functions
Message-ID: <YZ/9uzBfNF7U/jlY@pirotess>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <18daa194878d8815beef39d6fed2a838e1c2cb68.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18daa194878d8815beef39d6fed2a838e1c2cb68.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/Nov/2021 20:13, Mauro Carvalho Chehab wrote:
> There are several unused helper macros there, meant to parse some
> fields.
> 
> While there's not wrong with that, it generates clang warnings
> with W=1, causing build to break with CONFIG_WERROR.
> 
> So, add __maybe_unused to fix such warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

Acked-by: Ismael Luceno <ismael@iodev.co.uk>
