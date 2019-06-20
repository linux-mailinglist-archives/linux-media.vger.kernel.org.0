Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1574CE90
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 15:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfFTNXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 09:23:55 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41217 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfFTNXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 09:23:55 -0400
Received: by mail-ua1-f67.google.com with SMTP id 34so1612058uar.8
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2019 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbYBebZjIvlz6w0R9vxO1MziUeMqC2xBWnMf/BpZB1Y=;
        b=oM+7TXGiU2oFm+WFWFrw55xuVaYcWsatKMD2CJiBp8YMqYKrlhf9SQRbXbM7rnel8O
         i2dJQ+HqHxGRard5aB9Fw0IThbptlDeA164bnIfSvjGXHd0nPYIKd6/9PtfssFuNbBnD
         PsK+FVJtwtP9bB3ZeAAztD4+ZtYYl0/9hCwhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbYBebZjIvlz6w0R9vxO1MziUeMqC2xBWnMf/BpZB1Y=;
        b=sU5CERh6vlmHqd9XjCGp7LO1gkSx5bZmgZ0BwAzFUBVchycmCnijFHOxpnCst6yCzo
         nJytB7F35b8DWHSaRhNjBiPJNiShVac0nYSzZuXobEyi/Wa08zSNR3Gculo2qQYaXsrP
         7MYvzTaShhpni1NXEa9430g8EjnP6ce/p815rvYHMwK1a5eJK6934c3eb1yKZtoGJrBw
         SGdTAkpvBpdSRgvM2gsHImmiXZCN0IkgMkCgpKyMEpIiX96hgsNa3J9LYKhWxcLPmpH6
         p+aykTQ+iOhnTDcFqQCOi39djsQvogEWjM7GUIFQeJwIWEE6U2SI2aI9qnwAS7KM7V0n
         xrUA==
X-Gm-Message-State: APjAAAXRPZS/W9w20rXebxYLFQDIZYH9zDkG3jqNryRgb1AfAwKXyXs2
        zeBpeZmTgM8eBPV/qtcZTnNRdd1SJwrCUhqAql5mjg==
X-Google-Smtp-Source: APXvYqxhMmn/6YiURqRPX2AUyAx8mNMfeUzJ/XMXz8YLOuOn4E0EfnpD45gwOFpATjTWkn03gw9J01hKjDcGsAQqM18=
X-Received: by 2002:a9f:3605:: with SMTP id r5mr190213uad.131.1561037032483;
 Thu, 20 Jun 2019 06:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190603043251.226549-2-cychiang@chromium.org>
 <41e7052b-a58c-5a8c-5d94-37237e0c2070@xs4all.nl> <20190603080931.GG21222@phenom.ffwll.local>
 <CAFv8Nw+1sB8i1d87vLeKxRricZOi4gnXFSgOzW9k0sa_Tzybjg@mail.gmail.com>
 <20190604072411.GP21222@phenom.ffwll.local> <CAFv8NwKL9ZL=gNpDmdRV+R9eq22+Da_1kzuYBv8kMMyV3Hq14g@mail.gmail.com>
 <20190611123455.GD2458@phenom.ffwll.local> <CAFv8NwJxs-R=ehgeqyx=e+T5OmUBsk3uWnUb2t0cC-LDPS7G5w@mail.gmail.com>
 <20190618121220.GU12905@phenom.ffwll.local> <CAFv8NwLci2ALi3V-e=8jjatciHWOoOj-FeajwNLWRpWRtqgBdg@mail.gmail.com>
 <20190620092506.GP12905@phenom.ffwll.local>
In-Reply-To: <20190620092506.GP12905@phenom.ffwll.local>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Thu, 20 Jun 2019 21:23:23 +0800
Message-ID: <CAFv8NwLbS_f4cfeorzqtmRzQSY0u1tgM7fitAokg_QfViPvq=Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] video: add HDMI state notifier support
To:     Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
        linux-media@vger.kernel.org,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 5:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 19, 2019 at 07:48:11PM +0800, Cheng-yi Chiang wrote:
