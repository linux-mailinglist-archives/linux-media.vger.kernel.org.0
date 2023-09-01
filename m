Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F9A790284
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 21:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350670AbjIAThT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 15:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350659AbjIAThS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 15:37:18 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8C110E4
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 12:37:15 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8ABC966072B3;
        Fri,  1 Sep 2023 20:37:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693597033;
        bh=mCEL36xnd9J7gIyISZYBdCgvYlBKyi6V8AkvfGn1rTU=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=RfAT7t8p2Uc0v1298x4IJPzd0adSycFmt9tNmk8wipdkmNE0uaVXG4wpQJCNd3evY
         g60KMNF5APEuiKTJYariLUrEwKmkAe1LseR/SVTLXJDa7omkL2d1bN4zUv4jS/+l8q
         AlCTs2Pk7sY5kYHWGcYafxyjEYK+mBBUjmCYAZNhHAkT525vXBIdOsqiKbcQ3MnwN0
         o+uoPFLsUKFBowWBi7c4RDFd5Mofsf7Wl871diM4rm2o7Cv7kRpFYK025nLOS0O5kF
         g6VQ8Bt/jZakkpVctK2KICxhVGkcIF98ZTdGNH+5r++Swv/Glv64Sjblr4FSs+y9aF
         8Q7ceHmDG3WAA==
Message-ID: <9bab73d5-e59a-96a4-e846-9eb3f1c2a95d@collabora.com>
Date:   Fri, 1 Sep 2023 21:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: videobuf2: fix typo: vb2_dbuf -> vb2_qbuf
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <2df54bb9-4d4a-13ba-fa21-c4502a22944d@xs4all.nl>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <2df54bb9-4d4a-13ba-fa21-c4502a22944d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

W dniu 30.08.2023 o 14:31, Hans Verkuil pisze:
> Fix a small typo in the debug message: vb2_dbuf -> vb2_qbuf
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cf6727d9c81f..27aee92f3eea 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2890,7 +2890,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>   		if (copy_timestamp)
>   			b->timestamp = ktime_get_ns();
>   		ret = vb2_core_qbuf(q, index, NULL, NULL);
> -		dprintk(q, 5, "vb2_dbuf result: %d\n", ret);
> +		dprintk(q, 5, "vb2_qbuf result: %d\n", ret);
>   		if (ret)
>   			return ret;
> 

