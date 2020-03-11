Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00858181B83
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgCKOjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:39:51 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36591 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729236AbgCKOju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:39:50 -0400
Received: by mail-qk1-f193.google.com with SMTP id u25so2289737qkk.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rhjsFMTJYLZ3mn2Gjz5gdtKztjIbQQxRnlgYYaHk1wc=;
        b=jq1nLd7N0ZM7NLCRPAfd79/3lp7JoXaQKyCjdib2YXuex017Paog9Cb1gSTi52LaeU
         LD1ju8rshUvB9zkWef0PdPNO4Udw8+V7isXoZuvpyXa3Tx7jTX90pbf6ULYJ329QC+NK
         wurlo3b/MMssorlcwSLZj79N4GJnzXsr4ICiDM8lsMCuJ/s4Mq2uL9dzHxoJ9rThUt+G
         0M43++rvscWef+QYZ2eNhZrNiGqlrGzYxZdDEuHrFWPa1huhFSMbPlS/F/RD8Lxqb/Yt
         mM38TQUVgne/tXy4ELehYJrpPYdpSf4SvLUhu1xVPU7Nl9Y2F0cZoCDvYVvQ0XCHD7Y8
         Ellg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rhjsFMTJYLZ3mn2Gjz5gdtKztjIbQQxRnlgYYaHk1wc=;
        b=dbM4XZpH/Vb9nXt0ecQegbsx/dGZCswTIl1eejIxOwiprPWDF70/APe1xhEG4Cfm/l
         aEm46MM7Y7KcuuscCeUKPQxlK25pgRy1DihoZoFyyXA5yNRoTcAG2jFCB2uvtoluPtMr
         TpgQgkDNm+dtxVtCGfyAlnGbzncpTRIWs0H5L5P8JyAEpqz7QUGLR7rVw85HzTnyGHst
         Upg4bqc2d7eolKdX+Jqs9zgi8krZ6drOtQBuTlC62J+c607B+D26t0RIxwHQHm5tB04G
         ZMUkv7uhVteYYh2O1yKl+iOkOMVEgD2FKVRuymRh6CuF/2DK/KPy/KNHx4l9067SlMuA
         aTdQ==
X-Gm-Message-State: ANhLgQ1AmeMbJDDyibSzvaZAcfRIlx6IEbQfg4dTmivzfbEi+rQ/dC1Z
        5a8EIAM2iCHvesoAgLbKX5l8wA==
X-Google-Smtp-Source: ADFU+vtKWKPXCGB7JIWxuZf1mxQBulTGgF3UEE8ZRkf2YrVumDjwnXJioMKq580TmzzqD9l1/42wwQ==
X-Received: by 2002:a37:5d86:: with SMTP id r128mr3206003qkb.177.1583937589992;
        Wed, 11 Mar 2020 07:39:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id p22sm2113247qki.124.2020.03.11.07.39.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 07:39:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jC2WT-0004rq-56; Wed, 11 Mar 2020 11:39:49 -0300
Date:   Wed, 11 Mar 2020 11:39:49 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using
 DMA-buf v2
Message-ID: <20200311143949.GE31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200311135158.3310-6-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 02:51:57PM +0100, Christian König wrote:

> +/**
> + * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
> + *
> + * @adev: amdgpu device pointer
> + * @sgt: sg table to free


Wrong kdoc in many ways

> + * Free a previously allocate sg table.
> + */
> +void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
> +			      struct device *dev,
> +			      enum dma_data_direction dir,
> +			      struct sg_table *sgt)
> +{


Jason
