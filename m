Return-Path: <linux-media+bounces-64976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I0XKN00LMWoRawUAu9opvQ
	(envelope-from <linux-media+bounces-64976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:37:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F668D376
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Csvn+rpf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64976-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64976-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD613046EA4
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2383416D0A;
	Tue, 16 Jun 2026 08:34:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868F3CC310
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598855; cv=none; b=DVua8Sqs3xvhxuD/8ebm94+JcD+KfwgdICGbHRotzybCfLApgHTLS2DHu5V9WmRPYpD/i9fl1epoA6H9ZAKvomGuBm38M+v0imonhg3ZdRJK8w8uj+B1Pyhh5F5NoIVY5rrOOv5r4lcCFKg6DEdgYq6GYQqzFFS3MMVeTvQVSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598855; c=relaxed/simple;
	bh=0mysJtrCg6t6uJw9vWmjkzAZCjIUCuZ2ZzQERp85RlA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=LsJ+mIZFywoOJIzNVrNaHYFhKzvNUspxQF/MAVylKeKNmXDqCcNetUu4gJQ8NF3cImmV3ujf7aLYjXjfZPdG9fN7hP05NB9dGQPragJPE/exo9rBml9gLKb0u5XDqIiz1ntU81P4EktLng/GWq3SCtFEU037y9b3Grrh4BSs00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Csvn+rpf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AFD1F000E9
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598853;
	bh=d13EGZvEIaPBNCrrx+4YeM8+4NzPlZus1ISB6TrAGZs=;
	h=Date:From:Subject:To;
	b=Csvn+rpfKe4FGEGBCmuRc6OFb+alOSXCPHWokX8ELZRFTWEmlA0tZTPoJ6djfJghW
	 B/fD7iCrgJZQfoLwznEgpsN7GGKVlPq7yglNbYrv1qTed+LmdEftgiwDvLlGt6xOAO
	 0lizDnSWWNtSAPrUcqmkW2tiPmGkrmeh5QpCfEnZJgQ8PlnJ1vmVSGU6B08pNwXKys
	 xagrpMFEwXs0ZsVGdr/o14cbXA0NXoTkzO6rHTupZIuohidXxe3sDudBWI9digQBYp
	 3OTC8aoMWydFM8YDeD0YFQ0uoDzKRfCToMnXZBoXxp4MHKmgd/CzyKEDBSr9cGVv2P
	 p07ZSjd1tAyxw==
Message-ID: <40b6589d-ef42-48d0-9853-341dc196fd18@kernel.org>
Date: Tue, 16 Jun 2026 10:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [ANN] Media Summit 2026 meeting minutes
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-64976-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B5F668D376

Media Summit May 26 2026, Nice, France
--------------------------------------

These are the minutes (to the best of my ability) of the 2026 Media Summit.

Many thanks to our sponsors: Collabora, Ideas on Board and Cisco!

I also appreciate the efforts of all those who kept our etherpad up to date
during the meeting: thank you for doing that!

And of course a big Thank You! to all attendees. It was by a sizeable margin
the most attendees we ever had, I was really pleased by that.

The presentations can be found here:

https://www.linuxtv.org/downloads/presentations/media_summit_2026/

The minutes are in addition to the presentations and primarily address any
discussions during or after each presentation.

In-Person Attendees:

- Sakari Ailus <sakari.ailus@linux.intel.com>
- Kieran Bingham <kieran.bingham@ideasonboard.com>
- Brandon Brnich <b-brnich@ti.com>
- Rouven Czerwinski <rouven.czerwinski@linaro.org>
- Mehdi Djait <mehdi.djait@linux.intel.com>
- Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- Nicolas Dufresne <nicolas.dufresne@collabora.com>
- Marco Felsch <m.felsch@pengutronix.de>
- Vikash Garodia <vikash.garodia@oss.qualcomm.com>
- Stefan Klug <stefan.klug@ideasonboard.com>
- Paul Kocialkowski <paulk@sys-base.io>
- Frank Li <Frank.li@nxp.com>
- Jai Luthra <jai.luthra@ideasonboard.com>
- Robert Mader <robert.mader@collabora.com>
- Jacopo Mondi <jacopo.mondi@ideasonboard.com>
- Benjamin Mugnier <benjamin.mugnier@foss.st.com>
- Beleswar Padhi <b-padhi@ti.com>
- Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- Loic Poulain <loic.poulain@oss.qualcomm.com>
- Sven Püschel <s.pueschel@pengutronix.de>
- Ricardo Ribalda <ribalda@chromium.org>
- Michael Riesch <michael.riesch@collabora.com>
- Daniel Stone <daniel@fooishbar.org> (Collabora)
- Devarsh Thakkar <devarsht@ti.com>
- Michael Tretter <m.tretter@pengutronix.de>
- Suresh Vankadara <svankada@qti.qualcomm.com>
- Hans Verkuil <hverkuil@kernel.org> (Cisco)

Remote Attendees:

- Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
- Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
- Mauro Carvalho Chehab <mchehab@kernel.org>
- Rishikesh Donadkar <r-donadkar@ti.com>
- Arash Golgol <arash.golgol@gmail.com>
- Martin Hecht <mhecht73@gmail.com> (Avnet Silica), martin.hecht@avnet.eu
- Víctor Jáquez <vjaquez@igalia.com>
- Antti Laakso <antti.laakso@linux.intel.com>
- Mirela Rabulea <mirela.rabulea@nxp.com>
- Dave Stevenson <dave.stevenson@raspberrypi.com>
- Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
- Arthur Vinchon <arthur.vinchon@allegrodvt.com>

-------------------------------------------------------------------------------

Laurent Pinchart: Status of ISP support in V4L2

Overview of ISP development in V4L2 over the last 12 months:

- There are many SoC vendors that have no interest in upstreaming anything at all,
  e.g. they have a small amount of customers with high-volume, they don't want it
  upstream, instead they want to control the BSP and complete stack.

- Ricardo: Is Qualcomm looking to upstream ISPs for mobile processors?
- Loic: We started with Arduino SoC with small complexity.
- Suresh: Internal ISPs are in planning, looking to maybe upstream more based on
  internal roadmap.

- Sensors are selected based on the device requirement. Libcamera is working
  directly with vendors, but they don't have the resources to upstream every
  driver immediately. There are plans to expand this: trying to convince
  Omnivision to participate upstream as well, already many drivers in tree. But
  smaller vendors are hard to reach.

- Nicolas: SW-dev side: Slow progress, why is this? What are the required actions
  to accelerate?
- Laurent: Things are slow to be reviewed and merged. Large amount of work to
  build, large of amount of time needed to review. So API changes keep slipping.
  E.g. the Metadata patch series has been worked on since 2014?
- Sakari: One reason for the metadata series being around for a long time was that
  it was left to linger for a longer period of time.
- Hans: please ping me for reviews.
- Sakari: don't need a review, just ack them!
- Laurent: Kernel ABI stability forbids making mistakes when designing APIs,
- userspace compatibility is required. No good answers for that.
- Sakari: part of the reason, new functionality that interacts with the existing
  API and not all drivers use the new features. Userspace is also required to
  verify the features.
- Hans: Sometimes hard to review due to tangled up concepts in patch series, e.g.
  mixing bug fixes and features, or adding multiple features in one series.
- Sakari: Decision to move the bug fix out of the features series is sometimes hard
- Jacopo: Multi-context review stalled because nobody looked at it, has been to
  two summits to present this.
- Nicolas: Missing visibility and documentation to understand how it works.
- Nicolas: A Media Summit is not necessarily the correct stage for widespread
  presentation of concepts.
- Ricardo: have ABI similar to DRM, where each ISP driver can define its own ABI.
- Ricardo: Vendors only have money for the product development, funding is not
  possible after that.

-------------------------------------------------------------------------------

Paul Kocialkowski: V4L2 Stateless Video Encoding uAPI Progress Update

- Nicolas: Difference in design between stateful and stateless. The stateful
  encoding uAPI was done and could not be changed

- Negotiating formats for the encoder:
  - Paul: Fact that output depends on capture?
  - Nicolas: as soon as you pick a codec you may eliminate output formats, same
    for bitrates, sizes, profiles and so on. Much ambiguity in stateful where
    you push buffers into the encoder and some buffers are output, but are not
    fully controllable.
  - Hardware can detect 10bit vs 8bit, what should the driver report in that case?
  - Nicolas: decoder first sets the controls, this sets up the expectations for the
    format enumeration and so on
  - Paul: Different in encoders, since the user provides the pixels
  - Nicolas: note that there is an VIDIOC_ENUM_FMT flag V4L2_FMTDESC_FLAG_ENUM_ALL
    that will enumerate all formats, ignoring the current configuration.

- Proposal to rename V4L2_PIX_FMT_H264_SLICE to V4L2_PIX_FMT_H264_SL was approved.

- The read-only request patch series might be needed for stateless encoders
  to provide the feedback:

  https://lore.kernel.org/linux-media/20210610113615.785359-1-hverkuil-cisco@xs4all.nl/

- Regarding handling references in the uAPI: write an RFC or similar to propose a
  solution.

- Don't abuse existing controls, it's cheap to add new controls.

- Nicolas: Rate control is difficult because for CPU access to the information
  from the previous frame is required and keeping that in userspace creates a gap
  in the encoder where it can't be used to the fullest.
  - Paul: more about that can be found in last year's presentation
  - Vikash: Rate control can be made configurable? Let hardware do it even in stateless?
  - Paul: kernel rate control would take hardware feedback into account
  - Brandon: Is there a CPU usage increase for rate control?
  - Paul: not really, very simple math that is not expensive
  - Nicolas: most firmware devices use M0 cores which are slow as well
- Is there an intention to share between h.264 and h.265?
  - Paul: Some things are common, but terminology is different
    Bitstream generation could be common, but is very small
    A lot of this is directly from the SPEC, so there is not much room to share

-------------------------------------------------------------------------------

Nicolas Dufresne: Vulkan Video Codecs

- Make sure that Linux media knows whats happening, note that this is not a Linux
  Media Project
- Intention is to start with new hardware that was never supported by v4l2.
  IOMMU hardware protection needs to be in place for this.

-------------------------------------------------------------------------------

Rouven Czerwinski: Protected Video playback on i.MX8MQ

The discussions did not provide clear answers to the Open Questions.

-------------------------------------------------------------------------------

Hans Verkuil: HDCP support for HDMI receivers

- Michael: How do you deal with HDMI input on the userspace side? Custom?
  - Hans: V4L2
- Michael: Self written app or reusable application?
  - Hans: Not really device specific, specific is where you are not passing
    decrypted memory to unsecured memory
- Michael: libcamera for HDMI HDCP?
  - Hans: Device specific things are happening in OP-TEE anyway

-------------------------------------------------------------------------------

Stefan Klug: How to progress on Module identification

- Comes from a need to match tuning data with specific modules physical properties.
  Eeprom or some register based identification, DT to define where the information
  is. Some properties are not identifiable, device tree is an option, but typically
  something we iterate on in userspace.
- Even when data is there, we still need to know the format it's stored as.
- Multiple ideas for things to identify: module name, vendor, lens, sku,
  how-to-query, user defined.
- No objection to using a string, but where are all the tags/values defined and
  documented? libcamera perhaps since that's the main user?
- Would the devicetree maintainers agree to this?
- Suresh: Is it possible to create a tuning file name with module, lens and ISP
  information to select? Does Vendor name makes any difference if the data of module,
  lens and ISP info is available?
- Hans: make an RFC with a proposal.
- Ricardo: mentioned 'hardware database' and said that he would like to be part of this
  discussion. (Note: this was discussed further during the libcamera workshop the
  following Friday.)

-------------------------------------------------------------------------------

Sakari Ailus: Common raw sensor model, streams, metadata and metadata series status

- Being worked on since 2014
- Most of patches on the kernel side are on their way
- Since last year:
  - Separation between Common Raw Sensor Model and existing practice in uAPI
  - Introduction of lines length (in pixels) and frame length (in lines)
  - Capability flag for new Raw Model, very visible in pad ops in each driver
  - Multiple streams in a sensor routed to different video nodes, when should
    the sub-device start streaming, when should the MC validate the pipeline?
  - Jacopo: Is LATE_VALIDATE flag merged/final? Can we discuss this?
    - Is it only for yavta/old tools? Should this flag be for a whole
      media graph instead of a single video device?
    - Tomi: Ser/Des devices can be a bit picky, where it is impossible
      to change the streams after starting streaming
    - Hans: Can we postpone this?
    - Laurent: Can we rework validation to be streams-native?
    - Sakari: Can that be postponed too?
- Sakari: Users? When to merge?
    - Sakari has patches for v4l-utils, yavta
    - Can we have patches for libcamera too?
    - Laurent: we have support in libcamera for an older version of the
      series (v10 if I recall correctly), and we want to update
      to the latest version to validate it.
    - Hans: Patches in v4l2-ctl/compliance for all new APIs.
    - Sakari: I've added some
- Negative blanking breaks some libcamera pipelines
    - Jai: Don't break the most widely used sensor (IMX219)
    - Sakari: Can't have a single pixel rate (needed for new FLL/LLP
      controls) and still support old (non-negative) blanking values
      in IMX219
