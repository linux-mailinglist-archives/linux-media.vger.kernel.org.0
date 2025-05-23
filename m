Return-Path: <linux-media+bounces-33229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728C8AC1D8E
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 09:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2247117F03C
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 07:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527B321C197;
	Fri, 23 May 2025 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="JdJfcKus"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D21A3177
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984862; cv=none; b=HGUGo4nVApQll3BGK9kheqPWoSofJPfQKFM8Hym+GAIToV4qCvSgKVLJqaP1v7y7zhIC0fXg/rjoDifFEw+ActJV/x8QoP4n6wX7xLELkgarA8tet0TkJ5ByO91zOurpTvI9snMAfKPbrO4WKL5jCvgyv3Xq3daCLKESql42Jwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984862; c=relaxed/simple;
	bh=1ncRrHlkQCW+1SubuSUm5B5ReLzT/tjXuSJ0hcUtpc4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=VGeI7jSrED4ijs39CRN916BEsCQWCJ5juJ/1dn+/xG6Wfqc3Kv7MP3GtPH7bdjuSiwRYDz6Rmzr3ECtD07utTydw7SvZqMLa+veJEATby1mQC1Pf0r6cITrViq9EYVrYGiofyPydvJmAjckxROCmahxudekbdqH6i+/be71EaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=JdJfcKus; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4b3c5C4NRCz1GgM
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 07:20:47 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4b3c5B52ZPz2xMF
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 07:20:46 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=JdJfcKus;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1747984847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=P3B9IZeB4vL08hiqVSDJVCUMm6UFNM+WLxUxFUrxFsc=;
	b=JdJfcKusAdbGvzjAYbEEo4wEzS874i1ZoEAdBww574vF6VpF1og0/dOveyPlv3vfTamsEn
	PjEZg9Y5J6BHP2SNWgqCcoU9jx62xej6AdRu8tlZbUoYoGeesSdXwFzGvv2wsz/GA0z3QI
	mz8qIga0uO+HinbI+MEwHl+uzXz8rDDWN/83jI5Tu9TjThONpS4pzZ4LL/zXdZeaAl/D91
	x4utCV3U87qRAEjWw9yDm5P6PQZKDvfYqkMb0rUP3FsjHHHrKwUDN3y1WzN+4FSd3Nmc+x
	RVNWcLvKC7SFnH0IUQiCXHU0lQXm7o8jAmAGzKtfwDZGD9GZoPnUHpGcmRmu7w==
X-CM-Envelope: MS4xfEyvb/dxmtRA7oJc4lA0glbQi3of+ILHQoK4Vdcx85Maq9vR4dFtZZ5OHLQeM0DU2gzZBh/ZwnjFOaHdOdMCWfZaHCn13ELz7UPZPpSOJVxKJx1X5i2z NyRMJO8iPHF7rNjFFOvUX60zYQmBs//eoO0cSIXHd9vrKSZcTDlTueYymQuzEbAfKDQs/sWdTWkFr2SD3aFUnz9tn/VbKNwvFtM=
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=683021cf a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=8b9GpE9nAAAA:8 a=RF00TdSWAAAA:8 a=sozttTNsAAAA:8 a=WN6_cwnCAAAA:8 a=dML_XACEAAAA:8 a=PssDBZGIAAAA:8 a=mK_AVkanAAAA:8 a=8AirrxEcAAAA:8 a=cLacoQ2V4gzMLWO6MuMA:9 a=QEXdDO2ut3YA:10 a=lVXmBlJ2l1UA:10 a=P5L7wpMTXyg1GfFA3Gwx:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=_nx8FpPT0le-2JWwMI5O:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=L0fzO-P85HkJbeZJe4ir:22 a=HJRSn2hXXqGixlvEXVkw:22 a=3gWm3jAn84ENXaBijsEo:22 a=ST-jHhOKWsTCqRlWije3:22
Message-ID: <21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl>
Date: Fri, 23 May 2025 09:20:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: [ANN] Media Summit 2025 Report
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Media Summit May 13 2025, Nice, France
======================================

In-Person Attendees
-------------------

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
Hans de Goede <hdegoede@redhat.com> (Red Hat)
Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
Paul Kocialkowski <paulk@sys-base.io> (sys-base)
Mattijs Korpershoek <mkorpershoek@redhat.com> (Red Hat)
Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Maxime Ripard <mripard@redhat.com> (Red Hat)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)

Remote Attendees
----------------

