Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28E0725D33
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbjFGLfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240312AbjFGLeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:34:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51351707
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:34:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8340760C58
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF23C433D2;
        Wed,  7 Jun 2023 11:34:46 +0000 (UTC)
Message-ID: <3267eef9-1d67-933a-29c3-9919eb125084@xs4all.nl>
Date:   Wed, 7 Jun 2023 13:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 3/7] v4l2-ctl/compliance: Add routing and streams
 multiplexed streams
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
 <20230529085003.47207-4-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230529085003.47207-4-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/05/2023 10:49, Tomi Valkeinen wrote:
> Add basic support for routing and streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 120 ++++++++++++++++----
>  utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++++++-
>  3 files changed, 137 insertions(+), 34 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index e3556b1f..d7c10482 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1233,6 +1233,10 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  	if (node.is_subdev()) {
>  		bool has_source = false;
>  		bool has_sink = false;
> +		struct v4l2_subdev_routing sd_routing[2] = {};
> +		struct v4l2_subdev_route sd_routes[2][256] = {};

256 comes from the same kernel check, right? Can you use the same
NUM_ROUTES_MAX define that you used in v4l2-ctl? Perhaps this define
should be added to utils/common/v4l2-info.h?

> +		bool has_routes = !!(subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
> +		int ret;
>  
>  		node.frame_interval_pad = -1;
>  		node.enum_frame_interval_pad = -1;
> @@ -1244,6 +1248,22 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		}
>  		node.is_passthrough_subdev = has_source && has_sink;
>  
> +		if (has_routes) {
> +			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
> +				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> +
> +				sd_routing[which].which = which;
> +				sd_routing[which].routes = (__u64)sd_routes[which];
> +				sd_routing[which].num_routes = 256;

Also NUM_ROUTES_MAX?

> +
> +				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> +				if (ret) {
> +					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
> +					sd_routing[which].num_routes = 0;
> +				}
> +			}
> +		}
> +

Regards,

	Hans
