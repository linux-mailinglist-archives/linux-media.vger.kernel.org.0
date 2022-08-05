Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E2858AB8E
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 15:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbiHENZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 09:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiHENZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 09:25:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B562409B
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 06:25:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 639B1480;
        Fri,  5 Aug 2022 15:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659705953;
        bh=53Pf+L70JYPWF79CF83JhOB6qPnuv+ARUAkqW8DdiVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AjHqImS3Sy4O2KhYpnC+oH8/t6lmQOZHFyjZQoXxdbMe7OIO10qUcizVcH7UKJcFk
         eZW8YU04pvx/SLGxTumBbf5SLxNCZrh+gWFgJkcYpiMeznU5pmVSMf5bNGbiRvp5fK
         4uTEL+t5cK8kZvLrhLLJp2snV4C/i+FASzXcO6+M=
Date:   Fri, 5 Aug 2022 16:25:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V1
Message-ID: <Yu0aWXxuoyJJolyU@pendragon.ideasonboard.com>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Aug 05, 2022 at 01:35:48PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Here is some more information about the Media Summit:
> 
> Date: Monday September 12
> Time: 9:00-17:00
> Location: Convention Centre Dublin
> Room: The Liffey B - Part 1 (subject to change)
> Sponsored by: Cisco Systems Norway and Collabora
> 
> We will have a projector or display to show presentations, power strips,
> a whiteboard and beverages. For lunch we are on our own.

Thank you for arranging all this, and thank you to Cisco and Collabora
for the sponsorship.

> It's co-located with the OSS Europe conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com>
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Hidenori Kobayashi <hidenorik@chromium.org>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Ricardo Ribalda <ribalda@chromium.org>
> Maxime Ripard <maxime@cerno.tech>
> Daniel Scally <djrscally@gmail.com>
> Jernej Škrabec <jernej.skrabec@gmail.com>
> Dave Stevenson <dave.stevenson@raspberrypi.com> (from 11 am onwards)
> Hans Verkuil <hverkuil@xs4all.nl>
> Philipp Zabel <p.zabel@pengutronix.de>
> 
> Note: there are 5 seats left, so if you are interested in this, mail me.
> 
> The health and safety regulations will be those of the OSSE LF:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
> 
> We strongly recommend that you do a self-test before going to the Conference Centre
> for this meeting.
> 
> Code of conduct:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
> 
> 
> Based on the submitted topics I have made a first draft of the agenda. I have tried
> to keep the sensor-related topics to after 11:00 since Dave comes in later in the day.
> 
> I am also making the (reasonable) assumption that most (if not all) attendees will be
> attending the ELCE/OSSE conference Tue-Fri as well. While it is nice if we can come
> to a conclusion in the time allotted for each topic, it's also OK if we can set up
> a small group that can discuss it further in the following days.
> 
> If you raised a discussion topic, but will be in Dublin for only the Monday, then
> let me know.

I will be at Plumbers and Kernel Summit from Tuesday to Thursday, but
may be able to escape on Tuesday to join specific discussions if needed.
I should also be available on Friday, if anyone manages not to catch
covid at the ELCE/OSSE party on Tuesday evening :-)

It will be a busy week.

> I added a guesstimate of the time needed for each topic. If you think that guesstimate
> is wildly off, then let me know. But remember: it's fine if we decide to discuss it
> further in the following days in a smaller group.

Most topics could probably use four times as much as what has been
allocated. That's due to no fault in the agenda, it's just the way
things are.

> If you present a topic, then please make a presentation. And if you have material you
> can share beforehand, then that would be great.

Yes, please. Given the very tight schedule, there will be close to no
time to make presentations. We need to focus on discussions, with
everybody reading the presentation material beforehand. This means
sending presentations ideally at least a week before the workshop. As
far as I'm concerned, an e-mail is good enough, there's no need for
slides unless the topic at hand would really benefit from more graphical
support material.

For anyone opting to present the topic by e-mail, you can reply to this
mail thread, but please change the subject line, for instance to

Subject: [Workshop 2022] V4L2 streams series

> Draft Agenda V1:
> 
>  9:00 Getting settled
>  9:20 Introduction

Is there a way we can open the room 15 minutes earlier for everybody to
get settled, and start the introduction at 9:00 sharp ?

>  9:30 Hans: Presentation on CTA-861 & edid-decode
>  9:45 Nicolas: Stateless encoder progress
> 10:15 Ricardo: Introduce ChromeOS camera project

I expect this topic alone could take the whole day. Ricardo made a
presentation at Kernel Recipes a few months ago, that's good
introductory material (the video has bad quality audio though).
Ricardo, instead of repeating the same presentation, could you focus on
the issues we need to solve to move forward, perhaps with a proposed
plan ?

