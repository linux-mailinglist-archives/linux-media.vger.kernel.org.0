Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA48E60716A
	for <lists+linux-media@lfdr.de>; Fri, 21 Oct 2022 09:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJUHtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Oct 2022 03:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJUHtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Oct 2022 03:49:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DE22EF1F
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 00:49:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A83A1B80B3C
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 07:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9A9C433C1
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 07:49:29 +0000 (UTC)
Message-ID: <17ddf7de-74c1-ab34-fc82-e05d52104c88@xs4all.nl>
Date:   Fri, 21 Oct 2022 09:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Report of the Kernel CAM topic (Media Mini Summit Dublin - Sep
 12+13, 2022)
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The original Media Mini Summit report can be found here:

https://lore.kernel.org/linux-media/02ad4845-d7d8-d95c-ae7e-3229f1dc86b3@xs4all.nl/T/#u

It mentioned that the report about the Kernel CAM topic would be posted later, so
I'm pleased to finally post that. Thanks to all who participated in the meetings
and the reviewing of this report.


Kernel CAM (Ricardo Ribalda)
============================

Slides at https://drive.google.com/file/d/1Tew21xeKmFlQ7dQxMcIYqybVuQL7La1a/view

Kernel Recipes talk about Kernel CAM:

https://kernel-recipes.org/en/2022/talks/rethinking-the-kernel-camera-framework/

This discussion spanned two days: Monday morning on September 16th as part of
the Media Mini-Summit Dublin, followed by another meeting in a smaller group on
Tuesday morning. Many thanks to Google for organizing a room for us on Tuesday.

On Monday morning the discussion was specifically around the Kernel CAM proposal,
on Tuesday morning the discussion was more about how to proceed. This report
attempts to capture the discussions of those two days, but does not necessarily
reflect any final agreement between the parties involved.

The report ends with two final comments from myself as submaintainer of the media
subsystem (V4L2 in particular), and Mauro as maintainer of the media subsystem.


Attendees
---------

Sakari Ailus <sakari.ailus@linux.intel.com>
Kieran Bingham <kieran.bingham@ideasonboard.com>
Mauro Carvalho Chehab <mchehab@kernel.org> (Remote, Monday only)
Nicolas Dufresne <nicolas@ndufresne.ca>
Hugues Fruchet <hugues.fruchet@st.com>
Benjamin Gaignard <benjamin.gaignard@collabora.com>
Jacopo Mondi <jacopo@jmondi.org>
Benjamin MUGNIER <benjamin.mugnier@foss.st.com> (Remote, Monday only)
Michael Olbrich <m.olbrich@pengutronix.de>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Ricardo Ribalda <ribalda@chromium.org>
Maxime Ripard <maxime@cerno.tech> (Monday only)
Daniel Scally <djrscally@gmail.com> (Monday only)
Jernej Škrabec <jernej.skrabec@gmail.com> (Monday only)
Niklas Söderlund <niklas.soderlund@ragnatech.se> (Monday only)
Dave Stevenson <dave.stevenson@raspberrypi.com>
Michael Tretter <m.tretter@pengutronix.de> (Monday only)
Chen-Yu Tsai <wenst@chromium.org> (Monday only)
Hans Verkuil <hverkuil@xs4all.nl>


Monday
------

In Android, the vendor is responsible for implementation, between hardware and
Android camera HAL you can have anything (e.g. user space drivers).

ChromeOS currently supports several SoC vendors (Mediatek, Rockchip, Intel,
Qualcomm, more to come) and expects that the kernel code is upstream.

Documenting ISP algorithm parameters reveals information from image processing
step internal implementation and vendors are not willing to do so.

Can a driver be in upstream while being only usable by the original vendor?
Even if it offers enough functionality to be used by anyone and only leaves
un-documented a small percentage of advanced features?

Vendors may be unwilling to reveal tuning parameters they use.

Documentation requirements + difficulty in getting new features accepted to
V4L2 are the (main?) reasons for downstream V4L2-alike drivers.

Maxime notes that the slide about Vendors' Complaints has the same arguments
used by GPU vendors against upstreaming drivers.

API documentation is required for upstreaming.

ISPs have traditionally been a pain point upstream-wise. There is more push
to get these in upstream due to ChromeOS upstreaming requirement, and due to
user-visible problems (e.g. IPU6). Also laptop vendors are unhappy with no
upstream driver support for their computers.

