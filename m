Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2582625678
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 10:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiKKJUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 04:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbiKKJUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 04:20:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0613E2EF3B
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 01:20:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (85-76-78-95-nat.elisa-mobile.fi [85.76.78.95])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D701283;
        Fri, 11 Nov 2022 10:19:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668158399;
        bh=Yizh9lpOhVl/oT7J5Fdc7fAJa99DXB8qaqDybZj4DZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTASnDjtpzHdtOyeW1jcTUWV+x9B17nNYELuLt+pmX7WGP/dG0rCIjjHl4Bp7Oz9Q
         JrRUiMt3xyse7H2Kduo4JZ9IwbzpNVHomGQIo1i7paXVrP2EGjkshb9ogmpDXgl/ci
         r2SxPvLYsu794FGAQDCPRCDY86MMkb4iLJSBZ84s=
Date:   Fri, 11 Nov 2022 11:19:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH] media: v4l2-dev: fix possible name leak in
 __video_register_device()
Message-ID: <Y24TqcR9Hgy+R82/@pendragon.ideasonboard.com>
References: <20221111085809.1676804-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221111085809.1676804-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 11, 2022 at 04:58:09PM +0800, Yang Yingliang wrote:
> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
> bus_id string array"), the name of device is allocated dynamically,
> so call kfree_const() to freed it in error case.
> 
> Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 397d553177fa..1fce1c29c60f 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1036,6 +1036,9 @@ int __video_register_device(struct video_device *vdev,
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
>  		pr_err("%s: device_register failed\n", __func__);
> +		kfree_const(vdev->dev.kobj.name);
> +		/* set it to null to avoid callers using a bad pointer */
> +		vdev->dev.kobj.name = NULL;

This doesn't seem right to me. We shouldn't be poking into the kobj.
This should be handled in the driver core, or if that can't be done for
a reason specific to how the device is used in the V4L2 core, we need a
helper function from the driver core to perform the cleanup.

>  		goto cleanup;
>  	}
>  	/* Register the release callback that will be called when the last

-- 
Regards,

Laurent Pinchart
