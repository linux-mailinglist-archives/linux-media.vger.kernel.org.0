Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7993576518
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 18:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiGOQIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 12:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiGOQIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 12:08:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2C2E5F
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 09:08:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id va17so9851684ejb.0
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3PasddK+T0RiCpuRInGB1l5QQhMUG2cZyjr4QRaggM=;
        b=M65bKGLly7NTPUOE85BSTIfA8SckarV8GeEO+YECP4kA3KEa9QN3btAJvKN+BIHNI6
         xnz/HiOtlDKledw/T7Cd34/yWnysULKQK+eIg4q0vKNSBtMG6zMSmYMYwYobay9mg6Am
         /3c6pH/kPaQZRVh5ovmVNMj4DbzeDXECKBYPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3PasddK+T0RiCpuRInGB1l5QQhMUG2cZyjr4QRaggM=;
        b=41g6Gvgkj2P1JlPre25hIQStI6X0tY6818eQven8Lp/Yxt93JnDwk3bU6oq2UldXbZ
         Z699ySiZfLUBQBysh470MwWyeaM5TtAVJ4RJueyQffLA6I6cJFl/G2KHtsDxVMTSy40z
         XFcRDTHORxJEUItJq1bJ9eqYFpeIXqlRF33MtQv60glAk269B+AXegUiFyqKLdw0eVpk
         oZhfCehTpbJNUf71ft6gq+rj0kL76KyD81mtLH6tvolkROAdg7JODUvEO4g4CIQw5VKJ
         FDTDAP+XNfe2C27bqfEsWkHtLTuWiCDEfAfUR/mx/X3P5y5yUtyQUPjQLelcaGVOnFO4
         xtDQ==
X-Gm-Message-State: AJIora/J3g3/26obzR5096X86dFANN9/pZlXFLajkcER2eU4g6gMhkls
        KY4wHh6j25QLcoQt/cNek1ZWc/nymAey5g==
X-Google-Smtp-Source: AGRyM1uMcWL5v1uaB2kW4WNRL0Gq8eifSqhAILxqdSFTtJIq8RN0MtmmMwGVUniTmJeswDdWWSnMVw==
X-Received: by 2002:a17:907:724f:b0:72b:8650:b188 with SMTP id ds15-20020a170907724f00b0072b8650b188mr14804374ejc.727.1657901320150;
        Fri, 15 Jul 2022 09:08:40 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id h3-20020a056402094300b0043aba618bf6sm3108281edz.80.2022.07.15.09.08.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 09:08:37 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id sz17so9755244ejc.9
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 09:08:36 -0700 (PDT)
X-Received: by 2002:a17:906:730c:b0:72b:4f83:51c1 with SMTP id
 di12-20020a170906730c00b0072b4f8351c1mr14265995ejc.515.1657901316267; Fri, 15
 Jul 2022 09:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 15 Jul 2022 18:08:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCtf0dSfoAM-UiR7p_gAw_Gcc4U+f08g+K=muRkQKypO8w@mail.gmail.com>
Message-ID: <CANiDSCtf0dSfoAM-UiR7p_gAw_Gcc4U+f08g+K=muRkQKypO8w@mail.gmail.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans


On Fri, 15 Jul 2022 at 10:15, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> The Linux Foundation organized a meeting room for us to use on Monday September 12
> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>
> To attend this Media Summit no registration is required for the OSSE, but you do need
> to register with me by sending me an email. There is a maximum of 20 participants.


Please count me in as well.

Thanks for organizing this
>
> I send out a request for topics in May and got quite a few replies:
>
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
>
> If you have more ideas for topics, then reply either to that message (preferred) or this
> one.
>
> See here for more details about the conference:
>
> https://events.linuxfoundation.org/open-source-summit-europe/
>
> It is primarily meant for media developers to meet face-to-face. Whether there will
> be a possibility to participate remotely is not certain at this time. Past experience
> shows that meetings like this are a poor fit for remote attendance, unless you have
> a meeting room that is designed for such purposes, which we don't have.
>
> The actual agenda will depend on who will attend, I hope to be able to put that
> together around mid August. But the link above with the 'Request for Topics' thread
> will give a good indication of what to expect.
>
> So, if you want to attend, then let me know by email. Please reply as soon as possible,
> even if you are not entirely certain yet if you can attend.
>
> The health and safety regulations will be those of the OSSE LF:
>
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
>
> Code of conduct:
>
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
>
> A final note: the total cost is at most $650 (depends on the number of people):
> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
>
> It would be nice if this can be sponsored by one or more companies. I'll ask
> my manager if Cisco can contribute to this (once he's back from vacation), but
> if other companies want to contribute as well, then let me know and we can
> split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".
>
> Regards,
>
>         Hans



-- 
Ricardo Ribalda