V4L2 more a technically limiting factor than before, e.g. 96 DMAs in one ISP.

Nicolas and Hans noted that downsteam GPL drivers are fine. Upstreaming a
driver requires opening up the driver interfaces. There appears to be
near-unanimous consensus on this (apart from Ricardo).

Ricardo said that he rather have a driver that supports all the standard
use-cases than no driver at all. He is ok giving access to the vendor to the
"advanced" cores for a proprietary userspace, if that core has no access to
memory.

If a vendor wishes to upstream a driver with partial functionality, that's fine.
A downstream variant of this driver may support more functionality (that is not
documented).

Ricardo's preference would be to document only certain basic features and leave
the rest undocumented.

Vendors need to plan for upstreaming and understand requirements of getting
drivers to upstream. Implementing Android camera HAL API 3 full profile entirely
possible using V4L2.

The Request API is not very helpful here, not used by ISP drivers.

What developments API-wise do we expect in this area? Nokia FCAM and then
Android camera HAL 3 introduced the concept of a request that binds the frame
and the parameters. No major new developments since that, in almost 10 years.

Minor changes:
- Changing parameters from registers to buffers
- New pixel formats

If a new API for ISPs that is upstream would be developed, then that would be
what we use for the next two decades.

Sakari: V4L2 is not an impossible API for IPU6, just a  poor one.
Hans: V4L2 could be amended with support for disconnecting relation with
      DMAs and video devices. I.e., doing this directly through the media
      controller instead of having to deal with zillions of device nodes.
Mauro: discussion with vendors' ISP teams would be useful.

A short discussion of the proposed Kernel CAM API followed:
- 3 concepts:
  * Entities: represent a hardware node and have: properties and
    events. Properties do not need to map hardware registers 1:1.
  * Operation: A set of read and write to an entity. Multiple can be
    queued at the same time and can be scheduled after one or more
    triggers: Events, Fences, Operation Completion, timers
  * Single device node, /dev/cam, to control all the entities to queue
    operation and get the response from them.

  More information in the presentation linked to at the top.
- The interface looks like a register address space
  - Per-driver interface
  - These registers do not necessary map to hardware registers
- Hans: This will not go upstream if it allows vendor-only access to parts of
  the hardware.
- Many newer ISPs have firmware the driver talks to
- Plan to support real hardware soon
- In an offline discussion Mauro noted that 'CAM' is used in DVB where it
  stands for "Conditional Access Module", and so "Kernel CAM" is something
  that should be renamed if we decide to continue with this.


Some conclusions from this discussion
-------------------------------------

Everyone agrees that the current V4L2 API is not very suitable for the current
generation of ISPs: it is too cumbersome. We would be happy to work with
ChromeOS and/or vendors to attempt to improve it.

The proposed Kernel CAM API is considered much too vague to comment on.
An example driver for real hardware will be needed first.

A register level interface is too low level interface for a complex
kernel driver. A number of newer ISPs implement a (slightly) higher
level message-passing interface towards software rather than
something that would provide more direct control of hardware such
as what traditionally is meant by a register interface.

For upstreaming ISP drivers (regardless of the API used), multiple options
have been discussed, without any decision made yet regarding which options
would be accepted by the community:

1) A fully open source upstream driver. Does require opening up hardware access
   and documenting the API, but not the algorithms used to configure the HW
   optimally, those can remain closed. However, enough information must be
   available so an open source implementation can be made. Firmware may be
   used for low level control of the hardware.

2) A basic upstream driver that gives a reasonable quality picture. The BSP
   can be used if the vendor-specific camera control algorithms are needed
   to improve quality. The BSP would add those missing pieces to the upstream
   basic driver.

3) The upstream driver talks to vendor-provided firmware instead of directly
   to the hardware: the camera control algorithms are in the FW under control of
   the vendor. This does lock in the hardware to a specific use-case, optimized
   for in the FW.

4) As an alternative of fully documenting the driver API, an Open Source
   user space implementation can be provided. The driver UAPI needs to be
   more or less fully used and in practice this would involve libcamera.
   Note that this would be similar to DRM requirements; V4L2/MC are effectively
   not an application API for these devices. (This isn't meant to be seen as a
   fully articulated list of requirements as that part wasn't discussed in the
   meeting.)

