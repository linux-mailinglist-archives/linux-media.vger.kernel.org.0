Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36266EC78B
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 10:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjDXIBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 04:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjDXIBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 04:01:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7DB11B
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 01:01:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 053F5D80;
        Mon, 24 Apr 2023 10:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682323292;
        bh=/mKM90J8RX2RPcJygLUNejNxoYtekxkKxYkvatwDbW0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KalmIBHJq1rESr0+khhFAe/aroL6BnfpJSfhIbqRTtt5F+x7XBE4QTeEPVSnnG8lC
         5IdGrE9ipJLONE8TQ70f+3iTrITs57zSV0ZMocEO5d7k6mfqbJfpneC5o2zacDFFik
         cW9+yBFDP6ce+vMEdKv67lXGohnuPLmEa2LZsoCI=
Date:   Mon, 24 Apr 2023 11:01:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 7/8] utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS
 for subdevs
Message-ID: <20230424080153.GG4926@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-8-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421124428.393261-8-tomi.valkeinen@ideasonboard.com>
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

On Fri, Apr 21, 2023 at 03:44:27PM +0300, Tomi Valkeinen wrote:
> Do two things:
> 
> - Inform the kernel that we support streams with a call to
>   VIDIOC_SUBDEV_S_CLIENT_CAP
> 
> - Use the returns from VIDIOC_SUBDEV_S_CLIENT_CAP and
>   VIDIOC_SUBDEV_QUERYCAP to decide if streams are supported, and
>   return that via has_streams_support() method.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/common/cv4l-helpers.h |  1 +
>  utils/common/v4l-helpers.h  | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 3cee372b..502df6ac 100644
> --- a/utils/common/cv4l-helpers.h
> +++ b/utils/common/cv4l-helpers.h
> @@ -82,6 +82,7 @@ public:
>  	bool has_rw() const { return v4l_has_rw(this); }
>  	bool has_streaming() const { return v4l_has_streaming(this); }
>  	bool has_ext_pix_format() const { return v4l_has_ext_pix_format(this); }
> +	bool has_streams_support() const { return subdev_supports_streams; }

The other functions don't have a "_support" suffix, I'd write
"has_stream()".

>  
>  	int querycap(v4l2_capability &cap, bool force = false)
>  	{
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index c09cd987..2dd7f061 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -39,6 +39,7 @@ struct v4l_fd {
>  	bool have_selection;
>  	bool is_subdev;
>  	bool is_media;
> +	bool subdev_supports_streams;

Same here, and I would probably also drop the subdev_ prefix.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	int (*open)(struct v4l_fd *f, const char *file, int oflag, ...);
>  	int (*close)(struct v4l_fd *f);
> @@ -507,6 +508,12 @@ static inline int v4l_open(struct v4l_fd *f, const char *devname, bool non_block
>  
>  static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
>  {
> +	struct v4l2_subdev_client_capability clientcap = {};
> +	struct v4l2_subdev_capability subdevcap = {};
> +	bool subdev_streams;
> +	bool client_streams;
> +	int ret;
> +
>  	if (f->fd >= 0)
>  		f->close(f);
>  
> @@ -528,6 +535,16 @@ static inline int v4l_subdev_s_fd(struct v4l_fd *f, int fd, const char *devname)
>  	f->have_next_ctrl = false;
>  	f->have_selection = false;
>  
> +	ret = ioctl(f->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
> +	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
> +
> +	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> +
> +	ret = ioctl(f->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
> +	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
> +
> +	f->subdev_supports_streams = subdev_streams && client_streams;
> +
>  	return f->fd;
>  }
>  

-- 
Regards,

Laurent Pinchart