> > On Tue, Jun 18, 2019 at 8:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Jun 18, 2019 at 07:48:06PM +0800, Cheng-yi Chiang wrote:
> > > > On Tue, Jun 11, 2019 at 8:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, Jun 11, 2019 at 08:10:38PM +0800, Cheng-yi Chiang wrote:
> > > > > > On Tue, Jun 4, 2019 at 3:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Tue, Jun 04, 2019 at 10:32:50AM +0800, Cheng-yi Chiang wrote:
> > > > > > > > On Mon, Jun 3, 2019 at 4:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Jun 03, 2019 at 09:45:49AM +0200, Hans Verkuil wrote:
> > > > > > > > > > On 6/3/19 6:32 AM, Cheng-Yi Chiang wrote:
> > > > > > > > > > > From: Hans Verkuil <hans.verkuil@cisco.com>
> > > > > > > > > > >
> > > > > > > > > > > Add support for HDMI hotplug and EDID notifiers, which is used to convey
> > > > > > > > > > > information from HDMI drivers to their CEC and audio counterparts.
> > > > > > > > > > >
> > > > > > > > > > > Based on an earlier version from Russell King:
> > > > > > > > > > >
> > > > > > > > > > > https://patchwork.kernel.org/patch/9277043/
> > > > > > > > > > >
> > > > > > > > > > > The hdmi_notifier is a reference counted object containing the HDMI state
> > > > > > > > > > > of an HDMI device.
> > > > > > > > > > >
> > > > > > > > > > > When a new notifier is registered the current state will be reported to
> > > > > > > > > > > that notifier at registration time.
> > > > > > > > > > >
> > > > > > > > > > > Based on Hans Verkuil's patch:
> > > > > > > > > > >
> > > > > > > > > > > https://patchwork.kernel.org/patch/9472521/
> > > > > > > > > >
> > > > > > > > > > Erm, you are aware that this patch morphed into a CEC-specific notifier
> > > > > > > > > > found in drivers/media/cec/cec-notifier.c?
> > > > > > > > > >
> > > > > > > > > > I don't think it makes sense to have two notifier implementations in the kernel.
> > > > > > > > > > The original intention was to have the notifier deal with both CEC and ASoC
> > > > > > > > > > notifications, but there was not enough interest for the ASoC bits at the time
> > > > > > > > > > and it was dropped.
> > > > > > > > > >
> > > > > > > > > > I am planning changes to the cec-notifier API, I hope to work on that this
> > > > > > > > > > week. I'll CC you when I post those. Those might be a good starting point
> > > > > > > > > > to convert the cec-notifier to an hdmi-notifier as was originally intended.
> > > > > > > > > >
> > > > > > > > > > I've added your colleague Dariusz Marcinkiewicz to the CC list since he's been
> > > > > > > > > > working on some nice cec-notifier improvements as well.
> > > > > > > > >
> > > > > > > > > We also have some interfaces for drm/alsa interactions around hdmi
> > > > > > > > > already in drm/drm_audio_component.h, but it's not used by anything
> > > > > > > > > outside of i915. Imo we should extend that, not reinvent a new wheel.
> > > > > > > > >
> > > > > > > > Hi Daniel,
> > > > > > > > Thank you for the pointer. Looking at the ops, it seems that it is
> > > > > > > > specific to HDA.
> > > > > > > > I am not familiar with drm and HDA. I am not sure how applicable it
> > > > > > > > would be to report jack status to ASoC.
> > > > > > > > There is a use case in sound/soc/codecs/hdac_hdmi.c though so it
> > > > > > > > should be possible.
> > > > > > >
> > > > > > > Currently hda is the only user, but the idea was to make it more generic.
> > > > > > > Jack status in alsa is what drm calls connector status btw.
> > > > > > >
> > > > > > > So if we can take that as a baseline and extend it (probably needs some
> > > > > > > registration boilerplate and helpers to look up the right endpoint using
> > > > > > > of/dt for soc systems, we use component.c in i915/hda for this), that
> > > > > > > would be great I think.
> > > > > > >
> > > > > > > > > Another note: notifiers considered evil, imo. Gets the job done for one
> > > > > > > > > case, as soon as you have multiple devices and need to make sure you get
> > > > > > > > > the update for the right one it all comes crashing down. Please create an
> > > > > > > > > api which registers for updates from a specific device only, plus
> > > > > > > > > something that has real callbacks (like the drm_audio_component.h thing we
> > > > > > > > > started already).
> > > > > > > >
> > > > > > > > To clarify a bit, this hdmi-notifier indeed supports updating from a
> > > > > > > > specific device only.
> > > > > > > > hdmi_notifier_get takes a device and return the notifier.
> > > > > > >
> > > > > > > Hm I missed that, I thought it's global, so one of my usual notifier
> > > > > > > concerns addressed.
> > > > > > >
> > > > > > > > It seems that a major difference between drm_audio_components and
> > > > > > > > hdmi-notifier is that
> > > > > > > > drm_audio_components defines all supported ops in drm_audio_component_audio_ops.
> > > > > > > > On the other hand, hdmi-notifier passes different events using an enum
> > > > > > > > like HDMI_CONNECTED and let listener handle different events.
> > > > > > > > In this regard I agree with you that drm_audio_component is cleaner.
> > > > > > > > Anyway, I will look into it a bit more and see how it works.
> > > > > > >
> > > > > > > Yeah I think if we could combine the approach, i.e. notifier side for
> > > > > > > registration, some _ops structure for the actual notifications, then
> > > > > > > there's a solid interface. I just really don't like the opaque void *
> > > > > > > interface notifier provides, it encourages abuse way too much.
> > > > > > >
> > > > > > > Ofc the registration side would then no longer be based on the notifier
> > > > > > > datastructure, list_head (like cec-notifier.c) of registeres devices with
> > > > > > > their _ops structure should be enough.
> > > > > > > -Daniel
> > > > > >
> > > > > > Hi Daniel,
> > > > > > Yes, I agree the above statement that we should have a more solid interface.
> > > > > >
> > > > > > Hi Hans,
> > > > > > I am not sure if I missed the patch.
> > > > > > Do you have a estimated timeline for new cec-notifier interface you
> > > > > > are working on?
> > > > > > It seems that your PoC patch needs Dariusz's patch to work.
> > > > > > I would like to seek your advice on whether I can proceed without your
> > > > > > patch and Dariusz's patch.
> > > > > >
> > > > > > I looked through the patch from Dariusz
> > > > > >
> > > > > > https://lkml.org/lkml/2019/5/21/389
> > > > > >
> > > > > > , and saw that you were thinking whether we should use cec-notifier
> > > > > > for both HDMI and CEC.
> > > > > >
> > > > > > https://lkml.org/lkml/2019/5/24/298
> > > > > >
> > > > > > Could you please let me know your latest thought on whether we should
> > > > > > reuse cec-notifier?
> > > > >
> > > > > Nah, see later in that thread, I think cec and audio seem to be different
> > > > > use-cases.
> > > > >
> > > > Ack
> > > > > But definitely a good idea to sync with Dariusz, I forgot to pull the two
> > > > > threads together. Thanks for doing that.
> > > > >
> > > > > > I agree with you that I should not proceed with hdmi-notifier. Reasons include:
> > > > > > 1. Method like cec_notifier_parse_hdmi_phandle can be reused. It is
> > > > > > error prone to memory leak if it is implemented by user, like the
> > > > > > patch in hdmi-codec.c in this series did not handle the ref count.
> > > > > > 2. cec-notifier has a simpler implementation of register / unregister
> > > > > > because there is no call chain. I am not aware of the need for
> > > > > > hdmi-notifier to support a chain of callbacks. So I think that call
> > > > > > chain support can be removed.
> > > > > >
> > > > > > If I go ahead and add a new interface to register ops to handle
> > > > > > connector status report from cec-notifer, based on current
> > > > > > cec-notifier, do you think that would work ?
> > > > > > I think it might work if I add another cec_notifier object inside
> > > > > > dw-hdmi.c, but only for HDMI jack reporting, not for CEC related
> > > > > > reporting.
> > > > > >
> > > > > > And after some investigation, I realize that my requirement is even
> > > > > > simpler. I don't need hdmi_event_new_edid and hdmi_event_new_eld in my
> > > > > > use case.
> > > > >
> > > > > Yeah, connector status is how we started with the drm/alsa interface in
> > > > > i915 too, but later on had to extend it. I think eventually we'll need it
> > > > > all, that's why I suggested to use that as the interface between drm and
> > > > > alsa side, but augmented with some register/unregister and bind logic.
> > > > >
> > > > Hi Daniel,
> > > > Sorry for the late reply.
> > > > I spent some time investigating how drm_audio_component works.
> > > > The coupling of HDA in drm_audio_component framework makes the
> > > > register/unregister logic looks complicated to me as I don't use HDA
> > > > in my use case.
> > > > After some time, I found another patch series which also use component
> > > > framework to communicate between drm and mei world.
> > > >
> > > > https://patchwork.kernel.org/patch/10824527/
> > > >
> > > > And from that patch, I realized that I can follow the similar approach
> > > > to register a master component on ALSA side, a slave component on DRM
> > > > side, and use device and subcomponent to match them.
> > >
> > > Sorry for the confusion here. My suggestion is _not_ to use the component
> > > framework. That's only meant for one-off special case solutions. For that
> > > part I think you need to build a new register/unregister/bind/unbind
> > > infrastructure, like we have for lots of other things in the kernel
> > > already (clocks, gpio, drm_panel, drm_bridge as just a few examples).
> > >
> >
> > Hi Daniel,
> > Thank you for the prompt reply and guidance.
> >
> > I see. I was not aware that we should avoid using component framework.
> > Your example of drm_panel seems great.
> > I plan is to reuse drm_audio_components like this:
> > A LIST_HEAD holding the list of drm_audio_components instances, and add API
> > drm_audio_comp_init,
> > _add, _remove, _attach, _detach.
> > And for DRM side to look up the instance to use, we can use similar
> > approach like of_drm_find_panel, that is, using device tree node.
>
> Sounds good. I guess somewhere in there you'll use of_node/DT information
> to make sure you have the right audio component? Just to make sure we're
> agreeing on the design completely.


