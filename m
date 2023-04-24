Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE3E6EC78E
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjDXICx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 04:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjDXICv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 04:02:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3407499
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 01:02:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 618F7D80;
        Mon, 24 Apr 2023 10:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682323359;
        bh=NiB/5LIT2nHpGLNd+ZXawR1GsJhb0fK0TDA5ViBWkNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M67Yay+/bjxOuFaX0gil+NNDS+K1bTIP3bjyAKiEgv3JM64HHIW81bKAMeq8eFegm
         EBWPQKLHzkQ1En/pNH+63i8pgm84/VlRudZCB8QXmzQTspx8t+QuMS4uuzofoYzq6d
         PRplXfjKauRiB9ERU4yr7VMPjEkZzoUBaeZ3oi0M=
Date:   Mon, 24 Apr 2023 11:03:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 8/8] v4l2-ctl: Check for Streams API support
Message-ID: <20230424080301.GH4926@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-9-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421124428.393261-9-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Apr 21, 2023 at 03:44:28PM +0300, Tomi Valkeinen wrote:
> Return an error if the user tries to use streams related features, but
> streams are not supported.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index 7ab64646..ec70b52b 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -569,6 +569,11 @@ void subdev_set(cv4l_fd &_fd)
>  	if (options[OptSetSubDevFormat] || options[OptTrySubDevFormat]) {
>  		struct v4l2_subdev_format fmt;
>  
> +		if (!_fd.has_streams_support() && set_fmt_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&fmt, 0, sizeof(fmt));
>  		fmt.pad = set_fmt_pad;
>  		fmt.stream = set_fmt_stream;
> @@ -617,6 +622,11 @@ void subdev_set(cv4l_fd &_fd)
>  	if (options[OptSetSubDevSelection] || options[OptTrySubDevSelection]) {
>  		struct v4l2_subdev_selection sel;
>  
> +		if (!_fd.has_streams_support() && vsel.stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&sel, 0, sizeof(sel));
>  		sel.pad = vsel.pad;
>  		sel.stream = vsel.stream;
> @@ -649,6 +659,11 @@ void subdev_set(cv4l_fd &_fd)
>  	if (options[OptSetSubDevFPS]) {
>  		struct v4l2_subdev_frame_interval fival;
>  
> +		if (!_fd.has_streams_support() && set_fps_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&fival, 0, sizeof(fival));
>  		fival.pad = set_fps_pad;
>  		fival.stream = set_fps_stream;
> @@ -674,6 +689,11 @@ void subdev_set(cv4l_fd &_fd)
>  		}
>  	}
>  	if (options[OptSetRouting]) {
> +		if (!_fd.has_streams_support()) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		if (doioctl(fd, VIDIOC_SUBDEV_S_ROUTING, &routing) == 0)
>  			printf("Routing set\n");
>  	}
> @@ -731,6 +751,11 @@ void subdev_get(cv4l_fd &_fd)
>  	if (options[OptGetSubDevFormat]) {
>  		struct v4l2_subdev_format fmt;
>  
> +		if (!_fd.has_streams_support() && get_fmt_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&fmt, 0, sizeof(fmt));
>  		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt.pad = get_fmt_pad;
> @@ -745,6 +770,11 @@ void subdev_get(cv4l_fd &_fd)
>  		struct v4l2_subdev_selection sel;
>  		unsigned idx = 0;
>  
> +		if (!_fd.has_streams_support() && get_sel_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		sel.pad = get_sel_pad;
> @@ -767,6 +797,11 @@ void subdev_get(cv4l_fd &_fd)
>  	if (options[OptGetSubDevFPS]) {
>  		struct v4l2_subdev_frame_interval fival;
>  
> +		if (!_fd.has_streams_support() && get_fps_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&fival, 0, sizeof(fival));
>  		fival.pad = get_fps_pad;
>  		fival.stream = get_fps_stream;
> @@ -784,6 +819,11 @@ void subdev_get(cv4l_fd &_fd)
>  	}
>  
>  	if (options[OptGetRouting]) {
> +		if (!_fd.has_streams_support()) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		memset(&routing, 0, sizeof(routing));
>  		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
>  		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> @@ -867,11 +907,21 @@ void subdev_list(cv4l_fd &_fd)
>  	int fd = _fd.g_fd();
>  
>  	if (options[OptListSubDevMBusCodes]) {
> +		if (!_fd.has_streams_support() && list_mbus_codes_stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=%u,stream=%u)\n",
>  		       list_mbus_codes_pad, list_mbus_codes_stream);
>  		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
>  	}
>  	if (options[OptListSubDevFrameSizes]) {
> +		if (!_fd.has_streams_support() && frmsize.stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=%u,stream=%u)\n",
>  		       frmsize.pad, frmsize.stream);
>  		frmsize.index = 0;
> @@ -882,6 +932,11 @@ void subdev_list(cv4l_fd &_fd)
>  		}
>  	}
>  	if (options[OptListSubDevFrameIntervals]) {
> +		if (!_fd.has_streams_support() && frmival.stream) {
> +			printf("Streams API not supported.\n");
> +			return;
> +		}
> +
>  		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=%u,stream=%u)\n",
>  		       frmival.pad, frmival.stream);
>  		frmival.index = 0;

-- 
Regards,

Laurent Pinchart