Kieran Bingham <kieran.bingham@ideasonboard.com> (Ideas on Board)
Nas Chung <nas.chung@chipsnmedia.com> (Chips 'n Media)
Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
Donadkar, Rishikesh <r-donadkar@ti.com> (Texas Instruments)
Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> (Intel)
Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
Alain Volmat <alain.volmat@foss.st.com> (STMicroelectronics)


The PDFs of the presentations and the group photo can be found here:

https://hverkuil.home.xs4all.nl/summit2025


Hans Verkuil: Introduction
--------------------------

Meeting Room sponsored by: Cisco Systems Norway and Collabora
Lunch sponsored by: Ideas on Board

Many thanks to our sponsors!

Very pleased with the turn-out (19 in-person attendees and 12 remote
participants), even though the Media Summit is now co-located with a different
conference (Embedded Recipes instead of the Embedded Linux Conference Europe),
and it is only 9 months since our previous Media Summit.


Paul Kocialkowski: Stateless Video Encoding uAPI
------------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Paul%20Kocialkowski%20-%20Stateless%20Video%20Encoding%20uAPI.pdf

We still do not have support for stateless video encoders. Several attempts were
made since 2021, but never followed up.

One important part of the discussion is rate control, which may involve
proprietary algorithms and hardware features, so you want both an open source
kernel-side implementation and the option to run a custom implementation.

Proposal: have an open source kernelspace implementation and allow userspace to
provide hints, strategy and related parameters. The driver will take that into
account and do the rate control based on that. In the future look at eBPF to do
custom rate control.

Hans noted that code that uses publicly published algorithms (e.g. for rate
control) must refer to the public sources used to implement it. So it is clear
it is based on non-IP protected algorithms.

Encoders can have HW specific features. Mauro mentioned that some HW specific
high-level controls are fine (they already exist for some stateful encoder
drivers), as long as they are documented and as long as encoding will work with
acceptable quality without using them.

Going forward an informal working group is created to work on stateless
encoders. Contact Paul if you are interested in this.

The initial submission will include support for at least two hardware
implementations. This allows these drivers to go to mainline directly instead of
being parked in staging. The reason is that we want to have implementations for
at least two HW implementations before it is accepted in mainline to have a
reasonable guarantee that the uAPI is not specific to a single HW implementation.

The plan is to have something ready this year.


Jai Luthra: Per-Stream V4L2 Controls
------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Jai%20Luthra%20-%20Per-Stream%20V4L2%20Controls.pdf

Currently:

- controls can't be specified for pad/stream: controls apply to the whole
  device, to a device node or to a file handle, but not per-pad/stream.

Motivations:

- state awareness: no TRY controls (relevant for controls that impact format)
- stream awareness: support devices that support multiple streams
  (multi-exposure sensors)

Proposal:
- VIDIOC_SUBDEV_S_CTRL (and a VIDIOC_SUBDEV_S_EXT_CTRLS variant)
  Matches VIDIOC_SUBDEV_[SG]_FMT extension to support pad/streams.
- Store v4l2_ctrl_handler in the v4l2_subdev_state

Nicolas wonders if the pad/stream availability is discoverable: a generic API
would be needed to do so (partially covered by the routing support API).

Unknowns:
- per-pad or per-stream ? Devices that support internal pad should be good with
  'per pad' but other devices like FPD-Link or GMSL would require per-stream
  controls.
	
- Some controls apply to "all streams in a pad", other apply to "each stream in
  a pad". Devices with internal pads would be fine with per-pad only, devices
  like mux/demux might need per-stream: the suggestion is to add a flag field to
  signal this.

- Is this new API (TRY_CTRL) useful for video devices?
  M2M video devices use per-file handle controls, and pads are not relevant for
  video devices.
		
- Hans: Existing control API will continue to apply to the device globally,
  the newly introduced per-stream/pad API will require a reimplementation of
  the control discoverability (like query control etc.) mechanism. This is
  additional to the other work.
		
- Hans: How would this work with Request API? To be investigated.
	
- Laurent: storing controls in the subdev state would require duplicating the
  whole control handler per state, when the actual enumeration of controls will
  be the same for all instances of the control handlers, only the values change:
  is it worth exploring how to split the control definition from the actual
  control values?
  Hans: would be nice but not required, compared to the memory for video buffers
  this memory duplication is negligible. It can always be optimized in the
  future if needed.
		
- Hans: new compliance tests are required for this, and likely an implementation
  in the vimc test driver to allow regressions testing this.

- Lock handling: the lock should be shared between the subdev state and the
  control handler.
  Sakari: lock validation could be performed in v4l2_subdev_init_finalize().
	
Mirela from NXP points out that a sensor they're working on has up to 4
exposures with 4 controllable gain/exposure but a single pixel stream as HDR is
performed on the sensor. Per-pad would work better in this case? Or is it better
to use a dynamic array control?

Suggestion is to propose a new standard dynamic array control to support
multiple gain/exposure pairs for HDR sensors.
	

Sakari Ailus: Identifying Camera Modules
----------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Sakari%20Ailus%20-%20Identifying%20Camera%20Modules.pdf

Proposal: add a string-based identification to the devicetree to name camera
modules, similar to the 'compatible' string used today. And create a database
with camera module information indexed by that string.

Mauro: the linuxtv wiki has a database of TV capture card and PC webcams,
something like that might be useful for camera modules as well:

https://www.linuxtv.org/wiki/index.php/Hardware_device_information
https://www.linuxtv.org/wiki/index.php/List_of_device_vendors

Sakari suggested using "gpio" as the alias for 'unknown' vendors since "gpio" is
a reserved name, but that was considered to be too creative :-) Something else
will be needed for that. Laurent suggested to ask the DT maintainers to make
the prefix "unknown" reserved.

