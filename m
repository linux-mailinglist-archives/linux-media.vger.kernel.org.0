Return-Path: <linux-media+bounces-20088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE739AC2F6
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0798B22BC5
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F30216C69F;
	Wed, 23 Oct 2024 09:08:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8852381BA
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674479; cv=none; b=ecousrUwjFls56Rn5lY+zfylYf6rRGL45+vu9nejUVx18aAQaD8ZSuG1gTbwMLd1jIXbxHfk0rBILlJykaRn3cgj3P1JNViMCwOi5kkB3xmCygp2J2K7zJx9R9EAs33CHofYfJAvhQQXhVxcpqMY5Zzo5gdLlXjS7MVElO5ZVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674479; c=relaxed/simple;
	bh=0/RqOuedNfGxhS5oixAV1c3dLDDXdg8q0HQVnNJZhRI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=TaK6aM4jIU4PhoebxpPr8FI3WtoIodv4OjHjCXuXYaIEP/EanKO0qWGBnkSF6bDQq/nTzF6znYTyJVg66rMsCjMrufiSju0vXqK620XJ/oYjFBvNVAEFkbXIsdpPE7WvB14B6fumzKNo+GgP4B79CLNUV0TAR6ueWRDs4K5Qjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C9AC4CEC6;
	Wed, 23 Oct 2024 09:07:54 +0000 (UTC)
Message-ID: <45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl>
Date: Wed, 23 Oct 2024 11:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Media Summit 2024 Report
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

Below is the report of the Media Summit 2024.

I fully admit that this is mostly a cleaned up version of the etherpad notes.
In fairness, I think the etherpad notes were pretty good this time. Many thanks
to all who kept etherpad up to date during the discussions!

Regards,

	Hans

===========================================================

Report of the Linux Media Summit Vienna, 16 September 2024

Present in person:
	Sakari Ailus (Intel)
	Daniel Almeida (Collabora)
	Salahaldeen Altous (Leica Camera AG)
	Mauro Carvalho Chehab (Huawei, Media Kernel Maintainer)
	Steve Cho (Google)
	Sebastian Fricke (Collabora)
	Martin Hecht (Avnet)
	Tommaso Merciai (Avnet)
	Jacopo Mondi (Ideas On Board)
	Benjamin Mugnier (ST Electronics)
	Laurent Pinchart (Ideas On Board)
	Ricardo Ribalda (Google)
	Michael Tretter (Pengutronix)
	Suresh Vankadara (Qualcomm)
	Hans Verkuil (Cisco Systems Norway)
	Alain Volmat (ST Electronics)
	Sean Young
	Jerry W Hu (Intel)

Present remotely:
	Kieran Bingham (Ideas on Board)
	Mehdi Djait (Intel)
	Rishikesh Donadkar (TI)
	Nicolas Dufresne (Collabora)
	Paul Elder (Ideas on Board)
	Tomasz Figa (Google)
	Stefan Klug (Ideas on Board)
	Hidenori Kobayashi (Google)
	Dave Stevenson (Raspberry Pi)
	Devarsh Thakkar (TI)

Many thanks to Avnet for hosting this meeting in their office, and for
Cisco and Ideas on Board for sponsoring the lunch.

--------------------------------------------------------------------------

Topic: Multi-committer model using gitlab
Presenter: Ricardo Ribalda
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Multi-Committer.pdf

We now have a shiny new Media CI in place, so we can start the next phase:
introducing a multi-committer model.

The media CI just implemented the patchwork integration as well: patch series
are automatically compiled in media CI and the results are added to patchwork.
No opt-in/opt-out for automatic test via patchwork bot planned for now.

Initially, the plan is to close the committer tree between rc6 and rc1 for now,
that might change later.

- Hierarchy for committers planned:
  - Subsystem maintainers (Merge branches directly, accept userspace ABI changes,
    review changes to the tests, send to Linus, promote/demote committers, handle
    whitelist/blacklist, allowed to by-pass CI)
  - Core committers (committer that can change media core frameworks but not userspace ABI)
  - Committers (prepares MRs, create tooling for the process, add to allowlist,
    fix warnings, monthly committer meeting, keep patchwork up-to-date, cannot
    send patches to change core files, cannot send fixes for the current rcX, add
    link to commits from b4, patches have to be reviewed by at least one other
    committer, if any committer disapproves the patch then the patch must go through
    a higher hierarchy (only subsystem maintainers?))
  - Contributors (normal user posting to mailing list, allowed to use the tree: e.g.
    test their patches in advance allowing them to increase the test-scope in
    comparison to the tests done by the patchwork bot)

- All committers shall update patchwork status. Automation may help, but the
  responsibility is for committers to keep it updated.
