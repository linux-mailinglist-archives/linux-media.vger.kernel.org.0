Return-Path: <linux-media+bounces-38278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5FB0F4BC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 16:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1ECF1C833DB
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7673D2F0031;
	Wed, 23 Jul 2025 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L3+YEqko"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC32EFD84;
	Wed, 23 Jul 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279215; cv=none; b=kw6rPDDkF6MUCgjSRyBOEGBbMfVYnqmcwNl1oVq6obOez8qb3FMC0tEYW6mmuSTnHtxoA9kg0rEnIhvj9n5Wcen//Tq/sdSIo0z9SUYYM3Mu2vizmIYUr9hYy248NJvywCXviZR+1cVsydrKD74oDrZr8sZAh8KlSD6UUIXW7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279215; c=relaxed/simple;
	bh=5p7rvRCpYgVrdj5kB8Zx5M5QXjYmJ9zUvPIry/IyTM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI/2UhTPWjIuihr00kA21vfdxqSWANQlmskXdyvvGkOuY7Q05mi5UfyVNKz7GmVS3G47lEKJy/Ab3L99cD3JhKMuDyi0yrVV6d42D3mMHSqgO6It2uhrXfTCoz8C0murNKRg9LRngdVqHSZX5V38Nz44l/C/r13MmsZe613Yj3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L3+YEqko; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9C932E92;
	Wed, 23 Jul 2025 15:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753279173;
	bh=5p7rvRCpYgVrdj5kB8Zx5M5QXjYmJ9zUvPIry/IyTM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3+YEqkolB7bLdPjd5KPTAcUiwzewgVy8G7WrsW1/tkDpYBpai+83GIFapOvOdgvs
	 WYg2FHx489ezAX6s8KPQWJgp3aEFrLdV2Jis9LxDGSvgzbMk6mS8V8RWyxyIFONvmh
	 /2MUqprzFaBwarXK7eAxrfaGf8+rrW0q6t0TojB0=
Date: Wed, 23 Jul 2025 17:00:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Vuillaumier <julien.vuillaumier@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	ribalda@chromium.org, jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
	celine.laurencin@nxp.com
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
Message-ID: <20250723140009.GD6719@pendragon.ideasonboard.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
 <ebff73fd-292d-459a-9ebe-cbbc6ef2b39b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ebff73fd-292d-459a-9ebe-cbbc6ef2b39b@nxp.com>

On Tue, Jul 22, 2025 at 10:46:16AM +0200, Julien Vuillaumier wrote:
> On 16/07/2025 02:12, Laurent Pinchart wrote:
> > On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
> >> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
> >>> Add new standard controls as U32 arrays, for sensors with multiple
> >>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
> >>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
> >>> that have multiple captures, but the HDR merge is done inside the sensor,
> >>> in the end exposing a single stream, but still requiring AEC control
> >>> for all captures.
> >>
> >> It's also useful for sensors supporting DOL or DCG with HDR merge being
> >> performed outside of the sensor.
> > 
> > Regarless of where HDR merge is implemented, we will also need controls
> > to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
> > standardize the values, and that's not good enough. At least for DOL and
> > DCG with HDR merge implemented outside of the sensor, we need to
> > standardize the modes.
> 
> For the HDR-capable sensors with the HDR merge implemented outside, the 
> short capture(s) are likely implemented as separate streams, in order to 
> match the raw camera sensor model.

Yes, that's my expectation. They should use a different data type or a
different virtual channel (I expect most sensors to support both
options).

> In that case, the SDR/HDR mode switch, when supported, can be done by 
> configuring the sensor device internal route for the short capture stream.

That's an option too, but it won't allow us to select between different
HDR modes. For instance, the AR0830 supports both DOL (2 exposures) and
DCG (2 gains). We would need a way to select between those two modes.

> You mentioned the need to be able to select the HDR mode in a standard 
> way. Could you elaborate on the foreseen usage: would it be to select 
> SDR/HDR operation, to select between different HDR sub-modes, to inform 
> user space about HDR capability... ?

Both. From a libcamera perspective, I want standardized controls for
this, to avoid sensor-specific code as much as possible.

> > Can you tell which sensor(s) you're working with ?
> > 
> >>> All controls are in the same class, so they could all be set
> >>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
> >>> useful in case of sensors with context switching.
> >>
> >> Agreed, we should be able to set them all. Are we still unable to set
> >> controls from multiple classes atomatically ? I thought that limitation
> >> has been lifted.
> >>
> >>> Each element of the array will hold an u32 value (exposure or gain)
> >>> for one capture. The size of the array is up to the sensor driver which
> >>> will implement the controls and initialize them via v4l2_ctrl_new_custom().
> >>> With this approach, the user-space will have to set valid values
> >>> for all the captures represented in the array.
> >>
> >> I'll comment on the controls themselves in patch 2/2.
> >>
> >>> The v4l2-core only supports one scalar min/max/step value for the
> >>> entire array, and each element is validated and adjusted to be within
> >>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
> >>> maximum value for the exposure control could be "the max value for the
> >>> long exposure" or "the max value for the sum of all exposures". If none
> >>> of these is ok, the sensor driver can adjust the values as supported and
> >>> the user space can use the TRY operation to query the sensor for the
> >>> minimum or maximum values.
> >>
> >> Hmmmm... I wonder if we would need the ability to report different
> >> limits for different array elements. There may be over-engineering
> >> though, my experience with libcamera is that userspace really needs
> >> detailed information about those controls, and attempting to convey the
> >> precise information through the kernel-userspace API is bound to fail.
> >> That's why we implement a sensor database in libcamera, with information
> >> about how to convert control values to real gain and exposure time.
> >> Exposing (close to) raw register values and letting userspace handle the
> >> rest may be better.
> >>
> >>> Mirela Rabulea (2):
> >>>    LF-15161-6: media: Add exposure and gain controls for multiple
> >>>      captures
> >>>    LF-15161-7: Documentation: media: Describe exposure and gain controls
> >>>      for multiple captures
> >>
> >> Did you forget to remove the LF-* identifiers ? :-)
> >>
> >>>
> >>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
> >>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
> >>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
> >>>   3 files changed, 23 insertions(+)

-- 
Regards,

Laurent Pinchart

