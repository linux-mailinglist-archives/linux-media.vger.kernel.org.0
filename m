Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED965854F8
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 20:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiG2SVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 14:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiG2SVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 14:21:08 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E16E1572C
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 11:21:07 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-322b5199358so56774517b3.6
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yHRevWtP6xErDg1yPtOg8UMqDNLXdosMwPxU7FhwPFc=;
        b=sPCZOrIQMy+Igi6xWFTVijPa+GeG7lXYqY7FK47d7JTo1tm3fTAO2zxQD2Un+Cp/AO
         9tHrwvkZeZt+P8bDEhq7hVVA1YbNHZa6r8tgXhjLN0AiGWT4oHuXkRONjeXSaYlRiL1I
         l0OLiTylLySB6SV05kF4GGeQgecXrJqs6fSKpVx+so+5973cw1AR7yiyIZGYVYaTZuDN
         Vd+MW05YR8p1hY+8Q7lOaXw2eb2IeuW9pX/d/NZPZhYlADNYcKQo524MbMBUi8rV8Q6Q
         MJyH7YopLFFPjGV1h/USC6WG1P1luY1OYwRvYsttDyMYktokCGiLi/XZYHIEOTXdJ9UR
         PAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yHRevWtP6xErDg1yPtOg8UMqDNLXdosMwPxU7FhwPFc=;
        b=kiT5Z/xrftp/o6dIdsBmXdX7IEmlSOc6gl/ABBIMP4FhVCEu2yv6DJfxdfVIZQLpXg
         BzSoxAuaPLO5N2yWSsXf6brwivrMNTDeXODVvt0CRU+IArac2s/GfOkvaRQ4WU0v96/Q
         qE8AGdmPbzF21JQWbq3uSTBsFhO0nmFa5o7rd+iMNkmAz0k4vx88tk1+dMppSr8fOhYZ
         BGRT/znYcTo61DQNNqPp0NI4SN9Xi2qJYMAbc9nBamfkAQFYmrmUJvZMrllG18lb5jt+
         nxtvxQq3J3WSx4znADtw6XROn5H/qh0+jS9B12o8mIYooVyOb2Gc3ep/OYtLus/UcNJh
         Q4Fg==
X-Gm-Message-State: ACgBeo3E0SGIxAmdwP6c2Ro/AHgsGkXYT585q9i+0j0mHhJVW4wD+dIA
        N1AI02L0VO8HpbRlI65b4a5crGy1MT+2mHm+6yaz8A==
X-Google-Smtp-Source: AA6agR5rPiG4Upj+Z5YKDaMpAwBt7Kwn7XAZbai7SaZTW92eGLAKksxvcPfk1W8Z3a0hMjVohE9PbO7gKtWFkHR/bTM=
X-Received: by 2002:a81:8413:0:b0:322:d661:a785 with SMTP id
 u19-20020a818413000000b00322d661a785mr4200831ywf.16.1659118866432; Fri, 29
 Jul 2022 11:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
 <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com> <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
 <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com> <CAG0LG96dncADM65ids6VMU=ym-j55fws6NOwLQM=or7pN4-d-g@mail.gmail.com>
 <47c925b2-2fa2-ce0b-0d43-5fc8fb048338@ideasonboard.com>
In-Reply-To: <47c925b2-2fa2-ce0b-0d43-5fc8fb048338@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 11:20:55 -0700
Message-ID: <CAG0LG966eKazMTDBtk09dG8uOGbnBaqDJodr-OfLoabMUJ07fw@mail.gmail.com>
Subject: Re: [EXT] Re: [EXT] Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc:
 entity: Rewrite media_pipeline_start() to support routes
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

On Fri, Jul 29, 2022 at 10:07 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 29/07/2022 20:00, Satish Nagireddy wrote:
> > On Fri, Jul 29, 2022 at 3:27 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> On 29/07/2022 12:19, Satish Nagireddy wrote:
> >>> On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>
> >>>> On 29/07/2022 11:45, Satish Nagireddy wrote:
> >>>>
> >>>>>> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
> >>>>>>
> >>>>>>     struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> >>>>>>     {
> >>>>>> -       return entity->pipe;
> >>>>>> +       return entity->pads->pipe;
> >>>>>
> >>>>> I am not sure If it is always safe to return the pipe associated with
> >>>>> the first pad. I think this will work with all the existing drivers.
> >>>>> Let's say If pads of an entity are associated with different pipes,
> >>>>> this function might require extending the support of returning
> >>>>> pipe based on pad index. Please let me know your opinion.
> >>>>
> >>>> That's true. The kdoc for this function says:
> >>>>
> >>>>     * In general, entities can be part of multiple pipelines, when carrying
> >>>>     * multiple streams (either on different pads, or on the same pad using
> >>>>     * multiplexed streams). This function is ill-defined in that case. It
> >>>>     * currently returns the pipeline associated with the first pad of the
> >>>> entity.
> >>>>
> >>>> I did consider adding a warning if the function is called for entities
> >>>> with more than one pad. But that probably would give false warnings,
> >>>> e.g. for a simple entity with one sink and one source pad. In that case
> >>>> both pads are always part of the same pipeline, and
> >>>> media_entity_pipeline() works correctly.
> >>>>
> >>>> We could perhaps add a check here which verifies that all the pads in
> >>>> the entity have the same pipe.
> >>
> >> Perhaps something like:
> >>
> >> struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> >> {
> >>          struct media_pipeline *pipe;
> >>          struct media_pad *pad;
> >>
> >>          if (entity->num_pads == 0)
> >>                  return NULL;
> >>
> >>          pipe = entity->pads->pipe;
> >>
> >>          media_entity_for_each_pad(entity, pad) {
> >>                  if (WARN_ON(pad->pipe != pipe))
> >>                          return NULL;
> >>          }
> >>
> >>          return pipe;
> >> }
> >
> > The above code means that we do not support multiple pipelines per
> > entity. Or leave the implementation as is now and
> > this can be done as a different patch later, I will leave it to you.
> > He is what I'm thinking, assuming that every media_pad has it's own pipe.
> >
> > struct media_pipeline *media_entity_pipeline(struct media_entity
> > *entity, u32 pad_index)
> > {
> >           if (pad_index >= entity->num_pads)
> >                   return NULL;
> >
> >           return entity->pads[pad_index].pipe;
> > }
>
> Oh, I see now where the confusion is.
>
> media_entity_pipeline() is a convenience helper for the currently
> existing drivers. They access entity->pipe directly (or when we move the
> pipe to pad, entity->pads->pipe). So this function is just refactoring
> the direct access away from the drivers, which makes it easier in the
> future to find those drivers accessing the pipe, or change where the
> pipe is stored without doing any changes to the drivers.
>
> A driver which supports streams should not use this function, as there's
> no "pipe for entity". We seem to be missing a similar helper function
> for these cases, media_pad_pipeline() or such. We can add when needed.
>
>   Tomi

Sure, great!

- Satish
