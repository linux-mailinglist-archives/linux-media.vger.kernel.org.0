Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A41584DFB
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 11:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiG2JTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 05:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiG2JTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 05:19:49 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590C260693
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 02:19:48 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3238de26fb1so26562837b3.8
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Rp60i7+W7nD2Jx9anC11pSUXmYUqjtIaJ9F762jJtic=;
        b=MX/FCbeC1WHFyEJkhU44lsusr4XGDyc8bUYfFzHmsvyBLz4F1wG8u1fVzZwGrFuxlo
         MiLbwGn1qcjfPp0GuCpR+oaqOmqAXreasQvW+01lvva6iOYzdTvlRosmytUjrEuupPU3
         5S1msBMWGLxvRC1z35XEapMSvzI+s4/EUgeh+dmp7pY8m+yCFEb9ceD3ZzQ8Z3hYLB6K
         Kn96ErkhKu7rBCcVabQ9GIxwIrQArlb53hVCWWLvzXSRoMoLqawmLeAQYe8Ssgmm9GK+
         w64lVajoJNF6FmUEVOCE1UOGYY6PhnsNVWu6tmbj3e4aKv6OuW6DAsatNeXMRogICA7q
         1cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Rp60i7+W7nD2Jx9anC11pSUXmYUqjtIaJ9F762jJtic=;
        b=HtzCbscpFhewzDAABd8gUXRB/oNJtOv7RDod+0IqNU9Tzd1BB6sDLEzGZbWaJj55i4
         zijs+aGKIPm9KKUX9JyJf5nOY1+ByNPbWtu/hFHAvN/xDw9EmqH7RVz4hqod+mIkJeIh
         hGh8nmRAZ9Qh8QMCgZG9PEDGBtYqz0l6y1O2F/5atkjVMEe2bpiAqkzTeTVckQ6bZuqq
         W5scuEmh5UBGJ2YRI7UIi5lc72DuGBFZk2PcGT3XD8lgy6mQRNEKbinAtDHhEUUh9NyP
         NcZOITCi3gPRIJMBtc4xDsFHycGirRHmWpDsw77sL/McnlR/pJJwrh/d29QbV0en90Q7
         DS9g==
X-Gm-Message-State: ACgBeo0YEq+atW1Ypax/Rsk5Xu9OvSf30ewDCdcXFHuvd0CJvGRUfb1f
        nSrdU8E/+98oq0AMmnT6awQR+DILNYLdB0rbLlJrvw==
X-Google-Smtp-Source: AA6agR65vGlnwZOSSTwhsKMipQAGfDpwsPlDEiDK6rIlUjcWMDddVXXd3cS04bgeuwDkfTqlnTIYXKVcPRfC5Ba0LaM=
X-Received: by 2002:a81:6e54:0:b0:323:efab:8d8 with SMTP id
 j81-20020a816e54000000b00323efab08d8mr2120132ywc.363.1659086387610; Fri, 29
 Jul 2022 02:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com> <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
In-Reply-To: <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 02:19:36 -0700
Message-ID: <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
Subject: Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc: entity: Rewrite
 media_pipeline_start() to support routes
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

On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 29/07/2022 11:45, Satish Nagireddy wrote:
>
> >> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
> >>
> >>   struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> >>   {
> >> -       return entity->pipe;
> >> +       return entity->pads->pipe;
> >
> > I am not sure If it is always safe to return the pipe associated with
> > the first pad. I think this will work with all the existing drivers.
> > Let's say If pads of an entity are associated with different pipes,
> > this function might require extending the support of returning
> > pipe based on pad index. Please let me know your opinion.
>
> That's true. The kdoc for this function says:
>
>   * In general, entities can be part of multiple pipelines, when carrying
>   * multiple streams (either on different pads, or on the same pad using
>   * multiplexed streams). This function is ill-defined in that case. It
>   * currently returns the pipeline associated with the first pad of the
> entity.
>
> I did consider adding a warning if the function is called for entities
> with more than one pad. But that probably would give false warnings,
> e.g. for a simple entity with one sink and one source pad. In that case
> both pads are always part of the same pipeline, and
> media_entity_pipeline() works correctly.
>
> We could perhaps add a check here which verifies that all the pads in
> the entity have the same pipe.
>
> >>   }
> >>   EXPORT_SYMBOL_GPL(media_entity_pipeline);
> >
> > nit, It would be nice to rename this function to media_entity_get_pipe
> > or media_entity_get_pipeline for better readability.
>
> I'm ok with that, but we do have other functions with this style:
> media_entity_remote_pad(), media_entity_id(), ...
>
>   Tomi

I could only see one function with the similar style ==>
media_entity_get_fwnode_pad

-Satish