Using device tree vendor prefixes is preferred, since standardized, according to
Sakari.

Database should be in a git repo in machine readable format. Maybe YAML or
ReST files stored on a per-vendor structured tree with datasheets placed there
when publicly available.


Laurent Pinchart: Review of the Status of Staging Drivers
---------------------------------------------------------

Staging drivers should be maintained cleaned-up and graduate out of staging.
In some case they have been removed and then resurrected (AtomISP), others are
simply abandoned.

What is the policy?

Two cases for driver in staging:

- bad code with the promise of being improved; if it doesn't happen then drop it.
- good code with bad API usage: same reasoning.
- Ricardo: what if we have users already? Room: it might not be nice, but
  staging has been abused, so if things do not improve the staging driver should
  be dropped.
- Laurent: staging was there to allow people to cooperate on a common base and
  improve a non-finished driver. If cooperation doesn't happen code should be
  removed from staging.

- starfive driver: was merged with the promise of providing documentation and
  userspace support. They said it will come when the chip has no commercial
  value for them.

  Action Laurent: Ping the maintainer and if they don't act, drop it.

- ipu3 driver: limited activity, Sakari has on his TODO list talking with
  documentation team to release more documentation. Currently doc is missing to
  graduate out of staging. libcamera has open source support for it, but the
  image quality is limited. Some blocks are not documented and the pipeline
  configuration has been reverse engineered. Most of the issues are related
  to camera resolution support on different sensors.

  Action Sakari: try to get documentation, if nothing happens revisit the topic
  in one year.

- imx6 driver: imx6 (at least the camera part) should be reviewed and promoted.
  Maxime: if a staging driver has been there since a long time, it has users,
  so we can't drop it, does it mean it's "stable"?

  Main issue is that the TODO file is not clear about what the exact problem is.
  Action Hans: will look at the TODO to try to understand it if any of this is
  blocking, and if so, what needs to be done.

- av7710 driver: should probably move back to mainline. It has av7110 specific
  APIs, and patches were posted to properly document this. Nobody remembers if
  this was merged or not. Once the documentation is in place, it should be fine
  to move the driver back to mainline.
  Action Mauro: will look into this.

- max96712 driver: Analog device is working on this:
  https://patchwork.linuxtv.org/project/linux-media/list/?series=15271

- meson driver: current development is stalled. The BSP version is a lot better.
  Action Nicolas: will look at this some time in the next 4 month.

- rkvdec driver: Nicolas is working on this, some patches have already been
  posted. Plan is to fix issues first, then move to mainline, then build on top
  of it.

- sunxi/cedrus driver: Paul will work on moving it to mainline.

- sunxi/isp driver: uAPI is not well defined. Laurent: there is now an
  extensible uAPI format to make it easier to extend. This would make it
  possible to start with the current feature set and extend over time. Paul will
  look at mainlining this driver.

- tegra-video driver: it never worked reliably with the Jetson platform.
  Action Hans: move to deprecated, rename CONFIG to ..._DEPRECATED. Drop after
  2 kernel cycles.

- deprecated/atmel driver: Action Hans: check with Atmel, then drop.


Hans de Goede/Sakari Ailus: Discuss V4L2 Subdev API Ambiguities
---------------------------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Sakari%20Ailus%20-%20Discuss%20V4L2%20Subdev%20API%20Ambiguities.pdf

Currently a number of drivers do not expose their analogue crop rectangle
in any way to the user space, making it impossible to control the device's
frame rate with binning or sub-sampling enabled. Some drivers that do not
expose analogue crop, do compensate this in their VBLANK/HBLANK controls.

The compose rectangle on pad 0/1 defines the combined effect of binning and
sub-sampling. A control will be added later to allow deciding how the combined
effect is divided between binning and skipping.


MBUS Bayer formats proposal: MEDIA_BUS format conveys the bitdepth, a control
selects the Bayer pattern ordering. Right now grayscale formats are used, but
it might be confusing so new generic formats should be introduced to convey
the bitdepth.

* Selecting mode in mode-based drivers outside the scope of generic raw sensor
  model.
