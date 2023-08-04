Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA91277025D
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 15:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjHDN53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 09:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjHDN51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 09:57:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A47CB1
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 06:57:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D345861FA3
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 13:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13F3C433C8
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 13:57:22 +0000 (UTC)
Message-ID: <4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl>
Date:   Fri, 4 Aug 2023 15:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Report of the Media Summit 2023, June 26th, Prague
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is the report of the Media Summit 2023 which was held in Prague on June 26th
(with some additional discussions on June 27th).

Enjoy!

	Hans

Media Summit 2023 - June 26th, Prague
=====================================

Attendees
---------

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
Deborah Brouwer <deborah.brouwer@collabora.com> (Collabora)
Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
Martin Hecht <martin.hecht@avnet.eu> (Avnet Silica)
Jai Luthra <j-luthra@ti.com> (TI)
Tommaso Merciai <tomm.merciai@gmail.com> (Avnet Silica)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Michael Roeder <michael.roeder@avnet.eu> (Avnet Silica)
Niklas Söderlund <niklas.soderlund@ragnatech.se> (Ragnatech)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Chen-Yu Tsai <wens@kernel.org>
Martin Tůma <tumic@gpxsee.org> (Digiteq Automotive)
Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas On Board)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (AllegroDVT)
Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)

Remote attendees
----------------

Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
Hsia-Jun Li <Randy.Li@synaptics.com> (Synaptics)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
Devarsh Thakkar <devarsht@ti.com> (TI)


Daniel Almeida: Rust V4L2 support
---------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Daniel%20Almeida%20-%20Rust%20in%20V4L2.pdf

The goal of this topic was to look into low-risk integration of Rust support
into the media subsystem and discuss maintainership.

Rust is a modern language with better memory safety, and provides easier
ergonomics for handling data types as a sub-set of the Rust standard library
is present in the kernel.

Currently available: POD types, vb2 abstraction, some IOCTLs, probing.

The current patchset adds support for a sub-set of V4L2.

See the presentation for more details.

The current development is an investment, current code very tied to the C code,
building frameworks in Rust might be most beneficial.

Current low hanging fruit for Rust work: writing libraries and parsers for codec
drivers in Rust and also codec specific logic.

Note that we only need Rust abstraction for actual use cases, not for everything
that exists today.

One suggestion was to add an experimental child subsystem for Rust code.

Open questions:

What happens if the C API is changed and breaks the Rust bindings? Does this
delay the C work since the Rust code will not compile anymore?

It was noted that lifetime management issues often originate in C code and
should be addressed there.

There were no major objections against Rust code for the media subsystem, but
not until the media maintenance issues are resolved. There also needs to be at
least one other developer with Rust knowledge so there is a backup for Daniel
in case there are urgent Rust issues and Daniel is not available.


Hsia-Jun (Randy) Li: V4L2 M2M EXT API enhancement
-------------------------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf

Hsia-Jun Li presented several open issues related to codecs and the M2M API.
Unfortunately, due to poor audio for the remote presenter, it was often hard to
follow.


Hans Verkuil: Extended format and buffer handling
-------------------------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hans%20Verkuil%20-%20Extend%20Format%20and%20Streaming%20uAPI.pdf

For some years now a proposal for extended format and buffer handling
has been floating around. This attempts to simplify single/multiplane
differences in the API, making it easier for userspace to implement.

This API adds new pixelformat and buffer IOCTLs. The new pixelformat
adds support for the DRM modifier. The new v4l2_ext_buffer struct
adds an offset field, making it easier to allow planes to start at
different offsets, without requiring a new pixelformat.

The new buffer ioctls should probably not support USERPTR anymore.
But a translation layer is needed for both ways (old uAPI to new kAPI,
or vice versa), at least a best effort.

Mauro suggested that both the offset and sizeimage fields in the new
struct should be 64 bit integers.

Finally Hans noted that VIDIOC_CREATE_BUFS is over engineered since only
the sizeimage field of struct v4l2_format is used. While developing the new
VIDIOC_DELETE_BUF, a new EXT_CREATE_BUFS (or something like that) might be
a good idea. This probably requires an RFC.


Andrzej Pietrasiewicz: Stateless Encoders: VP8
----------------------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Andrzej%20Pietrasiewicz%20-%20Stateless%20Encoders%20-%20VP8.pdf

Are there more stateless VP8 encoders? The VP8 IP was made public by Google.
The assumption is that all VP8 encoders use that IP block.

The requirement is that a stateless encoder for a specific codec should be
implemented for two different SoCs, but currently we only have Rockchip.

