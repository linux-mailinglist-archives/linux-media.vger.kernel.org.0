Return-Path: <linux-media+bounces-13504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771490C7F5
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DDBA1C2212B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 10:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33411CF3CB;
	Tue, 18 Jun 2024 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="x80VpSNI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2E156C6F;
	Tue, 18 Jun 2024 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718702995; cv=none; b=XiFKmzqNmV/DzV/TVimh+LnAnE4gAGisoDCnk3JCu+eyBO7IvhNMrZ6pkC3lzP3KJhlt0sxw5DPF0ZJoEh/P3vaSP+EXO+znDJEuhfhLPdK1Z9T1ME+4Qa8UrZrh/PW1jFGbSsKisjXSjjk8Gixz5DtPx4BU8/aWuAD11TG6ZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718702995; c=relaxed/simple;
	bh=OylkFZBeJjThujKHXaJzf5IMFOgK/pwvhWGCCycLVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRrU0Y/zIsMbHHi74jt7FarFfPd9h7507W91nl7uZEe4/wVyZyXp1mugcNwKzxRbIcvqhg+hGiuI5rda9N4Am99csLk//CRJs4Q8+7NExbEo18UkLLovAUkCYHo3Guo4SuZUuC+ODryBxzopdR70mkmONx8P5NJrakDrVYu624M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=x80VpSNI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718702991;
	bh=OylkFZBeJjThujKHXaJzf5IMFOgK/pwvhWGCCycLVMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x80VpSNIhycMLIIYe2tr+ox3BbJPCiaJYh75+KqRqv2AZ/7GbhMapAl62x/36ERi+
	 WssKEjk9SaTUnWGcOW/sjoAcOQszP4goGdNV8aAaN4KUZRQ4BaKncqMyxwL/Kq+5yM
	 rIiOi765bii8P5PGQeYmnkgfAk1XLqJbe8x8wyfx/Hw4Ao0weavnT/sSij4XV5ZZ2e
	 XRLfCCEhLsxP1e1crjUTDOoIvwLDS1Hjmg+Lo3NNSLNduhWfpy4Li64sZgInf/gnRH
	 tQ3Zfzns4/foFgyhUA9E6pfbnkcRRpoZ/el/r4CTumlfnK9vxIcHIkbH669RXuoSex
	 Kv7kiZSd5r4ZQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4431A37820D6;
	Tue, 18 Jun 2024 09:29:51 +0000 (UTC)
Date: Tue, 18 Jun 2024 11:29:50 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: mchehab@kernel.org, nicolas@ndufresne.ca, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	b-brnich@ti.com
Subject: Re: [RESEND PATCH v6 0/4] Add features to an existing driver
Message-ID: <20240618092950.5xvkuhm7og27xgpj@basti-XPS-13-9310>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617104818.221-1-jackson.lee@chipsnmedia.com>

Hey Jackson,

what is up with all the resends, I can see that you send V6 two times
without a RESEND tag and once with a RESEND tag?
Was that an error on your side or did you actually change something?
Does it matter for me which version to consider or are they all the same
content-wise?

Regards,
Sebastian

On 17.06.2024 19:48, Jackson.lee wrote:
>The wave5 codec driver is a stateful encoder/decoder.
>The following patches is for supporting yuv422 inpuy format, supporting runtime suspend/resume feature and extra things.
>
>v4l2-compliance results:
>========================
>
>v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>
>Buffer ioctls:
>       warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>       warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>    test VIDIOC_EXPBUF: OK
>    test Requests: OK (Not Supported)
>
>Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2 Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
>
>Fluster test results:
>=====================
>
>Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
>Ran 132/147 tests successfully               in 88.745 secs
>
>(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
> 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)
>
>Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
>Ran 77/135 tests successfully               in 32.044 secs
>
>(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)
>
>Change since v5:
>================
>* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
> - Fix v4l2-compliance error for the vidioc_enum_framesizes
>
>* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
> - Remove warning messages for the checkpatch.pl script
>
>Change since v4:
>================
>* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
> - Fix warning message
>
>* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
> - Fix warning message
> - add Reviewed-By tag
>
>* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
> - add Reviewed-By tag
>
>Change since v3:
>=================
>
>* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
> - add Reviewed-By tag
>
>* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
> - add Reviewed-By tag
>
>* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
> - modify the commit message
> - define three framesize structures for decoder
>
>* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
> - modify the commit message
> - use the v4l2_format_info to calculate luma, chroma size
>
>Change since v2:
>=================
>
>* For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
> - add the suggested _SHIFT suffix
>
>* For [PATCH v3 1/4] media: chips-media: wave5: Support runtime suspend/resume
> - change a commit message
>
>* For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
> - add pix_fmt_type parameter into wave5_update_pix_fmt function
> - add min/max width/height values into dec_fmt_list
>
>Change since v1:
>=================
>
>* For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
> - define a macro for register addresses
>
>* For [PATCH v2 1/4] media: chips-media: wave5: Support runtime suspend/resume
> - add auto suspend/resume
>
>* For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
> - use helper functions to calculate bytesperline and sizeimage
>
>* For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
> - remove unnecessary codes
>
>Change since v0:
>=================
>The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a simple define, tab and multiple lines has been removed, The macro is defined using one line.
>
>
>jackson.lee (4):
>  media: chips-media: wave5: Support SPS/PPS generation for each IDR
>  media: chips-media: wave5: Support runtime suspend/resume
>  media: chips-media: wave5: Use helpers to calculate bytesperline and
>    sizeimage.
>  media: chips-media: wave5: Support YUV422 raw pixel-formats on the
>    encoder.
>
> .../platform/chips-media/wave5/wave5-helper.c |  24 ++
> .../platform/chips-media/wave5/wave5-helper.h |   5 +
> .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
> .../chips-media/wave5/wave5-vpu-dec.c         | 316 +++++++-----------
> .../chips-media/wave5/wave5-vpu-enc.c         | 308 +++++++++--------
> .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
> .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
> .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
> .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
> .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
> .../media/platform/chips-media/wave5/wave5.h  |   3 +
> 11 files changed, 430 insertions(+), 346 deletions(-)
>
>-- 
>2.43.0
>

