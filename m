Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C595FC096
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJLGW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJLGWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:22:54 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E608996C
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:22:54 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so1149567pjl.0
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3WTBqNq7Po/J3SmoHs3NxLMUPLBaj/mfSzSu3Pd4q0=;
        b=V4L/09qVqzZv9gs+gyINX/wUaIItdsyqMl76x0RKzf3BpbzocqvByb5H7hW9JcviTA
         jJNTqVjjnLHHCJQ0bSBhLzuv/Kh+N7CObUioQFgay071XcWTCGlnytbMV+9U8x9bipOC
         wSUGNJSEkM92SV6jOx5DsVzO6LvU+htcJYZpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3WTBqNq7Po/J3SmoHs3NxLMUPLBaj/mfSzSu3Pd4q0=;
        b=dQnqPJW1rARof3JXA/eZGfQ8bLxQGh64IFJkmS1TXKhl8aabo1Yrj6HdyDBSePbtWa
         DLNLAmpXNlvjsXJLsV1EjkVHGwhRhC+2UJSsXFARfcgfUk3yNaruffSfxovDBqI+jcKh
         edrsenQMj7y5+z2U0ZQ8mju3fSfDb7WrH4rIOZkZs7ZsOPTsLQHDg/n7KeOLJBy947ZE
         gNtCrCanERD56QpfFYnghOzntcBpTYTZSkIfT15J/gWBWsk1I5fXK7tTJ7FT8EoQm7AT
         YDeX3qnhzbJCCAFpO+5qSdtJGRBnEMKd771iB00rMhUmdUBzvi9i64pxjN75pI1/noEn
         I+7A==
X-Gm-Message-State: ACrzQf3r9aJiVlUSqxfV7nTCAq49pXd7zKiDs2y4Qq/j6b25zRzFa7OD
        IYrBof8OaA6kBmRYV1phyZzfb4lGXFPAreGLrqo11nl3UGA=
X-Google-Smtp-Source: AMsMyM6MQdi3Ih0kz30hcs1GIJODyz64W1CGVABjRF8PgKDfQychuWCbcmpcJcm2tuWnFoqQ5YJIS2Q5MXRX2WoXAgQ=
X-Received: by 2002:a17:90b:3b8b:b0:20d:4fd9:9a0f with SMTP id
 pc11-20020a17090b3b8b00b0020d4fd99a0fmr3163328pjb.17.1665555773500; Tue, 11
 Oct 2022 23:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com> <20221003121852.616745-8-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221003121852.616745-8-tomi.valkeinen@ideasonboard.com>
From:   Yunke Cao <yunkec@chromium.org>
Date:   Wed, 12 Oct 2022 15:22:42 +0900
Message-ID: <CAEDqmY4=yVOWA4-V-dc_5BQRA_TnGPmxBERrTj3hKBs8EXkjGg@mail.gmail.com>
Subject: Re: [PATCH v15 07/19] media: subdev: add v4l2_subdev_set_routing helper()
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Oct 12, 2022 at 2:03 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Add a helper function to set the subdev routing. The helper can be used
> from subdev driver's set_routing op to store the routing table.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index fff17b8536fc..3ae4f39a50e4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -12,6 +12,7 @@
>  #include <linux/ioctl.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> +#include <linux/overflow.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/version.h>
> @@ -1181,6 +1182,36 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +                           struct v4l2_subdev_state *state,
> +                           const struct v4l2_subdev_krouting *routing)
> +{
> +       struct v4l2_subdev_krouting *dst = &state->routing;
> +       const struct v4l2_subdev_krouting *src = routing;
> +       struct v4l2_subdev_krouting new_routing = { 0 };
> +       size_t bytes;
> +
> +       if (unlikely(check_mul_overflow(src->num_routes, sizeof(*src->routes),

Do we need to cast (size_t)src->num_routes here?
My compiler is complaining:
./include/linux/overflow.h:85:22: error: comparison of distinct
pointer types lacks a cast [-Werror]
   85 |         (void) (&__a == &__b);                  \

Thanks,
Yunke


> +                                       &bytes)))
> +               return -EOVERFLOW;
> +
> +       lockdep_assert_held(state->lock);
> +
> +       if (src->num_routes > 0) {
> +               new_routing.routes = kmemdup(src->routes, bytes, GFP_KERNEL);
> +               if (!new_routing.routes)
> +                       return -ENOMEM;
> +       }
> +
> +       new_routing.num_routes = src->num_routes;
> +
> +       kfree(dst->routes);
> +       *dst = new_routing;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 45c41f4d6a2b..7962e6572bda 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1419,6 +1419,22 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>                         struct v4l2_subdev_format *format);
>
> +/**
> + * v4l2_subdev_set_routing() - Set given routing to subdev state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + *
> + * This will release old routing table (if any) from the state, allocate
> + * enough space for the given routing, and copy the routing.
> + *
> + * This can be used from the subdev driver's set_routing op, after validating
> + * the routing.
> + */
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +                           struct v4l2_subdev_state *state,
> +                           const struct v4l2_subdev_krouting *routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> --
> 2.34.1
>
>
