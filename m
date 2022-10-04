Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D0E5F3EC2
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiJDItB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 04:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiJDIs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 04:48:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D917511171
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 01:48:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC8FE61296
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 08:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2714C4347C
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 08:48:51 +0000 (UTC)
Message-ID: <02ad4845-d7d8-d95c-ae7e-3229f1dc86b3@xs4all.nl>
Date:   Tue, 4 Oct 2022 10:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Report of the Media Mini Summit Dublin - September 12th, 2022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Media Mini Summit Dublin - September 12th, 2022
===============================================

On September 12th, 2022 we had a day long Media Mini Summit, discussing many
media topics. It was the first time after three years without meetings that we
finally could get together again.

Special thanks to:

- The Linux Foundation for organizing a room for us,
- Collabora and Cisco Systems Norway for sponsoring the summit,
- The Kodi Foundation for sponsoring lunch.

Much appreciated!

And of course many thanks to the participants of the meeting! I had no idea
what to expect when I organized this after three years of COVID, but we
had a really good group of people and interesting topics.


Attendees
---------

Sakari Ailus <sakari.ailus@linux.intel.com>
Kieran Bingham <kieran.bingham@ideasonboard.com>
Mauro Carvalho Chehab <mchehab@kernel.org> (Remote)
Nicolas Dufresne <nicolas@ndufresne.ca>
Hugues Fruchet <hugues.fruchet@st.com>
Benjamin Gaignard <benjamin.gaignard@collabora.com>
Jacopo Mondi <jacopo@jmondi.org>
Benjamin MUGNIER <benjamin.mugnier@foss.st.com> (Remote)
Michael Olbrich <m.olbrich@pengutronix.de>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Ricardo Ribalda <ribalda@chromium.org>
Maxime Ripard <maxime@cerno.tech>
Daniel Scally <djrscally@gmail.com>
Jernej Škrabec <jernej.skrabec@gmail.com>
Niklas Söderlund <niklas.soderlund@ragnatech.se>
Dave Stevenson <dave.stevenson@raspberrypi.com>
Michael Tretter <m.tretter@pengutronix.de>
Chen-Yu Tsai <wenst@chromium.org>
Hans Verkuil <hverkuil@xs4all.nl>


Stateless Codecs (Nicolas Dufresne)
-----------------------------------

Stateful encoder support is already available, the focus is now on stateless
encoders.

While decoders follow the codec specification, leading to very similar hardware
between vendor, encoders are allowed much more freedom. It is how vendors can
differentiate themselves from others.

With stateless codecs, the added-value features are implemented in software,
not in the fixed QP hardware encoder. There is thus room to innovate, and one of
the goals with the kernel API is to make anything possible in userspace.

Lots of mechanisms, especially around bitrate control, are patented. We thus
need to give users options to *not* use some of the features.  Most of the
patents are related to QP control, to maximize the quality within a bandwidth
allowance for TV (bandwidth is there and should be used to maximize quality,
but going over the allowance produces corruption). Simpler algorithms that
guarantee a correct long-term average but can overshoot are usually not
patented. In TV applications, they can afford to reencode a frame if it turns
out to use too much bandwidth. In streaming applications this isn't possible.

Those features can be hard to abstract, as patented features tend to be
available from a single vendor only. One approach being considered is to not
support "advanced" features to start with.

The core of the settings seem to be mostly generic.

Prototyping will be done in GStreamer. Should not be a problem in FFMPEG.
Chromium should follow. The first implementation focusses on Hantro. The
"Hantro" core is now owned by VeriSilicon, now called VC8000 and VC9000.
The second implementation will address AllWinner and/or Rockchip.

Hans asked about the status of stateless AV1 decoders: when Collabora
started, there was hardware but no firmware. An uAPI was written, now at v3.
There are plans to write a second driver. Target chip is RK3588, have early
access to platform, but doesn't work yet with the vendor stack. When a
working second driver is ready, the uAPI will be mainlined without staging
it first.


Kernel CAM (Ricardo Ribalda)
----------------------------

Slides at https://drive.google.com/file/d/1Tew21xeKmFlQ7dQxMcIYqybVuQL7La1a/view

This topic will have its own report since the discussion was spread over two
days, so it won't be discussed here.


Fault Tolerant V4L2 (Kieran Bingham, Daniel Scally)
---------------------------------------------------

Fault Tolerant V4L2 would allow systems to work with a non functioning camera.
Currently, if one camera in a single media graph if broken, then no media graph
is registered and no devices will come up.

Use cases:

ADAS (Advanced Driver-Assistance Systems): particularly relevant as if one
camera breaks the rest of the system should keep working.

MAX9286 GMSL deserializer with up to 4 cameras connected: if one fails, no
cameras on the system

IPU3 Surface Go 2: the VCM (for focussing the lens) is part of the media graph.
If the VCM is not probed, then no cameras will be available on the system. Also,
if a new device gets described in the system and it doesn't work (because it's
broken or not supported) no cameras will be available on the system.

Agreed in 2019:

- Event based failure detection to notify that media graph has changed.
  Sakari has patches to support media graphs events, to be rebased and re-posted.
