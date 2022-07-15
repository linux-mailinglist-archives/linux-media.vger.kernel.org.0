Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA11575E27
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 11:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbiGOI5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 04:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiGOI5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 04:57:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F5A2AE5
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 01:57:30 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id r6so5453787edd.7
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WF2/Rr6KDXGTe8c1nCnqFbYnoiF8afARgQTg3crt7JU=;
        b=GsfCPaROVaRJ+seDbyy0SpUxQlEHMhLelELpPL0pL6NwaREarezj+bi8vvMIgW1iL2
         ZuPW+jZDJicj6I494Wa1WskWWA79CB33tg8ITfIyw7vyvomnKJTSzZa8zyo1yGk9y2WO
         QN/613HKc6QPv2OIVZ1XSakXtfLwu8wk2HHt0+v1fA4ILgIFMv1/OmbGLTWtsaOPDwbD
         w7LZtPDoTn0o860WjS77WScMMkxcZpFAYBysSRdR+UvdU58HzWodl2ya5xK7f+lS8orY
         2tGnFePy/Y01T1Ds7HnSJQsoK8ZJjLQDVwmFxg3mIaLwzNtgydvRQ+CVFy3b0X9boBMC
         48Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WF2/Rr6KDXGTe8c1nCnqFbYnoiF8afARgQTg3crt7JU=;
        b=2qKeBQgjLpa+KjtiQ/EBNskIffFE0DOgTUPppb8vVitt9U3Kg0CDYf6Yfs8XT8c0FM
         krd93xnk8ikWKOLyHZnW0l4C8Vl8DkBMJxc5lxQh8gRlXLaoZLYY5hJ01grqmP7OPjFX
         HIwDZiOWHZ+fcbTZpChjIPVxLs2ZuN8ZtmfNmPcKCPUUR5idHr/U4RBIbY6ygmcEWrNk
         b4haby5TMboG9x6piHn068PDwglznMNJBMz1rK4zvtz3TetYUZCE/qNyac06A6jwtSxu
         U3jB7i9XtVgHh3wH3qQyrG88inT1EZ78u3pwkrneEFs6ouoR0PmTZeRfz6Y3oVL2LpBK
         PfOA==
X-Gm-Message-State: AJIora+/R+9hsZdmttjimSh5SVxM0PIVxHmojZOJICl5qdLSdKXUfpMi
        JrP/2xyk8JimqmVdYx3KXlai4A==
X-Google-Smtp-Source: AGRyM1sCFgH5MOXPoSFdU3zLqxTSMMdrJ1RPoDq85DBYMCeLh9PLHaYn7hND5sH7P0L4aoJjsw0aWQ==
X-Received: by 2002:a05:6402:27cf:b0:43a:de0b:9a82 with SMTP id c15-20020a05640227cf00b0043ade0b9a82mr17374933ede.427.1657875448691;
        Fri, 15 Jul 2022 01:57:28 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([194.44.56.171])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7c507000000b0043ab81e4230sm2457797edq.50.2022.07.15.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 01:57:28 -0700 (PDT)
Date:   Fri, 15 Jul 2022 11:57:20 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
Message-ID: <20220715085720.GA2295@vkh-ThinkPad-T490>
References: <cover.1657786765.git.vkh@melexis.com>
 <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
 <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review.

On Thu, Jul 14, 2022 at 01:31:35PM +0300, Laurent Pinchart wrote:
> Hi Volodymyr,
> 
> Thank you for the patch.
> 
> On Thu, Jul 14, 2022 at 11:34:46AM +0300, Volodymyr Kharuk wrote:
> > Define user controls for mlx7502x driver and update MAINTAINERS
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  MAINTAINERS                   |  7 +++++++
> >  include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 include/uapi/linux/mlx7502x.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ef3ec334fae9..1a68d888ee14 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12673,6 +12673,13 @@ S:	Supported
> >  W:	http://www.melexis.com
> >  F:	drivers/iio/temperature/mlx90632.c
> >  
> > +MELEXIS MLX7502X DRIVER
> > +M:	Volodymyr Kharuk <vkh@melexis.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Supported
> > +W:	http://www.melexis.com
> > +F:	include/uapi/linux/mlx7502x.h
> > +
> >  MELFAS MIP4 TOUCHSCREEN DRIVER
> >  M:	Sangwon Jee <jeesw@melfas.com>
> >  S:	Supported
> > diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
> > new file mode 100644
> > index 000000000000..44386f3d6f5a
> > --- /dev/null
> > +++ b/include/uapi/linux/mlx7502x.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Melexis 7502x ToF cameras driver.
> > + *
> > + * Copyright (C) 2021 Melexis N.V.
> > + *
> > + */
> > +
> > +#ifndef __UAPI_MLX7502X_H_
> > +#define __UAPI_MLX7502X_H_
> > +
> > +#include <linux/v4l2-controls.h>
> > +
> 
> These controls should be documented, in
> Documentation/userspace-api/media/drivers/.
Ok, will do in v3
> 
> > +/* number of phases per frame: 1..8 */
> > +#define V4L2_CID_MLX7502X_PHASE_NUMBER  (V4L2_CID_USER_MLX7502X_BASE + 0)
> > +/* shift of each phase in frame, this is an array of 8 elements, each 16bits */
> > +#define V4L2_CID_MLX7502X_PHASE_SEQ	(V4L2_CID_USER_MLX7502X_BASE + 1)
> > +/* frequency modulation in MHz */
> > +#define V4L2_CID_MLX7502X_FMOD		(V4L2_CID_USER_MLX7502X_BASE + 2)
> > +/* time integration of each phase in us */
> > +#define V4L2_CID_MLX7502X_TINT		(V4L2_CID_USER_MLX7502X_BASE + 3)
> 
> Are these control very device-specific, or are they concept that apply
> in general to ToF sensors ? Same for V4L2_CID_MLX7502X_OUTPUT_MODE.
These controls(except V4L2_CID_MLX7502X_OUTPUT_MODE) are general for ToF
sensors. Do you think we should standardize them?

Note that the control V4L2_CID_MLX7502X_TINT is similar to
V4L2_CID_EXPOSURE, but the way it is done in ToF is different. They don't
have a shutter. So I gave a separate control name. Is it ok?
> 
> > +/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
> > +#define V4L2_CID_MLX7502X_TRIGGER_MODE	(V4L2_CID_USER_MLX7502X_BASE + 4)
> > +/* in case sw or hw trigger mode is used */
> > +#define V4L2_CID_MLX7502X_TRIGGER	(V4L2_CID_USER_MLX7502X_BASE + 5)
> 
> Trigger control is likely something we need to standardize at the V4L2
> level.
Ok, then I'll remove these controls for now and I will back with this as
a separate patch.
> 
> > +/* this is related to the taps in ToF cameras, usually A minus B is the best option */
> > +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 6)
> > +/* ToF camers has its own temperature sensor, which can be read out only during streaming */
> > +#define V4L2_CID_MLX7502X_TEMPERATURE	(V4L2_CID_USER_MLX7502X_BASE + 7)
> 
> This should probably use the proposed temperature control from
> https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
Ok, then I'll remove these controls for now.
> 
> > +
> > +#endif /* __UAPI_MLX7502X_H_ */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
--
Volodymyr Kharuk

