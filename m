Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BA82CBCC6
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 13:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387535AbgLBMSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 07:18:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:49572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgLBMSG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 07:18:06 -0500
Date:   Wed, 2 Dec 2020 13:17:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606911445;
        bh=nDpirUT4HzebNKlAZcQZP0UPN73yEY091GDvXLXiKoM=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=saBL5IbI/rQj4VdWnSdQDRmPSP2MFwc7rVl8zznM8X1MRnx3kMIodra8LCR0YkGSU
         aOHWVq3ZnCJWt8VkS4JTajjvUkYFCyj1lepW0ZmCV3z5+Nmqtrlo8uBAFGhWsyefDt
         ayWru0XhVgT1XRzbcrfkcRJM9yxTvNGWVMA2XFXE=
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vidtv: fix read after free
Message-ID: <20201202131721.46ff17fc@coco.lan>
In-Reply-To: <20201130092825.28532-1-cengiz@kernel.wtf>
References: <20201130092825.28532-1-cengiz@kernel.wtf>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cengiz,

Em Mon, 30 Nov 2020 12:28:26 +0300
Cengiz Can <cengiz@kernel.wtf> escreveu:

> `vidtv_channel_si_destroy` function has a call to
>     `vidtv_psi_pat_table_destroy` that frees Program Association Table.
> 
> However it is followed by a loop that iterates over the count of Program
> Map Tables. This obviously accesses an invalid memory.
> 
> Eliminate this by making a copy of num_pmt before free'ing Program
> Association Table and loop on it instead.
> 
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>

Collin sent me a similar fix. I'm applying his because:
- it was sent first;
- it uses a better approach: it just moves the 
  vidtv_psi_pat_table_destroy() call to happen after freeing
  the PMT tables. So, it doesn't need an aux var.

Regards,
Mauro

> ---
>  drivers/media/test-drivers/vidtv/vidtv_channel.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> index 8ad6c0744d36..4af39a8786a7 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> @@ -503,10 +503,13 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
>  void vidtv_channel_si_destroy(struct vidtv_mux *m)
>  {
>  	u32 i;
> +	u16 num_pmt;
> +
> +	num_pmt = m->si.pat->num_pmt;
>  
>  	vidtv_psi_pat_table_destroy(m->si.pat);
>  
> -	for (i = 0; i < m->si.pat->num_pmt; ++i)
> +	for (i = 0; i < num_pmt; ++i)
>  		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
>  
>  	kfree(m->si.pmt_secs);



Thanks,
Mauro
