Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB1C62104A
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 13:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbiKHMUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 07:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbiKHMUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 07:20:30 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B25A17A85
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 04:20:27 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id bj12so38006501ejb.13
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KndevzpL5iTtreG9PsqqDvMJxU2HgkOfgFxD9fvxXg0=;
        b=ph9zmgpcsst6OY9WvWL4I8/fEYVu1vwau2jq0cmbSjj3now509hFuKHhDUgl/7g77D
         xc7uOW9+8Lx47GgdpY8XEJYwQYSn3pBMSm5bUNVjXSuBYqYIfI2yeG9CH0FmckkZbaHC
         9UXoHxGr6Yx1zpVYGgeMyopoT7GQVZKP4LcUoBj0mgDWu9+Pox0YHPsq/bakoht12IEx
         tJYGa+JZ3fC//OULkCdlDt6NxUFSSa8iNiWy+9+r+LiJ8yjk9HavfVMeXs8AsEH+SRmj
         SGdQBvFE+znuqgCw16HfW0VNgaw45I9K4r8FdrhH/4quY7KAemdTl7ttLh+VkvfrRFgs
         FUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KndevzpL5iTtreG9PsqqDvMJxU2HgkOfgFxD9fvxXg0=;
        b=4he2EAEIXATf1Ap8h45tgC3H/zeXP88LtDpDx7+UCiWacLbGVd5ozJRLA+XNf1VI2B
         1GwuFX1cnjAfBFfe1EUXSEs2AnMl8PKl/5L1Y6YMgkYCshwnufd5/dGSXfoZ+WJWGUFC
         y9FXjg9plBCxzVvcZcjiBdUL+m/ZiPWXbhGYeukWvBLtAY604YnI1wBWwucDjQiF7NNO
         ohaEKxiPSJpQ+Jecx7RxT/TJLt1WNcVNftFhNreYIAM3iX/ZyXq3Hta3pGo6lSlp73/L
         x/7K4X2O7K/nwSOMZgdIQ9qPg3Uv5cbcsA7dNXc/0fiFSCzFMbHqhHn2TOIqV4+gGf96
         aLCw==
X-Gm-Message-State: ACrzQf0HiGIb/gjXdJL36g+wc7Fhf5Aid1J7wly6dGQC57PpEsdaKlTQ
        KVZIlO0afQGSF5EwxkI8YHxiSmRJh4HDirsTNlUvxw==
X-Google-Smtp-Source: AMsMyM4CGbfV7kczWiUta3Ci/J8FOJH08Fwd2/Q1jYme/bDhbdGh8WG3agWi1/gCMy4nSZ3GcJJSgf+i80vMjpc1yBM=
X-Received: by 2002:a17:907:7b8b:b0:7ad:e144:19e1 with SMTP id
 ne11-20020a1709077b8b00b007ade14419e1mr42092920ejc.154.1667910025861; Tue, 08
 Nov 2022 04:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org>
In-Reply-To: <20221107204959.37691-1-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 8 Nov 2022 12:20:09 +0000
Message-ID: <CAPY8ntAgAtUCkWKzQgz0Uwf1xC8tUTskbn152eCoYyCW3mT_dQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Documentation: media: camera_sensor: Document
 blankings handling
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Sorry, I should have read this fully first :)

Thanks for your efforts in writing the docs, and I appreciate it's
worse when English isn't your native language.

On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello,
>    this series updates the camera-sensor documentation to indicate that
> vertical and horizontal blankings should be updated when a new image format
> is applied on the sensor.
>
> 1/3 is more for discussion than inclusion, as I noticed the documentation and
> the CCS driver use the analogue crop rectangle sizes to compute blanking limits
> while most driver use the visible size.
>
> Which ones are correct ?
>
> As I interpret "Figure 47 Line and Frame Blanking Definitions" in CSI-2 spec (I
> have version 1.01.00 r0.04 2-Apr-2009) it seems clear to me that blankings
> surround the visible size ("valid data").

I'll agree when considering the CSI-2 link.
However this is the same discussion as PIXEL_RATE vs LINK_FREQUENCY -
the blanking interval on the sensor array can differ from that on the
CSI-2 link. Largely we don't care about the CSI-2 link timings, and
frame rate is configured from PIXEL_RATE and not LINK_FREQUENCY.

> However it is also correct to consider
> blanking limits are a property of the pixel array usually represented by a
> minx/max limits of some "total output size" register.
>
> I wonder if it makes any real difference in practice...

It's only going to make any difference on binned or scaled modes,
which are not overly common in mainline drivers.

However we do have an issue of drivers accepted into mainline that
define blanking intervals based on the binned/scaled resolution and
not the analogue crop only, so how do you fix them without regressions
in the form of altered behaviour?

> 3/3 also documents that exposure limits should be updated when a new vertical
> blankings are applied.
>
> I haven't documented if the actual control value should be reset to some
> know value as the init-time default or to its minimum value, as described in
> https://lore.kernel.org/linux-media/20221019065801.4n7alfivhffbvgzo@uno.localdomain/T/
>
> A question for Dave: should the registration of events handler callbacks be
> documented too as clarified in:
> https://www.spinics.net/lists/linux-media/msg220715.html

Absolutely. Unless it gets fixed in the core then the drivers need to do it.

I have created the patches at [1] to address that issue (and the lack
of V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips), but need to curate the list
of maintainers to send it to. Compile tested only as I don't have the
hardware to test all of them.
I've also pushed the start of the doc changes I was considering for
all the bits needed when implementing sensor drivers - top commit on
the same branch.

  Dave

[1] https://github.com/6by9/linux/tree/linux-media


> Thanks!
>   j
>
> Jacopo Mondi (3):
>   Documentation: media: camera-sensor: Correct frame interval
>   documentation: media: camera_sensor: Document blankings handling
>   documentation: media: camera_sensor: Update exposure on blanking
>     change
>
>  .../driver-api/media/camera-sensor.rst        | 69 +++++++++++++++++--
>  1 file changed, 65 insertions(+), 4 deletions(-)
>
> --
> 2.38.1
>
