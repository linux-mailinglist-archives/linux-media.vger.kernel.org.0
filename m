Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D714C2EBF20
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhAFNqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:46:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbhAFNqx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 08:46:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38F182311B;
        Wed,  6 Jan 2021 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609940773;
        bh=XDCxZhCKT8DeXSiZhbQqWaGK9S2/Q/GSYiZmpuVdE0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CJwBqN9ZRCcrMy5lfLizt9P6BA9gYWI9nG5taJBe48NVwKi4RD+P0LdecjK9sj2HX
         7hfYfgqZDR0hfzV2YQKY+eLJlgx9boqDYc7u8G+5zvyPmVGCilWoYH1TGrMmd9q1vm
         4V9zSwKbsY/yWMw8vnu0ZIyRbu9I/qjYPdCbK6Jc=
Date:   Wed, 6 Jan 2021 14:47:32 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH -next] media: atomisp: use resource_size
Message-ID: <X/W/dFVbrv2W+Rl6@kroah.com>
References: <20210106131737.32571-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106131737.32571-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 09:17:37PM +0800, Zheng Yongjun wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 24fc497bd491..4a02948e5612 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -949,7 +949,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
>  
>  	params = stream->isp_params_configs;
>  	height = raw_black_frame->info.res.height;
> -	width = raw_black_frame->info.padded_width,
> +	width = raw_black_frame->info.padded_width;
d>  
>  	ptr = raw_black_frame->data
>  	+ raw_black_frame->planes.raw.offset;
> @@ -1443,7 +1443,7 @@ static int sh_css_params_default_morph_table(
>  	IA_CSS_ENTER_PRIVATE("");
>  
>  	step = (ISP_VEC_NELEMS / 16) * 128,
> -	width = binary->morph_tbl_width,
> +	width = binary->morph_tbl_width;
>  	height = binary->morph_tbl_height;
>  
>  	tab = ia_css_morph_table_allocate(width, height);
> -- 
> 2.22.0
> 

Your description does not match what the patch does at all :(
