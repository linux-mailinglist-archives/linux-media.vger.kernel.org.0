Return-Path: <linux-media+bounces-32140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA026AB1825
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E468AA20868
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866B9235057;
	Fri,  9 May 2025 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kY3hyzxw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA2235045;
	Fri,  9 May 2025 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803572; cv=none; b=aDw31OtK5+SN0oZgc2R6ZMlIDrHs2f+V/eJqioxs/oKP4F2twQnFGypqeickKJpTPOx5/2eVvOSId6MZdm6/NsdZNbQqccYCbuRY+QTlK6EJBuHa2GII7znX5TMXF5xseHiFr4XpHfmcTmkBNp82C5xZYsxZtujEfLKj7wDTu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803572; c=relaxed/simple;
	bh=UJIWZNGGBGXdUpp32uYLW0HmFBxQw3fRna/6jS+uqCs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iE2xVn00WeWVUgKiTFXoFBVfalh1NbUFaDnOimh2PFe5Hc91cku5f2zxQ/fLwgVrUTt9Bfd3abH4XW+Gzm5/lH1COvLrcXLsKnrIPRpIh+MEbyO6ah1/E35LRfnBbDVfNnqfgPxakiyX5Dy/lHOoQYtvOK7euKqHh6AL/GzLuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kY3hyzxw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746803567;
	bh=UJIWZNGGBGXdUpp32uYLW0HmFBxQw3fRna/6jS+uqCs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kY3hyzxwv3pOW1E2eOBUWjzqaa/ORsL7NuTBwzAwqlTYhMoDh4ZuzodwSYk3dG7dx
	 pVeOqN2/YoiDnQmRvPkx4qrTbm0vIh0n29oFmOABNbXHwnTm1AcxNXXLmbNvBiAoG6
	 6H1KiU7oGnexLvi8FSMe4MBGO2Eni46sKfN1knc2I+XhK1FJUfKrQcOFqCwsYEkaNt
	 an2TsEoF4WcNxIyjOHPESC9Osd+XUbnsTMEs0/Kl2+j5d9ILI0tkI0PeOiae2e9Y3q
	 J1VSKNW3mgJ5tX9jWTvOXijKF36yUZmzaUM2V/ypZH04zDdO99pJOO3Ma/OOHBDZmA
	 u3ghObQiWeAfw==
