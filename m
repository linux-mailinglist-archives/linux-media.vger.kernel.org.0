Return-Path: <linux-media+bounces-18867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A198A4AA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105911F232FA
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F0918EFEC;
	Mon, 30 Sep 2024 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kmEzbznR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2B18E74D
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702413; cv=none; b=Qu+cexVMcY6AYERk0vJpinJwnh7PbMwf5aZ5Wy9JZqjK/uldcVOrw4Ix0LedHlHdiDJyVUz0YdhI3erD+aqbczNL8jxLAGmdduTGJiMr7twOvY/KrjH+5/GUEg6D2fSS+AzLRHMY/7AI9iIqTU2usW4FtpFr1qtPJdkKNEQ7Ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702413; c=relaxed/simple;
	bh=porCRUDmIYRpaCG4KCioI3hNeD1WwAmkLEcMQAxQxjo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D5Zk6cUzWqoAhBjcM94NpqwSu8nR3PamcIjTBOVBUmQ/e73KKr0dWt8YmZq4rrF7tM576m1ks0pRdcsnWJHzlVieQ4B/PoFOJcM9a5ThhNCD1URMBRy/3MNJr/oi6tGPCwCGCdf1CQS8wrU1YAlsyduqyIXsRgNd11wBKQPERcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=kmEzbznR; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso5048660a12.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727702409; x=1728307209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T6TBXBVc/mjqILIMOpkV8orMByJ/wYvevOZtdDy1lK8=;
        b=kmEzbznRQKdPRW0uO/3LUddwWE9+U+oLoLrC4M/PmSYkmikhBDeHxt4K7rXpB58tZm
         F49/M6x3a+42IZzEtUVPmhP7pZUsVMp0jNeR7vlrnXKelVdZJN54E3Lg5LWkGdoV5bhw
         FJCvVoEfcrpzqw4HJwURfuTQy+QqWU9CDFx1mMp5NppDq/NYMeIX9bn+Tyn2tR+flrEr
         j8Ww8ylouP3lRo/lLdQ9itOeyQjcaxBP2+r7xl4nLfvYMXeSIMv4tuvwApQlv81BLzMd
         wJBpRrBFcyjKn34HWqeULv7ABpedJWxCJWP8BM387+xJfusmU/1g0wJ7cZY0jCjrbnHK
         eBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702409; x=1728307209;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6TBXBVc/mjqILIMOpkV8orMByJ/wYvevOZtdDy1lK8=;
        b=haC3ZQrPegpb69+5UBHEy10SEmf8lKxfSFyn/9RfIn6p37VOqGxpB8yF94jkBQ/81r
         axPbFrbB/5ZnufPQhI+R4qMOsWw6tr71hbF/mv5qg5PNvDW2YMC1S1h8A6bL71uG5jU+
         QwOFLewwluU0hFwLL5kWSyBDHWgG98fuUGdadMdEOT3kI1xafkS8H4FuNsjeqv+PCZk3
         RNWl3v0PC+LNFJroVJr7K0Vcw2ny9lLMUXsYbQKXkd9APPRPpbRouiYb0d8I5mG/PLqe
         ry+8mTiaSE4xUH9+yWxEweK3NYSTPIMLtXWCimmm+bAyYT2Cn2pcCWSzo6/kiFkgPQgm
         MB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+Z9TR43uS2S4Eu2u1WVlX8js5f6GmcAEEzflMghP8Qb6d4XYPGX/isTo9BqNOU76gCYsJsuKDBldLEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CwPgLDe5trCe5XOIlAqFxVbhT9H11EaQofRrcYkSFg816d6O
	nMSMHZeLIvZQ8ptPt11JmZ/ejA1sCGW23DbpngGzH2WCE/6i4veX
X-Google-Smtp-Source: AGHT+IECjk0j3LepFYGmRSNdtCWBpTZZgtnxUUDU6Jf1mZZJgOJS9LUrF/nELlsy5IOa47m0CjwH5w==
X-Received: by 2002:a05:6402:2708:b0:5c8:8d5e:18ad with SMTP id 4fb4d7f45d1cf-5c88d5e1933mr3854084a12.18.1727702408843;
        Mon, 30 Sep 2024 06:20:08 -0700 (PDT)
