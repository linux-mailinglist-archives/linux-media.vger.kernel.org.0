Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8D86EC72E
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 09:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjDXHcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 03:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjDXHc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 03:32:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55A010E0
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 00:32:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 820EB4AD;
        Mon, 24 Apr 2023 09:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682321536;
        bh=qpPHec1gn8Z4nR+sc0Gih3bdhJThaQdJWVK+6XsKbHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUir9PRKnLOZHYzSidsW3oHWy8oVVX6diO/ykGudfJ+UQiWggKx+oo/e7YQxMroK7
         ozrBaDNrjV82rX6OOwApPDWKJveCLNiUR7ZFx2dcAtXP/Hgwx4vzZUeeVCsrSCfOPS
         5BR98MQyjl8DHbmhEz0EgbJMkklM/w6rSI2wXlJA=
Date:   Mon, 24 Apr 2023 10:32:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 5/8] HACK: include/linux: Add client capabilities
Message-ID: <20230424073237.GE4926@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421124428.393261-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Apr 21, 2023 at 03:44:25PM +0300, Tomi Valkeinen wrote:
> Add client capabilities related hanges to include/linux/v4l2-subdev.h.
> This should be dropped when the v4l-utils kernel headers are updated to
> the version which contains client capabilities.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The subdev client capabilities patch is now in the media tree, maybe you
can sync the headers already ? The media tree master branch should get
merged in v6.4-rc1 within two weeks.

> ---
>  include/linux/v4l2-subdev.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
> index 654d659d..4a195b68 100644
> --- a/include/linux/v4l2-subdev.h
> +++ b/include/linux/v4l2-subdev.h
> @@ -233,6 +233,24 @@ struct v4l2_subdev_routing {
>  	__u32 reserved[6];
>  };
>  
> +/*
> + * The client is aware of streams. Setting this flag enables the use of 'stream'
> + * fields (referring to the stream number) with various ioctls. If this is not
> + * set (which is the default), the 'stream' fields will be forced to 0 by the
> + * kernel.
> + */
> + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> +
> +/**
> + * struct v4l2_subdev_client_capability - Capabilities of the client accessing
> + *					  the subdev
> + *
> + * @capabilities: A bitmask of V4L2_SUBDEV_CLIENT_CAP_* flags.
> + */
> +struct v4l2_subdev_client_capability {
> +	__u64 capabilities;
> +};
> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>  
> @@ -250,6 +268,9 @@ struct v4l2_subdev_routing {
>  #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
>  #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
>  #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
> +#define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
> +#define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
> +
>  /* The following ioctls are identical to the ioctls in videodev2.h */
>  #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
>  #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)

-- 
Regards,

Laurent Pinchart