Hans suggested that if no second hardware platform is available to develop
a VP8 encoder on, then look into, for example, existing Android code for
other platforms to verify that they took a similar approach and that indeed
there most likely exists only a single kind of VP8 encoding hardware, all
based on Google's IP. If so, then the requirement that there must be an
implementation for at least two HW platforms can be waived.

Where should the frame header be constructed: user space or kernel?
Example: the hardware counts the number of occurrences of symbols but user-space
calculates the probability rate. Currently the strategy is to assemble this in
the kernel for VP8. This decision may be different for different codecs, but
probably VP9 and AV1 would need the same approach due to their similarities to
VP8.

Should the QP range be specified in codec spec uAPI? The general consensus is
that the uAPI should follow the codec standard, and drivers have to translate
if required.

Rate control can either be done by hardware, by userspace, or by a kernel
rate control algorithm (would be generic and codec independent). There was
some discussion on whether it is desirable to have a generic rate control
algorithm in the kernel, and it would depend (at least in part) on the
amount of code this would take.

There was also a discussion about potential patent issues with VP8 (note
that VP8 is supposed to be patent free) and encoder features. Mauro brought up
maybe loading code via BPF when there are patent issues. It's an interesting
idea, but not clear how workable this would be.


Ricardo Ribalda Delgado: KCAM update
------------------------------------

A functional IPU6 PSYS driver using KCAM was completed as PoC.
The driver performs as well as the original driver from Intel and is feature
complete for the ChromeOS use-case.

Now starting to work on userspace, hopefully using libcamera, so it could be
used by any distro.

Proprietary implementation is still supported, and that would not be acceptable
for upstreaming as discussed during last year's media summit.

KCAM is limiting their scope to ISPs now (in IPU6 terminology this means, PSYS
support, but no ISYS support).

Ricardo reported that the industry is changing their roadmap, there is less
economic space to make big investments on complex cameras for notebooks, on the
other hand there is more interest to add advanced features to UVC.

ChromeOS wants to add support to publicly documented XUs to the UVC driver.
No objections.

ChromeOS asked about the possibility to add tools to v4l-utils in Rust: no
objection, but a warning about build system (cargo vs meson), so integrating
this might not be trivial.

ChromeOS asked if there is any requirement on what Rust bindings for media uAPI
to use. Either linuxtv repo or an external will work. The benefit of using
linuxtv is that we will be in sync with the kernel, benefit of external is that
we can use their CI/CD. ChromeOS will sync with Daniel.

ChromeOS asked about the possibility to add ftrace support for dev_debug.
No objections.


Sakari Ailus: line-based metadata and internal pads
---------------------------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Sakari%20Ailus%20-%20Generic%20line-based%20metadata.pdf

This is vendor specific embedded metadata which is provided in the beginning of
a frame to simplify negotiation of the pipeline.

A common use case for line based generic metadata and internal pads are
supporting camera sensor embedded data, but others exist, such as camera
sensor produced statistics. Both API additions are necessary for supporting
such use case.

It was requested to have better documentation and examples, especially
which ioctls should be used to configure such a pipeline.


Hans Verkuil: Media Summit: What Worked, What Didn't?
-----------------------------------------------------

Presentation:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hans%20Verkuil%20-%20Media%20Summit%20-%20What%20Worked,%20What%20Didn't%20Work.pdf

Currently the Media Summit is co-located with the Embedded Linux Conference.
Next year this is in the US only.

Since most of the media developers live in Europe, there was little interest in
co-locating with US conferences. Instead the suggestion was to co-locate with
the Embedded Recipes or GStreamer conferences next year. GStreamer would be the
best option.

There was a lot of interest in the Media Summit, so for next year we aim for
up to 30 people. But we want to limit it to that to keep the discussions
focused. It's a summit meeting for the active media developers, it is not a
conference.

Remote attendance wasn't a great success: the webcam microphone wasn't good
enough for the room. Last year's room was smaller and the webcam could handle
it well enough, but it wasn't good enough for this larger room and for the
larger number of people that were in the room.

Fund audio equipment for the next summit? Pay to attend the conference? With an
enthusiast/student free ticket available?

Or no remote attendance but recording with better equipment. Note that recording
has the same problem with microphones.

To do a proper job you would need a lot more and better equipment and be able
to get in the room the day before to install everything. This meeting is
primarily meant for the most active media devs to meet up in person once a
year. I will probably not organize remote attendance support next year.


Mauro & sub-maintainers: Subsystem development process
------------------------------------------------------

Presentations:

https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Sakari%20Ailus%20-%20Media%20tree%20maintenance.pdf
https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hans%20Verkuil%20-%20Daily%20Build%20Scripts.pdf

This was split over two days: the afternoon of June 26th and 27th.

This discusses the problems we have maintaining the media subsystem.

