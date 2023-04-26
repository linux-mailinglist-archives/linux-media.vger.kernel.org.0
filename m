Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745586EF409
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 14:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbjDZMKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 08:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240263AbjDZMKk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 08:10:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34F3EC
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:10:39 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 574042D8;
        Wed, 26 Apr 2023 14:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682511027;
        bh=YYbPFAb2MR0ubSGcZlTQPjxXz+31Gm5MUQo9ryu3qx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KlVtblmKQa3aX+zaDw5KRmH32lrDIUdEKhiKrJVGpr7HFIcMMbgRKziXiIAAO5Glv
         Mk/339sNl9Ngw5j2ZHR8N8Ng1zkNP3jh02E9lmoosLQEjAY8q3vHkh5me6BbY1tVME
         OJ9r1aTMRjOVcaJQlAlNgSvZQKeVyWojsvnb2gzM=
Date:   Wed, 26 Apr 2023 14:10:35 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/1] media: uapi: Fix [GS]_ROUTING ACTIVE flag value
Message-ID: <qswbowphxqgmqfosfwuxujege5vw4dfvtdmfkyms5vfyoohq3r@cwznewoat65h>
References: <20230425114456.109482-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230425114456.109482-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Indeed!

On Tue, Apr 25, 2023 at 02:44:56PM +0300, Sakari Ailus wrote:
> The value of the V4L2_SUBDEV_ROUTE_FL_ACTIVE is 1, not 0. Use hexadecimal
> numbers as is done elsewhere in the documentation.
>
> Fixes: ea73eda50813 ("media: Documentation: Add GS_ROUTING documentation")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 68ca343c3b44a..2d6e3bbdd0404 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -122,7 +122,7 @@ for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
>      :widths:       3 1 4
>
>      * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> -      - 0
> +      - 0x0001
>        - The route is enabled. Set by applications.
>
>  Return Value
> --
> 2.30.2
>
