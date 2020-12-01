Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6BB2CA5ED
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 15:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391657AbgLAOk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 09:40:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40368 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391650AbgLAOk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 09:40:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id ADBA41F40F5D
Subject: Re: [PATCH v2] media: rockchip: rkisp1: remove useless debugfs checks
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20201201143058.GJ2767@kadam>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <17d5555c-1f95-159b-f5db-cd3db0704a6c@collabora.com>
Date:   Tue, 1 Dec 2020 11:39:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201143058.GJ2767@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/1/20 11:30 AM, Dan Carpenter wrote:
> The debugfs_create_dir() function never returns NULLs so this code will
> never be executed.  It's not intended that callers will check for
> debugfs errors in the normal case and it's not necessary in this driver,
> so we can just delete this code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Since the debugfs_create_*() functions already check the parent
with IS_ERR(), this looks good to me.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> v2: Fix subject
> 
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 9af137e4967f..68da1eed753d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  	struct rkisp1_debug *debug = &rkisp1->debug;
>  
>  	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
> -	if (!debug->debugfs_dir) {
> -		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
> -		return;
> -	}
>  	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
>  			     &debug->data_loss);
>  	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
> 
