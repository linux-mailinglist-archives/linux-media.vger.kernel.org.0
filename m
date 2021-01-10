Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209882F09A7
	for <lists+linux-media@lfdr.de>; Sun, 10 Jan 2021 21:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbhAJUMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jan 2021 15:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbhAJUMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jan 2021 15:12:17 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B01EC061794
        for <linux-media@vger.kernel.org>; Sun, 10 Jan 2021 12:11:37 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id m5so14313375wrx.9
        for <linux-media@vger.kernel.org>; Sun, 10 Jan 2021 12:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vzqtQyMRq4VCQF1VUb0eyXg1Bg4nfSL5atIamSsB9uc=;
        b=x6LH5YZ4oO5+9nfetywRMADEwS3U7bawPknEEexOvy+CexY+QJbashKsVPIyMqwMgC
         6R0692/OaofsGMM5qHr6+WI/ZCm3momWjYGvNoN9NvQqwdr+PyBNw3LTHxkdG94s7t8e
         8MqkEXp7kKTOediovoBQTwS8bw/tKTe8PbeSiy3qXVDf19YE0Y8kE1Wz3RxdVGH7HsK0
         83Qql7RuMHUInzaieaPxgPzrSqTji74SfwGSiGngmIZ7Z4jJkPo5QeQHTh7xWRRuy+ul
         QYc/haAKWm78z9SqOxtVuybYYoMUMIcwwCma6k81FHNUtMSfN2ITDTm9NBnf7rynJs36
         VFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vzqtQyMRq4VCQF1VUb0eyXg1Bg4nfSL5atIamSsB9uc=;
        b=JtWxfm0aZbk+gu51FGpGDUBm8KMt3hj6/8vYnOK8nVH0x5Q/VAHnGGzxWtlGpBzwe7
         xW8xq/FSXbOJDV2RJmBc1mqa3BxEg8KtyqwStmomnpzk9iZnFTIxrnaJB3W3D3bNsiic
         0U9bmMx11XfvYUszelPUkA2HzBsnQ5X/2HcFDn8vqZ0nemu99nqA6O9451USfGPEG6FO
         etCwHz3RrK3DN1Yito6B5jPFtiF5Pz0ozW/NwZ8ANhqXmAEXXgsYvVczW/zhqd6VgYj1
         2PgpM+OMWoP4csUjF7zZAhEL1PKuaYLlfCcadsSctBRxm9i9cspPFIEKgB8w4zmhZaWG
         QGRQ==
X-Gm-Message-State: AOAM531kQAtb47VvyZDtwTE6IugfXvR1W9uuIx7yksxFmr0hJ2z/4rQG
        FzCdV4mAZYic+IECzTccmtsQAA==
X-Google-Smtp-Source: ABdhPJz5Dfz18y8QFO6GGNqOBNMf1RBCsaBQ6rZSVsoyLzkwP4MPg+sEKPlH4sybqmqVaN00KS42qg==
X-Received: by 2002:a05:6000:100f:: with SMTP id a15mr13320174wrx.300.1610309496048;
        Sun, 10 Jan 2021 12:11:36 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id h3sm19805291wmm.4.2021.01.10.12.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 12:11:35 -0800 (PST)
Date:   Sun, 10 Jan 2021 21:11:33 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     mchehab@kernel.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 -next] media: zoran: convert comma to semicolon
Message-ID: <X/tfdbVP5R2dzMuv@Red>
References: <20210108092119.18642-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210108092119.18642-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Fri, Jan 08, 2021 at 05:21:19PM +0800, Zheng Yongjun a écrit :
> Replace a comma between expression statements by a semicolon.
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
>  	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	vq->min_buffers_needed = 9;
>  	vq->lock = &zr->lock;
> -- 
> 2.22.0
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks!