- Can we have another "example" driver (with 0 users?) as an example of
  this API? Are we okay with never converting IMX219 to the new raw model APIs?

-------------------------------------------------------------------------------

Sakari Ailus: AI patches

- https://lore.kernel.org/linux-media/20260320000937.9177-3-tchatard@gmail.com/
- probably not written by a human
- Laurent: we could deny if it looks like an AI (not being properly marked is a
  trust breach) like we could for messy patches
- Nicolas: dig into some specifics and check if the submitter understands his
  code
- Hans: about 40% of fixes are bad. At least not yet seen the maintenance work
  increased in the AI era
- Laurent: crictial about Sashiko usage, on point with Erik's Opinion
  (https://kusma.xyz/blog/2026/03/26/open-source-and-ai/), Hans and Mauro are OK
  with Sashiko and think we should request to add linux-media to Sashiko bot.
- Nicolas: if sashiko notices a security flaw, we don't want to ignore it
- Laurent: we have to be careful to not get dependent on Sashiko (although being
  free at the moment)
- Nicolas: we don't want the reviews on the mailinglist, but it is useful to have
  them somewhere. It can be hard for newcomers to know which raised issues should
  be addressed.
- Frank Li: can maintainers make clear what they expect from contributors on
  handling reviews made by AI?
  The network maintainer requires contributors to address all sashiko issues,
  and if there are false positives, explain why it is a false positive. This
  indicates that the contributor has looked at this. The number of false positives
  has gone down a lot in the last half year.
- Hans: the media subsystem is not known for its quick reviews, so having sashiko
  assist is a positive thing.

-------------------------------------------------------------------------------

Jacopo Mondi: A case for a media-job scheduler

- Laurent: There are two separate drivers with two different DMA engines, one
  for raw buffers (IVC) and one for output buffers (Mali C55)
- Jai: DMA engine API to wrap IVC instead of a subdev?
  - Laurent: There might be other more complicated things before the ISP
    in the pipeline, not just IVC
  - Jacopo: IVC also handles input parameters, not just frame data
- Nicolas/Ricardo: Why not just use Fences like done in DRM?
  - If IVC is replaced by something else, fences will still work?
  - Hans: Fences were tried before and were very painful. Need a *really*
    good reason to try again.
  - Nicolas: Too much overlap between DRM sched and Media jobs
  - Hans: Please repost again on the list. Jacopo: Sure, we can also
    implement the new framework in the driver now
  - Suresh: Is new QBUF waiting on DQBUF of previous request DQBUF done
    (ISP Done) using fence/sync helps to solve?
  - Hans: post a new version on the mailinglist.

-------------------------------------------------------------------------------

Michael Riesch: The Butterfly Effect or How Support for Complex Hardware may affect the uAPI

- If we want dynamic media graph: then entities can disappear and re-appear.
- Hans: Please post an RFC for fault-tolerant support.
- Hans: if you want major changes, then I suggest a brainstorm session, this was
  done in the past.
- Laurent: we probably need to support a media device that contains multiple
  drivers. This requires a dynamic media graph.
- Hans: who will do that work?
- Laurent: it should be possible to allow for both m2m and inline support
  for the HW described in the presentation.

-------------------------------------------------------------------------------

Ricardo Ribalda: Overview of Media CI: where do pipelines run?

- Old days: scripts lived locally on the maintainers beefy machines.
- Now on Freedesktop GitLab.
- Unoptimized cost: $107k/year on gcloud.
- Save money hacks
  - Use spot instances and increase failure retries ->
    down to 48k/year
  - Autoscale servers on demand -> down to 5k/year
- Different queues for different environments
- AI uses a lot of resources and makes spot instances less available.
  Using multizone increases the chances to get a spot instance, but this
  is not enough during peak hours.
- Since a week, media-committers uses non-spot servers. More expensive,
  but you can actually get pipelines passed in the week before -rc6.
- Currently funded by Google.
- Use it to test hardware? Ricardo: Media CI is not meant for that, it is
  meant to ensure that the patches keep Linus happy.
- Hans: possible exception would be UVC: it would be nice to have this
  tested as part of the CI process.
- Nicolas: we use Fluster against visl. Could be a candidate for CI as well.
- Hans: emails sent to contributers can be improved as it is not always clear
  what is expected from them.

-------------------------------------------------------------------------------

Hans Verkuil: Discussion of the media subsystem development process

- Hans: tries to get PRs processed within 1-5 days.
- Hans: ping me (Hans) if you want me to review anything. I'll do my best to
  prioritize them.
- Mauro: ping me (Mauro) for DVB patches.
- Mauro will try and see if pw-bot could update patchwork automatically:
  https://korg.docs.kernel.org/patchwork/pwbot.html
- Encourage cross review across different vendors for drivers.

