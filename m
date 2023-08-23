Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8047853BE
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbjHWJVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbjHWJTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:19:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA3AE79
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:09:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 509D75A4;
        Wed, 23 Aug 2023 11:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692781677;
        bh=zFXXiGAHYuEfcmAXLQrkjv/SBwm9OA2kUrIpDzKuqJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rVl9Hby4ptd1QmIs4WWmDd4Z0oD5fqPATfsa7W3y51CghDK+W0LVkwD803ZUWA5jS
         jBfk4BtsQXIr5YqH22qGN6Pfrr2UarIvk/VSaXMBULfSw+/yRCb6ATYRcd1UKu0YwX
         h3svZSzxdfe8QSuyPMw98vyLVleR32JYIakCZmSQ=
Date:   Wed, 23 Aug 2023 12:09:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
 deprecated
Message-ID: <20230823090921.GF4143@pendragon.ideasonboard.com>
References: <20230823090600.3872867-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230823090600.3872867-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Aug 23, 2023 at 12:06:00PM +0300, Sakari Ailus wrote:
> The v4l2_pipeline_pm_get() and v4l2_pipeline_pm_put() functions were
> needed to control sub-devices' power states before runtime PM. These
> functions should no longer be used, and instead sub-device drivers should
> use runtime PM.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-mc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> index b39586dfba35..ed0a44b6eada 100644
> --- a/include/media/v4l2-mc.h
> +++ b/include/media/v4l2-mc.h
> @@ -143,6 +143,9 @@ int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
>   * v4l2_pipeline_pm_get - Increase the use count of a pipeline
>   * @entity: The root entity of a pipeline
>   *
> + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> + * ON SUB-DEVICE DRIVERS INSTEAD.
> + *
>   * Update the use count of all entities in the pipeline and power entities on.
>   *
>   * This function is intended to be called in video node open. It uses
> @@ -157,6 +160,9 @@ int v4l2_pipeline_pm_get(struct media_entity *entity);
>   * v4l2_pipeline_pm_put - Decrease the use count of a pipeline
>   * @entity: The root entity of a pipeline
>   *
> + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> + * ON SUB-DEVICE DRIVERS INSTEAD.
> + *
>   * Update the use count of all entities in the pipeline and power entities off.
>   *
>   * This function is intended to be called in video node release. It uses

-- 
Regards,

Laurent Pinchart
