Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 026AC30387
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 22:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfE3Uqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 16:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbfE3Uqj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 16:46:39 -0400
Received: from localhost (unknown [207.225.69.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 471722617A;
        Thu, 30 May 2019 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559249198;
        bh=3l/fBGXgNQ3z54neldfhfMe6aZgeoJlVyXU0AaAwnio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v2pCGD1jqzExF0Y6VZpFYt1i0aBb2vFESyML1kkiCIWUs+pjHG6XtXbVHLl2EVijj
         BPpjNLOPwnr4zqUnkCf/x7hqMD+CaVljtHhdHFyBj1AcxfemywLbyFdg0YxXlX7x0e
         6FJIMcqspp4XZ2rNP9jiDTQ9BLMjDT3ZOje9k6gs=
Date:   Thu, 30 May 2019 13:46:38 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     digetx@gmail.com, mchehab@kernel.org, thierry.reding@gmail.com,
        jonathan@nvidia.com, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-vde: Remove variable
Message-ID: <20190530204638.GA4784@kroah.com>
References: <20190530204439.29830-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530204439.29830-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 31, 2019 at 02:14:39AM +0530, Nishka Dasgupta wrote:
> Remove unnecessary variable iram_tables and use its value directly.
> Issue found using Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/tegra-vde.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
> index a5020dbf6eef..3205973218e4 100644
> --- a/drivers/staging/media/tegra-vde/tegra-vde.c
> +++ b/drivers/staging/media/tegra-vde/tegra-vde.c
> @@ -273,12 +273,10 @@ static void tegra_vde_setup_iram_entry(struct tegra_vde *vde,
>  				       unsigned int row,
>  				       u32 value1, u32 value2)
>  {
> -	u32 *iram_tables = vde->iram;
> -
>  	trace_vde_setup_iram_entry(table, row, value1, value2);
>  
> -	iram_tables[0x20 * table + row * 2] = value1;
> -	iram_tables[0x20 * table + row * 2 + 1] = value2;
> +	vde->iram[0x20 * table + row * 2] = value1;
> +	vde->iram[0x20 * table + row * 2 + 1] = value2;

Ick, no, why?  why why why?

You keep sending these patches, please take a bit of time to think about
what you are doing and see if the change actually makes sense.

Again, here, no, it does not.

greg k-h
