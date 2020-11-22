Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B352BC70F
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgKVQdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:33:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:53048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgKVQdQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:33:16 -0500
Received: from coco.lan (ip5f5ad5ca.dynamic.kabel-deutschland.de [95.90.213.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A4CD20781;
        Sun, 22 Nov 2020 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606062796;
        bh=KziRjoXHGWXfD1Ee+bXbjXK30Ug/6nzz4PerIjzcHLg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q55vGEyfugvsSM4of6dzek1crn1c7anEELYc8qBDIXKa5PeI+SZcEcRPpBhluPYOW
         IJKqXzVAmemwPGy9H4tOyakfkrvc4/MJkcA4UXtZJ3zOLHX9Xc8gLbfIDDjVAvJu3K
         5cC7JfZY+iewNIj7ZkpvGhTGe7T49I32rVy773+s=
Date:   Sun, 22 Nov 2020 17:33:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 096/141] media: rcar_jpu: Fix fall-through warnings for
 Clang
Message-ID: <20201122173313.0d507269@coco.lan>
In-Reply-To: <55b0dd100f6c2799e0250ce479291fceb40bb462.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
        <55b0dd100f6c2799e0250ce479291fceb40bb462.1605896060.git.gustavoars@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 20 Nov 2020 12:37:02 -0600
"Gustavo A. R. Silva" <gustavoars@kernel.org> escreveu:

> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  drivers/media/platform/rcar_jpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
> index 9b99ff368698..87466edf8a5e 100644
> --- a/drivers/media/platform/rcar_jpu.c
> +++ b/drivers/media/platform/rcar_jpu.c
> @@ -648,6 +648,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
>  			if (get_word_be(&jpeg_buffer, &word))
>  				return 0;
>  			skip(&jpeg_buffer, (long)word - 2);
> +			break;
>  		case 0:
>  			break;
>  		default:



Thanks,
Mauro
