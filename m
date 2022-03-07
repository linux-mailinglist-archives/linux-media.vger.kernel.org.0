Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9E04CFD36
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 12:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbiCGLns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 06:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbiCGLnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 06:43:46 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B685A4F442
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 03:42:49 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BFAE5FF805;
        Mon,  7 Mar 2022 11:42:46 +0000 (UTC)
Date:   Mon, 7 Mar 2022 12:42:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 01/17] media: rkisp1: capture: Initialize entity
 before video device
Message-ID: <20220307114245.lxujtjjvzs3uuhoa@uno.localdomain>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, Mar 04, 2022 at 07:19:09PM +0200, Laurent Pinchart wrote:
> The media_entity embedded in the video_device needs to be initialized
> before registering the video_device. Do so.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index c95c00a91180..9c11f2b8e5f5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1372,22 +1372,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>
>  	vdev->queue = q;
>
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> +	if (ret)
> +		return ret;
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		return ret;
> +		goto error;
>  	}
> +
>  	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
>  		  vdev->num);
>
> -	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> -	if (ret) {
> -		video_unregister_device(vdev);
> -		return ret;
> -	}
> -
>  	return 0;
> +
> +error:
> +	media_entity_cleanup(&vdev->entity);
> +	return ret;
>  }
>
>  static void
> --
> Regards,
>
> Laurent Pinchart
>
