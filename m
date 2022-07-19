Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A03A57A32D
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 17:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbiGSPcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 11:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238268AbiGSPcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 11:32:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A8559274
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 08:31:59 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id mf4so27899108ejc.3
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AdIkusCyuNbXm/Fmh7abSubF5hyetm/aGwgVJGoJ2XY=;
        b=So2RBPXDUHst0m/daAqIPks9mVNXq8Lym00T6gY/IXMRliW0IWBm4RL+sIrh24wPp/
         CUG3v+m7VdvUtUbewLRL/M4g1KMfIoqP1LzusKqfSgt87YGEOS6se7WUjRglBGlLIRDW
         /+MRjqI1JPm+M5r5DU0E6qgpZBrhHj2Db1g4adx7+3n8SnRz4iaUt7eTQeo3EA79tZ2g
         4UJ4LkCIx7fy6HxDV3J6cxFLOsjuRtEtl/2niYDU3PQdmUspDn3QsUp5JNw3vCOGXp57
         wbvdIPWUMfGtyyMHVVWa+yU4AqctuNf44rxS6WUC4Gbhtu9N9C8qNWuMtZZS4XVhvF72
         Jgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AdIkusCyuNbXm/Fmh7abSubF5hyetm/aGwgVJGoJ2XY=;
        b=vEyqO4QyDAaYRkxQUkocY2H3t8vkfVK6R/gPHgd+cZJ/TpXWOl1W9XxWOdRfCZCD1v
         nuQB5R/bi0upl+zf5rSDZbSP/Mq9BEsgRhkJYrUZdZAgNvf8Fov4vtatovFVXDzWwK88
         QGny2SbEMkTiAQuJNr1nASNm3nHyKZkiwXZ8bW0nmijBsARjFoJqBMvNlpCVvg4Fshxa
         8/VKFO4+BXuDaid4HfvftQBNS9iGpWvEHvj+H8wJlLUKz9hP33LXNR9fWbQ3BBFZ/fNd
         V0GZuj+0eQHF18mlXrS4gXqo2vchXOwkiudb0gf0Gi39RVgwEWbE7HnttFqjciAnIpj9
         ACpg==
X-Gm-Message-State: AJIora9qZ+mI+DENO8drx4V4B+mEDJYos9lUMC89ssz0yAPlp6Mk+uNH
        vU/7W1olgF2Ni0AdiTNkFG1lhmhMc0U5vhb5v2lzwg==
X-Google-Smtp-Source: AGRyM1tC6+LX3UQfEJLSUQwuLIdjlIe2qzkrdDVUxVTwshf6mMq1j2uz8THr40q+4BEypWTrIZgGxAb6CI7vRcjKZho=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31812637ejc.294.1658244718318; Tue, 19
 Jul 2022 08:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657786765.git.vkh@melexis.com> <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
 <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com> <20220715085720.GA2295@vkh-ThinkPad-T490>
 <YtE1EgvDpfLdbWnD@pendragon.ideasonboard.com> <20220715150329.GA14041@vkh-ThinkPad-T490>
 <d8868819-9807-f880-db9b-f2631c3ff5d3@foss.st.com>
