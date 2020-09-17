Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4712626DA91
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgIQLnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:43:10 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53727 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726714AbgIQLnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:43:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IsJ8kMCx8PTBMIsJ9klouK; Thu, 17 Sep 2020 13:42:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600342956; bh=7dj1q32JDBgy/nh+pm/ikTPB2+8KPJ8Yve3Qciq8Qpw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IzrMRhjlHnOYFzhPh1+7thsXuzsW1ts7Cwabv4GDGIARb/X3qhdk1EDtrHi/a+N2L
         lTixRyzEiOo/b+nuzTnzTKCkj/J93AFnsFgeOeSMrdu+x95Vbi1CzbscDGSfAxnoD0
         Ycx2QLRPP5mtfGLyJTpKnzWh7rwh3N+y4Rj4J7gwEJ8i6McJw8mc7rkNtS+84MnNyG
         Svn/16KwUfxRZzVCq0F0vSIahuPwLefz7QJpx/3ghxW3Ggu4KCB8lqeMkdfkXx6xo7
         Uad/+QFp44mWyf8siMLDJ2JuLeaUdLmuGpCIQtaC4x/wjGJPzCDagpXH+ffcX3RgfK
         bwmaaZEYT6rOg==
Subject: Re: [PATCH] media: mtk-jpeg: Fix a reference count leak.
To:     wu000273@umn.edu, kjlu@umn.edu
Cc:     Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ricky Liang <jcliang@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200613230843.14109-1-wu000273@umn.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
Date:   Thu, 17 Sep 2020 13:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200613230843.14109-1-wu000273@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJuL7t1rHdW84tT2i/rcyP37zN46fhUoL058G4mjDiCpc1dzY5lcoTLXx9HusSgsaifwP6PIjBuISaAZ+ojG1FafXGdRtu7I7e4kXACzagTcWXDdJ3TK
 4Tq91XJm52nrrxrUnpYAVmRUuCZy1S7iP4movC8W6Ipv4c4kEcRuwTa0PXuCtogHXkTXjgG+xGbG6aL7fD0BbEFqLtaMn5VnQPipmVRVMCWfrXKAHwEkZQbf
 coOfLDhU5gFmonJgeunqbZV7ufinrjxoal13MNFk1fCcUnA10wk6dBf8tawQCzdipJH8W1yRyvrn8qIxP7ilxVbCtOhDPPhG/DMuvwxEpF5b8Vo8AwUcuZ/e
 sjivz4IRI3G8+uGqxTJYCkoGeJRrr+ZhN+jR7XYGkGGzGr/93Vk2AVmboy/5ewvNFLmTZjjXVSzvoNMRN6N7E5a9B2eIEk3WbfPp41pcag+gAEoUI+6Zo8zW
 NNvvya1RJJj06++rU9b6E4IJbEY8VRjujiT38/P6fRCUlx60reRstYEJm+Xw2JLZbT+yAkiq5G6Jf1HtvhKsTAZQPF1FRLgnaLtneqzda+ib1cYloCIx/IPP
 PFlUpFT+XQIZBOGF7BKxhvELyd1iQU+XlIOfhNaIvTfh9cv73O2l0fpIccMaXKkKoVsVvLLU4EeYfA4IP7mE88MntmYLZIaW6ignJfhmOy1uzPPOz+txIT8n
 ltk8AlI7JtQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2020 01:08, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.
> 
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f82a81a3bdee..097f0b050f67 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
>  	int ret = 0;
>  
>  	ret = pm_runtime_get_sync(ctx->jpeg->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(ctx->jpeg->dev);
>  		goto err;
> +	}
>  
>  	return 0;
>  err:
> 

This patch no longer applies, can you rebase this?

Regards,

	Hans