And of course, if no agreement can be reached on any of the options above,
then we can keep everything out-of-tree.


Tuesday
-------

The main focus on the second day was on identifying the main painpoints and
agree on a list of requirements that any new A{O should fulfill.

## Problems with existing V4L2-based camera stacks

Ricardo initially went through the problems that vendors and ChromeOS
is having with V4L2:

### Problems from vendors

Vendors want to be able to use a kernel API that is respectful of their IP:
   * Protect investment
   * Licencing is simple
   * Do not have to release their 3A algorithms (external algorithms)
   * Do not have to release how their imaging blocks are implemented
     (internal algorithms)

Today the upstream community allows vendors to ship a closed source
implementation of 3A algorithms, provided that an open source
implementation can also be made. There are no plans to change this
policy.

Vendors want to leverage their investment in Android. And V4L2 does
not map 1:1 with HAL3.

### Problems from Chrome OS

ChromeOS has a Upstream First commitment, but also wants to enable as
much hardware as possible to as many users as possible.
ChromeOS has provided a lot of resources in the past to upstream
vendor code, but this is not scalable and cannot be done at the speed
that is required by the market.

Today downstream drivers can access features not available to the
open-source stack. ChromeOS thinks that there should be a mechanism
to access vendor features on the open-source stack assuming that
the open source stack is feature complete.

## Looking at the future

We listed a set of requirements that a kernel API should have
to support ISP based cameras. The goal is not to replace V4L2 for
every single type of device.

* Allowing different application-facing APIs to be built on top of
  the stack, e.g.:
  - libcamera
  - Android
  - Industrial APIs

* The kernel API shouldn't be designed as an application API, but
  require a middleware (e.g. Mesa for graphics, libcamera)

* Vendors must be involved
  * Vendors work (with) upstream

* IP protection
  * It's a vendor requirement, no particular requirement from Chrome OS

* Overhead of the API should be low
  * Limiting the number of context switches or system calls

* Flexible memory management (alloc/free individual buffers at
  runtime, buffers of different sizes, ...)
  * Separating management of buffers from configuration of the device
  * Support interoperability with other devices (codecs, display,
    accelerators, ...)
  * Memory buffer constraints (possibly using the Unix Device
    Memory Allocator, if it ever gets finalized)
  * dmabuf
  * Fences

* Atomic actions

* Security with an untrusted userspace
  * No access to foreign memory
  * No ill side-effects on any part of the system outside of the
    camera pipeline
  * No physical damage to the hardware
  * Can lock up the camera but needs to be recoverable by
    software using the camera API only
  * Images can be corrupted, that is accepted

* IP disclosure
  * Every driver upstream must be posted with an open-source
    userspace that showcases the API, in libcamera, Android camera HAL or
    another Camera Stack released under an open source license. This must
    be compilable and testable by the community on available hardware using
    only open-source software (e.g. if the implementation targets Android,
    it would need to be compilable and testable on a device using AOSP, not
    a vendor binary Android release).
  * The open-source user space can have closed-source 3A algorithms,
    but it must be possible to develop an open-source implementation
    of the 3A algorithms that has access to the exact same device features
    as the closed-source version.
  * Closed-source userspace is supported, with the limitation that
    it has access to the same features as the open-source userspace.

* Modularity of components in the camera pipeline
  * Camera sensor drivers must interoperate with any ISP driver that
    supports the same camera sensor bus.


Final comments from Hans and Mauro
==================================

These comments are added to clearly state the view of us as media
maintainers.

Hans (as media submaintainer):

It is *not* an option to upstream a driver that has support for
undocumented closed features. Basically maintainers can't put their name
on something that contains unverifiable (for them) and unusable (by all
except the vendor) features.

Mauro (as media maintainer):

My view as media maintainer is similar to Hans: the non-firmware
code required for the camera to work (either Kernelspace or userspace)
should be open-sourced, up to the point that video streams/images
are properly captured on a non-proprietary video output format,
in a way that it would be possible to use open-source implementations 
of 3A algorithms if someone is willing to do that.

So, registers used for image enhancement and meta-data should be 
properly documented. This is specially important since, usually,
chipset maintainers stop implementing features when newer generations
of the hardware arrive, keeping users of the (not so) old hardware
without decent support. With proper documentation, if enough developers
want to keep their hardware working, they could implement their
replacement code to the proprietary code if needed.
