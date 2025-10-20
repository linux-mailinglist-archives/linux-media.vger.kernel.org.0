Return-Path: <linux-media+bounces-45027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE92BF0AD0
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5148D189D2B3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E237624E4C3;
	Mon, 20 Oct 2025 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHEPhIMK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C324A051;
	Mon, 20 Oct 2025 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957506; cv=none; b=lj3Ms2uYZXfccQ/FLmkbo7JJPtbDbNmBkFRU7GA1WRLMzvdvcp6BqhVKW91R1frremzN9h/3wHurnDT4zFvH0lb0RnHp20nqxliWN8SUkrfsPjanyRu1/jrx/AsDAiigHIrCR11xm+uOrI6t+D4B3ZXFiXdZCCkM3UHZjrOaUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957506; c=relaxed/simple;
	bh=AI+v3B44r7aI13Nyi97cGokuSp4SZUSbHz6ilhTTrPM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tra7qcIgRlzjs6BYmFuJDKIR8uKqL2U45l8U22dzslr+oVpVsTxi7bCAEDhhzpNMUn2K6QMbThEKLbb6Ets5FxeYdfQwkXDxV9pD+2Ah9z8YsaNYGND0ODljTQzVaS6w+9aAn3mPGlAJwQ+aFUVcK+CmuPmfGeuhUsj+YMoa/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHEPhIMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813A3C4CEF9;
	Mon, 20 Oct 2025 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760957505;
	bh=AI+v3B44r7aI13Nyi97cGokuSp4SZUSbHz6ilhTTrPM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=rHEPhIMKfAcuEoJ1yzoyxjZCT7gddKGVNgjks2o7VYrhJxCdBDEz/EuHvz4t33pIl
	 sYgCpxBvOdbdKsWS778ABh2lWq0j54jO1ALXCn7851mK9vMId58jl3m4bU3qlkrfiQ
	 WaYfgXCxan9jHaGHqkEaYsLLMZeiu6QGjnIoBSPuhNpZMIxCv+XpStj+0SlEeTYUOW
	 juAOqAQ48+A6nSfx+us1gpNGjqrpyjjlun+kHdg3cbmruAVYOPy7aAPBw6u85menJt
	 LTNCcMBFKUEUja/zgwmHggVmp6B9OoINvaMZsocKfZd9vSS35S0bMU1k0BaaT6bpFJ
	 5DdctfxVYPpOA==
Message-ID: <e9ac7f92-3041-487c-9b48-e38fb98214a8@kernel.org>
Date: Mon, 20 Oct 2025 12:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 00/23] Fix media uAPI cross references
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2025 16:49, Mauro Carvalho Chehab wrote:
> In the past, media used Docbook to generate documentation, together
> with some logic to ensure that cross-references would match the
> actual defined uAPI.
> 
> The rationale is that we wanted to automatically check for uAPI
> documentation gaps.
> 
> The same logic was migrated to Sphinx. Back then, broken links
> were reported. However, recent versions of it and/or changes at
> conf.py disabled such checks.
> 
> The result is that several symbols are now not cross-referenced,
> and we don't get warnings anymore when something breaks.
> 
> This series consist on 2 parts:
> 
> Part 1: extra patches to parse_data_structs.py and kernel_include.py;
> Part 2: media documentation fixes.
> 
> I'm not sure what's the best strategy to merge it, as some patches
> belong to doc while others are media. So, they can be merged on
> either one of the tree, or split on two series and merged in
> separate or even being merged via a PR applied on both trees.
> 
> IMO, the latter is the better strategy.
> 
> Anyway, let's submit the series for review and discuss later about
> its merge strategy.

For all the media/cec oatches:

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Nice that cross references are now properly checked.

Regards,

	Hans

