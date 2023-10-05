Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8AF7B9F35
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbjJEOUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbjJEOSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:18:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC2826A75
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 05:59:10 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B081B9C4;
        Thu,  5 Oct 2023 14:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696510642;
        bh=PaHhXxFhItQu0J+sVv9DRCJ7mxoUOFIugGaQqOtypBs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mXTp7/e/p9K0DSFasa+hlOq+lD4NU7e7d8jxk2wIlICczG8tVKBPaR8Tnk0o6t2hh
         UYnRvQ0TKOyYNVnx2mEtWxdy5DI5mG5a7VUfUjQith3kJIeyRbCY76FEt7YzBd5vJt
         BcnIaodyhHo2wSFbtNgZY1Qz7yCSSniK3PoyFAqE=
Message-ID: <f31d9f76-4156-c79b-0cbc-0c5450656312@ideasonboard.com>
Date:   Thu, 5 Oct 2023 15:59:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 11/28] media: Documentation: Document S_ROUTING
 behaviour
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-2-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003120813.77726-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 15:07, Sakari Ailus wrote:
> Document S_ROUTING behaviour for different devices.
> 
> Generally in devices that produce streams the streams are static and some

I'm not sure what "static" means here. "Generally in devices that 
produce streams there is a fixed amount of streams..."?

> can be enabled and disabled, whereas in devices that just transport them
> or write them to memory, more configurability is allowed. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index fb73a95401c3..83993775237f 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -593,6 +593,27 @@ Any configurations of a stream within a pad, such as format or selections,
>   are independent of similar configurations on other streams. This is
>   subject to change in the future.
>   
> +Device types and routing setup
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Different kinds of sub-devices have differing behaviour for route inactivation,

Would "activation" convey the same, but be a bit clearer?

> +depending on the hardware. Devices generating the streams may often allow

Maybe drop the "often".

> +enabling and disabling some of these or the configuration is fixed. If these

"some of these" -> "some of the routes".

> +routes can be disabled, not declaring these routes (or declaring them without

Here also, I think "the routes" is more readable than repeating "these 
routes".

> +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will

Why is the flag sentence in parenthesis? Aren't both options of the same 
value?

> +disable the routes while the sub-device driver retain the streams and their

What does this mean? That even if the user disables a route, the driver 
must keep the configuration that was set earlier related to that route?

> +configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> +flag unset.

So a generating device should always return all its routes with both 
G_ROUTING and S_ROUTING, right? But with disabled routes not having 
VIDIOC_SUBDEV_STREAM_FL_ACTIVE. The text doesn't mention G_ROUTING at all.

> +Devices transporting the streams almost always have more configurability with
> +respect to routing. Typically any route between the sub-device's sink and source
> +pads is possible, and multiple routes (usually up to certain limited number) may
> +be active simultaneously. For such devices, no routes are created by the driver
> +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> +called on the sub-device. Such newly created routes have the device's default
> +configuration for format and selection rectangles.
> +

I think this paragraph is ok. But could this whole section be 
restructured a bit, as the previous paragraph gets quite confusing. Maybe:

First paragraph to explain the two different kinds of devices, and 
perhaps a mention that a route is considered disabled if either it does 
not exist in the routing table or if VIDIOC_SUBDEV_STREAM_FL_ACTIVE is 
not set.

Then a paragraph for generating devices, and then a paragraph for 
transporting devices.

>   Configuring streams
>   ^^^^^^^^^^^^^^^^^^^
>   

