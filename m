Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4362C2439
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732902AbgKXLcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:32:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:39032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732769AbgKXLct (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:32:49 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FEED2073C;
        Tue, 24 Nov 2020 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606217568;
        bh=+TFXpE67ze9a79fHxbPjSScp9KAtVTC9WVy4e/G2MKE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ua500VXga2eAelloX3vqLHc9oUsOoaISyjbT/dVhDlx8qRcJRZk9NTrGj/0r7gquB
         xqcasG1XhtSADhr/nvmJNCe7FugaBaBuFX9hLI1jwrPwppH9yhCUCBbDF52j4gBFZp
         Vfs3Q6bYaFZOCSFolGbusIogFd2HzB4k0YiHmJBY=
Subject: Re: [PATCH] media: platform: s5p-mfc: properly assign device to both
 vb2 queues
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <CGME20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d@eucas1p1.samsung.com>
 <20201124084143.12545-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <6e2409df-52f2-54b5-89b3-c9d6587160a4@kernel.org>
Date:   Tue, 24 Nov 2020 12:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124084143.12545-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/24/20 09:41, Marek Szyprowski wrote:
> Properly set device pointers in videobuf2 queues, so the videobuf2
> debugging messages will be prefixed with the respective device name.
> 
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
> This patch was previously sent as part of "[PATCH v2 0/4] Exynos4 media
> drivers: adapt for the planned ARM IOMMU-DMA changes" patchset:
> https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/
> The IOMMU related changes are still under review, but this change is
> unrelated and it makes sense to aplly it separately.
> ---
>   drivers/media/platform/s5p-mfc/s5p_mfc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index eba2b9f040df..4e50c342b322 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -844,6 +844,7 @@ static int s5p_mfc_open(struct file *file)
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   	q->drv_priv = &ctx->fh;
>   	q->lock = &dev->mfc_mutex;
> +	q->dev = &dev->plat_dev->dev;

I can't see where q->dev is used for debug logs, shouldn't we use
v4l2_queue_init_name() instead?

--
Regards,
Sylwester