It's becoming harder and harder to keep up with the flow of patches by the maintainers
of the media subsystem: at the core it is basically a matter of too many patches and
not enough maintainers.

It became critical after this mail from Linus:

https://lore.kernel.org/all/CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com/

(luckily he didn't go through with his threat of not taking in any new media code...)

We decided to use this media summit to discuss the problem and see how we
can get more reviewers and committers and how to improve the process in
general.

Since the discussions were wide-ranging I decided to condense it and group it
into several topics.

Media tree and the DRM model
----------------------------

The DRM subsystem has a much larger pool of trusted committers. Would it be
possible to move to a similar system? The general experience in the DRM
subsystem is that it works very well: if someone receives committer rights,
they tend to be extra careful about what they do in order to not abuse that
privilege. There is a mechanism in place how to address abuse: in that case
all committers from that company have their committer rights taken away.

One advantage that DRM has is that they invested in a lot of tooling that
runs patches through many tests.

They are also better at community building.

Provided we can get better tooling in place, then it should be possible to
increase the number of committers. We found a group of 15+ people we would
be happy to grant commit rights to. Requirements for being invited as a
new committer would be a proven understanding of the kernel development
process, good reviewing skills, actively contributing for some time, and
'gut feeling'.

So there is a lot of potential here.

We also asked if someone would be willing to become one of the core
maintainers to help reduce our workload. Sebastian Fricke from Collabora
offered to help out as codec maintainer. Much appreciated!


Process improvements
--------------------

One of the problems is that it can be hard to find the bug fixes. One easy
bit of low-hanging fruit was to have patchwork detect tags: Acked-by, Closed,
Fixed, Reviewed-by and Tested-by. This makes it easier to see which patches
have a Fixed tag. Mauro added this.

Another suggestion was to send an email to people who post a patch to linux-media
for the first time with information on how to test your patches, and what the
media maintainer process is. And of course review and update our existing
documentation:

https://www.kernel.org/doc/html/latest/driver-api/media/maintainer-entry-profile.html

We also discussed briefly how to remove maintainer entries. Sometimes maintainers
leave the subsystem, but there is no process in place to handle that. I.e. at
what point in time do you consider a maintainer as 'inactive' and how to ensure
that it is OK to drop the maintainer entry? We need a procedure for that.

A major problem is that patch reviews are often very delayed in the media subsystem.
Part of it is lack of reviewers.

There are two main categories of patches: patches that fix something, and patch series
adding new features.

The first category is easy to review, but there are a lot of those and it adds up.
In addition, in my experience 30-40% of those patches are bad in one way or another,
so you can't skip the review process.

The second category is very time consuming: a proper review can easily take up
4 hours of your time. Especially reviewing core changes are hard to do.

One idea to reduce the workload of the 'Fixes' category is to perhaps create
a weekly list of such patches that can then be reviewed by others. This will also
be an opportunity for people to get review experience. Hans will set up a trial
run for this.


Tooling
-------

If we want to support more committers, then we need better tooling.

Part of that is improving patchwork: we need an audit trail of who
changed the state of patches. Mauro will see if this is something
the Linux Foundation can find an intern for to look at.

The other part is creating a consistent set of build scripts that
anyone can run, either locally or (with assistance from someone
to set it up) in the cloud.

In addition, the same tests should be run once patches are committed
('trust, but verify') by jenkins, or, even better, *before* the patches
are committed.

Hans will take his build scripts that are used for both the daily
build and for his own testing and turn them into something that
everyone can use. We'll see if that can be the base for the tests.
One nice feature is that it can also do regression tests using a
VM and the virtual drivers (vivid et al) and the compliance tests.

This should be compulsory whenever the public API is changed to
ensure no bugs are introduced. A full regression test takes around
27 minutes. Without the CEC tests it is 20 minutes. Note that uAPI
changes must always be reviewed by core maintainers.

Update: the build scripts rework is mostly done (some more cleanup
is still required). A standard build (./build.sh -test all) takes
25 minutes on my 8 core AMD Ryzen 9 6900HX system, it takes 20
minutes on a 16 core AMD Ryzen 9 7950X and 8 minutes on a 64 core
AMD Ryzen Threadripper 3990X.

Ricardo wanted to have a mailinglist for CI/CD: a new linuxtv-ci
mailinglist was created for this.

An open issue is who is willing to set up such an environment?
There will be a follow-up meeting about this on July 18th.
Options are gitlab or asking freedesktop.org.


Two top-level maintainers
-------------------------

The consensus is that it would be better if there are two top-level
maintainers instead of just Mauro. But this only works if the
second maintainer is actively sharing the workload. Perhaps alternating
who handles each kernel release?

Hans offered to be that second maintainer once we moved to the new
committer model and (hopefully) his workload is reduced.
