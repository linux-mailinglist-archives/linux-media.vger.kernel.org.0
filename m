Return-Path: <linux-media+bounces-33520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F6AC6A1F
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614351BC0686
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FB7286D72;
	Wed, 28 May 2025 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KJFEDu7G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66C8634A
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438137; cv=none; b=E3inC3bzGmX0sl3huS+i1uKVO1HDGXwUU9OxODRsjOkKdEP7PtGK3iVgFoAvTzQA2Esxh40XCG72lK0cBATHpsMdyI2iXQ5O9jxxhJCiQu69ZYs/AAbB8IVCWqrGo6/yfnHJZ29qhS6Qwmlea+NFs2wgY5TNpvgyNzlKAEgiKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438137; c=relaxed/simple;
	bh=WgoJ3yuhlrwphX8yWQ+b2zfIlSfGiZoYNelu4AV1lq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZc2D4BljRQzraDlMxXE6nad+AAL51259M9I+NpKHQEIU950NLxCj0r0sotsxcQ8+i3G7miLtUMHnN7V/2nRKPTfrd3jH8B153/NS89r30nzGKWB4HTOTQrGnKgIc9DolEBfZmDdwlOwlozyu1au2UR5FQ85cAEpseRQ/SaWaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KJFEDu7G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [77.241.226.16])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FBEED6;
	Wed, 28 May 2025 15:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748438105;
	bh=WgoJ3yuhlrwphX8yWQ+b2zfIlSfGiZoYNelu4AV1lq4=;
	h=Date:From:To:Cc:Subject:From;
	b=KJFEDu7GRA7yPUgNe1bqZow5u+WA5jgx3+jigZ8GUv0dQeuTJ6QH0uJx4zj/fIgOr
	 ouGdb8MYN6daknoPMPHxnZynYFuTGUCQsXjbi2gBrwCqIq/hRpJHB7tIv3pzbEkRCD
	 suLn89ou+kjU/tZTw/OX/+Us38nDVdqfBmdQRqVI=
Date: Wed, 28 May 2025 15:15:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org
Subject: [ANNOUNCEMENT] Minutes from the libcamera workshop 2025 - Nice, May
 16th
Message-ID: <20250528131527.GA20738@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello everybody,

We have hosted our most popular workshop so far (in terms of number of
attendees) on May the 16th, as part of the Embedded Recipes workshops
day. I would like to thank all the participants, both local and remote,
who made this a success.

You will find the notes we have taken during the workshop below. Slides
from the presentations can be found at
https://libcamera.org/workshops/2025/.

# libcamera workshop Nice 2025

Attendees

* Advait Dhamorikar <> (remote)
* Alain Volmat <alain.volmat@foss.st.com> (remote)
* Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
* Benjamin Mugnier <benjamin.mugnier@foss.st.com>
* David Plowman <david.plowman@raspberrypi.com>
* Devarsh Thakkar <devarsht@ti.com>
* Hans de Goede <hdegoede@redhat.com>
* Jacopo Mondi <jacopo.mondi@ideasonboard.com>
* Jai Luthra <jai.luthra@ideasonboard.com>
* Jamie C <> (remote)
* Jerry Wu <jerry.w.hu@intel.com> (remote)
* Jesper Taxbøl <jesper@taxboel.dk>
* Josuah Demangeon <me@josuah.net>
* Julian Vuillaumier <julien.vuillaumier@nxp.com> (remote)
* Karthik Poduval <kpoduval@lab126.com> (remote)
* Kieran Bingham <kieran.bingham@ideasonboard.com>
* Laurent Pinchart <laurent.pinchart@ideasonboard.com>
* Loic Poulain <loic.poulain@oss.qualcomm.com>
* Mattijs Korpershoek <mkorpershoek@kernel.org>
* Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
* Mehdi Jait <mehdi.djait@linux.intel.com> (remote)
* Naush Patuck <naush@raspberrypi.com>
* Nicolas Dufresne <nicolas@ndufresne.ca>
* Niklas Söderlund <niklas.soderlund@ragnatech.se>
* Paul Kocialkowski <paulk@sys-base.io> (remote)
* Petr Hodina <> (remote)
* Ricardo Ribalda <ricardo.ribalda@gmail.com>
* Rishikesh Donadkar <r-donadkar@ti.com>
* Sakari Ailus <sakari.ailus@linux.intel.com>
* Sam Noble <> (remote)
* Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> (remote)
* Stefan Klug <stefan.klug@ideasonboard.com>
* Umang Jain <uajain@igalia.com> (remote)
* Víctor Jáquez <vjaquez@igalia.com> (remote)
* Will Robertson <w.robertson@cairnwater.com> (remote)
* Xavier Roumegue <xavier.roumegue@oss.nxp.com> (remote)

