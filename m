Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C763631E1
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 20:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbhDQS4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 14:56:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhDQS4p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 14:56:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD7E3611AF;
        Sat, 17 Apr 2021 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618685778;
        bh=q4iX3RXOxXW84nbXIPQOIIfrItUVpHgRu5CQVY3pD10=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mWgNqAbstI1cedVjNcKZidVcBm6v9IMj6tzpUNed3gM+CxaGhhzIxC1UOwBzntmUW
         c1U1MiHMnGGaKttVW39g17SsIQZtZvGXzyJAxB1L5XR9ZygLHpQCXujyFHR235qdR8
         dZFMoheVyzYtQ0iBi2dCjpL6CMHG6fQoRuHMND+ROEKNiHuczSIzTecO3wRPTV5De4
         jqyb1DK88vc83w9nPL8JMnYBU1AIakMztOAGgCZw3AJI6xdWUSrZ8lBQ1IsnNicTpK
         XlmBjnNMvaD5SU74U3oO5NHldTInUUnqPG+fq+aLTx4Mvci7aJI83JJPQIuVWXKDm6
         zAtyEUgR6KUcQ==
Date:   Sat, 17 Apr 2021 20:56:13 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ashish Kalra <eashishkalra@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Message-ID: <20210417205613.5c1aac74@coco.lan>
In-Reply-To: <20210417153627.GA50228@ashish-NUC8i5BEH>
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 17 Apr 2021 21:06:27 +0530
Ashish Kalra <eashishkalra@gmail.com> escreveu:

> Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> for this file.  Logical and bitwise OR are basically the same in this
> context so it doesn't cause a runtime bug.  But let's change it to
> logical OR to make it cleaner and silence the Sparse warning.
> 
> Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> ---
>  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> index 358cb7d2cd4c..3b850bb2d39d 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
>  	unsigned int ds_log2 = 0;
>  	unsigned int out_width;
>  
> -	if ((!out_info) | (!vf_info))
> +	if ((!out_info) || (!vf_info))


While here, please get rid of the unneeded parenthesis:

	if (!out_info || !vf_info)


>  		return -EINVAL;
>  
>  	out_width = out_info->res.width;



Thanks,
Mauro