> 
> Mauro Carvalho Chehab (23):
>   tools: docs: parse_data_structs.py: drop contents header
>   tools: docs: parse_data_structs.py: output a line number
>   docs: kernel_include.py: fix line numbers for TOC
>   docs: kernel_include.py: propose alternatives
>   tools: docs: parse_data_structs: make process_exceptions two stages
>   tools: docs: parse_data_structs.py: get rid of process_exceptions()
>   tools: docs: parse_data_structs.py: add namespace support
>   tools: docs: parse_data_structs.py: accept more reftypes
>   docs: media: dvb: use TOC instead of file contents at headers
>   docs: media: dvb: enable warnings for most headers
>   docs: media: rc: use TOC instead of file contents for LIRC header
>   docs: media: mediactl: use TOC instead of file contents
>   docs: kernel_include.py: use get_close_matches() to propose
>     alternatives
>   docs: media: add missing c namespace to V4L headers
>   docs: media: videodev2.h.rst.exceptions: fix namespace on refs
>   media: docs: add a missing reference for VIDIOC_QUERY_CTRL
>   media: docs: videodev2.h.rst.exceptions: ignore struct
>     __kernel_v4l2_timeval
>   media: docs: add some C domain missing references
>   docs: cec: cec.h.rst.exceptions: fix broken references from cec.h
>   docs: cec: show broken xrefs and show TOC instead of cec.h content
>   docs: media: dmx_types: place kerneldoc at the right namespace
>   docs: media: dvb: headers: warn about broken cross references
>   docs: media: dvb: fix dmx.h.rst.exceptions
> 
>  Documentation/sphinx/kernel_include.py        | 110 ++++++-
>  .../userspace-api/media/cec/cec-header.rst    |   8 +-
>  .../media/cec/cec.h.rst.exceptions            |   3 +
>  .../media/dvb/dmx.h.rst.exceptions            |  82 +++--
>  .../userspace-api/media/dvb/dmx_types.rst     |   1 +
>  .../media/dvb/frontend.h.rst.exceptions       |   5 +-
>  .../userspace-api/media/dvb/headers.rst       |  31 +-
>  .../media/mediactl/media-header.rst           |   8 +-
>  .../media/mediactl/media.h.rst.exceptions     |   3 +
>  .../userspace-api/media/rc/lirc-header.rst    |  14 +-
>  .../userspace-api/media/v4l/app-pri.rst       |   1 +
>  .../userspace-api/media/v4l/audio.rst         |   1 +
>  .../userspace-api/media/v4l/biblio.rst        |   1 +
>  .../userspace-api/media/v4l/buffer.rst        |   2 +
>  .../media/v4l/capture-example.rst             |   1 +
>  .../userspace-api/media/v4l/capture.c.rst     |   1 +
>  .../media/v4l/colorspaces-defs.rst            |   1 +
>  .../media/v4l/colorspaces-details.rst         |   1 +
>  .../userspace-api/media/v4l/colorspaces.rst   |   1 +
>  .../userspace-api/media/v4l/common-defs.rst   |   1 +
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/compat.rst        |   1 +
>  .../userspace-api/media/v4l/control.rst       |   1 +
>  .../userspace-api/media/v4l/crop.rst          |   1 +
>  .../userspace-api/media/v4l/depth-formats.rst |   1 +
>  .../userspace-api/media/v4l/dev-decoder.rst   |   1 +
>  .../userspace-api/media/v4l/dev-encoder.rst   |   1 +
>  .../userspace-api/media/v4l/dev-event.rst     |   1 +
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
>  .../userspace-api/media/v4l/dev-meta.rst      |   1 +
>  .../userspace-api/media/v4l/dev-osd.rst       |   1 +
>  .../userspace-api/media/v4l/dev-overlay.rst   |   1 +
>  .../userspace-api/media/v4l/dev-radio.rst     |   1 +
>  .../userspace-api/media/v4l/dev-sdr.rst       |   1 +
>  .../media/v4l/dev-stateless-decoder.rst       |   1 +
>  .../userspace-api/media/v4l/dev-subdev.rst    |   1 +
>  .../userspace-api/media/v4l/dev-touch.rst     |   1 +
>  .../userspace-api/media/v4l/devices.rst       |   1 +
>  .../userspace-api/media/v4l/dv-timings.rst    |   1 +
>  .../media/v4l/ext-ctrls-camera.rst            |   1 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   |   1 +
>  .../media/v4l/ext-ctrls-codec.rst             |   1 +
>  .../media/v4l/ext-ctrls-colorimetry.rst       |   1 +
>  .../media/v4l/ext-ctrls-detect.rst            |   1 +
>  .../userspace-api/media/v4l/ext-ctrls-dv.rst  |   1 +
>  .../media/v4l/ext-ctrls-flash.rst             |   1 +
>  .../media/v4l/ext-ctrls-fm-rx.rst             |   1 +
>  .../media/v4l/ext-ctrls-fm-tx.rst             |   1 +
>  .../media/v4l/ext-ctrls-image-process.rst     |   1 +
>  .../media/v4l/ext-ctrls-image-source.rst      |   1 +
>  .../media/v4l/ext-ctrls-jpeg.rst              |   1 +
>  .../media/v4l/ext-ctrls-rf-tuner.rst          |   1 +
>  .../media/v4l/extended-controls.rst           |   1 +
>  .../userspace-api/media/v4l/field-order.rst   |   1 +
>  .../userspace-api/media/v4l/fourcc.rst        |   1 +
>  .../userspace-api/media/v4l/hsv-formats.rst   |   1 +
>  .../userspace-api/media/v4l/libv4l.rst        |   1 +
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-c3-isp.rst              |   1 +
>  .../userspace-api/media/v4l/metafmt-d4xx.rst  |   1 +
>  .../media/v4l/metafmt-generic.rst             |   1 +
>  .../media/v4l/metafmt-intel-ipu3.rst          |   1 +
>  .../media/v4l/metafmt-pisp-be.rst             |   1 +
>  .../media/v4l/metafmt-pisp-fe.rst             |   1 +
>  .../media/v4l/metafmt-rkisp1.rst              |   1 +
>  .../userspace-api/media/v4l/metafmt-uvc.rst   |   1 +
>  .../userspace-api/media/v4l/metafmt-vivid.rst |   1 +
>  .../media/v4l/metafmt-vsp1-hgo.rst            |   1 +
>  .../media/v4l/metafmt-vsp1-hgt.rst            |   1 +
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>  .../userspace-api/media/v4l/pixfmt-cnf4.rst   |   1 +
>  .../media/v4l/pixfmt-compressed.rst           |   1 +
>  .../media/v4l/pixfmt-indexed.rst              |   1 +
>  .../userspace-api/media/v4l/pixfmt-intro.rst  |   1 +
>  .../userspace-api/media/v4l/pixfmt-inzi.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-m420.rst   |   1 +
>  .../media/v4l/pixfmt-packed-hsv.rst           |   1 +
>  .../media/v4l/pixfmt-packed-yuv.rst           |   1 +
>  .../media/v4l/pixfmt-reserved.rst             |   1 +
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    |   1 +
>  .../media/v4l/pixfmt-sdr-cs08.rst             |   1 +
>  .../media/v4l/pixfmt-sdr-cs14le.rst           |   1 +
>  .../media/v4l/pixfmt-sdr-cu08.rst             |   1 +
>  .../media/v4l/pixfmt-sdr-cu16le.rst           |   1 +
>  .../media/v4l/pixfmt-sdr-pcu16be.rst          |   1 +
>  .../media/v4l/pixfmt-sdr-pcu18be.rst          |   1 +
>  .../media/v4l/pixfmt-sdr-pcu20be.rst          |   1 +
>  .../media/v4l/pixfmt-sdr-ru12le.rst           |   1 +
>  .../media/v4l/pixfmt-srggb10-ipu3.rst         |   1 +
>  .../media/v4l/pixfmt-srggb10.rst              |   1 +
>  .../media/v4l/pixfmt-srggb10alaw8.rst         |   1 +
>  .../media/v4l/pixfmt-srggb10dpcm8.rst         |   1 +
>  .../media/v4l/pixfmt-srggb10p.rst             |   1 +
>  .../media/v4l/pixfmt-srggb12.rst              |   1 +
>  .../media/v4l/pixfmt-srggb12p.rst             |   1 +
>  .../media/v4l/pixfmt-srggb14.rst              |   1 +
>  .../media/v4l/pixfmt-srggb14p.rst             |   1 +
>  .../media/v4l/pixfmt-srggb16.rst              |   1 +
>  .../media/v4l/pixfmt-srggb8-pisp-comp.rst     |   1 +
>  .../userspace-api/media/v4l/pixfmt-srggb8.rst |   1 +
>  .../media/v4l/pixfmt-tch-td08.rst             |   1 +
>  .../media/v4l/pixfmt-tch-td16.rst             |   1 +
>  .../media/v4l/pixfmt-tch-tu08.rst             |   1 +
>  .../media/v4l/pixfmt-tch-tu16.rst             |   1 +
>  .../userspace-api/media/v4l/pixfmt-uv8.rst    |   1 +
>  .../media/v4l/pixfmt-v4l2-mplane.rst          |   1 +
>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-y12i.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-y16i.rst   |   1 +
>  .../userspace-api/media/v4l/pixfmt-y8i.rst    |   1 +
>  .../media/v4l/pixfmt-yuv-luma.rst             |   1 +
>  .../media/v4l/pixfmt-yuv-planar.rst           |   1 +
>  .../userspace-api/media/v4l/pixfmt-z16.rst    |   1 +
>  .../userspace-api/media/v4l/pixfmt.rst        |   1 +
>  .../userspace-api/media/v4l/planar-apis.rst   |   1 +
>  .../userspace-api/media/v4l/querycap.rst      |   1 +
>  .../userspace-api/media/v4l/sdr-formats.rst   |   1 +
>  .../media/v4l/selection-api-configuration.rst |   1 +
>  .../media/v4l/selection-api-examples.rst      |   1 +
>  .../media/v4l/selection-api-intro.rst         |   1 +
>  .../media/v4l/selection-api-targets.rst       |   1 +
>  .../media/v4l/selection-api-vs-crop-api.rst   |   1 +
>  .../userspace-api/media/v4l/selection-api.rst |   1 +
>  .../media/v4l/selections-common.rst           |   1 +
>  .../userspace-api/media/v4l/standard.rst      |   1 +
>  .../media/v4l/subdev-formats.rst              |   1 +
>  .../userspace-api/media/v4l/tch-formats.rst   |   1 +
>  .../userspace-api/media/v4l/tuner.rst         |   1 +
>  .../userspace-api/media/v4l/user-func.rst     |   1 +
>  .../media/v4l/v4l2-selection-flags.rst        |   1 +
>  .../media/v4l/v4l2-selection-targets.rst      |   1 +
>  .../userspace-api/media/v4l/v4l2.rst          |   1 +
>  .../media/v4l/v4l2grab-example.rst            |   1 +
>  .../userspace-api/media/v4l/v4l2grab.c.rst    |   1 +
>  .../userspace-api/media/v4l/video.rst         |   1 +
>  .../userspace-api/media/v4l/videodev.rst      |   9 +-
>  .../media/v4l/videodev2.h.rst.exceptions      | 288 +++++++++---------
>  .../media/v4l/vidioc-queryctrl.rst            |   8 +
>  .../userspace-api/media/v4l/yuv-formats.rst   |   1 +
>  tools/docs/lib/parse_data_structs.py          | 230 ++++++++------
>  tools/docs/parse-headers.py                   |   5 +-
>  141 files changed, 608 insertions(+), 324 deletions(-)
> 