* Generally there appears to be a consensus to use generic raw formats
  (bit depth specific) as well as a control to specify the Bayer format.
* Can the same be done for embedded data? To be figured out. The other option
  is to keep adding embedded data formats for every metadata format. The
  documentation requirement is the same in both cases, similar to that of
  existing embedded/metadata formats. This would potentially bring a hard
  dependency to per-pad/stream controls.


Jacopo Mondi: Unify the Multi-Context Support with the M2M Context Handling
---------------------------------------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Jacopo%20Mondi%20-%20Unify%20the%20Multi-Context%20Support%20with%20the%20M2M%20Context%20Handling.pdf

ISPs can process multiple cameras by time division multiplexing parameters with
different image streams. Downstream drivers create separate media graphs for
TDM'd ISP contexts.

New proposal is to introduce:

Media entity context
Video device context
V4L2 subdev context

Not much progress since last year on the patches. Dependency on Sakari's
lifetime management series. Action Sakari (discussed outside this meeting):
provide a patch that (if an option is set) provokes the lifetime issue (adding a
sleep at the right place). That helps with regression testing later.

The goal is to upstream multi-context support for the upstream RPi5 driver.

M2M and media contexts:

Nicolas: all buffers are managed by the central video device, its job is to
schedule it on one or many cores, every filehandle open on the video device gets
its own context

This multicontext approach might help with an outstanding problem with
codec drivers where you want a second video device to provide reconstruction
buffers. This API would probably help with that, allowing userspace to add
that second video device into the same context.

Hans & Nicolas can review the next version of the series, to make sure the new
approach isn't locking out future use-cases for codecs


Maxime Ripard: V4L2 & cgroups Memory Accounting
-----------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Maxime%20Ripard%20-%20V4L2%20and%20cgroups%20Memory%20Accounting.pdf

Main purpose is to allow admins to limit the amount of DMA memory drivers can
allocate. The default is infinite. This requires knowledge of who allocates
the memory from what resource. Complicated by carved out memory, CMA, etc.

Suggestion: try this with the test-drivers first. If that works, then it should
be good for 98% of all drivers.


Ricardo Ribalda: Openness Framework for ISPs
--------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Ricardo%20Ribalda%20-%20Openness%20Framework%20for%20ISPs.pdf

Proposal to split ISP data depending on the category. This helps vendors
to keep part of their configuration secret if they do not want to open it up.

1) Fixed data (akin to firmware): vendors provide that data.

2) Calibration data: typically sensor/use-case specific. Must be made
   available by the vendor. Possibly extract it from e.g. Windows drivers.
   It must be documented how to apply this. Note that providing calibration
   data for a specific sensor is a source of income for some vendors.

3) Algorithmic data: both the input (calibration/statistics/etc.) and output
   (ISP parameter buffer) must be fully documented. This allows for open source
   implementations.

No objections to this proposal, but the expectation is that this limits the
capabilities quite a bit. We will have to wait and see how this will work in
practice.


Ricardo Ribalda: Let Media CI check Alphabetical Order
------------------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Ricardo%20Ribalda%20-%20Openness%20Framework%20for%20ISPs.pdf

Suggestion to use a utility 'keep-ordered' to annotate code indicating if
something needs to be in a specific order and fail if it isn't.

Concern that it might make the code harder to read.

Proposal is to post patches to see what it would look like. It is not actually
a very common requirement.

Ricardo later posted a few examples:

https://lore.kernel.org/linux-media/20250514-keep-sorted-ioctl-v1-1-0d66585c6ce5@chromium.org/
https://lore.kernel.org/linux-media/20250516-keep-sorted-makefile-v1-1-82c6a4d3b1a8@chromium.org/
https://lore.kernel.org/linux-media/20250429-keep-sorted-v1-2-2fa3538c0315@chromium.org/


Hans Verkuil: Status of Media CI/Multi-Committers
-------------------------------------------------

Presentation: https://hverkuil.home.xs4all.nl/summit2025/Hans%20Verkuil%20-%20Status%20of%20Media%20CI%20and%20Multi-Committers.pdf

- Terminology: the various developer roles: Developer, Reviewer, Driver
  Maintainer, Media Maintainer, Media Core Maintainer, Media Subsystem
  Maintainer, God (aka Linus)
- Media Maintainer Duties: what is expected of Media Maintainers.
- Media CI is now in a good, usable state.
- Hans gave a demonstration how he is using patchwork/Media CI to do reviews
  and process Pull Requests. The workflow is often very maintainer-specific,
  i.e. whatever works for you.
- Multi-Committers: currently blocking on the documentation:
  Action Mauro: rebase and post the documentation. With some Acks it can go in
  and we can add two more committers. The expectation is that this document will
  change and be improved over time. This must be made clear in the documentation.

