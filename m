Return-Path: <linux-media+bounces-13322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92001909CD7
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 11:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F081C20A42
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 09:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E3418410E;
	Sun, 16 Jun 2024 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="yDLjLqOV"
X-Original-To: linux-media@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5111836E1
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718531280; cv=none; b=aXqSgowtOfQ7YFdbiK5DpELB3khYfU+r93B84TTAxYu4IKfrvad0bn5gNGemgNTvAB5rVb0IvyfD/MEySsJoRdMXu0HZP37QuXh6VzLYaiAjEvHHDOk7QGUkp+KK0769vGABGNFGajZqsP7Q0DJYTL7p1LJOZam2EI7tgsNFzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718531280; c=relaxed/simple;
	bh=U/8NZyO/ejgieYgN7cns+EsSBMKQVOy6mJpLWv03dTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iw2+KFUPGa0JRPlVJ1kOC0XjCmr8yBXj83Dx+a3UNqRN0fzxOudVzmWDXH699nUlx/wMLj9KbKCgjuyztHAY0LsdPcDzjD1C0buAwxRGaAFSd1NZFsBzth8Pm3+ovLpwNE5iwdQctPzDSp8fsMIfFojxjvNqzM6gKIUchC80g1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=yDLjLqOV; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Envelope-To: ezequiel@vanguardiasur.com.ar
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1718531276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YsGDxw7euO03Xurgk7SCoMe6i8m3qHGwgfyQyq8DqHE=;
	b=yDLjLqOV0BEutjvYcq1hJfA3ZHO0eUrH9kF7nNO3il/VF/h/bMWxWPZkG2RcqEFqPV76Uz
	qI2qJa18CdVdYxsM6pVcVIAbep4Wly2Wmz7lkgyKuls0/EiRtvJe8AnvF38iprjQoK5Y5H
	r8sMBQncCQYuLCRVlqW8C4o8qeh2VReRFOnBZqvAZskeZLEnS874LfH1YaO1gNS6kadDYp
	B4XWXB1Q6VmyGZ8E0i9yDzAyzt6JWEU2/JMnM5tQM2mVJN5Bb8W4Hqjnfi5YRPWsgCOJtg
	hGCpMuLl/tL0aa34HYB7BRA43KtSFNaqQsbi4AdWJImIha9r/WAPK0RyGTHLag==
X-Envelope-To: mchehab@kernel.org
X-Envelope-To: hverkuil-cisco@xs4all.nl
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: andyshrk@163.com
X-Envelope-To: knaerzche@gmail.com
X-Envelope-To: nicolas.dufresne@collabora.com
X-Envelope-To: benjamin.gaignard@collabora.com
X-Envelope-To: sebastian.fricke@collabora.com
X-Envelope-To: chris.obbard@collabora.com
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-staging@lists.linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: jonas@kwiboo.se
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>, Andy Yan <andyshrk@163.com>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Christopher Obbard <chris.obbard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH v4 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2 profile
 support
Date: Sun, 16 Jun 2024 11:47:43 +0200
Message-ID: <122755518.lCnTqr06ca@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231105165521.3592037-1-jonas@kwiboo.se>
References: <20231105165521.3592037-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2306946.yOONvtlcC0";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart2306946.yOONvtlcC0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Sun, 16 Jun 2024 11:47:43 +0200
Message-ID: <122755518.lCnTqr06ca@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231105165521.3592037-1-jonas@kwiboo.se>
References: <20231105165521.3592037-1-jonas@kwiboo.se>
MIME-Version: 1.0

On Sunday, 5 November 2023 17:54:59 CEST Jonas Karlman wrote:
> This is a revival of a 3 year old series [1] now that NV15/NV20/NV30 support
> for display driver have landed in mainline tree.
> 
> This series adds H.264 High 10 and 4:2:2 profile support to the Rockchip
> Video Decoder driver.
> 
> Patch 1 adds helpers for calculating plane bytesperline and sizeimage.
> Patch 2 adds two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YUV.
> 
> Patch 3 change to use bytesperline and buffer height to configure strides.
> Patch 4 change to use values from SPS/PPS control to configure the HW.
> Patch 5 remove an unnecessary call to validate sps at streaming start.
> 
> Patch 6-10 refactor code to support filtering of CAPUTRE formats based
> on the image format returned from a get_image_fmt ops.
> 
> Patch 11 adds final bits to support H.264 High 10 and 4:2:2 profiles.
> 
> Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> 
>   v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>   ...
>   Total for rkvdec device /dev/video1: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> 
>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
>   ...
>   Ran 65/69 tests successfully
> 
>   Running test suite JVT-AVC_V1 with decoder FFmpeg-H.264-V4L2-request
>   ...
>   Ran 127/135 tests successfully
> 
> Before this series:
> 
>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
>   ...
>   Ran 44/69 tests successfully
> 
> ...
> 
> Following commits adds support for NV15/NV20/NV30 to VOP driver:
> 728c15b4b5f3 ("drm/fourcc: Add NV20 and NV30 YUV formats")
> d4b384228562 ("drm/rockchip: vop: Add NV15, NV20 and NV30 support")
> 
> To fully runtime test this series you may need above drm commits and ffmpeg
> patches from [2], this series and drm patches is also available at [3].
> 
> [1]
> https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo.se/
> [2] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-n6.1-dev/ [3]
> https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v4/
> [4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865 [5]
> https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf

Reviving this old thread now that rkvdec2 'stuff' emerged.
I have (actually) done quite some tests with this (and "media: rkvdec: Add 
HEVC backend" patch set) and they have been part of my kernel builds ever 
since.
I _think_, but don't know, that is relevant for Andy's question:

On zondag 16 juni 2024 08:58:20 CEST Andy Yan <andyshrk@163.com> wrote:
> How can I test these patches? Do they require any additional userspace
> patches?

I have the same question and I think you'd need this and the HEVC patch set 
and then also patch FFmpeg and then it should enable HW acceleration.
So my question boils down to: with the rkvdec2 patch set, should V4L2-requests 
now also work with rkvdec, so not just Hantro anymore?

BTW: the libdrm commits have been merged upstream quite some time ago, so if 
you have a recent version of that, you don't need to patch that.
If you use FFmpeg 7.0, then Jonas has a branch for that too (haven't tried it 
yet though).

FWIW: my test results were a bit mixed. I didn't post them before as I don't 
fully/really understand this 'video stuff', and I didn't want you all to suffer 
from what was likely a PEBKAC issue.

On my PineTab2 (rk3566) I had some h.264 videos HW accelerated, but not all. 
My guess is that it's related to the resolution. 1920x1080 worked, while it 
didn't work with a 1280x640 video. The video still played, just not HW 
accelerated. IOW: improvements in some and otherwise it was just rendered by 
the CPU (I think), just like before.

On my Rock64 I got a pink tint with all videos, like described here:
https://github.com/mpv-player/mpv/issues/12968
IIUC, that's actually a problem in the lima driver?

Cheers,
  Diederik
--nextPart2306946.yOONvtlcC0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZm60vwAKCRDXblvOeH7b
bunzAQDtoUoO69YOCfIwQy1BpyubGMFwwb7YvB1mYGizpNzaAwD8Cw1NbPvKRJrd
AlNeNCuUbZbkJRIj5vHMteqOVa7VhwU=
=6pBz
-----END PGP SIGNATURE-----

--nextPart2306946.yOONvtlcC0--