- Requires media-graph versioning.
- The property API can be applicable to report the device status: Hans has (old)
  patches for a property API.

The discussion ended up being more of a brainstorming session, without any real
conclusions. I have tried to group related comments, but the discussion was
messy, so this will be messy too...

Events:

- Failure events need to be emitted by the sub-device that failed to report which
  streams are available at s_stream() time.
- Other components other than a camera can fail as well (e.g. regulators, although
  there may be a timeout mechanism in the kernel for regulator failures, TBC).
  Failed probe attempts should be reported. But how to distinguish between waiting
  for an event (e.g. waiting for the root fs to be available) and a real failure?
- dqbuf not the right mechanism to report failure, subdev events propagated on the
  media graph
- Are we targeting "big" failures or also handles case where the other cameras can
  continue working? Can the failure notfication event can be used for other purposes
  than simply reporting a failure to userspace?

  For both questions: userspace should decide what is acceptable or not.

Re-probing:

- Userspace should be notified about run-time failures and drive the re-"probe"
  mechanism
- If a camera (or any other leaf in the graph) fails and is attempted to be
  restarted all other devices in the graph should be "restarted" or at least
  informed about the re-probe
- In case of failure should the single component be reprobed or the full media
  graph should be reprobed?
  - Memory might be allocated by the master driver (the one that registered the
    notifier), should it be re-allocated on a full graph re-probe?
  - If the full graph is re-probed, other users might be affected (badly).
    Removing entities and MC device is dangerous in case of re-loading
    (un-binding/re-binding)
  - If an entity is registered, it should probably be not removed even during
    recovery. Even more sensible for devices with sub-devs and MC support. It
    should be OK for V4L2-only devices.
- unbind/rebind should work without crashing, if broken should be fixed in media.
  Note that many existing drivers aren't tested for this.
- On a probe failure, the driver will not register the entity in the media graph.
  Should it register the entity anyway and mark them "broken"?
  Media graph should not change during boots. Sakari noted that sometimes the
  entity registration depends on the device status and if that cannot be read,
  the media graph would anyway be different than the one on a "regular" probe.
- Probe errors can be re-attempted and the graph changed, while run-time errors
  should probably not change the graph.


Representing addition sensor processing stages (Jacopo Mondi)
-------------------------------------------------------------

Slides available at: https://nc.nibble.pw/s/oib8jzNjjtgB9c6

The V4L2 selection rectangles are documented in a fairly generic way. Camera sensor
drivers use them in different ways that are incompatible with the spec (in different
ways). It also interacts with size enumeration in driver-specific ways.

libcamera standardized how some selection targets need to be used by camera sensor
driver, but this isn't documented in the upstream kernel.

The CCS driver is the only one to implement the V4L2 subdev selection rectangles
correctly, but creates 2 or 3 subdevs as a result. This increases the complexity
both in the kernel and in userspace.

How do we improve this situation, to expose all these features in a standard way
for all sensors? Can this be made in a backward-compatible way? There has been
no consensus on this (mostly because no obviously good options exist).


A best effort implementation:

Enumerate sizes as multiple ranges of continuous intervals:

enum_framesize(0) -> no binning
- min = 1642x1234
- max = 3280x

enum_framesizes(1) -> bin 2x2
- min = ???
- max = ???

With a single subdev we can't represent the whole feature set of the sensor,
with multiple subdevs it's too complex for userspace.

libcamera + kernel helpers:

libcamera has a helper for working with camera sensors. This could be spun out
from libcamera with its API stabilised.

More selection targets:

More selection rectangles could be used to tell more information to the user
space. Binning and skipping may take place in different order. Needs to be told
to the user.

Another alternative is a new API to cover freely configurable and mode-based
drivers. Backwards compatible, and must not break freely configurable drivers
that now work well. This seems to be the way forward, Jacopo will work towards
this.


On-sensor temperature sensing (Dave Stevenson)
----------------------------------------------

Slides at: https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing

Options:

1) A new V4L2 control, limits can be reported by the control API. The unit
   should be standardized (milliCelcius was propoased by Ricardo). Multiple
   sensors can be represented through a control array.

2) HWMON. Won't allow for matching the values with the captured frames. But that
   may be better served by embedded data in the frame itself.

Made for hardware monitoring. The HWMON maintainers didn't consider that HWMON
is the only option, V4L2 controls would be OK with them.

Using HWMON would add the need to provide a link between the HWMON device and
the camera sensor.

Requires sensor drivers to use two APIs, makes maintenance more difficult.

3) Use CSI-2 embedded data. Simple, synchronization with frames.

Already there, if a platform can capture embedded data it will have temperature
for free. Not supported on all platforms.

4) Both V4L2 control and CSI-2 embedded metadata.

Yes, for different use cases. Platforms that can't capture embedded data will
use the control. There is likely no use case for perfect synchronization between
temperature reading and frames in that case.

Temperature sensing and output in embedded data can be enabled unconditionally,
we can add a V4L2 control to enable/disable it later if needed.

