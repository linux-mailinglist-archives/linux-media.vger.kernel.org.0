Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCEE725D36
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235269AbjFGLfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235419AbjFGLft (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:35:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6671707
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:35:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 101F263639
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD994C433EF;
        Wed,  7 Jun 2023 11:35:45 +0000 (UTC)
Message-ID: <8e2eb443-a245-584c-b418-3fb94d47abd9@xs4all.nl>
Date:   Wed, 7 Jun 2023 13:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 4/7] v4l2-ctl/compliance: Add simple routing test
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
 <20230529085003.47207-5-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230529085003.47207-5-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/05/2023 10:50, Tomi Valkeinen wrote:
> Add a very simple test for
> VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING.
> 
> We can't (at least at the moment) really know here what kind of routings
> the driver would accept, but we can test a VIDIOC_SUBDEV_G_ROUTING call,
> followed by a VIDIOC_SUBDEV_S_ROUTING call with the routing we
> received.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++++++++++
>  utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 16 ++++++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index d7c10482..f082f569 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1249,6 +1249,18 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		node.is_passthrough_subdev = has_source && has_sink;
>  
>  		if (has_routes) {
> +			printf("Sub-Device routing ioctls:\n");
> +
> +			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
> +				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> +
> +				printf("\ttest %s VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: %s\n",
> +				       which ? "Active" : "Try",
> +				       ok(testSubDevRouting(&node, which)));
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

NUM_ROUTES_MAX

> +
> +	routing.which = which;
> +	routing.routes = (__u64)&routes;
> +	routing.num_routes = 256;

NUM_ROUTES_MAX

Regards,

	Hans

> +
> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
> +
> +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
> +
> +	return 0;
> +}