ACK.
I need to check closer. I will use of_node/DT information,
but it might be the other way around as machine driver can get the
hdmi node and hence hdmi device,
and that device can be passed to codec driver to register a component
with the device.
So the register mechanism is more like original hdmi_notifier.
>
>
> > > My suggestion with the i915/hda interface is to build on the actual
> > > interface for signalling connector status and exchanging eld and stuff
> > > like that.
> > >
> >
> > I agree with using this interface. But in my use case there is no much
> > data to be exchanged.
> > Only the connector status needs to be passed from DRM to ALSA world.
> > If in the future there is need for ALSA to make some call, that ops
> > can be added to drm_audio_component_ops.
>
> Yeah I think it's ok to not implement everyhing. Iirc we started with only
> the connector status too, then extended that to sharing the eld.
>
> There's also some i915/had hacks (clocks without using clock framework,
> power domains without using power framework), where for DT platforms we
> probably want to do this right.
>
> Looking at the entire thing we might need to create new _ops structures,
> or at least refactor them quite a bit. But we can improve things
> iteratively imo.


ACK
>
>
> > > > I should be able to do this without touching anything specific to HDA.
> > > > After that, DRM world should be able to use the ops in
> > > > drm_audio_component_audio_ops to notify ALSA world some event when
> > > > there is something happen in DRM world.
> > > > Currently the ops like pin_eld_notify, pin2port are too specific to HDA.
> > > > I think I can add an ops to drm_audio_component_audio_ops to convey
> > > > connector status.
> > >
> > > Hm why? The pin2port is maybe not the best one, since port is an intel
> > > construct, and pin a hda construct. So we'd need to change those to talk
> > > in terms of the higher-level concepts (alsa output pin and drm crtc
> > > probably).
> > >
> >
> > I took more look into how information of audio being present or not is
> > passed between DRM and ALSA world,
> > taking drivers/gpu/drm/i915/intel_audio.c and
> > sound/soc/codecs/hdac_hdmi.c as example.
> > I see the sequence is DRM side to call pin_eld_notify ops with port
> > and pipe to ALSA side.
> > Then, ALSA side calls get_eld ops with port and pipe to look up
> > whether the saved encoder has audio_connector.
> >
> > However, my use case on RK3288 is different in that ALSA side does not
> > need to get ELD.
> > I think adding an ops like connector_status() for DRM side to call in
> > parallel to pin_eld_notify is reasonable.
> > Both DRM side and ALSA side can choose what is the desired ops to be
> > implemented as these ops can be optional.
>
> I think pin_eld_notify and get_eld are just mislabeled, they give you both
> eld and status (the bool *enabled in get_eld). Maybe we should rename them
> to get_status and pin_status_notify?


