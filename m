Return-Path: <linux-media+bounces-8492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E13D789696F
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C421C225E9
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7190763EE;
	Wed,  3 Apr 2024 08:46:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E978285
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133975; cv=none; b=McAHy9XaFWXlpAkU5fQB/EnJbcknsiSrNvYoWnEyzaWHK2tGplhud7XCOhy82C+76mfhPCh68w8vVYDpkKWUK6oTdErWNIqDHdtriP7DIh+zq3qOMk1mCZ7qEJ1ZTSdPM/3n1laGPedBkUHdT7MWjJutNovBP0ZLDGKw1hKz0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133975; c=relaxed/simple;
	bh=f2QEuBrPKReZygTnjA3sGwcVxTyT7zNAMEIFxCCqAVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqFAUCeNJYnQIyVf8KsHo0q6nzJt66UWEOmvOW858njWFNT9d5MHAawEjBjNVTUr11XepXGQI9zHEubApZjfofLXjBcOPaeZMNbQfJGlz4g20WZ2PooQZvFpN6uHDXkR6g8JXREfjHhbZ44I7hITKv5rECKFwnWB/zs96Nymv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC16C43390;
	Wed,  3 Apr 2024 08:46:13 +0000 (UTC)
Message-ID: <1b55ee87-2c41-4bfe-82a1-394331434df9@xs4all.nl>
Date: Wed, 3 Apr 2024 10:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH 2/8] v4l2-compliance: Constify pointers and
 references in formats tests
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gregor Jasny <gjasny@googlemail.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-3-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240402000033.4007-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 02:00, Laurent Pinchart wrote:
> Multiple variables point to or reference data that never needs to be
> modified. Make them const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  utils/v4l2-compliance/v4l2-test-formats.cpp | 30 ++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 8a16613c3097..423567fe573b 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -49,7 +49,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>  				  __u32 w, __u32 h, __u32 type)
>  {
>  	struct v4l2_frmivalenum frmival;
> -	struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
> +	const struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
>  	bool found_stepwise = false;
>  	unsigned f = 0;
>  	int ret;
> @@ -129,7 +129,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>  static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
>  {
>  	struct v4l2_frmsizeenum frmsize;
> -	struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
> +	const struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
>  	bool found_stepwise = false;
>  	__u64 cookie;
>  	unsigned f = 0;
> @@ -438,15 +438,15 @@ static void createInvalidFmt(struct v4l2_format &fmt, struct v4l2_clip &clip, un
>  
>  static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4l2_format &fmt, bool have_clip = false)
>  {
> -	pixfmt_map &map = node->buftype_pixfmts[type];
> -	pixfmt_map *map_splane;
> -	struct v4l2_pix_format &pix = fmt.fmt.pix;
> -	struct v4l2_pix_format_mplane &pix_mp = fmt.fmt.pix_mp;
> -	struct v4l2_window &win = fmt.fmt.win;
> -	struct v4l2_vbi_format &vbi = fmt.fmt.vbi;
> -	struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
> -	struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
> -	struct v4l2_meta_format &meta = fmt.fmt.meta;
> +	const pixfmt_map &map = node->buftype_pixfmts[type];
> +	const pixfmt_map *map_splane;
> +	const struct v4l2_pix_format &pix = fmt.fmt.pix;
> +	const struct v4l2_pix_format_mplane &pix_mp = fmt.fmt.pix_mp;
> +	const struct v4l2_window &win = fmt.fmt.win;
> +	const struct v4l2_vbi_format &vbi = fmt.fmt.vbi;
> +	const struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
> +	const struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
> +	const struct v4l2_meta_format &meta = fmt.fmt.meta;
>  	unsigned min_data_samples;
>  	unsigned min_sampling_rate;
>  	v4l2_std_id std;
> @@ -497,7 +497,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>  			return fail("pix_mp.reserved not zeroed\n");
>  		fail_on_test(pix_mp.num_planes == 0 || pix_mp.num_planes >= VIDEO_MAX_PLANES);
>  		for (int i = 0; i < pix_mp.num_planes; i++) {
> -			struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
> +			const struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
>  
>  			ret = check_0(pfmt.reserved, sizeof(pfmt.reserved));
>  			if (ret)
> @@ -559,7 +559,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>  		if (have_clip)
>  			fail_on_test(!win.clipcount && (node->fbuf_caps & V4L2_FBUF_CAP_LIST_CLIPPING));
>  		if (win.clipcount) {
> -			struct v4l2_rect *r = &win.clips->c;
> +			const struct v4l2_rect *r = &win.clips->c;
>  			struct v4l2_framebuffer fb;
>  
>  			fail_on_test(doioctl(node, VIDIOC_G_FBUF, &fb));
> @@ -1281,8 +1281,8 @@ int testSlicedVBICap(struct node *node)
>  static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>  {
>  	bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
> -	struct v4l2_captureparm *cap = &parm.parm.capture;
> -	struct v4l2_outputparm *out = &parm.parm.output;
> +	const struct v4l2_captureparm *cap = &parm.parm.capture;
> +	const struct v4l2_outputparm *out = &parm.parm.output;
>  	int ret;
>  
>  	switch (parm.type) {


