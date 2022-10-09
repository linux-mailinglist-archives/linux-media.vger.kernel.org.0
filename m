Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF8B5F89DC
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 09:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiJIHGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 03:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiJIHGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 03:06:24 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA202CE28
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 00:06:22 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5CF1332000E5;
        Sun,  9 Oct 2022 03:06:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 09 Oct 2022 03:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665299180; x=1665385580; bh=Cim2Khjo6+
        AR4Puga4yNASZM93Ogejn8jc547BVKXho=; b=RGTPW1QYkS+k4t1i1bxy9AesUT
        kXYT2eY7KMLbAynXyJvnfa2vNglOXHb1BrYn/aYcAdYxHJap6st7hFyuv5TgdjcC
        pyOYauvtMv53PYqrgl9rT5r5e0/+rFIIvRhXLSgUDOqkEyHqFiV8o0YAzSRf+s0/
        SWiXjYLHZMhlW6TqX+K0NEFIfNjHYaDehI5O29h/vQktDzzzB+DUEc0y2GTv2Lax
        kKHVEkIiwlhb4g6UqAy6sPB0yM0PwvCYODkRhgxBXXe8wRoWd9wdt8FZmpcc1Dgy
        Mu/wzlkfdz6WGd85vU62i9Y1hoq54XD61oKABzK+RIGKLnhdT13lw/puQEbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665299180; x=1665385580; bh=Cim2Khjo6+AR4Puga4yNASZM93Og
        ejn8jc547BVKXho=; b=bmijUCxyF3lgRnN9DzrvH/i4IAehVxEzqudmL7aSdoyl
        rXdFV+4pKXU8qVxyywnD8Xtpdi37TNQ8pylcenSRU1Mlw/Qs0BsLnR69LBHBbLkO
        9/Lmu6D2IOsYr+8N/j1QchHuu4IfxkyX91QKgeRuR9A03n+kb1lKKkAFvaCMv1s+
        qlzssGGcmd82lNzKgqN/FPUwuTWgfybVofuzmKA2un/vMDLxcj7+Tb6l8VkdB63D
        yQ9dpmA/I7BHLR548pF4DpRMJjJDonJ4hPR3r1cpvi94rJUxG8YYD6Uu9f+qeBtO
        taDnIRGQ8O2IDfYU8N8lUxkHwqcVm2K77lzeLqr8sg==
X-ME-Sender: <xms:7HJCYxZoQarpLLzBWwivINHNGSDlRzOKP0dulFOw3f6YyqmSjwJViw>
    <xme:7HJCY4Yxm5EE4cw0sMct9nNRFX4Q1U7i--elcOefEWW1UDSWHq0DE90n-r00wVuSw
    BjThkQrB76EkLSq53w>
X-ME-Received: <xmr:7HJCYz_SekBYRFX9xF7oPYGfUucTTTiqH-T6Z8A6ZqMYju6rbV8--w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejtddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7HJCY_qKJ4bqcvv8v_ATALQx84_VaosDCQ2jc9EScJmr_BYlWWQnyQ>
    <xmx:7HJCY8qMbsxw8N0WFSQFTb7mGvSTUmr_uLyS8Jt-zw7SKJ-sa8TxDw>
    <xmx:7HJCY1QKrtQpfyCoTF74G3H9m-e4crlpx_MVNsDwcjqtr6bYmyQH4Q>
    <xmx:7HJCY5jlGeFGtkIHWIwEvZYIIOHYU9rU6ePQVK9pZdOvi-RrM19TMQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Oct 2022 03:06:16 -0400 (EDT)
Date:   Sun, 9 Oct 2022 10:06:14 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v15 12/19] media: subdev: add "opposite" stream helper
 funcs