In-Reply-To: <d8868819-9807-f880-db9b-f2631c3ff5d3@foss.st.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 16:31:41 +0100
Message-ID: <CAPY8ntAVVeRZVjgHqDLviz9RqjSUypq+P3ck=f_CU1E6VHhSdw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Volodymyr Kharuk <vkh@melexis.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 19 Jul 2022 at 16:21, Benjamin Mugnier
<benjamin.mugnier@foss.st.com> wrote:
>
> Hi Volodymyr,
>
>
> On 15/07/2022 17:03, Volodymyr Kharuk wrote:
> > On Fri, Jul 15, 2022 at 12:36:18PM +0300, Laurent Pinchart wrote:
> >> Hello,
> >>
> >> CC'ing Benjamin Mugnier who I recall expressed an interest in ToF
> >> sensors (if I recall incorrectly, my apologies).
>
> I am indeed very interested. Thank you :)
>
> >>
> >> On Fri, Jul 15, 2022 at 11:57:20AM +0300, Volodymyr Kharuk wrote:
> >>> On Thu, Jul 14, 2022 at 01:31:35PM +0300, Laurent Pinchart wrote:
> >>>> On Thu, Jul 14, 2022 at 11:34:46AM +0300, Volodymyr Kharuk wrote:
> >>>>> Define user controls for mlx7502x driver and update MAINTAINERS
> >>>>>
> >>>>> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> >>>>> ---
> >>>>>  MAINTAINERS                   |  7 +++++++
> >>>>>  include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
> >>>>>  2 files changed, 38 insertions(+)
> >>>>>  create mode 100644 include/uapi/linux/mlx7502x.h
> >>>>>
> >>>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>>> index ef3ec334fae9..1a68d888ee14 100644
> >>>>> --- a/MAINTAINERS
> >>>>> +++ b/MAINTAINERS
> >>>>> @@ -12673,6 +12673,13 @@ S:       Supported
> >>>>>  W:       http://www.melexis.com
> >>>>>  F:       drivers/iio/temperature/mlx90632.c
> >>>>>
> >>>>> +MELEXIS MLX7502X DRIVER
> >>>>> +M:       Volodymyr Kharuk <vkh@melexis.com>
> >>>>> +L:       linux-media@vger.kernel.org
> >>>>> +S:       Supported
> >>>>> +W:       http://www.melexis.com
> >>>>> +F:       include/uapi/linux/mlx7502x.h
> >>>>> +
> >>>>>  MELFAS MIP4 TOUCHSCREEN DRIVER
> >>>>>  M:       Sangwon Jee <jeesw@melfas.com>
> >>>>>  S:       Supported
> >>>>> diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
> >>>>> new file mode 100644
> >>>>> index 000000000000..44386f3d6f5a
> >>>>> --- /dev/null
> >>>>> +++ b/include/uapi/linux/mlx7502x.h
> >>>>> @@ -0,0 +1,31 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >>>>> +/*
> >>>>> + * Melexis 7502x ToF cameras driver.
> >>>>> + *
> >>>>> + * Copyright (C) 2021 Melexis N.V.
> >>>>> + *
> >>>>> + */
> >>>>> +
> >>>>> +#ifndef __UAPI_MLX7502X_H_
> >>>>> +#define __UAPI_MLX7502X_H_
> >>>>> +
> >>>>> +#include <linux/v4l2-controls.h>
> >>>>> +
> >>>>
> >>>> These controls should be documented, in
> >>>> Documentation/userspace-api/media/drivers/.
> >>>
> >>> Ok, will do in v3
> >>>
> >>>>> +/* number of phases per frame: 1..8 */
> >>>>> +#define V4L2_CID_MLX7502X_PHASE_NUMBER  (V4L2_CID_USER_MLX7502X_BASE + 0)
> >>>>> +/* shift of each phase in frame, this is an array of 8 elements, each 16bits */
> >>>>> +#define V4L2_CID_MLX7502X_PHASE_SEQ      (V4L2_CID_USER_MLX7502X_BASE + 1)
> >>>>> +/* frequency modulation in MHz */
> >>>>> +#define V4L2_CID_MLX7502X_FMOD           (V4L2_CID_USER_MLX7502X_BASE + 2)
> >>>>> +/* time integration of each phase in us */
> >>>>> +#define V4L2_CID_MLX7502X_TINT           (V4L2_CID_USER_MLX7502X_BASE + 3)
> >>>>
> >>>> Are these control very device-specific, or are they concept that apply
> >>>> in general to ToF sensors ? Same for V4L2_CID_MLX7502X_OUTPUT_MODE.
> >>>
> >>> These controls(except V4L2_CID_MLX7502X_OUTPUT_MODE) are general for ToF
> >>> sensors. Do you think we should standardize them?
> >>
> >> I would really really like to see control standardization for ToF
> >> sensors, yes :-)
> > Sounds great :)
>
> Thanks a lot for your efforts in standardizing these controls. This is pretty close to what I expected :)
>
> Sensors may require multiple fmod from the user, and may not be able to deduce them from a single one.
> Subframes may be acquired for each fmod (composed themselves of acquisitions for each phase), and then generate a frame from these.
> Here is a quick drawing example with 2 fmod and 2 phases. Hope this makes sense.
>
> |-------------------------------------------------------------------------> time
> |FMOD1 PHASE1|FMOD1 PHASE2|FMOD2 PHASE1|FMOD2 PHASE2|FMOD1 PHASE1|...
> |         SUBFRAME1       |         SUBFRAME2       |
> |                       FRAME1                      |
>
> This allows greater ranges.
> I suggest changing V4L2_CID_MLX7502X_FMOD to an array, if it suits you.
> I'm curious how are you doing this? Are you using only one fmod or do you compute some others from the first one? Either in the driver or the sensor.
>
> >>
> >> Do you know of any public litterature that explains the operating
> >> principles of ToF sensors ? I don't expect most of the V4L2 developers
> >> to be familiar with the concept, so something that could bring us up to
> >> speed on ToF would be useful for the discussion.
> >
> > Here what I have:
> > 1. ToF Basics from Melexis
> > https://media.melexis.com/-/media/files/documents/application-notes/time-of-flight-basics-application-note-melexis.pdf
> > 2. ToF Basics from TI
> > https://www.ti.com/lit/wp/sloa190b/sloa190b.pdf?ts=1657842732275&ref_url=https%253A%252F%252Fwww.google.com%252F
> > 2. ToF systems from TI
> > https://www.ti.com/lit/ug/sbau219d/sbau219d.pdf
> > 4. This more related to ToF algorithms
> > https://hal.inria.fr/hal-00725654/document
> >
> > I hope it helps.
> >>
> >>> Note that the control V4L2_CID_MLX7502X_TINT is similar to
> >>> V4L2_CID_EXPOSURE, but the way it is done in ToF is different. They don't
> >>> have a shutter. So I gave a separate control name. Is it ok?
> >>
> >> Yes, I think that's fine.
> >>
>
> Having only one integration time control is problematic for HDR sensors as they require both a short and long integration time setting.
> I have the same issue for the vgxy61 camera with V4L2_CID_EXPOSURE and ended up defining 2 custom controls for both short and long exposure, but I understand this is not ideal. Maybe Laurent have an idea on this?
>
> >>>>> +/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
> >>>>> +#define V4L2_CID_MLX7502X_TRIGGER_MODE   (V4L2_CID_USER_MLX7502X_BASE + 4)
> >>>>> +/* in case sw or hw trigger mode is used */
> >>>>> +#define V4L2_CID_MLX7502X_TRIGGER        (V4L2_CID_USER_MLX7502X_BASE + 5)
> >>>>
> >>>> Trigger control is likely something we need to standardize at the V4L2
> >>>> level.
> >>>
> >>> Ok, then I'll remove these controls for now and I will back with this as
> >>> a separate patch.
> >>>
> >>>>> +/* this is related to the taps in ToF cameras, usually A minus B is the best option */
> >>>>> +#define V4L2_CID_MLX7502X_OUTPUT_MODE    (V4L2_CID_USER_MLX7502X_BASE + 6)
> >>>>> +/* ToF camers has its own temperature sensor, which can be read out only during streaming */
> >>>>> +#define V4L2_CID_MLX7502X_TEMPERATURE    (V4L2_CID_USER_MLX7502X_BASE + 7)
> >>>>
> >>>> This should probably use the proposed temperature control from
> >>>> https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
> >>>
> >>> Ok, then I'll remove these controls for now.
> >>>
>
> We discussed the standardization of the temperature control with linux-hwmon subsystem team [1].
> As this happened to be a trickier problem than I thought, I decided to remove the temperature control I initially proposed. You can find the v3 of the vgxy61 without the temperature control [2].
>
> So no temperature control for now. I plan on giving it another go after the vgxy61 is accepted, but for now the simpler the better.
> Of course feel free to do it, I'll gratefully rebase on your work ;)

I've thrown it into the ring as one of a number of image sensor
related subjects to discuss at the Media Summit alongside ELCE in
September[1]. Whether it makes the agenda or we get a decision there
or not are different questions.

An option that may be available is reading it from embedded metadata
(if we had a standardised way of exporting that, which is dependent on
the multiplexed streams patchset).
Certainly several of the Sony image sensors that we're using drop the
temperature registers in the embedded data, so we can lift it out in
libcamera without needing kernel support beyond enabling it.

  Dave

[1] https://lore.kernel.org/linux-media/CAPY8ntCwoLys1uwpoy3AW=wbBZod5cxj==z0XjUrBxK=0cwr8g@mail.gmail.com/

> [1] https://lore.kernel.org/linux-media/d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca/
> [2] https://lore.kernel.org/all/20220512074037.3829926-1-benjamin.mugnier@foss.st.com/
>
> >>>>> +
> >>>>> +#endif /* __UAPI_MLX7502X_H_ */
> >>
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
> >