Agenda

- 09:00 - 09:10  Welcome and agenda bashing
- 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
- 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent Pinchart)
- 10:00 - 10:30  Using a single IPA with multiple pipeline handlers (Hans de Goede)
- 10:30 - 11:00  Break
- 11:00 - 11:45  Bayer reprocessing (David Plowman)
- 11:45 - 12:30  Startup frames (David Plowman)
- 12:30 - 13:30  Lunch
- 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
- 14:00 - 14:30  Multi-context support (Jacopo Mondi)
- 14:30 - 15:30  Per-frame control (David Plowman)
- 15:30 - 16:00  Break
- 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
- 16:45 - 17:15  The importance of libcamera to WildCamera (Will Robertson)
- 17:15 - 17:45  TBD

## Welcome and agenda bashing

## Software ISP status and future plans (Hans de Goede)

Hans plans to add auto-focus support to the soft ISP. Jacopo mentioned there's
an interest for AF on rkisp1 as well, and collaboration would be good. There is
lots of stuff to do there, including possibly locking AGC while doing an AF
sweep.  For the moment a region of the image is used, doing it on the whole
image is too expensive for CPU based implementations. LSC only on GPU, too
expensive for CPU (might be there but disabled by default).

Current code is single-threaded C, there is room for optimization.

GPU implementation is currently OpenGL based, might move to Vulkan Compute. GPU
based implementation is in early stage. There is lots of work to be done on the
current implementation, so many opportunities to collaborate.

Nicolas said that libcamera has no memory model (padding, cache, ...). Most
GPUs can't deal with odd resolutions, with "odd" being platform-dependent (e.g.
256 bytes alignment for the stride for AMD, 64 pixels in both directions for
Mali, ...). The kernel doesn't expose those constraints, which is problematic.
Android has some API to get a buffer that can be used for specified purposes.
Nicolas doesn't expect us to solve this problem, this should be offloaded to
the outside world. V4L2 encoders give us the padding. The uvcvideo driver
doesn't support strides, that should be fixed in the kernel.

Hans said this is a wider topic than libcamera. Nicolas said it's a solved
problem in GStreamer for codecs <-> GPUs, with a best-effort trial and error.

Laurent explained that libcamera (and V4L2) should not allocate buffers. We
should have a centralized memory allocator. The topic was discussed at XDC
2024. Nicolas asked if libcamera needs to wait for missing fetures to be add to
the kernel, or if we could e.g. copy frames. Laurent said that the stride bug,
and the missing data offset feature in V4L2, should really be handled in the
kernel. Boris made a proposal a couple of years ago, and yak-shaving killed it.

Naush said RPi started their implementation using V4L2-allocated buffers, but
found no way to control cacheability. V4L2 is making progress. The cache hints
have been broken for dmabuf for years, but patches were posted recently. Stefan
asked if there was a central place where we track the use case combinations
that work and don't work.

