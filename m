Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B5D7279CF
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbjFHIUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbjFHIUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:20:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C3E2695
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 01:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B3EE6449A
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 08:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B95C433D2;
        Thu,  8 Jun 2023 08:20:41 +0000 (UTC)
Message-ID: <e635ea49-c185-c02f-fe37-adc4c30b752c@xs4all.nl>
Date:   Thu, 8 Jun 2023 10:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 3/7] media: uapi: v4l: Document source routes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-4-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230505215257.60704-4-sakari.ailus@linux.intel.com>
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

On 05/05/2023 23:52, Sakari Ailus wrote:
> Document how internal pads are used on source routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
>  .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
>  include/uapi/linux/v4l2-subdev.h               |  6 +++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a4f1df7093e8..395e06d2f0f2 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
>  sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
>  
> +.. _v4l2-subdev-source-routes:
> +
> +Source routes
> +^^^^^^^^^^^^^
> +
> +Cases where a single sub-device pad is a source of multiple streams are special
> +as there is no sink pad for such a route. In those cases, an internal pad is
> +used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
> +<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.

add: instead of the <MEDIA-PAD-FL-SINK> flag.

> +
> +Internal pads have all the properties of a sink pad in such case, including
> +formats and selections. The format in this case is the source format of the
> +stream. An internal pad always has a single stream only (0).
> +
> +Generally source routes are not modifiable but they can be activated and
> +inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE

inactivated -> deactivated

> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> +

Again, this really needs one or more examples.

>  Interaction between routes, streams, formats and selections
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 68ca343c3b44..e00622071b64 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -94,6 +94,11 @@ for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
>      * - __u32
>        - ``sink_pad``
>        - Sink pad number.
> +    * - __u32
> +      - ``internal_source_pad``
> +      - Internal source pad number. For pads with :ref:`internal source pad flag
> +	<MEDIA-PAD-FL-INTERNAL-SOURCE>`, for use with :ref:`source routes
> +	<v4l2-subdev-source-routes>`.
>      * - __u32
>        - ``sink_stream``
>        - Sink pad stream number.
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 4a195b68f28f..703e3a1f199b 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -203,6 +203,7 @@ struct v4l2_subdev_capability {
>   * struct v4l2_subdev_route - A route inside a subdev
>   *
>   * @sink_pad: the sink pad index
> + * @internal_source_pad: the internal source pad
>   * @sink_stream: the sink stream identifier
>   * @source_pad: the source pad index
>   * @source_stream: the source stream identifier
> @@ -210,7 +211,10 @@ struct v4l2_subdev_capability {
>   * @reserved: drivers and applications must zero this array
>   */
>  struct v4l2_subdev_route {
> -	__u32 sink_pad;
> +	union {
> +		__u32 sink_pad;
> +		__u32 internal_source_pad;

Nobody will understand this. I think this should still be kept as
sink_pad. If the INTERNAL_SOURCE flag is changed to SINK_FROM_INTERNAL_SOURCE
(or something along those lines), then 'sink_pad' still makes sense
and you don't need this change.

It's still a sink pad, just a sink pad with a special property in that it
receives the data from an internal source.

> +	};
>  	__u32 sink_stream;
>  	__u32 source_pad;
>  	__u32 source_stream;

Regards,

	Hans
