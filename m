Return-Path: <linux-media+bounces-8491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF2896962
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448801C25AA5
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338B36EB70;
	Wed,  3 Apr 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tiguq/D/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88135C61A
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133854; cv=none; b=cnlNlbr1izhWUt0PorHZg8cf3lr8w0TCNFkoepbtv4llZ+eLve4eqqNsUETNGzZQRiYtWNJAn5O8bI2AoDp+M4H1RYI39pGk0q4AEdvU1KB2YeUS2IgD2yOXRxLLijrK4fIDUyivaceGSj3mSrdyyy3bMIqksIyD9zJ8qUqfM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133854; c=relaxed/simple;
	bh=kTs4+FBhAAcKPFopUdVVLUwH95S4V01YqeggJ/0fcN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVUhPbxunE34r6+XUGPdbGEPJMtLZrBT+UL9O/gdmSzD33Igvf/ZcJ/f2acYEZ5p3WeQcVn3k7AW+gPCSRleolY2/dOMamcUHdHrAlfZHZBebkvXW0QETJ3btjo0HJrOODh/MJaFWtQbvvBSlO1zGW2cRhfwBH4YWy+cvi5rvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tiguq/D/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D942674;
	Wed,  3 Apr 2024 10:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712133813;
	bh=kTs4+FBhAAcKPFopUdVVLUwH95S4V01YqeggJ/0fcN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tiguq/D/+7iR2vdt3vxxyx+/APARG8LDYL6bw2Zi+oMD6ry0Q1X7lad8pR4DrPYEj
	 HumUs0i9XrsYpAutqH8WAn1VDe+hdpShfLCu0VSc80UmiAWRI8lyBkE40sSjwnozCC
	 FbRXrWOakG8jUPjIs1squvZa5wgG3j4nBWdiweJA=
Message-ID: <af9e51c6-bc2e-456f-8f36-9fd74479083f@ideasonboard.com>
Date: Wed, 3 Apr 2024 11:44:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH 2/8] v4l2-compliance: Constify pointers and
 references in formats tests
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Gregor Jasny <gjasny@googlemail.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-3-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240402000033.4007-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2024 03:00, Laurent Pinchart wrote:
> Multiple variables point to or reference data that never needs to be
> modified. Make them const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   utils/v4l2-compliance/v4l2-test-formats.cpp | 30 ++++++++++-----------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 8a16613c3097..423567fe573b 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -49,7 +49,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>   				  __u32 w, __u32 h, __u32 type)
>   {
>   	struct v4l2_frmivalenum frmival;
> -	struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
> +	const struct v4l2_frmival_stepwise *sw = &frmival.stepwise;
>   	bool found_stepwise = false;
>   	unsigned f = 0;
>   	int ret;
> @@ -129,7 +129,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>   static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
>   {
>   	struct v4l2_frmsizeenum frmsize;
> -	struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
> +	const struct v4l2_frmsize_stepwise *sw = &frmsize.stepwise;
>   	bool found_stepwise = false;
>   	__u64 cookie;
>   	unsigned f = 0;
> @@ -438,15 +438,15 @@ static void createInvalidFmt(struct v4l2_format &fmt, struct v4l2_clip &clip, un
>   
>   static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4l2_format &fmt, bool have_clip = false)
>   {
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
>   	unsigned min_data_samples;
>   	unsigned min_sampling_rate;
>   	v4l2_std_id std;
> @@ -497,7 +497,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>   			return fail("pix_mp.reserved not zeroed\n");
>   		fail_on_test(pix_mp.num_planes == 0 || pix_mp.num_planes >= VIDEO_MAX_PLANES);
>   		for (int i = 0; i < pix_mp.num_planes; i++) {
> -			struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
> +			const struct v4l2_plane_pix_format &pfmt = pix_mp.plane_fmt[i];
>   
>   			ret = check_0(pfmt.reserved, sizeof(pfmt.reserved));
>   			if (ret)
> @@ -559,7 +559,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
>   		if (have_clip)
>   			fail_on_test(!win.clipcount && (node->fbuf_caps & V4L2_FBUF_CAP_LIST_CLIPPING));
>   		if (win.clipcount) {
> -			struct v4l2_rect *r = &win.clips->c;
> +			const struct v4l2_rect *r = &win.clips->c;
>   			struct v4l2_framebuffer fb;
>   
>   			fail_on_test(doioctl(node, VIDIOC_G_FBUF, &fb));
> @@ -1281,8 +1281,8 @@ int testSlicedVBICap(struct node *node)
>   static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>   {
>   	bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
> -	struct v4l2_captureparm *cap = &parm.parm.capture;
> -	struct v4l2_outputparm *out = &parm.parm.output;
> +	const struct v4l2_captureparm *cap = &parm.parm.capture;
> +	const struct v4l2_outputparm *out = &parm.parm.output;
>   	int ret;
>   
>   	switch (parm.type) {

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