ACK

>
> > > The other stuff should work a bit better. Either way my idea was to evolve
> > > that interface (and put in the place the required type-casting for
> > > i915/hda), since more users increases the odds that it actually is a good
> > > design.
> > >
> > Sorry I don't understand this part.
> > Could you please elaborate more about type-casting for i915/hda ?
> >
> > TBH, If possible, I would like to minimize the change I'll need to
> > make to i915/hda because of my limited knowledge of i915/hda and my
> > limited bandwidth.
> >
> > I would like to point out the scope of this problem to help the discussion.
> > I think this is a common need on boards using ALSA hdmi-codec driver.
> > Currently, there are many DRM drivers resorted to hdmi_codec_ops
> > approach to let ALSA world talks to DRM world.
> > That hdmi_codec_ops approach came around 2016 so it was before
> > drm_audio_component was introduced.
> > As for how jack status is reported for these boards, I am not sure,
> > maybe with local patches of hdmi-notifier.
> > So this is not a one-off change for RK3288 only. I believe other
> > boards will benefit from this jack reporting feature as well.
> >
> > As for extending and improving the interface of drm_audio_component so
> > more users can adopt it,
> > I think the ops in hdmi_codec_ops are good candidates to be moved to
> > drm_audio_component to consolidate the interface between DRM and ALSA
> > better.
> > That said, I don't feel a strong need to change i915/hda if the
> > purpose is to let more users use drm_audio_component.
> >
> > I can drew these changes in three stages:
> > 1. Add the infrastructure to add/remove/attach/detach
> > drm_audio_component (like how drm_panel does), and add
> > connector_status ops.
> > 2. Move ops in hdmi_codec_ops into drm_audio_components.
> > 3. Desired change of i915/hda (I am not clear about this part)
> >
> > I can help with 1 and 2 as Chromium tree have at least RK3288 and
> > MT8173 SoC using hdmi-codec driver so it is easier for me to try
> > patches.
> > And there may be more in the future.
> >
> > Thanks again for the patience.
> > I am not familiar with DRM so it takes me more time to digest your
> > comment and reply.
>
> Hm sorry, I totally forgot about this again, iirc I looked at this.
>
> Yeah fully agreeing that hdmi_audio_code is probably a better starting
> point. Problem is that becuase hdmi_codec is built on top of platform
> device it's quite a bit harder to extend with callbacks and things like
> that, without breaking the driver model.
>
> I need to think about this more, but if all we need to look at is
> hdmi_codec, then I think this becomes a lot easier. And we can ignore
> drm_audio_component.h completely.


