Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94FA51F9F6
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiEIKe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 06:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiEIKei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 06:34:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9B21F7E12
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 03:29:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210FA484;
        Mon,  9 May 2022 12:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652092159;
        bh=0o4uKUGoH0+2mStSf9ppR8fnsoNFbhReoOsFOZJCLzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJT1xGrHo6XA7Fzy/A8/bvwIq9+gIz53yhv48IeiglHTsn0FfqSLAPcHLONapYEwk
         IKcocuIMwdNBZEjssgCtBbfhVuROiqAFhy2w0/1tjdnGUKZXuS1WIdejnLXlQPhUDb
         DUSdmP0l0qI7nXVzxdzAzZkpvqaIEtL5N5LE1XoU=
Date:   Mon, 9 May 2022 13:29:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/7] v4l2-subdev.c: kvmalloc_array -> kvcalloc
Message-ID: <Ynjs++Ejru2FyBiv@pendragon.ideasonboard.com>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
 <20220509091553.2637089-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509091553.2637089-2-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, May 09, 2022 at 11:15:47AM +0200, Hans Verkuil wrote:
> Fixes smatch warning:
> 
> drivers/media/v4l2-core/v4l2-subdev.c:978 __v4l2_subdev_state_alloc() warn: Please consider using kvcalloc instead
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 3da200bb23dd..5c27bac772ea 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -975,9 +975,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>  		state->lock = &state->_lock;
>  
>  	if (sd->entity.num_pads) {
> -		state->pads = kvmalloc_array(sd->entity.num_pads,
> -					     sizeof(*state->pads),
> -					     GFP_KERNEL | __GFP_ZERO);
> +		state->pads = kvcalloc(sd->entity.num_pads,
> +				       sizeof(*state->pads), GFP_KERNEL);
>  		if (!state->pads) {
>  			ret = -ENOMEM;
>  			goto err;

-- 
Regards,

Laurent Pinchart