Received: from [IPv6:2606:6d00:15:ec4::5ac] (unknown [IPv6:2606:6d00:15:ec4::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3410717E09BE;
	Fri,  9 May 2025 17:12:46 +0200 (CEST)
Message-ID: <a94af33d65636345c4ac7db8e2e87bfb8042a775.camel@collabora.com>
Subject: Re: [PATCH v5 00/26] Add support for HEVC and VP9 codecs in decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia	
 <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Dan Carpenter <dan.carpenter@linaro.org>,
 stable@vger.kernel.org
Date: Fri, 09 May 2025 11:12:44 -0400
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dikshita,

Le vendredi 09 mai 2025 à 14:08 +0530, Dikshita Agarwal a écrit :
> Hi All,
> 
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the 
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
> 
> These patches also address the comments and feedback received from the 
> RFC patches previously sent. I have made the necessary improvements 
> based on the community's suggestions.
> 
> Changes in v5:
> - Splitted patch 01/25 in two patches (Bryan)
> - Link to v4: https://lore.kernel.org/r/20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com
> 
> Changes in v4:
> - Splitted patch patch 06/23 in two patches (Bryan)
> - Simplified the conditional logic in patch 13/23 (Bryan)
> - Improved commit description for patch patch 13/23 (Nicolas)
> - Fix the value of H265_NUM_TILE_ROW macro (Neil)
> - Link to v3: https://lore.kernel.org/r/20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com
> 
> Changes in v3:
> - Introduced two wrappers with explicit names to handle destroy internal 
> buffers (Nicolas)
> - Used sub state check instead of introducing new boolean (Vikash)
> - Addressed other comments (Vikash)
> - Reorderd patches to have all fixes patches first (Dmitry)
> - Link to v2: 
> https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com
> 
> Changes in v2:
> - Added Changes to make sure all buffers are released in session close 
> (bryna)
> - Added tracking for flush responses to fix a timing issue.
> - Added a handling to fix timing issue in reconfig
> - Splitted patch 06/20 in two patches (Bryan)
> - Added missing fixes tag (bryan)
> - Updated fluster report (Nicolas)
> - Link to v1: 
> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
> 
> Changes sinces RFC:
> - Added additional fixes to address issues identified during further 
> testing.
> - Moved typo fix to a seperate patch [Neil]
> - Reordered the patches for better logical flow and clarity [Neil, 
> Dmitry]
> - Added fixes tag wherever applicable [Neil, Dmitry]
> - Removed the default case in the switch statement for codecs [Bryan]
> - Replaced if-else statements with switch-case [Bryan]
> - Added comments for mbpf [Bryan]
> - RFC: 
> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
> 
> These patches are tested on SM8250 and SM8550 with v4l2-ctl and 
> Gstreamer for HEVC and VP9 decoders, at the same time ensured that 
> the existing H264 decoder functionality remains uneffected.
> 
> Note: 1 of the fluster compliance test is fixed with firmware [3]
> [3]: 
> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u 
> 
> The result of fluster test on SM8550:
>  131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
>  GStreamer-H.265-V4L2-Gst1.0.
>  The failing test case:
>  - 10 testcases failed due to unsupported 10 bit format.
>    - DBLK_A_MAIN10_VIXS_4
>    - INITQP_B_Main10_Sony_1
>    - TSUNEQBD_A_MAIN10_Technicolor_2
>    - WP_A_MAIN10_Toshiba_3
>    - WP_MAIN10_B_Toshiba_3
>    - WPP_A_ericsson_MAIN10_2
>    - WPP_B_ericsson_MAIN10_2
>    - WPP_C_ericsson_MAIN10_2
>    - WPP_E_ericsson_MAIN10_2
>    - WPP_F_ericsson_MAIN10_2
>  - 4 testcase failed due to unsupported resolution
>    - PICSIZE_A_Bossen_1
>    - PICSIZE_B_Bossen_1
>    - WPP_D_ericsson_MAIN10_2
>    - WPP_D_ericsson_MAIN_2 
>  - 2 testcase failed due to CRC mismatch
>    - RAP_A_docomo_6
>    - RAP_B_Bossen_2
>    - BUG reported: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
>      Analysis - First few frames in this discarded by firmware and are 
>      sent to driver with 0 filled length. Driver send such buffers to 
>      client with timestamp 0 and payload set to 0 and 
>      make buf state to VB2_BUF_STATE_ERROR. Such buffers should be 
>      dropped by GST. But instead, the first frame displayed as green 
>      frame and when a valid buffer is sent to client later with same 0 
>      timestamp, its dropped, leading to CRC mismatch for first frame.
> 
>  235/305 testcases passed while testing VP9-TEST-VECTORS with 
>  GStreamer-VP9-V4L2-Gst1.0.
>  The failing test case:
>  - 64 testcases failed due to unsupported resolution
>    - vp90-2-02-size-08x08.webm
>    - vp90-2-02-size-08x10.webm
>    - vp90-2-02-size-08x16.webm
>    - vp90-2-02-size-08x18.webm
>    - vp90-2-02-size-08x32.webm
>    - vp90-2-02-size-08x34.webm
>    - vp90-2-02-size-08x64.webm
>    - vp90-2-02-size-08x66.webm
>    - vp90-2-02-size-10x08.webm
>    - vp90-2-02-size-10x10.webm
>    - vp90-2-02-size-10x16.webm
>    - vp90-2-02-size-10x18.webm
>    - vp90-2-02-size-10x32.webm
>    - vp90-2-02-size-10x34.webm
>    - vp90-2-02-size-10x64.webm
>    - vp90-2-02-size-10x66.webm
>    - vp90-2-02-size-16x08.webm
>    - vp90-2-02-size-16x10.webm
>    - vp90-2-02-size-16x16.webm
>    - vp90-2-02-size-16x18.webm
>    - vp90-2-02-size-16x32.webm
>    - vp90-2-02-size-16x34.webm
>    - vp90-2-02-size-16x64.webm
>    - vp90-2-02-size-16x66.webm
>    - vp90-2-02-size-18x08.webm
>    - vp90-2-02-size-18x10.webm
>    - vp90-2-02-size-18x16.webm
>    - vp90-2-02-size-18x18.webm
>    - vp90-2-02-size-18x32.webm
>    - vp90-2-02-size-18x34.webm
>    - vp90-2-02-size-18x64.webm
>    - vp90-2-02-size-18x66.webm
>    - vp90-2-02-size-32x08.webm
>    - vp90-2-02-size-32x10.webm
>    - vp90-2-02-size-32x16.webm
>    - vp90-2-02-size-32x18.webm
>    - vp90-2-02-size-32x32.webm
>    - vp90-2-02-size-32x34.webm
>    - vp90-2-02-size-32x64.webm
>    - vp90-2-02-size-32x66.webm
>    - vp90-2-02-size-34x08.webm
>    - vp90-2-02-size-34x10.webm
>    - vp90-2-02-size-34x16.webm
>    - vp90-2-02-size-34x18.webm
>    - vp90-2-02-size-34x32.webm
>    - vp90-2-02-size-34x34.webm
>    - vp90-2-02-size-34x64.webm
>    - vp90-2-02-size-34x66.webm
>    - vp90-2-02-size-64x08.webm
>    - vp90-2-02-size-64x10.webm
>    - vp90-2-02-size-64x16.webm
>    - vp90-2-02-size-64x18.webm
>    - vp90-2-02-size-64x32.webm
>    - vp90-2-02-size-64x34.webm
>    - vp90-2-02-size-64x64.webm
>    - vp90-2-02-size-64x66.webm
>    - vp90-2-02-size-66x08.webm
>    - vp90-2-02-size-66x10.webm
>    - vp90-2-02-size-66x16.webm
>    - vp90-2-02-size-66x18.webm
>    - vp90-2-02-size-66x32.webm
>    - vp90-2-02-size-66x34.webm
>    - vp90-2-02-size-66x64.webm
>    - vp90-2-02-size-66x66.webm
>  - 2 testcases failed due to unsupported format
>    - vp91-2-04-yuv422.webm
>    - vp91-2-04-yuv444.webm
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-22-svc_1280x720_3.ivf
>    - Bug reported: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>  - 2 testcase failed due to unsupported resolution after sequence change
>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
>  - 1 testcase failed due to unsupported stream
>    - vp90-2-16-intra-only.webm
> 
> The result of fluster test on SM8250:
>  133/147 testcases passed while testing JCT-VC-HEVC_V1 with
>  GStreamer-H.265-V4L2-Gst1.0.
>  The failing test case:
>  - 10 testcases failed due to unsupported 10 bit format.
>    - DBLK_A_MAIN10_VIXS_4
>    - INITQP_B_Main10_Sony_1
>    - TSUNEQBD_A_MAIN10_Technicolor_2
>    - WP_A_MAIN10_Toshiba_3
>    - WP_MAIN10_B_Toshiba_3
>    - WPP_A_ericsson_MAIN10_2
>    - WPP_B_ericsson_MAIN10_2
>    - WPP_C_ericsson_MAIN10_2
>    - WPP_E_ericsson_MAIN10_2
>    - WPP_F_ericsson_MAIN10_2
>  - 4 testcase failed due to unsupported resolution
>    - PICSIZE_A_Bossen_1
>    - PICSIZE_B_Bossen_1
>    - WPP_D_ericsson_MAIN10_2
>    - WPP_D_ericsson_MAIN_2
> 
>  232/305 testcases passed while testing VP9-TEST-VECTORS with
>  GStreamer-VP9-V4L2-Gst1.0.
>  The failing test case:
>  - 64 testcases failed due to unsupported resolution
>    - vp90-2-02-size-08x08.webm
>    - vp90-2-02-size-08x10.webm
>    - vp90-2-02-size-08x16.webm
>    - vp90-2-02-size-08x18.webm
>    - vp90-2-02-size-08x32.webm
>    - vp90-2-02-size-08x34.webm
>    - vp90-2-02-size-08x64.webm
>    - vp90-2-02-size-08x66.webm
>    - vp90-2-02-size-10x08.webm
>    - vp90-2-02-size-10x10.webm
>    - vp90-2-02-size-10x16.webm
>    - vp90-2-02-size-10x18.webm
>    - vp90-2-02-size-10x32.webm
>    - vp90-2-02-size-10x34.webm
>    - vp90-2-02-size-10x64.webm
>    - vp90-2-02-size-10x66.webm
>    - vp90-2-02-size-16x08.webm
>    - vp90-2-02-size-16x10.webm
>    - vp90-2-02-size-16x16.webm
>    - vp90-2-02-size-16x18.webm
>    - vp90-2-02-size-16x32.webm
>    - vp90-2-02-size-16x34.webm
>    - vp90-2-02-size-16x64.webm
>    - vp90-2-02-size-16x66.webm
>    - vp90-2-02-size-18x08.webm
>    - vp90-2-02-size-18x10.webm
>    - vp90-2-02-size-18x16.webm
>    - vp90-2-02-size-18x18.webm
>    - vp90-2-02-size-18x32.webm
>    - vp90-2-02-size-18x34.webm
>    - vp90-2-02-size-18x64.webm
>    - vp90-2-02-size-18x66.webm
>    - vp90-2-02-size-32x08.webm
>    - vp90-2-02-size-32x10.webm
>    - vp90-2-02-size-32x16.webm
>    - vp90-2-02-size-32x18.webm
>    - vp90-2-02-size-32x32.webm
>    - vp90-2-02-size-32x34.webm
>    - vp90-2-02-size-32x64.webm
>    - vp90-2-02-size-32x66.webm
>    - vp90-2-02-size-34x08.webm
>    - vp90-2-02-size-34x10.webm
>    - vp90-2-02-size-34x16.webm
>    - vp90-2-02-size-34x18.webm
>    - vp90-2-02-size-34x32.webm
>    - vp90-2-02-size-34x34.webm
>    - vp90-2-02-size-34x64.webm
>    - vp90-2-02-size-34x66.webm
>    - vp90-2-02-size-64x08.webm
>    - vp90-2-02-size-64x10.webm
>    - vp90-2-02-size-64x16.webm
>    - vp90-2-02-size-64x18.webm
>    - vp90-2-02-size-64x32.webm
>    - vp90-2-02-size-64x34.webm
>    - vp90-2-02-size-64x64.webm
>    - vp90-2-02-size-64x66.webm
>    - vp90-2-02-size-66x08.webm
>    - vp90-2-02-size-66x10.webm
>    - vp90-2-02-size-66x16.webm
>    - vp90-2-02-size-66x18.webm
>    - vp90-2-02-size-66x32.webm
>    - vp90-2-02-size-66x34.webm
>    - vp90-2-02-size-66x64.webm
>    - vp90-2-02-size-66x66.webm
>  - 2 testcases failed due to unsupported format
>    - vp91-2-04-yuv422.webm
>    - vp91-2-04-yuv444.webm
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-22-svc_1280x720_3.ivf
>    - Bug raised: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371

A fix is pending https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8944
should land soon. What is important to note is that after this fix, V4L2 will be handed
over the entire super-frame. The V4L2 spec is not terribly verbose on the subject, but
I would assume stateful decoders can take care of these the way its specified in the
spec. That means, if you have 3 frames in there, it should ultimatly hold on 2 capture
buffers and submit the last one to userspace for display.

My impression is that your driver will be having issues with that. It will erroneously
return the 2 first frame with the ERROR flag and zero-size instead. The main issue with
that, is that these will display the timestamp of the superframe, miss-leading userspace
in thinking the decoding of the super-frame failed, and dropping associated metadata.

If you'd prefer to be handed frames, it will get very complicated for you, since this is
spatial SVC. While the smaller frame size fits the allocation, you will need to implement
DRC to signal the resolution change to userspace. That means introducing new DRC flags,
since you can't affort loosing your references, implement DELETE_BUFS and matching userspace
support. But, this would fix the resize_inter streams below.

In practice, for this test vector, the number of bitstream buffer will got from 60 to 20,
and 20 is the matching expected capture buffer. The MR is also fixing the super-frame to
frame conversion, so that the DECODE_ONLY flag is not lost anymore, which could have
worked for you.

Nicolas

>  - 5 testcase failed due to unsupported resolution after sequence change
>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
>    - vp90-2-21-resize_inter_320x240_5_1-2.webm
>    - vp90-2-21-resize_inter_320x240_7_1-2.webm
>    - vp90-2-18-resize.ivf
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-16-intra-only.webm
>    Analysis: First few frames are marked by firmware as NO_SHOW frame.
>    Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>    Such buffers should be dropped by GST. But instead, the first frame 
>    is being displayed and when a valid buffer is sent to client later
>    with same timestamp, its dropped, leading to CRC mismatch for first 
>    frame.
> 
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Stefan Schmidt <stefan.schmidt@linaro.org>
> To: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (26):
>       media: iris: Skip destroying internal buffer if not dequeued
>       media: iris: Verify internal buffer release on close
>       media: iris: Update CAPTURE format info based on OUTPUT format
>       media: iris: Avoid updating frame size to firmware during reconfig
>       media: iris: Drop port check for session property response
>       media: iris: Prevent HFI queue writes when core is in deinit state
>       media: iris: Remove error check for non-zero v4l2 controls
>       media: iris: Remove deprecated property setting to firmware
>       media: iris: Fix missing function pointer initialization
>       media: iris: Fix NULL pointer dereference
>       media: iris: Fix typo in depth variable
>       media: iris: Track flush responses to prevent premature completion
>       media: iris: Fix buffer preparation failure during resolution change
>       media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length
>       media: iris: Skip flush on first sequence change
>       media: iris: Remove unnecessary re-initialization of flush completion
>       media: iris: Add handling for corrupt and drop frames
>       media: iris: Add handling for no show frames
>       media: iris: Improve last flag handling
>       media: iris: Remove redundant buffer count check in stream off
>       media: iris: Add a comment to explain usage of MBPS
>       media: iris: Add HEVC and VP9 formats for decoder
>       media: iris: Add platform capabilities for HEVC and VP9 decoders
>       media: iris: Set mandatory properties for HEVC and VP9 decoders.
>       media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>       media: iris: Add codec specific check for VP9 decoder drain handling
> 
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  56 ++-
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>  .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>  drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
>  drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>  24 files changed, 1159 insertions(+), 211 deletions(-)
> ---
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
> change-id: 20250508-video-iris-hevc-vp9-bd35d588500f
> 
> Best regards,

