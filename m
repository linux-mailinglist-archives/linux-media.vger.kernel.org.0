Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279CD57B8B2
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 16:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiGTOoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 10:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiGTOoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 10:44:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7554E606
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 07:44:12 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y11so30629889lfs.6
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qYop0Q3YsZPRiQBkv4mH/kYdEP3zP/NhYxYEW6Hu8u0=;
        b=LhL+06RLWqB+zcRKVLljz5Cxxy9rs027CUfHw0JoxBK9GBVCysu6sVzMOgZ+tdS1i3
         IL+kp8bOSX10hN9ZWnA76H5+U12zpJ2aXbefBxVGTcmDoBYOk9FLWgw68ji18H48uQ1k
         koSQLddg4+v4mdQGaZooJYT+DkzIgxWO5C5WNR/zRwEGYIgumbLjsNaM+ggmarRljmti
         ith3soJTg15K0pPCXjcyTiPCB6Ij3hqCQN5A8dEL/12G32H02ImIDUYpFFlpSEuuWosV
         fyvhmojdYFKvh9INnftjp+QbG6FicBBJzYlMNGP2v5SyQtZ4kzbzMyjrATkGf/dRpCZV
         Nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qYop0Q3YsZPRiQBkv4mH/kYdEP3zP/NhYxYEW6Hu8u0=;
        b=a7Krt7XW8nqAQxytSHYDrJ2A6SXNDTSJ12mcpT5Bdc0SNxl9lT5k0GNzPtJ8l+W1xe
         /hvHzrqkjH4P1ZfEVXlTmI5tuM48yni/Ro0d7cxCrs8U3jxkIBE/ZeYFkTiOnDJ+5I9s
         gJrZO1Ird1WoYqAxGXOFwogJ9xFJhW3mcMM6qRkBmFSauUSNpNs24AMJJClFBs6q//dy
         LWRDQj8i6ivVRp5jpN3eBAPEg0z3SWM5PaTS+uw/NVugc0UYSc7whlO+9u2/956KPQxU
         qA9FekkLfN6u75Zje1hNlUHuHZF3p5ltFj0eKZjqXv1/A/0AnlktqYFhoKnpvYZ9K8Ly
         DWUw==
X-Gm-Message-State: AJIora/CYiZIzZNTnmfIhT0C/CgLHx066IFWbSQLDWnS+GQUIxB0LARu
        5dGIczEECBvZEUvo5+hmsEuEKST/Ah6FjQ==
X-Google-Smtp-Source: AGRyM1vOALFdKXhLuw23vq4VaTxl8MbuuhTUcFMG18pPRoyfz/Yw4jAuTHlpp5pZScWpyNxL8kZ2Kg==
X-Received: by 2002:a05:6512:39cc:b0:48a:2c31:8feb with SMTP id k12-20020a05651239cc00b0048a2c318febmr11642658lfu.660.1658328251083;
        Wed, 20 Jul 2022 07:44:11 -0700 (PDT)
Received: from melexis.com ([194.44.50.51])
        by smtp.gmail.com with ESMTPSA id r28-20020ac25c1c000000b0048910301774sm3824817lfp.307.2022.07.20.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:44:10 -0700 (PDT)
Date:   Wed, 20 Jul 2022 17:44:05 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
Message-ID: <20220720144405.GA45183@melexis.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
 <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com>
 <20220715085720.GA2295@vkh-ThinkPad-T490>
 <YtE1EgvDpfLdbWnD@pendragon.ideasonboard.com>
 <20220715150329.GA14041@vkh-ThinkPad-T490>
 <d8868819-9807-f880-db9b-f2631c3ff5d3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8868819-9807-f880-db9b-f2631c3ff5d3@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Tue, Jul 19, 2022 at 05:20:40PM +0200, Benjamin Mugnier wrote:
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
> >>>>> @@ -12673,6 +12673,13 @@ S:	Supported
> >>>>>  W:	http://www.melexis.com
> >>>>>  F:	drivers/iio/temperature/mlx90632.c
> >>>>>  
> >>>>> +MELEXIS MLX7502X DRIVER
> >>>>> +M:	Volodymyr Kharuk <vkh@melexis.com>
> >>>>> +L:	linux-media@vger.kernel.org
> >>>>> +S:	Supported
> >>>>> +W:	http://www.melexis.com
> >>>>> +F:	include/uapi/linux/mlx7502x.h
> >>>>> +
> >>>>>  MELFAS MIP4 TOUCHSCREEN DRIVER
> >>>>>  M:	Sangwon Jee <jeesw@melfas.com>
> >>>>>  S:	Supported
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
> >>>>> +#define V4L2_CID_MLX7502X_PHASE_SEQ	(V4L2_CID_USER_MLX7502X_BASE + 1)
> >>>>> +/* frequency modulation in MHz */
> >>>>> +#define V4L2_CID_MLX7502X_FMOD		(V4L2_CID_USER_MLX7502X_BASE + 2)
> >>>>> +/* time integration of each phase in us */
> >>>>> +#define V4L2_CID_MLX7502X_TINT		(V4L2_CID_USER_MLX7502X_BASE + 3)
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
Just to be clear: one camera trigger generates one frame.
The number of subframes can be configured via register.
One phase generates one image. Do we have the same understanding?
> 
> This allows greater ranges.
> I suggest changing V4L2_CID_MLX7502X_FMOD to an array, if it suits you.
> I'm curious how are you doing this? Are you using only one fmod or do you compute some others from the first one? Either in the driver or the sensor.
The mlx7502x supports only one fmod per frame. Instead it is possible to use
a few phase shifts(V4L2_CID_MLX7502X_PHASE_SEQ) per one frame. Using
cross-correlation it is possible to calculate the distance from received images.
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
It is possible to have integration time per phase. For now I just copy tint into all phase registers.
> 
> >>>>> +/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
> >>>>> +#define V4L2_CID_MLX7502X_TRIGGER_MODE	(V4L2_CID_USER_MLX7502X_BASE + 4)
> >>>>> +/* in case sw or hw trigger mode is used */
> >>>>> +#define V4L2_CID_MLX7502X_TRIGGER	(V4L2_CID_USER_MLX7502X_BASE + 5)
> >>>>
> >>>> Trigger control is likely something we need to standardize at the V4L2
> >>>> level.
> >>>
> >>> Ok, then I'll remove these controls for now and I will back with this as
> >>> a separate patch.
> >>>
> >>>>> +/* this is related to the taps in ToF cameras, usually A minus B is the best option */
> >>>>> +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 6)
> >>>>> +/* ToF camers has its own temperature sensor, which can be read out only during streaming */
> >>>>> +#define V4L2_CID_MLX7502X_TEMPERATURE	(V4L2_CID_USER_MLX7502X_BASE + 7)
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
> 
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

-- 
--
BR,
Volodymyr Kharuk