Received: from [192.168.1.153] ([188.26.249.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882495491sm4497664a12.87.2024.09.30.06.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 06:20:08 -0700 (PDT)
From: Mirela Rabulea <mirela.rabulea@googlemail.com>
X-Google-Original-From: Mirela Rabulea <mirela.rabulea@gmail.com>
Message-ID: <396086a8-f464-45d0-a1b3-bb222c65074f@gmail.com>
Date: Mon, 30 Sep 2024 16:20:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/46] Generic line based metadata support, internal
 pads
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>, laurentiu.palcu@oss.nxp.com,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>, tomas.babinec@nxp.com
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari & all,


On 16.04.2024 22:32, Sakari Ailus wrote:
> Hi folks,
>
> Here are a few patches to add support generic, line based metadata as well
> as internal pads. While the amount of code is not very large, to the
> contrary it is quite small actually IMO, I presume what this is about and
> why it is being proposed requires some explaining.
>
> Metadata mbus codes and formats have existed for some time in V4L2. They
> however have been only used by drivers that produce the data itself and
> effectively this metadata has always been statistics of some sort (at
> least when it comes to ISPs). What is different here is that we intend to
> add support for metadata originating from camera sensors.
>
> Camera sensors produce different kinds of metadata, embedded data (usually
> register address--value pairs used to capture the frame, in a more or less
> sensor specific format), histograms (in a very sensor specific format),
> dark pixels etc. The number of these formats is probably going to be about
> as large as image data formats if not larger, as the image data formats
> are much better standardised but a smaller subset of them will be
> supported by V4L2, at least initially but possibly much more in the long
> run.
>
> Having this many device specific formats would be a major problem for all
> the other drivers along that pipeline (not to mention the users of those
> drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> receiver drivers that have DMA: the poor driver developer would not only
> need to know camera sensor specific formats but to choose the specific
> packing of that format suitable for the DMA used by the hardware. It is
> unlikely many of these would ever get tested while being present on the
> driver API. Also adding new sensors with new embedded data formats would
> involve updating all bridge and CSI-2 receiver drivers. I don't expect
> this to be a workable approach.
>
> Instead what I'm proposing is to use specific metadata formats on the
> sensor devices only, on internal pads (more about those soon) of the
> sensors, only visible in the UAPI, and then generic mbus formats along the
> pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> to bit depth and packing). This would unsnarl the two, defining what data
> there is (specific mbus code) and how that is transported and packed
> (generic mbus codes and V4L2 formats).
>
> The user space would be required to "know" the path of that data from the
> sensor's internal pad to the V4L2 video node. I do not see this as these
> devices require at least some knowledge of the pipeline, i.e. hardware at
> hand. Separating what the data means and how it is packed may even be
> beneficial: it allows separating code that interprets the data (sensor
> internal mbus code) from the code that accesses it (packing).
>
> These formats are in practice line based, meaning that there may be
> padding at the end of the line, depending on the bus as well as the DMA.
> If non-line based formats are needed, it is always possible to set the
> "height" field to 1.
>
> The internal sink pads are an alternative to source routes [1]. The source
> routes were not universally liked and I do have to say I like re-using
> existing interface concepts (pads and everything you can do with pads,
> including access format, selections etc.) wherever it makes sense, instead
> of duplicating functionality.
>
> Effectively internal sink pads behave mostly just like sink pads, but they
> describe a flow of data that originates from a sub-device instead of
> arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> and disable routes from internal sink pads to sub-device's source pads.
> The subdev format IOCTLs are usable, too, so one can find which subdev
> format is available on given internal sink pad.

I wanted to ask what is the current status and intentions regarding this 
patch-set?

I am particularly interested in the internal sink pads, as I hope that 
is what I need for a sensor driver that I am currently working on. It is 
for an HDR sensor which is sending the long exposure on one virtual 
channel, and the short exposure on another virtual channel. While adding 
streams & routes to the sensor driver, which only has one source pad, 
the routes are invalid on the sink side (still, I can capture on 2 
streams, with the routes active by default).

One way to solve that would be to add an internal sink pad. Another 
would have been to have a route flag, V4L2_SUBDEV_ROUTE_FL_SOURCE was 
proposed here, but it seems it was not approved:

https://patchwork.linuxtv.org/project/linux-media/patch/20210524104408.599645-21-tomi.valkeinen@ideasonboard.com/#129080 


Thanks,

Mirela

>
> I've also pushed these here and I'll keep updating the branch, I've also
> included untested OV2740 patches:
>
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
>
> Questions and comments are most welcome.
>
> Preliminary media-ctl and yavta patches can be found here:
>
> <URL:https://git.retiisi.eu/?p=~sailus/yavta.git;a=shortlog;h=refs/heads/metadata>
> <URL:https://git.retiisi.eu/?p=~sailus/v4l-utils.git;a=shortlog;h=refs/heads/metadata>
>
> I have used IMX219 as an example on routing in a sensor driver in this
> version.
>
> The patches are on my master branch
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.
>
> [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
>
> since v8:
>
> - Move the patch adding internal pad flag past the routing API reworks, as
>    well as a few other patches, in order to separate the patches to those
>    that could still be merged for v6.10 (routing changes) and those that
>    couldn't (sensor API related). The patch on the edge is "media: uapi:
>    v4l: subdev: Enable streams API".
>
> - Include Laurent's two patches to address crop API issues wrt. streams.
>
> - Add two patches to prepare for CCS driver rework (media: ccs: Move
>    ccs_pm_get_init function up and media: ccs: Rename out label of
>    ccs_start_streaming).
>
> - Address issues in the ov2740 driver patches (as well as the driver
>    itself), 4 more patches towards the end of the set.
>
> - Improved generic metadata format names, align with other existing
>    formats.
>
> - Improved ov2740 embedded data documentation.
>
> - Reworked streams and camera sensor documentation based on Laurent's
>    comments mainly. In particular, the contradictory concept of internal
>    source pads no longer should exist in the patches.
>
> - Fixed pad numbering in the CCS example.
>
> - Fixed S_ROUTING behaviour when len_routes is too small and when
>    S_ROUTING isn't implemented by the driver.
>
> - Reorder sections in meta-formats.rst alphabetically.
>
> - Add a note per struct fields that certain struct v4l2_subdev_format are
>    zero for metadata mbus codes.
>
> - CCS driver patch cleanups.
>
> - CCS driver metadata width fix for space-efficient embedded data at 16
>    bpp and over.
>
> - Postpone CCS frame descriptor quirk for now.
>
> - Use MIPI_CSI2_DT_USER_DEFINED(0) instead of a numerical value for
>    compressed data datatype.
>
> since v7:
>
> - Add embedded data support for the ov2740 driver.
>
> - Add three patches on top, to add an IMMUTABLE flag to source streams
>    when they cannot be disabled.
>
> - Improved documentation of len_routes and num_routes arguments of
>    [GS]_ROUTING.
>
> - Remove one inclusion of twice-included media/v4l2-fwnode.h in
>    drivers/media/i2c/ccs/ccs-core.c .
>
> - Add missing forward declaration of ccs_internal_ops in
>    drivers/media/i2c/ccs/ccs-core.c .
>
> since v6:
>
> - Improve embedded data UAPI documentation on camera sensors.
>
> - Improve wording of stream glossary entry.
>
> - Improve internal pad flag documentation.
>
> - Fix definition of "data unit" and remove an extra "only" in INTERNAL pad
>    flag description (1st patch).
>
> - Use IMX219 driver in examples consistently.
>
> - Remove the CSI-2 to parallel bridge from the example to simplify the
>    example.
>
> - Minor rewording of some parts of the routing examples.
>
> - Rebase on unified sub-device state information access functions:
>    <URL:https://lore.kernel.org/linux-media/20231027095913.1010187-1-sakari.ailus@linux.intel.com/T/#t>
>
> - In CCS driver, do not maintain current active configuration in driver's
>    device context struct (apart from mbus codes). Rely on sub-device state
>    locking and clean up the code. (Multiple patches towards the end of the
>    set.)
>
> - Arrange the CCS patches early in the set towards the end of the set.
>
> - Move the patch enabling streams API to the end of the set.
>
> - Rework IOCTL argument copying condition for [GS]_ROUTING).
>
> - Handle copying back routes in S_ROUTING, do not rely on G_ROUTING
>    IOCTL implementation.
>
> - Rebase on metadata preparation patchset v6:
>    <URL:https://lore.kernel.org/linux-media/20231106121805.1266696-1-sakari.ailus@linux.intel.com/T/#t>.
>
> since v5:
>
> - Rebase on new set of preparation patches.
>
> - Switch CCS driver from s_stream to enable_streams/disable_streams. Keep
>    streaming state information --- the sensor remains in streaming state if
>    any of the streams is enabled.
>
> - Fix setting mbus code on embedded data in get_frame_desc() op in the CCS
>    driver.
>
> since v4:
>
> - Add a patch to acquire two sub-device states that may use the same lock.
>
> - Add a patch for CCS driver to remove ccs_get_crop_compose() helper.
>
> - Add a patch for CCS driver moving acquiring and releasing the mutex to
>    the s_stream callback.
>
> - Add a patch for CCS driver to rely on sub-device state locking using a
>    single driver-provided lock.
>
> - Fixed calculating minimum number of routes in copying the routes
>    (thanks, Laurent).
>
> - Moved a label in S_ROUTING handling to make Clang happy (hopefully).
>
> - Fixed setting emb_data_ctrl register for CCS embedded data support.
>
> - Rebase on Laurent's cleanup patches.
>
> - Wrap a few long lines.
>
> - Write in embedded data documentation sensor drivers generally don't
>    allow configuring it.
>
> since v3:
>
> - Separate preparation patches from this set.
>
> - Add a definition for "Data unit", a pixel that is not image data and use
>    it instead in format documentation.
>
> - Fix more numbered lists in dev-subdev.rst.
>
> - Remove a redundant definition for V4L2_META_FMT_GENERIC_CSI2_2_24 ---
>    V4L2_META_FMT_GENERIC_CSI2_12 can be used instead.
>
> - Use "X" instead of "p" to denote padding in format documentation.
>
> - Use IMX219 in examples instead of CCS.
>
> - Document that the generic V4L2 CSI-2 metadata formats use padding
>    defined in CSI-2 spec and packing defined in CCS spec.
>
> - Add patches to align [GS]_ROUTING behaviour with V4L2. This means mainly
>    returning configured routes as part of S_ROUTING as well. "len_routes"
>    field is added to denote the length of the array and having more routes
>    than fits in the array is no longer an error. Also added more reserved
>    fields.
>
> - Added trivial support for S_ROUTING (via G_ROUTING implementation) for
>    use in drivers with static-only routes.
>
> - Added helper functions to obtain mbus format as well as crop and compose
>    rectangles that are streams-independent.
>
> - Added a patch to define generic CSI-2 long packet types.
>
> - Removed MEDIA_BUS_FMT_IS_META() macro. It didn't seem useful in the end.
>
> - Use a single CCS embedded data format. The bit depth can be selected
>    using the meta stream on the source pad.
>
> - Fix mbus code numbers (there were holes due to removed redundant
>    formats).
>
> - Fix generic mbus code documentation (byte was being used instead of
>    bit).
>
> - Fix spelling of "length".
>
> - Added a patch to remove v4l2_subdev_enable_streams_api that disables
>    streams API. This should be merged once libcamera support for streams
>    works nicely.
>
> - Don't use strings in printing frame descriptor flags.
>
> - Warn on string truncation in printing frame descriptor.
>
> since v2:
>
> - Add a better example, with formats.
>
> - Add CCS static data media bus codes.
>
> - Added an example demonstrating the use of internal pads. --- Is the
>    level of detail enough for the purpose?
>
> - Improved documentation.
>
> - Added a macro to tell whether a format is a metadata format.
>    (Documentation could be added.)
>
> - A small ReST syntax fix in the same section.
>
> - Drop leftovers of a patch checking for the INTERNAL_SOURCE flag.
>
> since v1:
>
> - Make the new pad flag just "INTERNAL", requiring either SINK or SOURCE
>    pad flag to accompany it. Removed the union in struct v4l2_subdev_route.
>
> - Add the term "stream" to MC glossary.
>
> - Improved and fixed documentation (according to comments).
>
> - Note these formats are little endian.
>
> - Remove 1X8 from the names of the mbus codes. These formats have generally
>    8 bits per pixel.
>
> - Fix mbus code numbering (had holes in RFC).
>
> - Add new metadata fields to debug prints.
>
> - Fix a minor documentation build issue.
>
> Laurent Pinchart (2):
>    media: v4l2-subdev: Fix stream handling for crop API
>    media: v4l2-subdev: Clearly document that the crop API won't be
>      extended
>
> Sakari Ailus (44):
>    media: Documentation: Add "stream" into glossary
>    media: uapi: Add generic serial metadata mbus formats
>    media: uapi: Document which mbus format fields are valid for metadata
>    media: uapi: v4l: Add generic 8-bit metadata format definitions
>    media: v4l: Support line-based metadata capture
>    media: Documentation: Additional streams generally don't harm capture
>    media: Documentation: Document embedded data guidelines for camera
>      sensors
>    media: Documentation: v4l: Document internal sink pads
>    media: Documentation: Document S_ROUTING behaviour
>    media: v4l: subdev: Add a function to lock two sub-device states, use
>      it
>    media: v4l: subdev: Move G_ROUTING handling below S_ROUTING
>    media: v4l: subdev: Copy argument back to user also for S_ROUTING
>    media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
>    media: v4l: subdev: Return routes set using S_ROUTING
>    media: v4l: subdev: Add trivial set_routing support
>    media: ccs: No need to set streaming to false in power off
>    media: ccs: Move ccs_pm_get_init function up
>    media: ccs: Rename out label of ccs_start_streaming
>    media: ccs: Use {enable,disable}_streams operations
>    media: ccs: Track streaming state
>    media: ccs: Move ccs_validate_csi_data_format up
>    media: ccs: Support frame descriptors
>    media: uapi: v4l: subdev: Enable streams API
>    media: mc: Add INTERNAL pad flag
>    media: uapi: ccs: Add media bus code for MIPI CCS embedded data
>    media: Documentation: Document non-CCS use of CCS embedded data format
>    media: Documentation: ccs: Document routing
>    media: ccs: Add support for embedded data stream
>    media: ccs: Remove ccs_get_crop_compose helper
>    media: ccs: Rely on sub-device state locking
>    media: ccs: Compute binning configuration from sub-device state
>    media: ccs: Compute scaling configuration from sub-device state
>    media: ccs: Remove which parameter from ccs_propagate
>    media: uapi: Add media bus code for ov2740 embedded data
>    media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
>    media: ov2740: Remove shorthand variables
>    media: ov2740: Switch to {enable,disable}_streams
>    media: ov2740: Track streaming state
>    media: ov2740: Add support for embedded data
>    media: ov2740: Add generic sensor fwnode properties as controls
>    media: ov2740: Add support for G_SELECTION IOCTL
>    media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
>    media: ccs: Add IMMUTABLE route flag
>    media: ov2740: Add IMMUTABLE route flag
>
>   .../media/drivers/camera-sensor.rst           |   32 +
>   .../userspace-api/media/drivers/ccs.rst       |   38 +-
>   .../userspace-api/media/glossary.rst          |   15 +
>   .../media/mediactl/media-types.rst            |    9 +
>   .../userspace-api/media/v4l/dev-meta.rst      |   21 +
>   .../userspace-api/media/v4l/dev-subdev.rst    |  179 ++-
>   .../userspace-api/media/v4l/meta-formats.rst  |    3 +-
>   .../media/v4l/metafmt-generic.rst             |  328 +++++
>   .../media/v4l/subdev-formats.rst              |  374 +++++-
>   .../media/v4l/vidioc-enum-fmt.rst             |    7 +
>   .../media/v4l/vidioc-subdev-g-crop.rst        |    6 +-
>   .../media/v4l/vidioc-subdev-g-routing.rst     |   60 +-
>   .../media/videodev2.h.rst.exceptions          |    1 +
>   drivers/media/i2c/ccs/ccs-core.c              | 1050 +++++++++++------
>   drivers/media/i2c/ccs/ccs.h                   |   27 +-
>   drivers/media/i2c/ov2740.c                    |  304 +++--
>   drivers/media/mc/mc-entity.c                  |   15 +-
>   drivers/media/v4l2-core/v4l2-ioctl.c          |   25 +-
>   drivers/media/v4l2-core/v4l2-subdev.c         |  118 +-
>   include/media/v4l2-subdev.h                   |   42 +
>   include/uapi/linux/media-bus-format.h         |   13 +
>   include/uapi/linux/media.h                    |    1 +
>   include/uapi/linux/v4l2-mediabus.h            |   18 +-
>   include/uapi/linux/v4l2-subdev.h              |   18 +-
>   include/uapi/linux/videodev2.h                |   18 +
>   25 files changed, 2183 insertions(+), 539 deletions(-)
>   create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
>