It is surprising that you think this way.
Maybe the original patch before hdmi-notifier was introduced is the
better way to solve this issue, if we only need to look at hdmi_codec.

The history of hdmi_codec driver is in this patch series:

https://lore.kernel.org/patchwork/patch/539656/

There was a callback mechanism implemented between dw-hdmi and hdmi
codec driver.
It was later consolidated by Doug in this patch for better jack status
reporting:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/303573/

I am not sure why the original patch series did not get fully accepted
in the upstream.
It was quite long time ago.

But if you think this might be the right way to do, then it is even
better for us because the patch series and Doug's patch had been quite
stable
on our RK3288 products for about four years with plenty of users, so
we have much higher confidence in them.
I can rebase and clean up them and post another patch for review.

Please let me know what approach you feel is better.
Thanks again!


>
> -Daniel
>
>
> >
> > > > I will work toward this approach these days.
> > > > If you have other thought please let me know.
> > > > Thanks!
> > > >
> > > > > > I just need to report the connector status from synopsys/dw-hdmi.c to
> > > > > > codecs/hdmi-codec.c for codec driver to update the jack status.
> > > > > > Do you think I can proceed in this direction ? Or do you prefer I wait
> > > > > > for a while and work on it based on your new patch.
> > > > >
> > > > > I think most important part here is that we sync across all the different
> > > > > people pushing for better drm/alsa integration. What the solution looks
> > > > > like in the end doesn't matter much imo, as long as we don't end up with 3
> > > > > different things :-)
> > > >
> > > > Totally agree.
> > >
> > > Anyway just my thoughts, let's keep chatting.
> > >
> > > Cheers, Daniel
> > >
> > > > Thanks again!
> > > >
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > > >
> > > > > > Thanks a lot!
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks again!
> > > > > > > >
> > > > > > > > > -Daniel
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Regards,
> > > > > > > > > >
> > > > > > > > > >       Hans
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Modified by Cheng-Yi Chiang:
> > > > > > > > > > >  - Add a section in MAINTAINER.
> > > > > > > > > > >  - Changes connected and has_eld to bitfield of unsigned int.
> > > > > > > > > > >  - Other minor fixes to pass checkpatch.pl --strict checks.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > > > > > > > > > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > > > > > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > > > > > > > > > ---
> > > > > > > > > > > The original patch is at
> > > > > > > > > > > https://lore.kernel.org/linux-arm-kernel/20161213150813.37966-2-hverkuil@xs4all.nl
> > > > > > > > > > >
> > > > > > > > > > >  MAINTAINERS                   |   6 ++
> > > > > > > > > > >  drivers/video/Kconfig         |   3 +
> > > > > > > > > > >  drivers/video/Makefile        |   1 +
> > > > > > > > > > >  drivers/video/hdmi-notifier.c | 145 ++++++++++++++++++++++++++++++++++
> > > > > > > > > > >  include/linux/hdmi-notifier.h | 112 ++++++++++++++++++++++++++
> > > > > > > > > > >  5 files changed, 267 insertions(+)
> > > > > > > > > > >  create mode 100644 drivers/video/hdmi-notifier.c
> > > > > > > > > > >  create mode 100644 include/linux/hdmi-notifier.h
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > > > > index 5cfbea4ce575..ffb7376f9509 100644
> > > > > > > > > > > --- a/MAINTAINERS
> > > > > > > > > > > +++ b/MAINTAINERS
> > > > > > > > > > > @@ -16676,6 +16676,12 @@ W: https://linuxtv.org
> > > > > > > > > > >  S: Maintained
> > > > > > > > > > >  F: drivers/media/platform/vicodec/*
> > > > > > > > > > >
> > > > > > > > > > > +VIDEO FRAMEWORK
> > > > > > > > > > > +M: Hans Verkuil <hverkuil@xs4all.nl>
> > > > > > > > > > > +L: linux-media@vger.kernel.org
> > > > > > > > > > > +F: drivers/video/hdmi-notifier.*
> > > > > > > > > > > +S: Maintained
> > > > > > > > > > > +
> > > > > > > > > > >  VIDEO MULTIPLEXER DRIVER
> > > > > > > > > > >  M: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > > > > > >  L: linux-media@vger.kernel.org
> > > > > > > > > > > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> > > > > > > > > > > index 83d3d271ca15..000ba9bc0ae7 100644
> > > > > > > > > > > --- a/drivers/video/Kconfig
> > > > > > > > > > > +++ b/drivers/video/Kconfig
> > > > > > > > > > > @@ -34,6 +34,9 @@ config VIDEOMODE_HELPERS
> > > > > > > > > > >  config HDMI
> > > > > > > > > > >     bool
> > > > > > > > > > >
> > > > > > > > > > > +config HDMI_NOTIFIERS
> > > > > > > > > > > +   bool
> > > > > > > > > > > +
> > > > > > > > > > >  endif # HAS_IOMEM
> > > > > > > > > > >
> > > > > > > > > > >  if VT
> > > > > > > > > > > diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> > > > > > > > > > > index df7650adede9..eff4736102ca 100644
> > > > > > > > > > > --- a/drivers/video/Makefile
> > > > > > > > > > > +++ b/drivers/video/Makefile
> > > > > > > > > > > @@ -1,6 +1,7 @@
> > > > > > > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > >  obj-$(CONFIG_VGASTATE)            += vgastate.o
> > > > > > > > > > >  obj-$(CONFIG_HDMI)                += hdmi.o
> > > > > > > > > > > +obj-$(CONFIG_HDMI_NOTIFIERS)      += hdmi-notifier.o
> > > > > > > > > > >
> > > > > > > > > > >  obj-$(CONFIG_VT)             += console/
> > > > > > > > > > >  obj-$(CONFIG_FB_STI)                 += console/
> > > > > > > > > > > diff --git a/drivers/video/hdmi-notifier.c b/drivers/video/hdmi-notifier.c
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 000000000000..d1eedf661648
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/drivers/video/hdmi-notifier.c
> > > > > > > > > > > @@ -0,0 +1,145 @@
> > > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > +/* hdmi-notifier.c - notify interested parties of (dis)connect and EDID
> > > > > > > > > > > + * events
> > > > > > > > > > > + *
> > > > > > > > > > > + * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> > > > > > > > > > > + * Copyright 2016 Cisco Systems, Inc. and/or its affiliates.
> > > > > > > > > > > + * All rights reserved.
> > > > > > > > > > > + */
> > > > > > > > > > > +
> > > > > > > > > > > +#include <linux/export.h>
> > > > > > > > > > > +#include <linux/hdmi-notifier.h>
> > > > > > > > > > > +#include <linux/string.h>
> > > > > > > > > > > +#include <linux/slab.h>
> > > > > > > > > > > +#include <linux/list.h>
> > > > > > > > > > > +
> > > > > > > > > > > +static LIST_HEAD(hdmi_notifiers);
> > > > > > > > > > > +static DEFINE_MUTEX(hdmi_notifiers_lock);
> > > > > > > > > > > +
> > > > > > > > > > > +struct hdmi_notifier *hdmi_notifier_get(struct device *dev)
> > > > > > > > > > > +{
> > > > > > > > > > > +   struct hdmi_notifier *n;
> > > > > > > > > > > +
> > > > > > > > > > > +   mutex_lock(&hdmi_notifiers_lock);
> > > > > > > > > > > +   list_for_each_entry(n, &hdmi_notifiers, head) {
> > > > > > > > > > > +           if (n->dev == dev) {
> > > > > > > > > > > +                   mutex_unlock(&hdmi_notifiers_lock);
> > > > > > > > > > > +                   kref_get(&n->kref);
> > > > > > > > > > > +                   return n;
> > > > > > > > > > > +           }
> > > > > > > > > > > +   }
> > > > > > > > > > > +   n = kzalloc(sizeof(*n), GFP_KERNEL);
> > > > > > > > > > > +   if (!n)
> > > > > > > > > > > +           goto unlock;
> > > > > > > > > > > +   n->dev = dev;
> > > > > > > > > > > +   mutex_init(&n->lock);
> > > > > > > > > > > +   BLOCKING_INIT_NOTIFIER_HEAD(&n->notifiers);
> > > > > > > > > > > +   kref_init(&n->kref);
> > > > > > > > > > > +   list_add_tail(&n->head, &hdmi_notifiers);
> > > > > > > > > > > +unlock:
> > > > > > > > > > > +   mutex_unlock(&hdmi_notifiers_lock);
> > > > > > > > > > > +   return n;
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_notifier_get);
> > > > > > > > > > > +
> > > > > > > > > > > +static void hdmi_notifier_release(struct kref *kref)
> > > > > > > > > > > +{
> > > > > > > > > > > +   struct hdmi_notifier *n =
> > > > > > > > > > > +           container_of(kref, struct hdmi_notifier, kref);
> > > > > > > > > > > +
> > > > > > > > > > > +   mutex_lock(&hdmi_notifiers_lock);
> > > > > > > > > > > +   list_del(&n->head);
> > > > > > > > > > > +   mutex_unlock(&hdmi_notifiers_lock);
> > > > > > > > > > > +   kfree(n->edid);
> > > > > > > > > > > +   kfree(n);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +void hdmi_notifier_put(struct hdmi_notifier *n)
> > > > > > > > > > > +{
> > > > > > > > > > > +   kref_put(&n->kref, hdmi_notifier_release);
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_notifier_put);
> > > > > > > > > > > +
> > > > > > > > > > > +int hdmi_notifier_register(struct hdmi_notifier *n, struct notifier_block *nb)
> > > > > > > > > > > +{
> > > > > > > > > > > +   int ret = blocking_notifier_chain_register(&n->notifiers, nb);
> > > > > > > > > > > +
> > > > > > > > > > > +   if (ret)
> > > > > > > > > > > +           return ret;
> > > > > > > > > > > +   kref_get(&n->kref);
> > > > > > > > > > > +   mutex_lock(&n->lock);
> > > > > > > > > > > +   if (n->connected) {
> > > > > > > > > > > +           blocking_notifier_call_chain(&n->notifiers, HDMI_CONNECTED, n);
> > > > > > > > > > > +           if (n->edid_size)
> > > > > > > > > > > +                   blocking_notifier_call_chain(&n->notifiers,
> > > > > > > > > > > +                                                HDMI_NEW_EDID, n);
> > > > > > > > > > > +           if (n->has_eld)
> > > > > > > > > > > +                   blocking_notifier_call_chain(&n->notifiers,
> > > > > > > > > > > +                                                HDMI_NEW_ELD, n);
> > > > > > > > > > > +   }
> > > > > > > > > > > +   mutex_unlock(&n->lock);
> > > > > > > > > > > +   return 0;
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_notifier_register);
> > > > > > > > > > > +
> > > > > > > > > > > +int hdmi_notifier_unregister(struct hdmi_notifier *n, struct notifier_block *nb)
> > > > > > > > > > > +{
> > > > > > > > > > > +   int ret = blocking_notifier_chain_unregister(&n->notifiers, nb);
> > > > > > > > > > > +
> > > > > > > > > > > +   if (ret == 0)
> > > > > > > > > > > +           hdmi_notifier_put(n);
> > > > > > > > > > > +   return ret;
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_notifier_unregister);
> > > > > > > > > > > +
> > > > > > > > > > > +void hdmi_event_connect(struct hdmi_notifier *n)
> > > > > > > > > > > +{
> > > > > > > > > > > +   mutex_lock(&n->lock);
> > > > > > > > > > > +   n->connected = true;
> > > > > > > > > > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_CONNECTED, n);
> > > > > > > > > > > +   mutex_unlock(&n->lock);
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_event_connect);
> > > > > > > > > > > +
> > > > > > > > > > > +void hdmi_event_disconnect(struct hdmi_notifier *n)
> > > > > > > > > > > +{
> > > > > > > > > > > +   mutex_lock(&n->lock);
> > > > > > > > > > > +   n->connected = false;
> > > > > > > > > > > +   n->has_eld = false;
> > > > > > > > > > > +   n->edid_size = 0;
> > > > > > > > > > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_DISCONNECTED, n);
> > > > > > > > > > > +   mutex_unlock(&n->lock);
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_event_disconnect);
> > > > > > > > > > > +
> > > > > > > > > > > +int hdmi_event_new_edid(struct hdmi_notifier *n, const void *edid, size_t size)
> > > > > > > > > > > +{
> > > > > > > > > > > +   mutex_lock(&n->lock);
> > > > > > > > > > > +   if (n->edid_allocated_size < size) {
> > > > > > > > > > > +           void *p = kmalloc(size, GFP_KERNEL);
> > > > > > > > > > > +
> > > > > > > > > > > +           if (!p) {
> > > > > > > > > > > +                   mutex_unlock(&n->lock);
> > > > > > > > > > > +                   return -ENOMEM;
> > > > > > > > > > > +           }
> > > > > > > > > > > +           kfree(n->edid);
> > > > > > > > > > > +           n->edid = p;
> > > > > > > > > > > +           n->edid_allocated_size = size;
> > > > > > > > > > > +   }
> > > > > > > > > > > +   memcpy(n->edid, edid, size);
> > > > > > > > > > > +   n->edid_size = size;
> > > > > > > > > > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_NEW_EDID, n);
> > > > > > > > > > > +   mutex_unlock(&n->lock);
> > > > > > > > > > > +   return 0;
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_event_new_edid);
> > > > > > > > > > > +
> > > > > > > > > > > +void hdmi_event_new_eld(struct hdmi_notifier *n, const u8 eld[128])
> > > > > > > > > > > +{
> > > > > > > > > > > +   mutex_lock(&n->lock);
> > > > > > > > > > > +   memcpy(n->eld, eld, sizeof(n->eld));
> > > > > > > > > > > +   n->has_eld = true;
> > > > > > > > > > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_NEW_ELD, n);
> > > > > > > > > > > +   mutex_unlock(&n->lock);
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(hdmi_event_new_eld);
> > > > > > > > > > > diff --git a/include/linux/hdmi-notifier.h b/include/linux/hdmi-notifier.h
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 000000000000..c8f35110e3e3
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/include/linux/hdmi-notifier.h
> > > > > > > > > > > @@ -0,0 +1,112 @@
> > > > > > > > > > > +/* SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > + * hdmi-notifier.h - notify interested parties of (dis)connect and EDID
> > > > > > > > > > > + * events
> > > > > > > > > > > + *
> > > > > > > > > > > + * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> > > > > > > > > > > + * Copyright 2016 Cisco Systems, Inc. and/or its affiliates.
> > > > > > > > > > > + * All rights reserved.
> > > > > > > > > > > + */
> > > > > > > > > > > +
> > > > > > > > > > > +#ifndef LINUX_HDMI_NOTIFIER_H
> > > > > > > > > > > +#define LINUX_HDMI_NOTIFIER_H
> > > > > > > > > > > +
> > > > > > > > > > > +#include <linux/types.h>
> > > > > > > > > > > +#include <linux/notifier.h>
> > > > > > > > > > > +#include <linux/kref.h>
> > > > > > > > > > > +
> > > > > > > > > > > +enum {
> > > > > > > > > > > +   HDMI_CONNECTED,
> > > > > > > > > > > +   HDMI_DISCONNECTED,
> > > > > > > > > > > +   HDMI_NEW_EDID,
> > > > > > > > > > > +   HDMI_NEW_ELD,
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct device;
> > > > > > > > > > > +
> > > > > > > > > > > +struct hdmi_notifier {
> > > > > > > > > > > +   /* Lock to protect callback registration and notification. */
> > > > > > > > > > > +   struct mutex lock;
> > > > > > > > > > > +   struct list_head head;
> > > > > > > > > > > +   struct kref kref;
> > > > > > > > > > > +   struct blocking_notifier_head notifiers;
> > > > > > > > > > > +   struct device *dev;
> > > > > > > > > > > +
> > > > > > > > > > > +   /* Current state */
> > > > > > > > > > > +   unsigned int connected : 1;
> > > > > > > > > > > +   unsigned int has_eld : 1;
> > > > > > > > > > > +   unsigned char eld[128];
> > > > > > > > > > > +   void *edid;
> > > > > > > > > > > +   size_t edid_size;
> > > > > > > > > > > +   size_t edid_allocated_size;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_notifier_get - find or create a new hdmi_notifier for the given device.
> > > > > > > > > > > + * @dev: device that sends the events.
> > > > > > > > > > > + *
> > > > > > > > > > > + * If a notifier for device @dev already exists, then increase the refcount
> > > > > > > > > > > + * and return that notifier.
> > > > > > > > > > > + *
> > > > > > > > > > > + * If it doesn't exist, then allocate a new notifier struct and return a
> > > > > > > > > > > + * pointer to that new struct.
> > > > > > > > > > > + *
> > > > > > > > > > > + * Return NULL if the memory could not be allocated.
> > > > > > > > > > > + */
> > > > > > > > > > > +struct hdmi_notifier *hdmi_notifier_get(struct device *dev);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_notifier_put - decrease refcount and delete when the refcount reaches 0.
> > > > > > > > > > > + * @n: notifier
> > > > > > > > > > > + */
> > > > > > > > > > > +void hdmi_notifier_put(struct hdmi_notifier *n);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_notifier_register - register the notifier with the notifier_block.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + * @nb: the notifier_block
> > > > > > > > > > > + */
> > > > > > > > > > > +int hdmi_notifier_register(struct hdmi_notifier *n, struct notifier_block *nb);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_notifier_unregister - unregister the notifier with the notifier_block.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + * @nb: the notifier_block
> > > > > > > > > > > + */
> > > > > > > > > > > +int hdmi_notifier_unregister(struct hdmi_notifier *n,
> > > > > > > > > > > +                        struct notifier_block *nb);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_event_connect - send a connect event.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + *
> > > > > > > > > > > + * Send an HDMI_CONNECTED event to any registered parties.
> > > > > > > > > > > + */
> > > > > > > > > > > +void hdmi_event_connect(struct hdmi_notifier *n);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_event_disconnect - send a disconnect event.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + *
> > > > > > > > > > > + * Send an HDMI_DISCONNECTED event to any registered parties.
> > > > > > > > > > > + */
> > > > > > > > > > > +void hdmi_event_disconnect(struct hdmi_notifier *n);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_event_new_edid - send a new EDID event.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + *
> > > > > > > > > > > + * Send an HDMI_NEW_EDID event to any registered parties.
> > > > > > > > > > > + * This function will make a copy the EDID so it can return -ENOMEM if
> > > > > > > > > > > + * no memory could be allocated.
> > > > > > > > > > > + */
> > > > > > > > > > > +int hdmi_event_new_edid(struct hdmi_notifier *n, const void *edid, size_t size);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * hdmi_event_new_eld - send a new ELD event.
> > > > > > > > > > > + * @n: the HDMI notifier
> > > > > > > > > > > + *
> > > > > > > > > > > + * Send an HDMI_NEW_ELD event to any registered parties.
> > > > > > > > > > > + */
> > > > > > > > > > > +void hdmi_event_new_eld(struct hdmi_notifier *n, const u8 eld[128]);
> > > > > > > > > > > +
> > > > > > > > > > > +#endif
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Daniel Vetter
> > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > http://blog.ffwll.ch
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
