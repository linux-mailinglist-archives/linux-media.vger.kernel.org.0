Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B91E464B00B
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 07:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbiLMGtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 01:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbiLMGtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 01:49:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4424017E25
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 22:49:48 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B02487C5;
        Tue, 13 Dec 2022 07:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670914186;
        bh=8d8ihZ9WDEVuX4YCDRwzkyWDu6kb0Al9GdAXBnaKbzg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=b8AHU00tEJxD/BSsoGCrtB1vbmqlzKYVT5XzfEZLVadRI9ShpStbmVDSGoL8QpC8m
         9y6ZuvRUzt+OgVMhrW+Vou+hkKVdqtQcUlGklK+4z33ab2Gk2kF2fEZ4G/v90bacla
         Mo/zc8Lqa7M3QJIwHHCnTKu43QnX2BODmboR2Jfk=
Message-ID: <0ded9b0e-66f6-6e73-c508-9cf15489007b@ideasonboard.com>
Date:   Tue, 13 Dec 2022 08:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/2] media: mc: entity: Fix minor issues in comments
 and documentation
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
References: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
 <20221212132505.9251-3-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212132505.9251-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/12/2022 15:25, Laurent Pinchart wrote:
> Commit ae219872834a ("media: mc: entity: Rewrite
> media_pipeline_start()") incorrectly referred to entity instead of pad
> in a comment, and forgot to update a second comment accordingly when
> moving the pipe from entity to pad. Furthermore, it didn't properly
> reflow the documentation text it updated.
> 
> Fix those small issues.
> 
> Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   Documentation/driver-api/media/mc-core.rst | 10 ++++------
>   drivers/media/mc/mc-entity.c               |  6 +++---
>   2 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 400b8ca29367..2456950ce8ff 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -232,12 +232,10 @@ prevent link states from being modified during streaming by calling
>   
>   The function will mark all the pads which are part of the pipeline as streaming.
>   
> -The struct media_pipeline instance pointed to by
> -the pipe argument will be stored in every pad in the pipeline.
> -Drivers should embed the struct media_pipeline
> -in higher-level pipeline structures and can then access the
> -pipeline through the struct media_pad
> -pipe field.
> +The struct media_pipeline instance pointed to by the pipe argument will be
> +stored in every pad in the pipeline. Drivers should embed the struct
> +media_pipeline in higher-level pipeline structures and can then access the
> +pipeline through the struct media_pad pipe field.
>   
>   Calls to :c:func:`media_pipeline_start()` can be nested.
>   The pipeline pointer must be identical for all nested calls to the function.
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f268cf66053e..4c37c0df1a73 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -711,8 +711,8 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>   	lockdep_assert_held(&mdev->graph_mutex);
>   
>   	/*
> -	 * If the entity is already part of a pipeline, that pipeline must
> -	 * be the same as the pipe given to media_pipeline_start().
> +	 * If the pad is already part of a pipeline, that pipeline must be the
> +	 * same as the pipe given to media_pipeline_start().
>   	 */
>   	if (WARN_ON(pad->pipe && pad->pipe != pipe))
>   		return -EINVAL;
> @@ -906,7 +906,7 @@ __must_check int media_pipeline_alloc_start(struct media_pad *pad)
>   	mutex_lock(&mdev->graph_mutex);
>   
>   	/*
> -	 * Is the entity already part of a pipeline? If not, we need to allocate
> +	 * Is the pad already part of a pipeline? If not, we need to allocate
>   	 * a pipe.
>   	 */
>   	pipe = media_pad_pipeline(pad);

