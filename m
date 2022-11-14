Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30AAE6282C5
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 15:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbiKNOiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 09:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235468AbiKNOiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 09:38:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259CB29CBA
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 06:38:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [46.183.103.8])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13FC4891;
        Mon, 14 Nov 2022 15:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668436696;
        bh=RgmO7+Ic2awm4Yibqx6xUS6xPh7+epm0Jtw69iNXV1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hEOZBTnGgvTgNVljlbC4OSPlRIEcofY4M3r2VMyaaSpyGnpmN109uqFkU3n4HXRgs
         BeRFZrDDWxEyJ66PE7t3uK7tK5Jecx4J4YWQi0kGR4goEhdJtXquCexwO9Gzxm6OyA
         XA1UOnVGuH0xsGCDIw7ec2LUZS7Wo2gpyhIRg4nI=
Date:   Mon, 14 Nov 2022 16:37:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH] media: v4l2-dev: fix possible name leak in
 __video_register_device()
Message-ID: <Y3JSEErWZB3Wvza5@pendragon.ideasonboard.com>
References: <20221111085809.1676804-1-yangyingliang@huawei.com>
 <Y24TqcR9Hgy+R82/@pendragon.ideasonboard.com>
 <b1f054e4-91f5-7d8a-330b-ac57213ad3bc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1f054e4-91f5-7d8a-330b-ac57213ad3bc@huawei.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 11, 2022 at 09:23:29PM +0800, Yang Yingliang wrote:
> On 2022/11/11 17:19, Laurent Pinchart wrote:
> > On Fri, Nov 11, 2022 at 04:58:09PM +0800, Yang Yingliang wrote:
> >> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
> >> bus_id string array"), the name of device is allocated dynamically,
> >> so call kfree_const() to freed it in error case.
> >>
> >> Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
> >> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-dev.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> >> index 397d553177fa..1fce1c29c60f 100644
> >> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >> @@ -1036,6 +1036,9 @@ int __video_register_device(struct video_device *vdev,
> >>   	ret = device_register(&vdev->dev);
> >>   	if (ret < 0) {
> >>   		pr_err("%s: device_register failed\n", __func__);
> >> +		kfree_const(vdev->dev.kobj.name);
> >> +		/* set it to null to avoid callers using a bad pointer */
> >> +		vdev->dev.kobj.name = NULL;
> >
> > This doesn't seem right to me. We shouldn't be poking into the kobj.
> > This should be handled in the driver core, or if that can't be done for
> > a reason specific to how the device is used in the V4L2 core, we need a
> > helper function from the driver core to perform the cleanup.
>
> In technical, we should call put_device() here, but the release()
> function has not been set in this case, and v4l2_device_release() will
> release something that not need be, so we can not handle it in the
> driver core well, I think free the name here directly is the best way
> to fix it.

The documentation of device_register() states

 * NOTE: _Never_ directly free @dev after calling this function, even
 * if it returned an error! Always use put_device() to give up the
 * reference initialized in this function instead.

We thus need to fix this in __video_register_device(), not to pile
another workaround :-)

> >>   		goto cleanup;
> >>   	}
> >>   	/* Register the release callback that will be called when the last

-- 
Regards,

Laurent Pinchart
