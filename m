Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6351CD424
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 10:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgEKIjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 04:39:07 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37663 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728344AbgEKIjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 04:39:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Y3xmj9T6WhEkrY3xojFapo; Mon, 11 May 2020 10:39:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589186344; bh=1oD/S26Y7OXgLhAWD2Bkdgg6JPDaSAVldyb/7mlmz4M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YuBYywPBbZRkE4xBaDKhaaINJHbzdu8eaSzrhSxD4MNdE4LOnW3RP4lrC2Vo/WPzo
         spog22RAGV2b3nFSBb5exiVG4PZDpL0zE7i1eRla89FgX50CisnyiDISHcpdvi90b0
         Nhe5w7magmXN9O/xx5emB8zO8SYUkKvMNoruULOk+oCA/O4pncmbh2sB5g0yQtcR64
         Xol5Nqxp5UtXDn3eYoPr6Wv6VmmSZoKZX3JH1bvx8QQ9PfYaXxKu0LYnkswiFjSXUq
         bBtk7XS6CkCLcSNZuIx8IO/6J0Qvcu36X8FWNgsrD4rxFHyaexKD7i3wbLAr4hHbao
         y5OUQ9MJ0gK0A==
Subject: Re: [PATCH v8 04/14] media: platform: Change the fixed device node
 number to unfixed value
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com,
        sj.huang@mediatek.com
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-5-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c4b04c02-b04c-5e83-d3bc-4d9a78df013b@xs4all.nl>
Date:   Mon, 11 May 2020 10:39:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200403094033.8288-5-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH3Qxi/EC6zVl/WXW9BpI6AzF5LZ4rFX17rfNLXwjO0wfJJWojH0ewBQwkwBQGV3iHisPiL60beWzwAQICYYTGjCevh33ExwJUofq3+4YROIaaM7Gxgc
 IACOzYYxlAaX7HCNdfeM2DVbjLHaEvAAUhyatopAA18m7CZ6x0WO8hmkHN+eMMnQv7QCYzP1Net7m6dy/4inp2YPgEbhvfsTxl2xfgerk5o1eOAqo1PEI3QK
 /N2Z5mOL8kxzOOzeXoUqKKnwyKHG7VhicAWfjwTAXFqET/cZM206AczjHRQzBKfI0j0uX9tG7/RQ+Xs9lQLqlpHAyKO8LsHMs48wLD9qHvSLP8K2yWtLVjvH
 LlgddFr+fYeLEeFSHRgcEUgxNiiXKa1kWwQie3+51Eb1tO1b1JK8SswBquYqN5o4u4ca5cCJBXu2hhEJYfBQKHSjNDd97nVnlsAPKOG10YUw0oCgYNjiE80E
 lh0ejgHggWrnkBbNzdGoc5b5KU2/vExh2iLGmSqMDxFHTcPO3Of8JjLGOvrOgiI0a4S0JsMx6H7LIedZYjwDj3fBUA47gikkTdx05zGLH3vqMApyYVBY7USP
 Q3vEzEgdiQsAvmSxM2ZIVUyJ35hx/3GiJbgIrbzx380Ce9znLfwqbjXApaMxs09beQexXm2W1h1946UWNjh5uWpoBC5NTLU6a0WEi7W/EhxQo7haIsBK7gvo
 nyl13bDJjqbcoKE1rgAA/C7kqPFucBre/Pk10hs/uTS1QTEkttb7iVT9zfG99/yaU7riPisVnSd9BKUvnTwgiiuZ1evboV2MKtCrUz+UZYhK9t7fLb1/O0Z/
 DnvofI7Glw5uaS67YZaV8F/rOP2N+XejHlJwU/L482Yr2EydNiKNi/DNGn4lpjlDboQl4fKX3dvL+2Y26Z6dX2fCBEUaGGmmRnTUxLoX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2020 11:40, Xia Jiang wrote:
> Change device node number from 3 to -1 because that the driver will
> also support jpeg encoder.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index e2a1d850813b..a536fa95b3d6 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1154,7 +1154,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
>  				      V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> -	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, 3);
> +	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, -1);

VFL_TYPE_GRABBER was renamed to VFL_TYPE_VIDEO.

It looks like this patch series is not on top of the media_tree repo master branch.

Please make sure your patch series is on top of that.

Regards,

	Hans

>  	if (ret) {
>  		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
>  		goto err_dec_vdev_register;
> 

