Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B76B57928A
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 07:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236243AbiGSFij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 01:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbiGSFih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 01:38:37 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D26424F05
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 22:38:36 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id o21so10429148qkm.10
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GehrUVl56aQUC3Uq0SxtvWux24yDXnKo84YHl8XFB0k=;
        b=Z45VGuuZ/RXOX2ZLsXiarIT7j70/Fz9wgV8486FsUjs8kfyRsOlKz6FGbWiAhO0yjD
         reqc0z7fNsrf1YOer7wlEhTfnI78IPMRWzS2vFK4YALMqQwGX4Um0Z2PShkh87B1wfZn
         qY48FcMe37Cn43MMd3wAcrAlHhVI1eEYECJfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GehrUVl56aQUC3Uq0SxtvWux24yDXnKo84YHl8XFB0k=;
        b=l9vhrC3J+i9pajOsQPN4LingvMyRlXz6cTOJfGUo1Lz+NVFKV/KbXnkTOLHcOXI8/2
         VUWA9HOfdHyuDp2omClVoLrmjObr4Roc3EeQEN6bpheFvGnqYhephtJncIvCZG1YjrsY
         pZVRBvkDzniwsAX75GI8JCtfU2w5ES4/ItFgnqRS23NXSj8Gjt00ERPyf1KQEUs4DGnL
         eh3nYTOIb7OCcBlhCcj9Uwbf6ETV0YeDU9l6MOel7fSO7tiLAVkfWGoY5F8RJQ800LL2
         gJpZtJg9oI4mg2/rIt29HUDiduINK/ggg5RnNapTOGtMa89pBPdiQB0saXLgV4oAgUDE
         VLsA==
X-Gm-Message-State: AJIora+WPPxrhbC5G+XoExRX2XF/SJnLJjKFV2+1h0pyEtnpu48IiO1P
        ASIUSBPqYPuMaGdsZ3MG2ypK5SoW03p10Q==
X-Google-Smtp-Source: AGRyM1ufMo5UHS+7jVM83FuX9CyqPVl8wEdWrOy+cCD+o/0NRvUh2Aztq3PBG4JQ9YHNlSes+oB9nw==
X-Received: by 2002:a05:620a:1707:b0:6b5:f93a:ee54 with SMTP id az7-20020a05620a170700b006b5f93aee54mr2875199qkb.158.1658209115571;
        Mon, 18 Jul 2022 22:38:35 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id z3-20020a05622a028300b0031ef108e6a8sm3394360qtw.42.2022.07.18.22.38.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 22:38:34 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-31caffa4a45so129640717b3.3
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 22:38:33 -0700 (PDT)
X-Received: by 2002:a81:7cc4:0:b0:31e:6065:f1f0 with SMTP id
 x187-20020a817cc4000000b0031e6065f1f0mr178727ywc.41.1658209113417; Mon, 18
 Jul 2022 22:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
 <Ysa1HZh5f38iXDHf@chromium.org> <d1eb02fc-a5a9-7b19-64da-fdd719f3e342@ideasonboard.com>
In-Reply-To: <d1eb02fc-a5a9-7b19-64da-fdd719f3e342@ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 19 Jul 2022 14:38:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A8K4PPgfWnRNXC7vjjb-B6hn1T=haQPhtNw7tp1pdbKQ@mail.gmail.com>
Message-ID: <CAAFQd5A8K4PPgfWnRNXC7vjjb-B6hn1T=haQPhtNw7tp1pdbKQ@mail.gmail.com>
Subject: Re: [PATCH v11 34/36] media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams()
 helper
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 14, 2022 at 4:41 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 07/07/2022 13:27, Tomasz Figa wrote:
> > Hi Tomi, Laurent,
> >
> > On Tue, Mar 01, 2022 at 06:11:54PM +0200, Tomi Valkeinen wrote:
> >> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> Add a helper function to translate streams between two pads of a subdev,
> >> using the subdev's internal routing table.
> >>
> >
> > Thanks for the patch! Please see my comments inline.
> >
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
> >>   include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
> >>   2 files changed, 48 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >> index e30338a53088..6a9fc62dacbf 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -1529,6 +1529,31 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
> >>   }
> >>   EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
> >>
> >> +u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
> >> +                                u32 pad0, u32 pad1, u64 *streams)
> >> +{
> >> +    const struct v4l2_subdev_krouting *routing = &state->routing;
> >> +    struct v4l2_subdev_route *route;
> >> +    u64 streams0 = 0;
> >> +    u64 streams1 = 0;
> >> +
> >> +    for_each_active_route(routing, route) {
> >> +            if (route->sink_pad == pad0 && route->source_pad == pad1 &&
> >> +                (*streams & BIT(route->sink_stream))) {
> >> +                    streams0 |= BIT(route->sink_stream);
> >> +                    streams1 |= BIT(route->source_stream);
> >> +            }
> >> +            if (route->source_pad == pad0 && route->sink_pad == pad1 &&
> >> +                (*streams & BIT(route->source_stream))) {
> >> +                    streams0 |= BIT(route->source_stream);
> >> +                    streams1 |= BIT(route->sink_stream);
> >> +            }
> >> +    }
> >> +
> >> +    *streams = streams0;
> >> +    return streams1;
> >> +}
> >> +
> >>   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >>                      struct v4l2_subdev_format *format)
> >>   {
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 1eced0f47296..992debe116ac 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
> >>   v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
> >>                                           u32 pad, u32 stream);
> >>
> >> +/**
> >> + * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
> >> + *
> >> + * @state: Subdevice state
> >> + * @pad0: The first pad
> >> + * @pad1: The second pad
> >> + * @streams: Streams bitmask on the first pad
> >> + *
> >> + * Streams on sink pads of a subdev are routed to source pads as expressed in
> >> + * the subdev state routing table. Stream numbers don't necessarily match on
> >> + * the sink and source side of a route. This function translates stream numbers
> >> + * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
> >> + * on @pad1 using the routing table from the @state. It returns the stream mask
> >> + * on @pad1, and updates @streams with the streams that have been found in the
> >> + * routing table.
> >> + *
> >> + * @pad0 and @pad1 must be a sink and a source, in any order.
> >> + *
> >> + * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
> >
> > It might be just me, but somehow I associate "translate" with turning a
> > name from one namespace into a corresponding name from another
> > namespace. In this case I initially assumed that this function is
> > supposed to accept stream IDs from pad0 and return corresponding
> > stream IDs from pad1. However, it looks like this is move like - "tell
> > me which streams on pad1 are connected to the given pad0 streams". Is
> > this correct?
>
> So is your point that as the function returns a bitmask, and not a
> mapping of the stream IDs, this is not a translate function?

Yep.

>
> > If yes, maybe v4l2_subdev_state_get_routed_streams() be a better name?
>
> I think this name would also fit quite well for a function that returns
> a mapping of the streams. So... I don't have a strong opinion on this.
> To me, neither the current name nor the proposed one clearly explains
> alone what the function does.

Well, since it's a kernel function, it probably can be renamed later.
Anyway, I forgot to place "nit:" before the comment. It's not really a
strong opinion from me either.

Best regards,
Tomasz