Power management: what do we do if the user reads the control and the sensor is
powered off? -EACCESS is proposed. Sakari said it means we have to start
streaming before reading the control. This can be an issue to tailor the noise
profile to the temperature before starting the stream.


Sensor synchronization (Dave Stevenson)
---------------------------------------

Configuration operation mode: from DT or from userspace?
Having the option of running standalone is useful to debugging, even if the main
use case on the platform is synchronized sensors. It can also be needed to switch
from wide angle to tele sensors when zooming: start with T in master mode, enable
W in slave mode, then switch to W in master mode.

Proposal: Add a new control to set the mode (standalone/master/slave)

The device tree should indicate if synchronized mode is possible.

Where is the mode validated? What if userspace wants to switch between
master A / slave B and slave A / master B? I.e. what happens if two sensors are
in master mode at the same time? This must not lead to HW failures.

See also CCS Special Actuator Strobe (16.3 in CCS 1.1).


Additional sensor signals (Dave Stevenson)
------------------------------------------

Flash triggers, OIS triggers, H/V sync signals, ... Hardcoding the function
of pins in the driver restricts use cases, and results in out-of-tree patches
being required.

Controllable from userspace? Set in DT? Using pinctrl/pinmux/GPIO frameworks?

General discussion around what use cases are envisaged and what can be achieved.
DT is the most logical place to configure this, most likely via pinctrl.
Discussion needs to be had with DT maintainers as to what is acceptable to them.
Dave to put together a proposal and start that discussion.


Lens assemblies (Dave Stevenson)
--------------------------------

Only the VCM driver IC is specified in DT at the moment. Where do we get all the
other information from?

Camera module identification will always be needed, as some parameters have to
be looked up in userspace databases (tuning files, ...). What are proper
identifiers?

In addition, do we then also add some lens-related module parameters in DT or
in NVM? If so, which ones, and can we standardize them?

The approach should be based on module identification. Lens or spring models
are generally unknown. Module composition also plays a role. So put the
(or 'a') name in the DT to identify the lens assembly.


Reconcile handling of regulator, gpios and clock on OF and ACPI platforms (Jacopo Mondi)
----------------------------------------------------------------------------------------

Which of the OF or ACPI power handling is right? We can't change the OF
behaviour to power up the device before calling probe() as the platform doesn't
know how to power up the device, only the driver has that knowledge. We could
only modify ACPI to not power up the device.

Driver implementation of power sequences and resources is also needed in ACPI
systems if the ACPI implementation does not handle this through power
resources/_PSx methods.

ACPI has a D0 waiveing mechanism, to avoid flashing the privacy light at boot
time. This requires support in the ACPI tables. This could be extended to cover
more use cases, but then the meaning of the D0 waiveing flag changes.

Runtime PM may not always be available. Drivers that don't get probed with the
device powered on would need to call ACPI-specific functions to power it up.
Laurent doesn't want camera sensor drivers to deal with ACPI- or OF-specific
functions. Sakari agrees we should put that in some other layer. This being
said, disabling runtime PM (CONFIG_PM) doesn't make much sense for cameras.
Should V4L2 depend on CONFIG_PM? Sakari suggested even dropping CONFIG_PM
from the kernel. Runtime PM seems to be controllable from userspace,
allowing disabling it at runtime.

What would be needed, at least:

- DT support for waiving powering on a device in probe
- Turn ACPI D0 waive power flag into a more generic "don't power on for probe"
  flag, set for new drivers: start with V4L2 sub-device sensor drivers
- Runtime PM helper functions for doing common tasks instead of relying on
  multiple runtime PM functions to achieve this
- Refactor an example driver's probe to come up with simple example power
  management sample code that does it right in all combinations


Merging streams support (Laurent Pinchart)
------------------------------------------

Using the route source flag is seen fine. Maybe rename as "internal source" flag?
Can link validation catch wrongly set route source flag? Just a check. It doesn't
absolutely have to.

Two kinds of devices:
- Camera sensors (e.g.) have fixed routes
- CSI-2 receivers and crossbar switches have freely configurable routes

Some devices are expected to be somewhere in between, but there are likely
few of these. There is not necessarily a need to come up with a way to
differentiate between these before upstreaming.

Setting routing using S_ROUTING removes existing routes (where they are not fixed).
Sensor driver selects data types based on formats selected.
Streams are global but stream IDs are link-local, across the link.
Routing may be configured to direct the same streams to multiple locations if the
hardware allows.
Virtual channels could be put into DT in case that a CSI-2 aggregator requires
different virtual channels from camera sensors connected to it:
- Usually VCs are specific to a given link only
- Virtual channels nor data types are exposed to the user space


Intent to add new V4L2 extensions (Ricardo Ribalda)
---------------------------------------------------

Ricardo announced that a vendor is working in adding new features into v4l2
and asked if there were anyone interested in helping out, or has an early
objection. Features being:
- Enqueue multiple buffers with a single ioctl
- Support dynamic video node format while streaming
- Increase max number of video devices above the current 256 limit
- Increase the max number of vb2 buffers above the current 32 limit

No objections, it's important to work with the community early to make sure
the right approach is taken.