- Concern by Laurent having a requirement of at least 2 committers makes merging
  to the tree very hard. Jacopo: what if there are not even two committers for a
  part of the subsystem?
  - Reaction by others: Should push motivation for better review
  - Two committers required includes the author.

- Concern by Mauro: Security issue by overloading the CI? Reserving 50% for
  subsystem-wide checks
  - Suresh Vankadara: To avoid overload CI system, if there is a possibility to
    run these test patches in advance at local systems it reduces load to post
    multiple patches based on results and also these will be addressed ahead of time.

- Fixes are currently not planned to go through the multi-committer tree
  - Laurent has fixes and next and current in the same tree to have a better overview
    for the user

- Process of becoming a committer: has to be proposed by another, good contribution record,
  must have been met in person, key signed by another committer, sign the committer agreement
  (with GPG key? Laurent: that doesn't improve trust requirement), send welcome message to ML
  and add name to committers.txt
- Subsystem maintainers can demote any committer at any time, people can demote themselves
  if they feel pressured or if they retire (Laurent: people should notify us first privately
  if under pressure), after about 1 year without commits a notification is sent to the committer
  before disabling commit rights.

- Question by Jacopo: Is there a way to prepare the cover letter by the CI system with
  the v4l2-compliance output? Hans: decide later, not a problem for now
- Suggestion by Mauro: run tests on hardware via KernelCI. To be discussed offline with
  interested parties to sponsor it. AVnet suggestion to provide access to their hardware.

TODO:
- Change CSS for patchwork test result report to make it more readable
- Send mail to the author when the automatic test run (over patchwork bot) has been completed
- Send automatic patches to maintainers for specific paths (suggestion by Hans)
  (Comment by Laurent: Use lei for that?)
- Laurent: Write part about lei for the report of the event
- Define committers agreement (as soon as possible, but we may start with core maintainers
  without that)
  - Mauro: if we start without agreements, committers/core-committers need to be aware
    that, once the agreement is defined, they'll need to formally accept them if they want
    to keep commit rights.
- Add Stanimir and Hans de Goede to committer list
- Bot to validate the committer list to notify the subsystem maintainers when someone hasn't
  done anything for a long time
- media-share.git / media-committers.git / media.git as name for the tree (it became
  media-committers)

--------------------------------------------------------------------------

Topic: Multi-context support in V4L2
Presenter: Jacopo Mondi
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Multi-Context.pdf

- RFC sent to ML:
  https://lore.kernel.org/linux-media/20240913214657.1502838-1-jacopo.mondi@ideasonboard.com/
- Background: some ISPs are time-multiplexed devices, some just process tiles instead
  of handling camera streams, multiplex different outputs from cameras after one another
- Introducing contexts, generalized version of v4l2-m2m contexts, isolated at the process
  level (media entity context (stores list of media entities and is refcounted), media device
  context (containing the topology), video device context, v4l2 subdev context)
- BIND_CONTEXT IOCTL to bind a context to a video file handle
- Adding context identifier to IOCTL? Mauro: Need error code if you try to bind to many contexts
- Multi context already available for codecs which are bound to the video device, which becomes
  ambiguous to this
- Multiplexing means moving the videobuf2 queue to the device context from the device
- Suresh Vankadara: considering priority among context in UAPI helps for drivers to prioritize.
- Nicolas: For codecs the multi context model needs to implicitly create multiple contexts
- Suresh Vankadara: is there a possibility to have 3 processes (2 follows multi context model
  and another in older model)? Yes, legacy will automatically use the default context

TODO:
- Write tests to make sure that an arbitrary order of opening media and video devices work
- Subdevs need to be made context aware

--------------------------------------------------------------------------

Current state of videobuf2, its limitations and the paths forward
Presenter: Tomasz Figa
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-VB2.pdf

- 32 buffer limit fixed by Benjamin
- REMOVE_BUFS IOCTL was added by Benjamin, allows to delete a range of buffers which
  are in the DEQUEUED state. Primary use-case is for decoders and dynamic resolution
  changes where you may want to change the size of the buffers by allocating new ones
  and deleting the old buffers.
- Reuse private memory between planes that import the same DMA buffer
- Limitations:
  - Sharing buffer between CPU and DMA. Hans has a 9 year old local branch which nearly
    solved this: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2-cpu-access
  - Page allocation in vb2-dma-sg (Sakari: provide compatibility helper)
  - DMA buffer mapping lifetime. Laurent: should be handled at core instead
    of in drivers, Nicolas: What if we allow buffers to be active in the DEQUEUED state?
    Hans: Have handles like in DRM?
  - Duplicate DMA mappings (queuing the same dma buffer on different indices of the
    same queue (solve this on the API level by comparing the buffers?)
- Simplify locking, 7 different types of locking available
- Add documentation for VB2 locking
- Remove .wait_prepare/.finish. Hans: They can probably be removed, work in progress


TODO:
- vb2_queue_busy and vb2_queue_is_busy sound very similar but are different to be
  renamed for less confusion
- Tomasz send RFC (many different RFCs to send!)
- Do a careful analysis of buffers used as reference frames: how to hold on to
  those without mappings disappearing.

--------------------------------------------------------------------------

Topic: Subdev state, and usage of the media controller device to submit requests
Presenter: Laurent Pinchart
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Subdev-State.pdf

- V4L2 subdev state: introduced a few releases ago, stores config of a subdev
  and remove boilerplate code from drivers by unifying try/active semantic
- All subdev fops receive a subdev_state
- Helpers in the core to simplify drivers implementation
  - format/selection rectangles are stored in the subdev_state

Missing pieces/TODO:
- Support for controls: a configuration cannot be TRYed if there's a dependency
  between formats/controls/selection-rectangles
- v4l2_subdev_state should be sub-classable
- Replace .get/.set with .check/.apply
  - get/set apply either to TRY/ACTIVE states
  - Drivers API:
    - check() tests and adjust a configuration
    - apply() applies settings to HW
  - From userspace nothing changes, only drivers should be ported to check/apply
  - The core already stores the format in the state, only set_fmt needs to be
    implemented on check/apply
  - Mauro: support for get() in the core should be optional ?
    - Laurent: for format it shouldn't be necessary, for selection rectangles it
      might be (decouple the crop bounds from set_selection())
    - Sakari: we can start without get() and if needed can be made optional
- Ricardo: some controls might affect the size of the image;
- Laurent: very few controls interact with the format, if there are we need to move
  controls to the state as well

Video device state (TODO)
- Apply the same concepts to video devices
- Implement try/get/set in the core
- As state handling is handled by the core we can drop the mutex
- Hans: locking for video devices is already there (vb2_queue)
- Hans: lot of legacy, pretty unpredictable
- Mauro: in DVB sometimes the get() implementation does something

Requests
2016: The request API was presented
- Requests have been implemented but the "state" was missing
- The idea was to replace all IOCTLs with a single one that applies all
  configurations to the media device (a' la' "DRM Atomic API")

Hans: how does this relates to contexts?
Laurent: contexts are layers on top vertically stacked on a media graph.
States are points in time that represents the configuration of the media graph
horizontally.

Steps to get there:

- Video device state
- Design the atomic uAPI
- Map requests to states

Get inspirations from KMS

Hans: keep track of which drivers have been converted (or are in the process of)
and which ones will never be converted. Laurent: conversion is in progress, but
new drivers should be required to use new features.
Mauro: profiles on userspace, when we add states we need to do things in a
certain sequence for them to not fail, document to implement for the different
scenarios correctly. Hans: v4l2-compliance is closest to that as it tests based
on what sort of device it is.

Suresh: with the request API all settings will be set in one go. Is it mandatory
for drivers to apply them all in one go (ie sensor delays). Laurent: we disallow
setting parameters that could compromise streaming. Setting everything in one go
when you're not streaming (Jacopo: sensor delays should be handled by userspace)

--------------------------------------------------------------------------

Topic: New tooling for infrared
Presenter: Sean Young
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-IR-Tools.pdf

lirc: userspace daemon that sends keystrokes through infrared. 3 userspace drivers,
merged in one kernel HID driver. Only works for a limited number of protocols, the
rest of the others need a userspace daemon. Tooling for userspace and kernel side
are different.

Hans: Where is the tooling? Sean: On sourceforge
Hans: Should lirc be moved to linuxtv ? Sean: I would rather like to see it go away

- IRP
  - IR protocols are decoded in the kernel (notations RC5 & NEC),

- BPF
  - Decoding with BPF programs, merged 2019, not used very much

- cir
  - Consumer infraRed converts the conf files and keymaps to IRP notation, can be
    used to transmit or decode or to configure a keymap
  - To replace the current IR tools in v4l-utils

TODO:
- Move cir to a differrent location? -> yes, To our gitlab folder
- Remove existing ir tools from v4l-utils? (Ricardo: it makes sense to have the
  tools in different locations from a distro point of view, Hans: for synchronisation
  it makes sense to have it in v4l-utils)
- Move v4l-utils to a different location (like GitLab)? (Mauro: nothing against it just
  never thought about it) (Ricardo offered to build CI for it, Hans: don't move it yet,
  there needs to be a better reason before deciding to move)
- Mauro: removing IR tools from v4l-utils is problematic, as we can't
  have aliases supporting the old binary name. He suggested looking
  into multi-packaging support on Fedora and to have multiple deb
  packages pointing to the same repository, each one with a different
  debian ruleset tar file (like v4l-utils-1.28.1-1.debian.tar.xz,
  at https://packages.debian.org/de/sid/v4l-utils). We can have
  another package with ir-tools.debian.tar.gz on it.

--------------------------------------------------------------------------

Topic: Rust in the media subsystem
Presenter: Daniel Almeida
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Rust.pdf

- Approach changed, no driver anymore, which would have been a separate layer, new
  approach no bindings anymore
- Example writing vulnerabilities with H264 (H26Forge), which could cause a variety
  of critical issues throughout different platforms
- Problems from the last year: maintenance, slow down c development, overworked community
- New strategy: only convert a few functions at a time, which are generated to be called
  from C directly
- Jacopo: in this case we move from unsafe to rust, do we have any guarantees for the
  parameters? Daniel: After validation, the procedure is safe
- problem with this it can quickly out of sync, solution: cbindgen (Mauro: does cbindgen
  work on all architectures? Daniel: Have to come back on this)
- Use-case: vp9 library in v4l2 because the proof of concept works best on self-contained
  components
  - Rework done, implemented for 2 drivers, implemented a testing tool and got the same score
  - Doesn't use any "obscure" rust features. mostly limited to sized arrays,
    bound checks, references and iterators
- Mauro: Why change something that works? Nicolas: This is more to implement the
  basic stuff that is needed to build upon, when the tooling is there it makes it
  easier to contribute -> getting cbindgen into the toolbox (which removes a barrier),
  Jacopo: if we don't start small we don't get to a point where it can add value
- Martin: Prove that your implementation fixes something
- Ricardo: roadmap, if we want that to happen, we need tooling for integration, CI for Rust
- Sakari: Who maintains? Hans reviews, Daniel maintains
- Hans: Not convinced that Rust in Linux is a good thing at all (why 2 languages in the codebase)
- Hans: you need a statement from Linus, I see a lot of problems

TODO:
- Daniel: Research whether cbindgen works on all architectures and report to Mauro
- Daniel: Bring up an example with a malicious bitstream to show that the Rust change fixes a problem
- Hans: Review RFC from Daniel, CI required for merge

--------------------------------------------------------------------------

Topic: UVC maintenance
Presenter: Hans Verkuil

- UVC most used driver, maintainer (Laurent) overloaded, current situation doesn't work,
  either assign a co-maintainer or step down and let someone else take over
- Laurent: friction due to a discussion and due to delays
- Ricardo: hard to sell UVC changes when it takes up to 3 years to merge not complex changes
- Mauro: We need at least one co-maintainer
- Ricardo would volunteer for co-maintainer
- Laurent: Proposal add Ricardo as co-maintainer, but also have Hans send PRs to
  Linus to have a full co-subsystem maintainer
- Sakari: Willing to help out with reviews
- Ricardo: what do we do on conflicts? (Hans: Hans and Mauro can mediate)
- Ricardo: Distros are forced to use down-stream patches for UVC
- Laurent: if big companies pushing for changes, but the maintainer isn't paid,
  the maintainer shouldn't be obliged to be stressed (?)
- Mauro: for the common areas we need someone with more time than Laurent
- Hans: Why isn't anything happening when everyone says that it is so easy to solve?
- Laurent: Flooded with patches, Ricardo: willing to help with the reviews

TODO:
- Post state to ML

--------------------------------------------------------------------------

Topic: V4L2 testing on Chromium using virtual video decode driver (visl)
Presenter: Steve Cho
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Better-Decode-Testing.pdf

- How can we do more testing without the actual HW?
- Decoding doesn't happen but the main setup can be done for verification
- Runs with QEMU on x86 ARM
- Currently does VP8 and VP9 tests
- Plan do this for pre-merge testing
- Hans: would it be possible to do decodes with the visl driver? Daniel: That should be doable

--------------------------------------------------------------------------

Topic: V4L2 video decoding testing with KernelCI
Presenter: Steve Cho
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-Better-Decode-Testing.pdf

- KernelCI reduces cost for ChromeOS, helps with upstream first, etc
- Running video decode tests on the latest linux kernel upstream for Linux and on
  Chrome OS with latest LTS versions
- New KernelCI UI available now

TODO:
- Mauro: Have CI test malicious streams (looking at the Rust proposal)

--------------------------------------------------------------------------

Topic: Should media drivers depend on CONFIG_PM?
Presenter: Laurent Pinchart
Presentation: https://hverkuil.home.xs4all.nl/summit2024/MS2024-CONFIG_PM.pdf

- Most developers will not think that CONFIG_PM could be disabled
- It is possible to write the pm functions into the driver in a manner that doesn't
  break without CONFIG_PM
- Mauro mentioned that mt9v011 sensor driver doesn't implement PM and it is used by
  em28xx USB driver
- It is very unlikely that devices are used on architectures without PM support
- Adding helpers for PM management? (Sakari has already started to work on something)
- Jacopo: Should we require autosuspend support? Laurent: I think we should.


