Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C8551F9F9
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiEIKey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 06:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiEIKeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 06:34:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC30B24F232
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 03:29:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB85455A;
        Mon,  9 May 2022 12:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652092179;
        bh=WZFD1HknoRyw8lgiLaD9nG8BZ4/HmZcYQSMXSZ/g9Pw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DF2Xz0cszePTgMpq34zMwI+k31SduUIJuGdvTfhhIURWP6H9CvHebuCzKPuX4Coia
         b6OtMTrWcWvz8iHixH+7602y4z6rsX/7GA6VPnbwQmWbc5mNioOiLXfN3T1ysv2jhW
         JC2R7o7xD6UQfTrn6CFleh3y9z961jPmMtxFl1Yw=
Date:   Mon, 9 May 2022 13:29:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/7] v4l2-ctls-core.c: kvmalloc_array -> kvcalloc
Message-ID: <YnjtDrbV25c1QUNe@pendragon.ideasonboard.com>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
 <20220509091553.2637089-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509091553.2637089-3-hverkuil-cisco@xs4all.nl>
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

On Mon, May 09, 2022 at 11:15:48AM +0200, Hans Verkuil wrote:
> Fixes smatch warning:
> 
> drivers/media/v4l2-core/v4l2-ctrls-core.c:1143 v4l2_ctrl_handler_init_class() warn: Please consider using kvcalloc instead
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 8968cec8454e..949c1884d9c1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1140,9 +1140,8 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>  	INIT_LIST_HEAD(&hdl->ctrls);
>  	INIT_LIST_HEAD(&hdl->ctrl_refs);
>  	hdl->nr_of_buckets = 1 + nr_of_controls_hint / 8;
> -	hdl->buckets = kvmalloc_array(hdl->nr_of_buckets,
> -				      sizeof(hdl->buckets[0]),
> -				      GFP_KERNEL | __GFP_ZERO);
> +	hdl->buckets = kvcalloc(hdl->nr_of_buckets, sizeof(hdl->buckets[0]),
> +				GFP_KERNEL);
>  	hdl->error = hdl->buckets ? 0 : -ENOMEM;
>  	v4l2_ctrl_handler_init_request(hdl);
>  	return hdl->error;

-- 
Regards,

Laurent Pinchart
