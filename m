Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEF0710D7E
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 15:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241357AbjEYNnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 09:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241337AbjEYNnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 09:43:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E5619D
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 06:43:41 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D76273F1;
        Thu, 25 May 2023 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685022202;
        bh=AQrcrGNE2dgsLAqnc5bUyHgEJpyXp6qV5CnpVN35keo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVxHePWJrQ3qwvlDh+SSGy78MRqcKx0d5mX+oGZee+RJya/RehBUKXprfQHiTF/9R
         ADXxM7V0F4KwbapQVcyso04HNEmRzsMfe1RjAc5UA4IqJFCdTcyqavTKpHzn+Pu9z2
         ZhCMOZy1pj90PkPznSVsMyER0CPZLuRXfZfzyC4E=
Date:   Thu, 25 May 2023 15:43:35 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 4/8] media: platform: renesas-ceu: drop buf NULL check
Message-ID: <gtmriloqwvaujhb5q2he73cljd5unf622vtz4tdv5z7s3rptnl@xk7wzoognio2>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
 <20230524121150.435736-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230524121150.435736-5-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, May 24, 2023 at 02:11:46PM +0200, Hans Verkuil wrote:
> Since start_streaming is only called if there are at least two
> buffers queued, the ceudev->capture list will never be empty, so
> the check whether there are no buffers can be dropped.
>
> Note that the '!buf' check was wrong in any case, if we wanted to
> check for an empty list it should have used list_empty().
>
> This fixes this smatch warning:
>
> drivers/media/platform/renesas/renesas-ceu.c:705 ceu_start_streaming() warn: can 'buf' even be NULL?
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Jacopo Mondi <jacopo@jmondi.org>

Thank you!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  drivers/media/platform/renesas/renesas-ceu.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index 56b9c59cfda8..5c9e27f8c94b 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -702,12 +702,6 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	/* Grab the first available buffer and trigger the first capture. */
>  	buf = list_first_entry(&ceudev->capture, struct ceu_buffer,
>  			       queue);
> -	if (!buf) {
> -		spin_unlock_irqrestore(&ceudev->lock, irqflags);
> -		dev_dbg(ceudev->dev,
> -			"No buffer available for capture.\n");
> -		goto error_stop_sensor;
> -	}
>
>  	list_del(&buf->queue);
>  	ceudev->active = &buf->vb;
> @@ -722,9 +716,6 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
>
>  	return 0;
>
> -error_stop_sensor:
> -	v4l2_subdev_call(v4l2_sd, video, s_stream, 0);
> -
>  error_return_bufs:
>  	spin_lock_irqsave(&ceudev->lock, irqflags);
>  	list_for_each_entry(buf, &ceudev->capture, queue)
> --
> 2.39.2
>