Message-ID: <20221009070614.rud3yx6acsxwt6kl@guri>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-13-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20221003121852.616745-13-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03.10.2022 15:18, Tomi Valkeinen wrote:
>Add two helper functions to make dealing with streams easier:
>
>v4l2_subdev_routing_find_opposite_end - given a routing table and a pad
>+ stream, return the pad + stream on the opposite side of the subdev.
>
>v4l2_subdev_state_get_opposite_stream_format - return a pointer to the
>format on the pad + stream on the opposite side from the given pad +
>stream.
>
>Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>---
> drivers/media/v4l2-core/v4l2-subdev.c | 49 +++++++++++++++++++++++++++
> include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
> 2 files changed, 85 insertions(+)
>
>diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>index 1cea6ec750c0..7d2d8e8d3aea 100644
>--- a/drivers/media/v4l2-core/v4l2-subdev.c
>+++ b/drivers/media/v4l2-core/v4l2-subdev.c
>@@ -1514,6 +1514,55 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> }
> EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
>
>+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>+					  u32 pad, u32 stream, u32 *other_pad,
>+					  u32 *other_stream)
>+{
>+	unsigned int i;
>+
>+	for (i = 0; i < routing->num_routes; ++i) {
>+		struct v4l2_subdev_route *route = &routing->routes[i];
>+
>+		if (route->source_pad == pad &&
>+		    route->source_stream == stream) {
>+			if (other_pad)
>+				*other_pad = route->sink_pad;
>+			if (other_stream)
>+				*other_stream = route->sink_stream;
>+			return 0;
>+		}
>+
>+		if (route->sink_pad == pad && route->sink_stream == stream) {

Hi, I think here you should also check that the FL_SOURCE flag is not set to make sure
that sink_pad/stream are used

Thanks,
Dafna

>+			if (other_pad)
>+				*other_pad = route->source_pad;
>+			if (other_stream)
>+				*other_stream = route->source_stream;
>+			return 0;
>+		}
>+	}
>+
>+	return -EINVAL;
>+}
>+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
>+
>+struct v4l2_mbus_framefmt *
>+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>+					     u32 pad, u32 stream)
>+{
>+	u32 other_pad, other_stream;
>+	int ret;
>+
>+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
>+						    pad, stream,
>+						    &other_pad, &other_stream);
>+	if (ret)
>+		return NULL;
>+
>+	return v4l2_subdev_state_get_stream_format(state, other_pad,
>+						   other_stream);
>+}
>+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>+
> #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
> #endif /* CONFIG_MEDIA_CONTROLLER */
>diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>index d6273ad2eea8..6f4719e28ad1 100644
>--- a/include/media/v4l2-subdev.h
>+++ b/include/media/v4l2-subdev.h
>@@ -1527,6 +1527,42 @@ struct v4l2_rect *
> v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> 				     unsigned int pad, u32 stream);
>
>+/**
>+ * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
>+ * @routing: routing used to find the opposite side
>+ * @pad: pad id
>+ * @stream: stream id
>+ * @other_pad: pointer used to return the opposite pad
>+ * @other_stream: pointer used to return the opposite stream
>+ *
>+ * This function uses the routing table to find the pad + stream which is
>+ * opposite the given pad + stream.
>+ *
>+ * @other_pad and/or @other_stream can be NULL if the caller does not need the
>+ * value.
>+ *
>+ * Returns 0 on success, or -EINVAL if no matching route is found.
>+ */
>+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>+					  u32 pad, u32 stream, u32 *other_pad,
>+					  u32 *other_stream);
>+
>+/**
>+ * v4l2_subdev_state_get_opposite_stream_format() - Get pointer to opposite
>+ *                                                  stream format
>+ * @state: subdevice state
>+ * @pad: pad id
>+ * @stream: stream id
>+ *
>+ * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
>+ * that is opposite the given pad + stream in the subdev state.
>+ *
>+ * If the state does not contain the given pad + stream, NULL is returned.
>+ */
>+struct v4l2_mbus_framefmt *
>+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>+					     u32 pad, u32 stream);
>+
> #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
> #endif /* CONFIG_MEDIA_CONTROLLER */
>-- 
>2.34.1
>
