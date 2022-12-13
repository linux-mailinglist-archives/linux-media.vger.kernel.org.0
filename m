Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E0F64B00A
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 07:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbiLMGtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 01:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbiLMGtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 01:49:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A221B17E25
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 22:49:12 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A62594A7;
        Tue, 13 Dec 2022 07:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670914149;
        bh=CFXbiK1F7mjiipR9bGucgD6tLcCwLr2rjD9KcslO+l8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a3tNhBJ94NyBRLQcxmZ9CrZycwRM7HWcPAPJCNZvkCDdQHflsQVpAmsiOeTYKo9ku
         g3VxvUIPisSGmFl5rjN8QLOJe5SycyF00sP0KDSHKl22p64ams/52BCPFFtIFSOWEp
         WzHen6XYrxLJJsRsSvFY+c3Lp5mTXak5H6bQyqUA=
Message-ID: <720c9072-ed9c-eb04-b031-af704441fa4a@ideasonboard.com>
Date:   Tue, 13 Dec 2022 08:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/2] media: mc: Get media_device directly from pad
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
References: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
 <20221212132505.9251-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221212132505.9251-2-laurent.pinchart@ideasonboard.com>
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
> Various functions access the media_device from a pad by going through
> the entity the pad belongs to. Remove the level of indirection and get
> the media_device from the pad directly.
> 
> Fixes: 9e3576a1ae2b ("media: mc: convert pipeline funcs to take media_pad")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/mc/mc-entity.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b8bcbc734eaf..f268cf66053e 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -703,7 +703,7 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>   __must_check int __media_pipeline_start(struct media_pad *pad,
>   					struct media_pipeline *pipe)
>   {
> -	struct media_device *mdev = pad->entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->graph_obj.mdev;
>   	struct media_pipeline_pad *err_ppad;
>   	struct media_pipeline_pad *ppad;
>   	int ret;
> @@ -851,7 +851,7 @@ EXPORT_SYMBOL_GPL(__media_pipeline_start);
>   __must_check int media_pipeline_start(struct media_pad *pad,
>   				      struct media_pipeline *pipe)
>   {
> -	struct media_device *mdev = pad->entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->graph_obj.mdev;
>   	int ret;
>   
>   	mutex_lock(&mdev->graph_mutex);
> @@ -888,7 +888,7 @@ EXPORT_SYMBOL_GPL(__media_pipeline_stop);
>   
>   void media_pipeline_stop(struct media_pad *pad)
>   {
> -	struct media_device *mdev = pad->entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->graph_obj.mdev;
>   
>   	mutex_lock(&mdev->graph_mutex);
>   	__media_pipeline_stop(pad);
> @@ -898,7 +898,7 @@ EXPORT_SYMBOL_GPL(media_pipeline_stop);
>   
>   __must_check int media_pipeline_alloc_start(struct media_pad *pad)
>   {
> -	struct media_device *mdev = pad->entity->graph_obj.mdev;
> +	struct media_device *mdev = pad->graph_obj.mdev;
>   	struct media_pipeline *new_pipe = NULL;
>   	struct media_pipeline *pipe;
>   	int ret;

