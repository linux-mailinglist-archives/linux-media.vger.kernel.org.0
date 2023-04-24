Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259576EC791
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 10:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDXIEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 04:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXIEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 04:04:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A64F10E7
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 01:04:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74800D80;
        Mon, 24 Apr 2023 10:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682323439;
        bh=ddQzuGDLIezrB92/NQyi4NWH6I47TlkV32Xngesq0PI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jFkK1dhhGUW5dM3/hTFoakX+2elPLc+aN5SPm86i/gZsoi22Dr1i5ItAWp8cvtK54
         7rlkjI2/32M0zwb9JWHYK2dNpUQjW8lqrcDFtyZOQiV+pHG31r+B5oH8l06oK+orP3
         4A59IWENlgVJVrtNNQfnmQVAKMruqIsPwnX/5ElM=
Date:   Mon, 24 Apr 2023 11:04:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 4/8] v4l2-ctl/compliance: Add simple routing test
Message-ID: <20230424080421.GI4926@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421124428.393261-5-tomi.valkeinen@ideasonboard.com>
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

On Fri, Apr 21, 2023 at 03:44:24PM +0300, Tomi Valkeinen wrote:
> Add a very simple test for
> VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
> 
> We can't (at least at the moment) really know here what kind of routings
> the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
> followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
> received.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++++++++++
>  utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 16 ++++++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index a147604c..7c3a688b 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1241,6 +1241,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		node.is_passthrough_subdev = has_source && has_sink;
>  
>  		if (has_routes) {
> +			printf("Sub-Device routing ioctls:\n");
> +
> +			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
> +				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> +
> +				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
> +						       which ? "Active" : "Try",
> +						       ok(testSubDevRouting(&node, which)));

Weird indentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			}
> +
> +			printf("\n");
> +
>  			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>  
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 0cd43980..35b2274b 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -375,6 +375,7 @@ int testSubDevEnum(struct node *node, unsigned which, unsigned pad, unsigned str
>  int testSubDevFormat(struct node *node, unsigned which, unsigned pad, unsigned stream);
>  int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigned stream);
>  int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned stream);
> +int testSubDevRouting(struct node *node, unsigned which);
>  
>  // Buffer ioctl tests
>  int testReqBufs(struct node *node);
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index 07192bda..962d9244 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -551,3 +551,19 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad, unsigne
>  
>  	return have_sel ? 0 : ENOTTY;
>  }
> +
> +int testSubDevRouting(struct node *node, unsigned which)
> +{
> +	struct v4l2_subdev_routing routing = {};
> +	struct v4l2_subdev_route routes[256] = {};
> +
> +	routing.which = which;
> +	routing.routes = (__u64)&routes;
> +	routing.num_routes = 256;
> +
> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
> +
> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
> +
> +	return 0;
> +}

-- 
Regards,

Laurent Pinchart
