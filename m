Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC466532837
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 12:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbiEXKvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 06:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiEXKvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 06:51:23 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ACED116
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 03:51:21 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i27so34465352ejd.9
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5xEowohdKVVFAK5NeT4FgtjVgwzf/M8iyJ2EKDMz1AM=;
        b=ClGjWxDJSFdyphstwjAFvnk3e6c3deCBBtgDitB8L2XuF9LwSJW/xPhs/8w9VCTmS/
         3B2IQ3IgOa/kBNQKRKqZV+7gB+J1PnGbRKA9vtX6KZ5z7ctudEpEh3+6CVOrz/tSlAc8
         wfc4ffAi6kam4+zW5OMv6sC0liiLkh6OIhWPTtjr+/OeEAu+5CdPfAQSq5qblnZv2XL2
         RpDJJ1xyqZmW+ZNb9OoNW6LQvm8Z8WBZlI7LgOxb1KwdkMEL7jAHEFdoXy7ERMGCmUza
         tn7XXCLRiZmm3GpBdnDB2ngfzd70vFfRu3d/7uMasHlbt2IAK6InK2GFrhFx/iW0C0Xr
         ju4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5xEowohdKVVFAK5NeT4FgtjVgwzf/M8iyJ2EKDMz1AM=;
        b=dGLGViiOio8qgnr/hJwJveQ8xjk+qxQSLZ4r6nan+91Q0tx656VQjtvdj1Rqt6WmOw
         E+Y3fUKaknIoMSSfVdXEpRaKEtfX9UNt6byQHx8c8RR7O0E6nSqruZjBclV4fBCqyshj
         xuycg9B0Lvv/qPOlWAoTwvgIwSewFZDu7vVUdVx/2eENd5LVyfboigVR/QmYVnG3j6ev
         a6Cj06jxLidn8qLoKXtKxrgNwhmiziebnarMYpShJjTfAJn7sm7eRyV5fJ/HhMjc8+7x
         NjQxnldgm63i/35DjE8Uvxw3MFITtsPYY2Z4ysTWBozhT4oiOb3gGMaLxqGs2Jf9/MfM
         rOMw==
X-Gm-Message-State: AOAM5301JLFdfNsqfpWNl52Jxknpak5zV2/L2iXQ0xb8jlIb7EUafUr3
        BNQgYgpFbuxILo1bJTdaKvYx9tOwuh2VG/tJG36ivw==
X-Google-Smtp-Source: ABdhPJxa+aTRnFnkhvvv5tm4F2MLRgCV57fS823CwN72YSLz8fmw98oidluXo0BoF/fFq/RXj4VDTBfv9humwF2uOA8=
X-Received: by 2002:a17:907:9621:b0:6fe:c661:b300 with SMTP id
 gb33-20020a170907962100b006fec661b300mr12069894ejc.294.1653389479842; Tue, 24
 May 2022 03:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl> <20220520082248.o6gzekapndo4lhgb@uno.localdomain>
In-Reply-To: <20220520082248.o6gzekapndo4lhgb@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 24 May 2022 11:51:04 +0100
Message-ID: <CAPY8ntCwoLys1uwpoy3AW=wbBZod5cxj==z0XjUrBxK=0cwr8g@mail.gmail.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Jacopo

