Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E644CFD40
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 12:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbiCGLqb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 06:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiCGLqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 06:46:30 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A639652C5
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 03:45:34 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 380F51C0009;
        Mon,  7 Mar 2022 11:45:31 +0000 (UTC)
Date:   Mon, 7 Mar 2022 12:45:30 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 02/17] media: rkisp1: capture: Fix and simplify
 (un)registration
Message-ID: <20220307114530.e3u4oqsburizcig6@uno.localdomain>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304171925.1592-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, Mar 04, 2022 at 07:19:10PM +0200, Laurent Pinchart wrote:
> The rkisp1_register_capture() and rkisp1_unregister_capture() functions
> don't destroy the mutex (in the error path for the former). Fix this and
> make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
> safe to be called on an unregistered capture node to prepare for
> simplification of error handling at probe time.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - Reset cap->rkisp1 in rkisp1_capture_devs_register()
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 26 ++++++++++---------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 9c11f2b8e5f5..96a7e6c0a622 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1312,8 +1312,12 @@ static const struct v4l2_file_operations rkisp1_fops = {
>
>  static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
>  {
> +	if (!cap->rkisp1)
> +		return;
> +
>  	media_entity_cleanup(&cap->vnode.vdev.entity);
>  	vb2_video_unregister_device(&cap->vnode.vdev);
> +	mutex_destroy(&cap->vnode.vlock);
>  }
>
>  void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
> @@ -1390,6 +1394,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>
>  error:
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
>  	return ret;
>  }
>
> @@ -1425,26 +1430,23 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
>  {
> -	struct rkisp1_capture *cap;
> -	unsigned int i, j;
> +	unsigned int i;
>  	int ret;
>
>  	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> +		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> +
>  		rkisp1_capture_init(rkisp1, i);
> -		cap = &rkisp1->capture_devs[i];
>  		cap->rkisp1 = rkisp1;

This is set by rkisp1_capture_init() already

> +
>  		ret = rkisp1_register_capture(cap);
> -		if (ret)
> -			goto err_unreg_capture_devs;
> +		if (ret) {
> +			cap->rkisp1 = NULL;

Is this correct ?

As:
> +			rkisp1_capture_devs_unregister(rkisp1);

Calls
rkisp1_capture_devs_unregister():
        rkisp1_unregister_capture():
                if (!cap->rkisp1)
                        return 0;

Effectively making rkisp1_capture_devs_unregister() a nop.

Thanks
   j

> +			return ret;
> +		}
>  	}
>
>  	return 0;
>
> -err_unreg_capture_devs:
> -	for (j = 0; j < i; j++) {
> -		cap = &rkisp1->capture_devs[j];
> -		rkisp1_unregister_capture(cap);
> -	}
> -
> -	return ret;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
