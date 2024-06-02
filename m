Return-Path: <linux-media+bounces-12390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8589D8D7749
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 19:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E239F1F21702
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 17:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F9C55E73;
	Sun,  2 Jun 2024 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TPRERmzB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032663B8
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717348616; cv=none; b=dw+nMyYI/CzEja+zeJt9iRyIr0k50lHu7V+1yuBZtSXLLuYLYGyxbItvFxJ/NrKNZ4wDhAOnGfqVxXaxpeYYvCYDPlknpw42kjQw6nYJxrUUinlCjggB/sO0axnCtBYv6FwK9340sRIF2XmhkTCSPh5747GSCWytQCbw4fEYNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717348616; c=relaxed/simple;
	bh=dPf6B5T1s47H4oZEF9JcvaGar5LM+nrenbuusF/fwho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFuje5L1FHcLcxmBltmjbUL9IAv1mdw/fKkV4K1O11JbjYNL8aj++8vDHGkDLwVjnmdD7HPyrIOZq128KhASD89Oj5mgOV5ktzCsKbnstQ0pasyzeDJMNCJWC7BchJ6k3M4HFXPBtskwExQTgayE7cDSPEvez4POHmQAzB7bNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TPRERmzB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AA2E4CA;
	Sun,  2 Jun 2024 19:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717348606;
	bh=dPf6B5T1s47H4oZEF9JcvaGar5LM+nrenbuusF/fwho=;
	h=Date:From:To:Cc:Subject:From;
	b=TPRERmzBGNAw3Az3aNmGy02+aLLVeoSxsduT5p3f5GMeRX9zlkzOC35SoqyEXumEh
	 R93Rsli/406FLmDinDlNmHPVUhCw3EWcdMLbsM4JejZkCmtGo//9zKoyBcLvChFdrz
	 fDwFn+0n82kyQlmK3IGqXaMABQ0fhSvzNjOUH8XM=
Date: Sun, 2 Jun 2024 20:16:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: RFC: V4L2 subdev states and controls
Message-ID: <20240602171638.GA9310@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Hans,

I've mentioned a few times in the past that I would like to see tighter
integration of V4L2 controls for subdevs and the subdev states. Other
developments related to subdev states were of higher priority,
preventing me from diving into this topic. Now that we've merged quite a
few state-related patch series, it's time to get back to controls.

I'll try to explain here what I envision, focussing on the goals, to
start brainstorming possible solutions.

# Background

First, some background, to make sure every participant in this
conversation understands what we're talking about.

## Userspace API

Historically, the V4L2 API has modelled controls, formats and selection
rectangles using a GET/SET/TRY API. This is still what the API exposes
today on video devices. The TRY and SET calls update the requested
format, selection rectangle and controls identically before returning
them to userspace. The TRY calls then discard the values without
affecting the hardware configuration, while the SET calls apply the
values to the device.

For subdevs, controls are handled the same way as on video devices, with
GET/SET/TRY operations. Formats and selection rectangles, on the other
hand, are instead handled with GET/SET operations only, but with the
ability to operate on different device states. The API defines two
states, the ACTIVE and TRY states. As for video devices, the GET/SET
operations update the values requested by userspace in the same way. SET
stores the value in the specified state, and GET retrieves the current
value from the state.

The ACTIVE state corresponds to the hardware state. There is a single
ACTIVE state, and modifying it affects the hardware. The TRY state does
not affect the hardware. It offers a storage space for formats and
selection rectangles. This allows trying different combinations of
formats and selection rectangles on different pads of a subdev, without
affecting the hardware state. There is one TRY state per open file
handle of a subdev, allowing different applications to try subdev
configurations without affecting each other. When a subdev file handle
is closed, the corresponding TRY state is destroyed.

## Kernel API

Subdev states are modelled in the kernel by a v4l2_subdev_state
structure. The structure stores formats and selection rectangles (as
well as routing tables) for all pads of the subdev. A pointer to the
state is passed to all subdev operations. This simplifies implementation
of drivers, as they don't have to handle configuration storage manually,
and can more easily implement common GET/SET handlers for the ACTIVE and
TRY states.

