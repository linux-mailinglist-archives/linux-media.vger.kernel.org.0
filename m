Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75FD2EBFDD
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbhAFOwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:52:41 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59658 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbhAFOwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:52:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106Ena0t075317;
        Wed, 6 Jan 2021 14:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=tIA8GlTWf3yVssgYetYQok6eZau6hlzofE7mX8MNTEQ=;
 b=KioYAGiejyEuyCo0AjAS3xp3TP9zuynp6zh6M2UScSTILVHPrJT7ZKZcC0mLm6C5cS5o
 zvdjNZRLVOE9MRJXpfeT7/+qmEsTZhyrtoeK9HSHBW9jpfoOIlxNN0fx6msHaCXGMqQi
 vcVW8gyijz3d+hUAksNndW0TkWSbBPYmzHQBQNRjNxkb89O5ZXyrXbQR47eC4LivtOaV
 g1N9sFXCe6vhtkvoFvdRqq8qizyBGiBGxBONuQdLwRa0Yge9QbzHybYD9/XXbbSTSs/m
 AMs9v4meU/bFqHyO0SbTxlUPuMyibfyEAVLzoGvGUNzT+Cx++XcMRTWQI2isjpfXxxSz Mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 35wepm85xj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 06 Jan 2021 14:51:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106EoSs8166955;
        Wed, 6 Jan 2021 14:51:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 35v4rcrryg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Jan 2021 14:51:14 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 106EpB1w011216;
        Wed, 6 Jan 2021 14:51:12 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 06 Jan 2021 06:51:08 -0800
Date:   Wed, 6 Jan 2021 17:51:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] media: zoran: use resource_size
Message-ID: <20210106145100.GJ2809@kadam>
References: <20210106131702.32507-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106131702.32507-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060093
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 09:17:02PM +0800, Zheng Yongjun wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/zoran/zoran_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
> index 808196ea5b81..d60b4c73ea80 100644
> --- a/drivers/staging/media/zoran/zoran_driver.c
> +++ b/drivers/staging/media/zoran/zoran_driver.c
> @@ -1020,7 +1020,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
>  	vq->buf_struct_size = sizeof(struct zr_buffer);
>  	vq->ops = &zr_video_qops;
>  	vq->mem_ops = &vb2_dma_contig_memops;
> -	vq->gfp_flags = GFP_DMA32,
> +	vq->gfp_flags = GFP_DMA32;

The commit doesn't match the patch.  Also this driver is in
staging because it's going to be deleted soon so there probably isn't
much point doing cleanups.

If you're looking at the Smatch resource_size() message, then that's a
tricky thing because of the + 1 on part of the "end - start + 1"...
It's sometimes hard to know if we should add the + 1 which resource_size()
does or not.  (That check is ancient and not up to modern standards).

regards,
dan carpenter