On Fri, 20 May 2022 at 09:22, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello Hans,
>
> On Fri, May 06, 2022 at 03:20:09PM +0200, Hans Verkuil wrote:
> > Hi all,
> >
> > Since countries are opening up again and travel is (at least for now!) a lot easier,
> > I am considering a media summit during the ELCE in Dublin (Sep 13-16).
> >
> > See here for more details about the conference:
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/
> >
> > Of course, this only makes sense if there is something to talk about. So please reply
> > with any suggestions for topics!
> >
> > Also please let me know if you would expect to be at such a media summit in person.
> > If only a few people would be there, then there isn't much point to this.
> >
> >
> > I have two topics:
> >
> > 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
> >    for improvements?
> >
> > 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
> >    HDMI) and the edid-decode utility.
> >
> > I'd like to make a decision on whether or not it is worthwhile to do this in a week
> > or two. If we wait too long it might be difficult to get a room for the summit.
>
> There are a few topics around image sensor support, especially
> relevant for RAW sensor drivers
>
> - Recently Dave posted an question about how to represent additional
>   processing stages that happens on the sensor side, mostly
>   additional subsampling/cropping that happen between the analogue cropping
>   on the full pixel array and the final image sent on the wire.
>
>   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/
>
>   Dave made a good introduction of the issue his email which got
>   largely unanswered.
>
>   The issue is particularly relevant for RAW sensors, where applying
>   subsampling has an impact on the sensor's sensitivity and requires
>   to adjust the gains and exposure accordingly.
>
>   The V4L2 selection API falls short on this and the only other
>   solution I am aware of is registering additional subdevices as the
>   CCS driver does.

If you want to throw in some more image sensor related issues, I can
think of a couple more areas that could do with some consensus on how
to implement:

On-sensor temperature reporting. Thread started by Benjamin at
https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
, but no resolution over using hwmon API or V4L2 control. If hwmon
then we need Media Controller framework to tie the sensor and thermal
device together.
It's recently been queried for IMX477 with the Pi
(https://github.com/raspberrypi/libcamera/issues/19), but it will
apply to many sensors.

Synchronising sensors for stereoscopic operation (trying to avoid the
master / slave terminonlogy). How should that be configured? Allowing
configuration from userspace would allow sensors to be operated
independently which can be useful for test purposes, or should it be
enforced from DT / ACPI? Do we set a default configuration for each
sensor from DT/ACPI and then allow userspace to override should it
wish?

Controlling sensor GPIO outputs for things such as flash triggers,
vsync, frame start/end, exposure start/end, etc.
There is a huge range of features available so do we have any hope of
standardising some of it, or do we end up hiding these away in the
drivers with custom DT bindings to configure them? If we accept that
there will be variation, can we vaguely standardise what those
bindings look like? Or should these be V4L2 controls as things like
pulse widths may want to be adjusted by userspace?

Lens drivers. Each driver will have a "useful" range which is
effectively dictated by the overall module. Should that be defined via
DT as it is a feature of the platform, or leave the driver totally
generic and expect userspace to do something sensible?
In the case of simple systems without libcamera (this is Video 4 Linux
2, not Video 4 Libcamera 2), do we set default for
V4L2_CID_FOCUS_ABSOLUTE to a sensible hyperfocal distance, and can
that again be defined in DT as it is defining the hardware?

Thanks.
  Dave

> - Probably less relevant for a media summit, but we recently got a few
>   series trying to reconcile handling of regulators, gpios and clocks
>   on OF and ACPI platforms all of them doing the usual "similar but
>   slightly different" thing:
>
>   https://lore.kernel.org/linux-media/20220425061022.1569480-1-paul.elder@ideasonboard.com/
>   https://lore.kernel.org/linux-media/20220329090133.338073-1-jacopo@jmondi.org/
>   https://lore.kernel.org/linux-media/20220509143226.531117-1-foss+kernel@0leil.net/
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2c7a1e0d69221b9d489bfd8cf53262d6f82446
>
>   ACPI and OF handles clocks slightly differently, and it is not clear
>   to me if ACPI based platform need explicit handling of
>   clocks/regulator or ACPI does "the right thing" by itself (I'm
>   afraid the answer is actually "it depends"). I'm ACPI illiterate
>   so I cannot propose anything meaningful but if anyone is interested
>   in discussing this further this might be a good time to do so ?
>
> Let me know if those points might be of any interest and I can try to
> prepare something about them.
>
> Thanks
>    j
>
> >
> > Regards,
> >
> >       Hans
