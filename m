Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F0558540F
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 19:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238189AbiG2RAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 13:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238195AbiG2RAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 13:00:32 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB463ED54
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 10:00:31 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id n8so9218921yba.2
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=g14OPAGQDKEyG0lq3sN6X8BjyD1YpIrYmaAKPcLKupc=;
        b=CQoPfQNeNM0qx94zcnjwesXs/ryCXpoy6pviQfWcebQ5TI7V+yeQhqzyc07gZl9DiO
         5xqkaSiLwzptu4gy7O+u0qp4MbXY1K3a+ZVDwHwcfOlvvg3Gl+0pjOw+y4tP1z2urn/C
         v1497n3NHrpWnGJdtN0r8WZSqNP+62xEr2h1qFsa7w46u52uJUAyNjOqjNeetzV2sGk4
         BAKcHfFIQ7eUlSmJ/F89qugA8aRJGx9Uap4j6MNRF1ULo8ZD6mrzS+3+4acM99m1tBR7
         Ly/gOU/boUFcEcjYZw11mL3VRRBX3laMT3L+GykdidPv26LeWNr+pWWtL634EWw3/Q7n
         CMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=g14OPAGQDKEyG0lq3sN6X8BjyD1YpIrYmaAKPcLKupc=;
        b=JChaJ4U6ZAGOEKLQQamVgciBtfBlnleCT+UZrkRcI1SUwsso3xYImV71XNgG286njm
         Tr4+zlLfZn3HaII5B+n1+w01xVl9uJc8DrEr9kGSx40bUmEXkVLY3Q51tJKd0OuHyEO/
         bnvumNt9flJjD7cr/luQhRTPaljf3qbxt4Hr7pB+zb2+WoyNE7f+/QzNJ4vOy53W0M4G
         AiZcdvZmrQfDofSLy54u9fScEASrJk5KR2FSW7LCHlC0i+FBgq5VC/JKkHVelc4NhyDa
         8nSPlAE6vNliMHRA59kDAcSdFMmBgw+lxLh4Yf8IMdIz8tJdUZLmp7fpDBZtx39U7vxR
         4J4g==
X-Gm-Message-State: ACgBeo2+gqPTu77MFToxoKRIAbFd7I7KufjoP8WQp9CE/9UpY0RT2vfQ
        Zu9dwYBC3MuX7aG/DetZxONMU+/8syWw519u8F9ZMA==
X-Google-Smtp-Source: AA6agR6W2cFntTYH4Nw/lbhHw6X0cciuzsmjbdHpR6qTKFPpK22lyG2VEVKTLFA41+ZeMBy/qbpAfxr77pdCvRu/PCk=
X-Received: by 2002:a25:4d83:0:b0:676:b6cf:ed23 with SMTP id
 a125-20020a254d83000000b00676b6cfed23mr2058001ybb.254.1659114030568; Fri, 29
 Jul 2022 10:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
 <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com> <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
 <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com>
In-Reply-To: <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 10:00:19 -0700
Message-ID: <CAG0LG96dncADM65ids6VMU=ym-j55fws6NOwLQM=or7pN4-d-g@mail.gmail.com>
Subject: Re: [EXT] Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc: entity:
 Rewrite media_pipeline_start() to support routes
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 29, 2022 at 3:27 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 29/07/2022 12:19, Satish Nagireddy wrote:
> > On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> On 29/07/2022 11:45, Satish Nagireddy wrote:
> >>
> >>>> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
> >>>>
> >>>>    struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> >>>>    {
> >>>> -       return entity->pipe;
> >>>> +       return entity->pads->pipe;
> >>>
> >>> I am not sure If it is always safe to return the pipe associated with
> >>> the first pad. I think this will work with all the existing drivers.
> >>> Let's say If pads of an entity are associated with different pipes,
> >>> this function might require extending the support of returning
> >>> pipe based on pad index. Please let me know your opinion.
> >>
> >> That's true. The kdoc for this function says:
> >>
> >>    * In general, entities can be part of multiple pipelines, when carrying
> >>    * multiple streams (either on different pads, or on the same pad using
> >>    * multiplexed streams). This function is ill-defined in that case. It
> >>    * currently returns the pipeline associated with the first pad of the
> >> entity.
> >>
> >> I did consider adding a warning if the function is called for entities
> >> with more than one pad. But that probably would give false warnings,
> >> e.g. for a simple entity with one sink and one source pad. In that case
> >> both pads are always part of the same pipeline, and
> >> media_entity_pipeline() works correctly.
> >>
> >> We could perhaps add a check here which verifies that all the pads in
> >> the entity have the same pipe.
>
> Perhaps something like:
>
> struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> {
>         struct media_pipeline *pipe;
>         struct media_pad *pad;
>
>         if (entity->num_pads == 0)
>                 return NULL;
>
>         pipe = entity->pads->pipe;
>
>         media_entity_for_each_pad(entity, pad) {
>                 if (WARN_ON(pad->pipe != pipe))
>                         return NULL;
>         }
>
>         return pipe;
> }

The above code means that we do not support multiple pipelines per
entity. Or leave the implementation as is now and
this can be done as a different patch later, I will leave it to you.
He is what I'm thinking, assuming that every media_pad has it's own pipe.

struct media_pipeline *media_entity_pipeline(struct media_entity
*entity, u32 pad_index)
{
         if (pad_index >= entity->num_pads)
                 return NULL;

         return entity->pads[pad_index].pipe;
}

- Satish

>
> >>>>    }
> >>>>    EXPORT_SYMBOL_GPL(media_entity_pipeline);
> >>>
> >>> nit, It would be nice to rename this function to media_entity_get_pipe
> >>> or media_entity_get_pipeline for better readability.
> >>
> >> I'm ok with that, but we do have other functions with this style:
> >> media_entity_remote_pad(), media_entity_id(), ...
> >>
> >>    Tomi
> >
> > I could only see one function with the similar style ==>
> > media_entity_get_fwnode_pad
>
> Right, so, do you agree that we should keep the name as
> media_entity_pipeline, as we already have many other functions with
> similar style?
>
>   Tomi

Sure, we can go with the same function name.

- Satish
