Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB02257B5A
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgHaOfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 10:35:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgHaOfV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 10:35:21 -0400
Received: from coco.lan (ip5f5ad5da.dynamic.kabel-deutschland.de [95.90.213.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62BE720767;
        Mon, 31 Aug 2020 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598884521;
        bh=tRBcPIP46PIv9mvYzx8qR3efQWkqbvGf3UbDReEJolA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bdLjsyhixcxLBkSG5UVO9cNWid/B3Lx3PX/Cu+N5k1lbkhpcN2NkEuhGLLeU0wWkJ
         ZwbY4uQoHjCbqpKuHOgg0e02obaMzfjGrascd7RQpkC7ShBXTGW/jaoEsCWUfj6W2t
         2umU3WL1qZDhrhrfHVyWIFcyx5AwOSTO4GF3iSdg=
Date:   Mon, 31 Aug 2020 16:35:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: Fix fallthrough keyword warning
Message-ID: <20200831163516.490f5941@coco.lan>
In-Reply-To: <20200831133011.91258-1-cengiz@kernel.wtf>
References: <20200831133011.91258-1-cengiz@kernel.wtf>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 31 Aug 2020 16:30:12 +0300
Cengiz Can <cengiz@kernel.wtf> escreveu:

> commit df561f6688fe ("treewide: Use fallthrough pseudo-keyword") from
> Gustavo A. R. Silva replaced and standardized /* fallthrough */ comments
> with 'fallthrough' pseudo-keyword.
> 
> However, in one of the switch-case statements, Coverity Static Analyzer
> throws a warning that 'fallthrough' is unreachable due to the adjacent
> 'return false' statement.
> 
> Since 'fallthrough' is actually an empty "do {} while(0)" this might be
> due to compiler optimizations. But that needs further investigation.
> 
> In order to fix the unreachable code warning, make adjacent 'return
> false' a part of the previous if statement's else clause.
> 
> Reported-by: Coverity Static Analyzer CID 1466511
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 1b2b2c68025b..aaa2d0e0851b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -709,8 +709,8 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
>  		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
>  		    pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>  			return true;
> -
> -		return false;
> +		else
> +			return false;
>  		fallthrough;

Actually, the actual fix here would be to get rid of fallthrough.

Regards,

Thanks,
Mauro