> 11:00 Break
> 
> 11:15 Kieran: Fault tolerance
> 
>   I raised this in the past when we first started hitting the issue on
>   Renesas platforms with multiple cameras in a single media graph, but now
>   I think it's become more critical with desktop / laptop devices that are
>   hitting the issue (i.e. the IPU3).
> 
>   Summary of issue:
> 
>   - Multiple cameras that can function independently successfully, are
>     prevented from functioning or fully probing by V4L2 if one component
>     of another camera fails to load or probe.
> 
>     If Camera A has a VCM, and Camera B does not, Camera B will not be
>     available at all if Camera A's VCM is not fully probed, even though
>     Camera B can be fully functional and complete.
> 
>     Even if Camera A does not have the VCM probed, it may still function
>     successfully (with a fixed focal position) - but our current
>     implementation will mean that it will not even be available to
>     capture images.
> 
>   We talked about this quite a long time ago, and I believe the general
>   consensus was that we can have events on the media graph. But
>   unfortunately at the time, there was no development scheduled on that,
>   and it wasn't something I was able to continue at the time.
> 
>   I'd like to bring it up to refresh the topic, and see if we can make
>   some progress as it's now affecting more general devices.
> 
> 11:45 Jacopo: Representing addition sensor processing stages.
> 
>   How to represent additional processing stages that happens
>   on the sensor side, mostly additional subsampling/cropping that happen
>   between the analogue cropping on the full pixel array and the final
>   image sent on the wire.
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
> 
> 12:30 Lunch

I would have proposed having lunch in the room to avoid losing one hour,
but that won't be compatible with the conference's mask mandate. I
suppose an hour of brain rest would be welcome anyway :-)

> 13:30 Dave: On-sensor temperature reporting.
> 
>   Thread started by Benjamin at
>   https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
>   but no resolution over using hwmon API or V4L2 control. If hwmon
>   then we need Media Controller framework to tie the sensor and thermal
>   device together.
> 
>   It's recently been queried for IMX477 with the Pi
>   (https://github.com/raspberrypi/libcamera/issues/19), but it will
>   apply to many sensors.

Dave, it would be very useful if you could summarize, based on your
experience, how that information is reported by sensors (I2C reads,
embedded data, ..., but also single value, multiple values, ...) and
what use cases are expected to consume it.

> 13:45 Dave: Synchronising sensors for stereoscopic operation.
> 
>   How should that be configured? Allowing configuration from userspace
>   would allow sensors to be operated independently which can be useful for
>   test purposes, or should it be enforced from DT/ACPI? Do we set a default
>   configuration for each sensor from DT/ACPI and then allow userspace to
>   override should it wish?
> 
> 14:00 Dave: Lens drivers.
> 
>   Each driver will have a "useful" range which is effectively dictated by
>   the overall module. Should that be defined via DT as it is a feature of
>   the platform, or leave the driver totally generic and expect userspace
>   to do something sensible?
> 
>   In the case of simple systems without libcamera, do we set default for
>   V4L2_CID_FOCUS_ABSOLUTE to a sensible hyperfocal distance, and can
>   that again be defined in DT as it is defining the hardware?
> 
> 14:15 Dave: Controlling sensor GPIO outputs.
> 
>   Controlling sensor GPIO outputs for things such as flash triggers,
>   vsync, frame start/end, exposure start/end, etc.
> 
>   There is a huge range of features available so do we have any hope of
>   standardising some of it, or do we end up hiding these away in the
>   drivers with custom DT bindings to configure them? If we accept that
>   there will be variation, can we vaguely standardise what those
>   bindings look like? Or should these be V4L2 controls as things like
>   pulse widths may want to be adjusted by userspace?
> 
> 14:30 Jacopo: Reconcile handling of regulator, gpios and clock on OF and ACPI platforms.
> 
>   We recently got a few series trying to reconcile handling of regulators,
>   gpios and clocks on OF and ACPI platforms all of them doing the usual
>   "similar but slightly different" thing:
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
> 15:00 Break
> 
> 15:30 Laurent: V4L2 streams series.
> 
>   I'd like to discuss the V4L2 streams series, in particular how to
>   upstream the parts that won't be upstream yet by mid-September.
>   Discussing the next steps would also be useful, as there's lots we could
>   build on top.
> 
> 16:00 Laurent: How can we finalize conversion of v4l-utils to meson?

If everybody answers "yes" to this question in reply to this e-mail,
I'll send patches and we can free 15 minutes of discussion time :-)

> 16:15-17:00 Anything else?

Do we have t leave the room at 17:00 or would it still be available
should anyone want to continue discussions ?

-- 
Regards,

Laurent Pinchart