The discussion then moved to memory allocation patterns, limitation in
videobuf2 for cached/uncached memory allocation and dmabuf heaps cache
handling. Example of users experiencing problems with cached memory handling
[https://lkml.org/lkml/2025/3/9/524](https://lkml.org/lkml/2025/3/9/524)

### Actions

* [ ] UVC Video Pipeline handler needs a stride handling fix
* [ ] libcamera stride handling also needs to expose an offset
* [ ] V4L2 allocated buffers need to be able to request cached buffers

## Slowing down the soft ISP CPU implementation (Laurent Pinchart)

SoftISP combines different processing steps together in a way that doesn't
match an HW ISP design.

Moving to a GPU implementation might help as it might easily offload tasks that
are CPU intensive.

GPU and CPU implementation will initially be the same and then later diverge.
Laurent thinks a pixel-perfect copy of the GPU implementation should be
replicated on a CPU implementation for easier testing, resulting in a slower
version. Should the two CPU versions diverge or be kept together ?

There seems to be consensus on diverging, not to slow down the existing CPU
implementation. Hans however said he would try to move BLC before debayering.
That would then allow adding LSC to the soft ISP, in a way that we be disabled
for people who care about performance.

Acceptance criteria for CPU implementation: 720p@30FPS on a modern laptop.

David would expect to have two soft ISPs, a quick one and a higher quality one.
Naush said it's not only about enabling and disabling features, but also about
having e.g. fast denoising for video capture and high quality denoising for
single image capture. This could even apply to the GPU ISP.

Hans said we may get ahead of the curve here, maybe we should first see if we
have issues developing and debugging GPU-based algorithms before committing to
a CPU-based ISP used for debugging only.

Nicolas points out that frameworks like OpenCL could generate C code that is
CPU runnable.

Contributing to both the CPU and GPU part is duplicated effort and hard to ask
to contributors.

Once the GPU/CPU implementation diverge what about the IPA ? Should we have two
IPAs for GPU/CPU versions ? Hans think it depends on the algorithms. IPA
modules will be developed for the GPU and adapted to the CPU implementation
handling the translation of the params/stats formats in the SoftISP
implementation.

### Actions

* [ ] SoftIPA will target the GPU ISP Parameters to drive the interface, the
  CPU will keep up where it can and decide what parameters it should utilise or
  ignore.

## Using a single IPA with multiple pipeline handlers (Hans de Goede)

AtomISP is now working with libcamera thanks to Hans' work. However is not
using an IPA and making it work would be a lot of work for a 'dead' platform so
the softISP stats and algos have been reused. Similarlys ome USB cameras has
movable lens and could re-use the stats processing from the SoftISP. Does it
make sense to re-use IPA like from the SoftISP for other platforms ?

Hans sent a patch to allow AtomISP to re-use the softISP:

[https://patchwork.libcamera.org/patch/23359/](https://patchwork.libcamera.org/patch/23359/)

Laurent is concerned about maintainability. Duplicating the IPA should be
rather cheap especially if more code is moved to libIPA.

For AtomISP since a sub-set of the IPA is needed, it might make sense to
duplicate the IPA.

Hans asked if we can have a mode in the libipa AGC to slowly walk the sensor
gain curve when we don't know the gain curve of the sensor. Otherwise AGC
oscillates. Kieran and Laurent said the gain curve should be calibrated, and
libcamera should have a script to help users doing so. Naush said that in cases
where we really can't know the gain curve, it's better to disable analog gain
completely and only use exposure time.

Laurent said a mode where libcamera can run on an unknown sensor without
recompiling is useful for bring up, with a 1:1 analog gain mapping. This will
be gated by an environment variable (or configuration file). If we want people
to find this mechanism, we can document it in the error message.

Niklas would like to support using a new Pipeline handler with an existing IPA
also. Laurent suggests that that platform may also be likely to diverge in the
future. But as an initial step - it can still make sense to re-use the same
IPA. Maintenance problems will be the main concern, but when they diverge it
would then become a separate IPA.

### Actions

* [ ] Create a 'Calibration Only' Camera Sensor Helper that passes V4L2
  controls through 1:1 allowing a calibration tool to capture and process RAW
  images.
* [ ] Sensors with unknown gain curves should realistically set or leave the
  gain to a default value and not change it - providing limiting functionality
  but with a more consistent behavior

## Bayer reprocessing (David Plowman)

The most interesting use case for Raspberry Pi is AI processing of Bayer frames
before ISP processing. The ISP can also be used to process DNG files completely
offline.

Kieran asked if this should be called a camera, or if we should expose an ISP
object. Devarsh asked why this was called "reprocessing". Nicolas asked if
statistics should be passed to the ISP, along raw frames. The feature reminds
him of two-pass encoding. One of the controls the application would put back in
is statistics.

Nicolas asked what applications could expect from the ISP in reprocessing use
cases. Could user create e.g. image editing software that would use the ISP for
faster processing. David said a Pi Zero 2 could then run darktable in real
time. It's however not the main use case.

Jacopo asked what's blocking to implement this. David said we just need an
agreement that we want such an API.

Naush suggests that this should be likely handled with two different libcamera
instances, one for live preview and one just for reprocessing. Laurent wonders
if fully off-line processing needs any state coming from the live capture
processing. Naush said that they used to copy the whole state from one instance
to the other. It's not nice but possible. Some context, like the algorithms
state is mostly static, so they might be easily isolated.

Nicolas asked if the overall pipeline would be a live pipeline. Jacopo asked if
the reprocessing context should be isolated from the live capture context.
Nicolas assumes the data used in reprocessing is isolated, but reprocessing
can't have exclusive access to the ISP as the live capture session runs in
parallel. Jacopo said we shouldn't rule out platforms that would require due to
system design the capture session and reprocessing session to run together, not
in separate contexts.

David feels like working with isolated instances of libcamera is easier, but we
shouldn't rule out the ability to run live capture and live capture at the same
time.

How does it work with desktop application using frameworks like pipewire
wanting to do reprocessing ?

Nicolas suggests that this could be represented as an isolated "reprocessing"
node.  This would require representing all parameters as streams, with
corresponding formats.

Raspberry Pi has no interest in Pipewire, however the libcamera API should
support the Pipewire use case. Nicolas showed an example of a pipewire
patchbay, which would still be a useful feature for Raspberry Pi.

Compared to the past years the introduction of vendor controls make it easier
to seed the algorithms with a self-contained state that comes from controls and
not from the algorithms state.

Laurent points out that the current pipelines we have are [sensor + ISP]. In
systems with additional components (GPU, DSP, NPU) etc. The pipelines will
become way more heterogeneous. This should be abstracted from users, but might
be interesting to expose to applications to control the composition of the
pipeline. Naush thinks that there is scope, like placing AI before the ISP but
unlikely people wirting apps wanting to recompile/modify libcamera for that.

Jacopo asks what should be considered as part of an imagine pipeline. He
mentioned dewarpers, which should be part of the pipeline and handled
internally in libcamera, but wondered if libcamera should be concerned about
AI. Naush said it's a decision for libcamera maintainers whether or not to
accept "AI feature creep". He said he wouldn't want to see object detection as
part of libcamera.

The discussion progressed on how much the processing of images will be
off-loaded to accellerators. There is consensus that we're not there yet at
all, but we should prepare for some processing blocks to be offloaded to
components external to the capture pipeline. David said denoising would be an
important use case, but he doesn't see a good reason to dedicate lots of NPU
silicon space for e.g. debayering. Laurent said the NPU wouldn't just debayer,
but perform all processing steps in one go.

Jacopo asked if the only decision we need to make is if the capture and
reprocessing sessions are fully separate or if they share state. David and
Naush prefer having separate states. Nicolas said it could cause some
performance issues as we have to copy state data back and forth. Laurent said
that once we'll have a C API the controls and metadata will be put in memory
buffers.

Technical issues we raised in the past an need to handle are

* Adding input streams (there is a consensus on this)
* Passing state to applications and back
* Sharing the memory-to-memory ISP between multiple libcamera instances (will
  be helped by the V4L2 multi-context work)
* Loading an application-specific tuning file (for the reprocessing pipeline)

David says he doesn't want to lose track of the configuration file issue: there
is no way to load a config file that is not tied to the sensor in use. Stefan
says we have a similar issue with regular cameras where supplying a config file
at runtime might be desirable.

Laurent said in the past there were issue sharing ISP resources, but with
multi-context support should solve the issue, providing isolation at the
process level context (separate instances of libcamera). He asked how to ensure
applications will not cause resource starvation. An ISP scheduler will likely
be needed.

Laurent wonder how the "state" from a live pipeline could be transferred to the
reprocessing pipeline. Naush points out that this is a concern for off-line
pipelines as well.

A proposal for the creation of an INPUT stream is required to evaluate the
viability.

Niklas wonders why not always separate the ISP processing from capture. That
would create complexity on the application that will have to handle themselves
the composition of the pipeline (like they will always have to do
reprocessing). Niklas suggests that an helper could be provided to "hide" to
applications the complexity. Laurent says that something similar is in scope to
simplify the pipeline handler creation, to create blocks that can be composed,
but not as the main API exposed towards applications.

Laurent points out a difference between the Android reprocessing API that
allows applications to extend the capture pipeline with additional steps, while
the proposal by RPi is mostly about using the ISP as an isolated component
after an external processing step.

### **Actions**

* [ ] libcamera needs an 'input camera device'
* [ ] libcamera needs an 'input stream'
* [ ] Each 'input camera' instance will need a configuration file (or config
  parameters structure). Perhaps even current cameras should already allow a
  config file to be passed at Camera creation time from the application
* [ ] Decide (and publish) where AI / NPU feature creep is allowed into
  libcamera

## Startup frames (David Plowman)

Startup frames are frames coming out from the camera from cold start:
potentially bad and not consumable by application. Currently RPi has dedicated
buffers that are discarded.

Two classes of "bad frames":

* Frames generated as corrupted by the sensor at the very beginning of the
  streaming session
  * Still pretty common
  * Some sensors do that only at power-up, some also a stop-start sequence
  * Sensor-depended parameter
  * Typically 1/2 frames
* Frames where algorithms have not yet converged
  * Wild oscillations, not consumable by application
  * Typically 5/6 frames

Naush proposed flag to "flag" a frame buffer as bad.

[https://patchwork.libcamera.org/project/libcamera/list/?series=5164](https://patchwork.libcamera.org/project/libcamera/list/?series=5164)

Nicolas points out that currently apps like cam and qcam do not inspect the
FrameMetadata State.

Mauro wonders where the information about the number of bad frames comes from:
sensor datasheet and sensor database.

Devarsh asks why report frames to applications in first place and not drop
them: Naush points out that discarding frames requires ad-hoc memory allocation
of scratch buffer, which might be complex and tedious.

Nicolas points out that gstreamer wants to classify corrupted frames as well.
An identifier for bad frames should be provided for that. It's up to the
application using gstreamer to decide if the frame should be used or not.

Should this be per 'buffer' or 'per request'

### **Actions**

* [ ] We can extend the gstreamer element to incorporate this update to
  demonstrate the functionality.
* [ ] Decide if the output should be in a control/metadata or stay in the Frame
  error flags. It may be easier for Applications if it's on the request (or
  that the request flags are updated from the buffer flags)

## State of GStreamer support (Nicolas Dufresne)

Can controls be changed at runtime ?

- gstreamer has a property to flag controls that can be changed
- all libcamera controls are now gstreamer controls

Kieran: what happens if you set a control that a Camera has not registered ? If
gstreamer let it pass, it will cause and assertion in libcamera.

Kieran: what testing can we do on gstreamer ?

- We have unit tests

David: What is the situation about selecting camera modes on gstreamer ?
(sensor configuration)

- "Camera modes" are not a thing in libcamera
- Only set if explicitly request by the user (expert only)
- Feasible but no action planned

gstreamer 1.14 is old and EOL; but is still shipped in Debian 10/11. Once they
reach EOL will drop 1.14

Is 0-copy support there with kms-sync: yes if buffers are compatible with your
display controller (requires stride support). Cannot allocate in KMS and import
in libcamera, missing implementation in the gstreamer element.

Usage of DRM formats and modifiers (introduced in 1.26) allows the use of
compression through modifiers.

HDMI capture could be implemented in libcamera without changing the API.

libav latency keeps increasing, but this can end up holding frames (there's a 4
frame deadlock) because libav needs more frames to hold on to.

We need to fix the number of buffers available, and we will update this to fix
rkisp1 to parse the buffercount accordingly.

Pipewire has a "use case" oriented approach, the definition of a use case has
to be better specified (we can't query HW capabilities as the same camera
hardware can generate a variable number of streams). The way Pipewire creates
use cases has to be clarified, in order to understand how to better support
them.

### Actions

* [ ] What tests for gstreamer element can we add to either unit tests or CI
  tests
  * Add role / raw stream tests
  * Add more control setting tests
  * Add mode configuration tests
  * We should test gstreamer on many pipeline handlers (rkisp1, rpi5...)
* [ ] Check what happens in gstreamer if we set an unsupported control on a
  camera.

## Multi-context support (Jacopo Mondi)

Jacopo quickly summarised the presentation he gave at the Linux media summit.

Paul said that the Allwinner ISP driver has a copy of the context, and copies
it to the device during vblank. Jacopo said he is working on a platform that
has a similar mechanism, so it will be supported.

Nicolas stated all this would be easier with (V4L2) requests. There was a
consensus requests would be nice, but are an orthogonal issue.

## Per-frame control (David Plowman)

David started with a demo of a per-frame control prototype, in Python. Nicolas
asked if the Python API could use futures.

Jacopo said we have been going around in circles with per-frame controls. The
Raspberry Pi use cases only care about applying controls atomically, and
reporting when a "pack" of controls has been applied. Synchronisation with
sensor frames is not needed. libcamera, on the other hand, partly because of
the need to implement the Android camera HAL 3 API, defines per-frame controls
as synchronised with a specific request. Nicolas said the former is more
"atomic controls" than "per-frame controls". Naush said that the API proposal
still allows changing controls back-to-back for every frame.

Sakari mentioned that real-time constraints could be missed, causing issues.
PREEMPT\_RT could help, and ensuring that the process doesn't get paged out
could make a difference. Stefan said we need to handle fault conditions,
resynchronisation needs to be guaranteed. Sakari said PREEMPT\_RT would still
minimise the probability of glitches. Naush said the issue starts appearing
around 90 fps on Pi 4, 60 fps works typically quite fine.

Stefan asked about frame drop behaviour. If the system drops a frame, control
packs needs to be squashed to catch up. The behaviour is anyway configurable
and up to the application to control

Kieran wonders if the HDR demo that was presented a long time ago requires this
method of PFC. Stefan think this won't work, but David mentions that watching
the ControlListId allows you to skip a Frame with a ControlList that has not
been applied correctly.

Stefan think that after a long discussion is possible to unify the two
behaviour. RPi wants to apply a control list as fast as possible, without
waiting for being in the queue to be consumed.

David think the way Controls and Buffers are queued to the Camera should be
reworked.

For sensor controls the max delay of sensor controls should be taken into
account, while for ISP controls they can be applied immediately. David thinks
everything could be delayed by a fixed amount. Digital zoom is an example where
delaying by a fixed amount of frames won't work well. Some controls might be
prioritization.

RPi "jumps the queue" to the next request that has a ControlList set, basically
ignoring all other requests in the queue. Right now, with a single queue for
requests and controls, it's hard to model a "skip the queue" while with
separate queues for Requests and Control the two can be easily handled
separately (and allow to implement different behavior).

Difference between Android and RPi model discussed; david and naush thinks the
difference is minimal.

Stefan ControlListId might make sense even with "hardcore per frame control"
and could help with error condition. Matching ControlListId with the one
returned in metadata makes it way easier to check if PFC was realized rather
than inspecting an error flag condition.

David thinks the idea of separating Controls, Buffer and Request is a good for
everyone, will make RPi happy and will make it possible to realize both
behavior.

Stefan is uneasy on letting go the "android per frame control" mode, but a set
of tests that allows to validate both behaviour would make things easier to
accept.

Karthik points out that it's hard to exactly match control values by just
comparing them because the HW quantize them, ControlListId might help
validating the behavior.

Stefan has been experimenting with these topics in camshark, and using a
capture script to define the expected frame controls delivery - while showing
the results plotted on a real time graph.

## libcamera on Zephyr (Josuah Demangeon)

Josuah presented an overview of Zephyr and its camera API
([https://docs.zephyrproject.org/latest/doxygen/html/group\_\_video\_\_interface.html)](https://docs.zephyrproject.org/latest/doxygen/html/group\_\_video\_\_interface.html)).
He started working on a software ISP for Zephyr, as there is very rarely a
hardware ISP. This comes with specific challenges, such as processing frames
without enough memory to store a full frame in memory
([https://github.com/zephyrproject-rtos/zephyr/issues/86669)](https://github.com/zephyrproject-rtos/zephyr/issues/86669)).

An important question to answer is what platforms are in scope (the lower the
cost and the broader the scope, the lower the CPU power and RAM size). Another
question from Josuah was if libcamera had attempted to use microcontroller in
the imaging pipeline, for any purpose (not constrained to image processing, but
also e.g. to implement a VCM controller). Kieran asked about camera features
for STM32 chips running Zephyr. Alain said there was relevant platforms. Kieran
asked if we could share any code between Zephyr and the Linux kernel. Devarsh
said TI has a Cortex-M core driving an ISP, on a platform running Linux on
larger cores.

Zephyr is licensed under Apache-2, while the Linux kernel is licensed under
GPL-2.0. No Linux kernel code can be ported copied to Zephyr, drivers need to
be reimplemented from scratch. Jacopo asked how it applied to libcamera. The
parts of libcamera that handle V4L2 abstractions are not relevant for Zephyr.
How about e.g. the ISP algorithms ? Josuah said sources can be published, but
binaries may not be distributable. Laurent said that in that case nobody could
make a product out of it. libcamera is licensed under LGPL, which according to
Laurent could have less compatibility issues with Apache-2. It would need to be
checked. Devarsh asked if some IPC mechanisms could help.

There are lots of sensors used on Zephyr that have a built-in ISP. With
Cortex-M55 devices, ISP in the MPU may become more common. UVC may be coming to
Zephyr too, with Zephyr running in the camera. Josuah would like to extend UVC
to have h/v flip.

Porting libcamera to Zephyr as-is is a big challenge, but cooperation between
the two projects could start small and increase over time. Zephyr can help
libcamera by being used as an open-source base for a UVC webcam firmware or a
Cortex-M ISP control firmware (for instance on TI AM69x platforms).

Kieran mentioned the OpenIPC project
([https://openipc.org/)](https://openipc.org/)), which is an open firmware for
IP cameras. There could be lots of overlap there.

## The importance of libcamera to WildCamera (Will Robertson)

Existing hunting cameras are good at detecting large slow-moving animals, but
not for small fast-moving animals. Probability of getting footage is very low
in that case. The best quality cameras are expensive (600€ to 1000€), and the
average life time on the field is about 3 years. This is an issue for
conservation researchers, as the budget in that field is low. Devices use
antiquated file systems, with a 64GB SD card limit that fills up quickly.
Losing several weeks of data is typical. Travelling to the field to handle
those issues takes a lot of time and money, not to mention how dangerous
climbing in those trees can be.

Lots of species that WildCamera is caring for are on the brink of extinction.
There is a scientific need to find ways to help with conservation efforts.
There is also a public need, most people don't know that those species are
getting extinct within just a few dozens of kilometres from their home. This is
a big extinction problem, caused by climate change and destruction of habitat.
Many people think extinction happens on the other side of the planet, but this
is happening in Europe.

What can we do about this? Small off-the-shelf Raspberry Pi camera modules are
much better than what commercial wild life cameras provide. They can help
getting footage of small mammals that would be impossible to get otherwise.

A solution has to be open-source. Will said that any SoC vendor that will not
embrace open-source cameras within 10 years will be out of business. i.MX8MP is
a front-runner thanks to NXP's support for open-source. There's hardware
support for Linux going to sleep states. This is very important for
solar-powered devices in forests.

The big technical challenges are lack of experience in embedded Linux or in the
Linux kernel. With help from the team, Will managed to get a system running. He
needs to get a monochrome camera module running, with IR support. The
flexibility of Linux is great, but for some operations it would be better to
use a real-time operating system with lower power but also lower power
consumption. HDR capabilities will also be very valuable. Jacopo said there are
lots of mechanical challenges, and maker communities such as the Raspberry Pi
community could help. Has Will considered starting with a Raspberry Pi ? Will
said the major problem with Raspberry Pi is the lack of support for deep sleep
states with low power consumption. Naush said there could be a sleep mode on
Raspberry Pi 5.

Our GitHub repository (sorry this is only in English at the moment):

[https://github.com/William-Robert-Robertson/WildCamera](https://github.com/William-Robert-Robertson/WildCamera)

Our conservation work in English - maybe not worth reading my text but worth it
for the cuddly animals in the photos and videos😉:

[https://new-homes-for-old-friends.cairnwater.com/](https://new-homes-for-old-friends.cairnwater.com/)

German (apologies for grammar - I was tired while I was writing this 🙈)

[https://new-homes-for-old-friends.cairnwater.com/de/neue-heimat-fur-alte-freunde/](https://new-homes-for-old-friends.cairnwater.com/de/neue-heimat-fur-alte-freunde/)

A quick summary of what we're doing in Switzerland in English, French and
German:

[https://new-homes-for-old-friends.cairnwater.com/quick-summary-new-homes-for-old-friends-switzerland/](https://new-homes-for-old-friends.cairnwater.com/quick-summary-new-homes-for-old-friends-switzerland/)

Our work in Belgium with Goedele Verbeylen (only in English at the moment -
I'll try to translate this to Flemish soon):

[https://new-homes-for-old-friends.cairnwater.com/quick-summary-new-homes-for-old-friends-belgium/](https://new-homes-for-old-friends.cairnwater.com/quick-summary-new-homes-for-old-friends-belgium/)

Is it possible to train a tree-dwelling primate to rebuild the Linux kernel?
The evidence seems to be that - with a lot of exasperation - the answer is -
eventually - yes!

* [    4.738207] devtmpfs: mounted
* [    4.741902] Freeing unused kernel memory: 2944K
* [    4.746521] Run /sbin/init as init process
* [    4.894477] EXT4-fs (mmcblk1p1): re-mounted 322a6ff4-2e9e-4d20-b379-8ac86ca9a018 r/w. Quota mode: none.
* Seeding 256 bits without crediting
* Saving 256 bits of non-creditable seed for next boot
* Starting syslogd: OK
* Starting klogd: OK
* Running sysctl: OK
* Starting network: OK
* Starting crond: OK
*

* Welcome to Buildroot
* buildroot login:

## Extra

### DT Connectors

Kieran met with Pantelis Antoniou in the Hallway Track, and has discussed
progression of DT Connectors which will help device tree overlays for camera
modules. This work was started back in 2016[0][1] but hasn't been worked on
since. There are no specific blockers on this other than needing the use cases
to be revived and worked on.

[0] [https://www.konsulko.com/wp-content/uploads/2016/09/portable-device-tree-connector.pdf](https://www.konsulko.com/wp-content/uploads/2016/09/portable-device-tree-connector.pdf)
[1] [https://lore.kernel.org/all/1464986273-12039-2-git-send-email-pantelis.antoniou@konsulko.com/](https://lore.kernel.org/all/1464986273-12039-2-git-send-email-pantelis.antoniou@konsulko.com/)

### Remote attendees questions

Q: [Karthik Poduval] A lot of new drivers like rkisp1 and mali-c55 appear to
use a param video device node for ISP controls as opposed to using V4L2
Controls, is this preferred (over V4L2 Control) or done for convenience (to
avoid defining umpteen V4L2 Custom Controls for ISP)  ?

A: [Laurent] Both. The V4L2 control API and framework has a too large overhead
for ISPs. Upstream ISP drivers are required to use parameters buffers (very,
very simple ISPs with just a couple of controls could be granted an exception,
this would need to be discussed).

[Karthik Poduval]  But with param buffer we lose all the great property of
controls like bounds check, also isn't media request API also built to support
per frame controls.

[Laurent] Yes, bound checks are lost. This implies that userspace won't be able
to query bounds for the ISP controls, but userspace will contain ISP-specific
code anyway. The ISP driver will also need to manually validate/adjust the
parameters from the parameters buffer. For parameters that could impact system
stability, that's crucial. For parameters that would just cause artifacts in
images, if userspace doesn't do its job, no validation is needed and it's valid
to return sub-optimal images. As for the request API, it's currently
half-implemented, for codec use cases only, and is inefficient. We could
reconsider this when we'll be able to queue a request with a single IOCTL on
the media device, but even then, handling controls through the control
framework will likely be expensive for very little gain.

Q: [Karthik Poduval] Is there any work to support WIP pipeline handlers compile
out of libcamera tree ? The monolithic approach makes it harder to upgrade
and/or contribute back. I used this kind of an approach for making an app using
libcamera library helpers (not the camera API) to create a V4L2 M2M application
[https://github.com/karthikpoduval/meta-v4l2-m2m-example/blob/elc-2022/recipes-multimedia/m2m-scaler-test/src/m2m-example.cpp](https://github.com/karthikpoduval/meta-v4l2-m2m-example/blob/elc-2022/recipes-multimedia/m2m-scaler-test/src/m2m-example.cpp),
but would be useful to support pipeline handlers and generic support for other
V4L2 M2M devices (that can benefit from libcamera's powerful abstraction)

A: [Kieran] I also think some of the 'internal' libcamera classes could be
useful outside of libcamera - but it's tricky to use those without making them
part of the libcamera public API ... we could make a separate library - that
libcamera 'uses' but that can be used independently - but that may then add
more ABI burden to us ... so we haven't done that (but I do think it would be a
helpful set of classes to make a library from).

[Karthik Poduval] I have just being doing something like this to use
libcamera's helpers outside of libcamera.
[https://github.com/karthikpoduval/meta-v4l2-m2m-example/blob/elc-2022/recipes-multimedia/libcamera/libcamera/0001-libcamera-export-internal-headers-to-libcamera-inter.patch](https://github.com/karthikpoduval/meta-v4l2-m2m-example/blob/elc-2022/recipes-multimedia/libcamera/libcamera/0001-libcamera-export-internal-headers-to-libcamera-inter.patch)

[Kieran] How about could you try doing it 'properly' and split out the v4l2
device helpers to libv4l2++ (ok the name might clash?) and have that built
separately in libcamera, but used - and installed as a separate usable library
to see how it work ? If it works well - then that could be something we can
review.

[Karthik Poduval] Sure can try that, I also had a 2nd need to build WIP
pipeline handlers out of tree just like out of tree kernel modules
(conceptually). This to allow for rapid update of libcamera from upstream and
also making it easy to contribute any libcamera patches or enhancements from
WIP pipeline handler implementers. Any thoughts or comments ?

[Kieran] When will you upstream the pipeline handler - then you won't have out
of tree issues ;-)

[Laurent] Can you tell which platform (SoC/ISP) you're working on, or is that
secret at the moment ?

-- 
Regards,

Laurent Pinchart