Controls are handled by the V4L2 control framework. Subdev drivers
create an instance of the v4l2_ctrl_handler structure, add controls to
the control handler, and implement a few control operations, mostly
.s_ctrl(). The control framework handles the V4L2 control userspace API
with all its legacy and extended ioctls, and implements all the complex
validation and userspace-visible behaviour.

# Issues and next steps

As described above, subdevs and formats and selection rectangles on one
hand, and controls on the other hand, in very different ways. While
userspace can test combinations of formats and selection rectangles on
different subdev pads, it can only do so separately from trying
controls. For most controls that is not an issue, but some controls
affect or are affected by formats or selection rectangles. Those include
(but are not limited to)

- V4L2_CID_HFLIP and V4L2_CID_VFLIP that may affect the Bayer pattern
  produced by a raw sensor

- V4L2_CID_HBLANK and V4L2_CID_VBLANK whose higher limits typically
  depend on the format and selection rectangles, as those values are
  often expressed at the hardware level as total horizontal/vertical
  sizes (i.e. active + blanking)

- V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ, as link frequencies and
  pixel rates affect the achievable throughput, and thus the usable
  sensor resolutions and frame rates

Other controls may also be affected.

The subdev .set_fmt(), .set_selection() and .s_ctrl() operations need to
handle those dependencies, and not only is this cumbersome for drivers,
it is also impossible for userspace applications to try combinations of
formats, selection rectangles and controls without modifying the active
value of the controls.

One way to improve the situation could be to modify some of those
controls to make them independent from the format and selection
rectangles. For instance, we could deprecate the HBLANK and VBLANK
controls and introduce HTOTAL and VTOTAL controls whose maximum value
wouldn't depend on the sensor output resolution (this has been proposed
already, see https://lore.kernel.org/all/20230609-v4l2-vtotal-v2-0-cf29925f4517@skidata.com/).
This would however likely trade one problem for another, as the minimum
value of the HTOTAL and VTOTAL controls would then depend on the sensor
output resolution. In any case, not all control can be made independent
of the formats and selection rectangles.

Another option would be to create a completely new API to configure
subdevs, tailored to specific use cases. I'm personally focussing on
drivers for raw camera sensors, and we could create an API that focusses
on that. The obvious downsides are that userspace would need to learn a
completely different API, that API would duplicate features of existing
APIs, and we would anyway be facing the same issues in the API design.
The kernel-side implementation would be cumbersome too if we want to
handle interoperability of different APIs. While we may consider this
option in the long term, I don't think it's a good solution today.

I would like to explore moving storage of control values to the
v4l2_subdev_state, the same way we store formats and selection
rectangles. Subdev drivers would still create control globally, at probe
time, but the stored value would be duplicated in each state. Control
ioctls would need to gain a 'which' argument to select the ACTIVE or TRY
state (ACTIVE would need to be the default for backward compatibility).

On the kernel side, I think it could help to split the existing
.s_ctrl() operation in two, with one operation to update (e.g. round)
the control value, and the limits of other related controls, and one
operation to apply controls to the hardware. The former would be called
for both the ACTIVE and TRY states, while the latter would only be
called for the ACTIVE state.

Control limits would also likely need to be stored in the subdev state,
as they will change when formats and selection rectangles change. I wish
we could avoid this though, as it will make both the implementation and
the specification of the userspace API behaviour more complex, but I'm
not sure we can get away without storing limits in the state too. Still,
control values and control limits are different, and I have a feeling we
should handle them somehow differently.

Storing control values in the subdev state will also enable future API
evolutions in V4L2. I'm thinking in particular about usage of the
request API with subdevs. If we can store the whole subdev state in the
v4l2_subdev_state structure, we will be able to construct state
instances per request, and nicely extend the request API to a whole MC
device. There will be quite some work to achieve that, but it's a
direction I'd like to take.

Now the stage is yours. All constructive feedback is welcome. Patches
would be amaazing, but I think we need to discuss this further first.

-- 
Regards,

Laurent Pinchart

