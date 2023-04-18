Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3AD26E673B
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 16:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjDROd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 10:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjDROdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 10:33:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88584C13
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 07:33:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FB9E720;
        Tue, 18 Apr 2023 16:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681828392;
        bh=Edg2BTPar4+g2k3/9gWNDF0Gi0S+OnN+F8e9qXM51jI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nWQJI82rlM4HdiGPR0XFYMi9CoWlnTYD3ODX7Ebw9WM+dhz+OlSIKSPoZuefx1JmP
         oP3Jut8aJUvDGcN/2ZxhLtn/tzoH5CEbIL2H3KQXd5TwVyW26q4hPBv6fHewzIZfpa
         3kbIbx4Is0BG9Ngg6EdaNnQqigcQIirdG6bHtgQg=
Date:   Tue, 18 Apr 2023 17:33:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Fix missing kerneldoc for client_caps
Message-ID: <20230418143330.GE30837@pendragon.ideasonboard.com>
References: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 18, 2023 at 01:59:24PM +0300, Tomi Valkeinen wrote:
> Add missing kernel doc for the new 'client_caps' field in struct
> v4l2_subdev_fh.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index cfd19e72d0fc..9d0a6a993fb0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1119,6 +1119,7 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> + * @client_caps: bitmask of V4L2_SUBDEV_CLIENT_CAP_*
>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;

-- 
Regards,

Laurent Pinchart
