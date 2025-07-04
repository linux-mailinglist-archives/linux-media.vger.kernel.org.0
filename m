Return-Path: <linux-media+bounces-36864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB4AF9921
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5E26E5353
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 16:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EF32E36F0;
	Fri,  4 Jul 2025 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="celWfABK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806D2E36E2;
	Fri,  4 Jul 2025 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647451; cv=none; b=Hb5X6wAOt3qejGx0FNrYsxJ0U3UIgaWRvsGNT/OIM4sbI4O0yxgsDXLmEWV8gmXsNM3rwgfh6itMaEww+3b/V9h5u35+F7HfwXz4CoNMKQL0U5uBbOtzx2eFPb6Sf0WRSiG3YxjnPzxRK1MZVQwWc7hWIWJwK7jmBtdF+dcmOvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647451; c=relaxed/simple;
	bh=m63KwsaI/IYP186RM7U4NQzWQE7N0zHbaWkFDdT9/6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK9yu6WY9DPVjavO+tCpns9YFFJF4xoqiJpFYsKkBDh4QeVr0kMVfiZg5TJULWnI4JQ/Rd/9cLAC0qIIu7HBSHErJT2rhLKjRaPes1XeG0Op7BXYkZktl4bJqs4JXNSlsPMFf+me+uYv8WVT8qA59xN8a5/5p3wqTp7Mzeu0xt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=celWfABK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4EB9669;
	Fri,  4 Jul 2025 18:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751647423;
	bh=m63KwsaI/IYP186RM7U4NQzWQE7N0zHbaWkFDdT9/6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=celWfABK/vpqxgX71f2Q1AECHHi0hR94W1aWDVQgZndNrv3lE54iS10V0hCN40GhR
	 LR/C388fm3uEyPqnltRSat1y20zTDfo5F8NGa234B0f9jczCoLkFaEzNmjQLfZw4mI
	 mJra4P3x7MGU8K1Be8QAQQ0Mbru0cewkQLGvjzYY=
Date: Fri, 4 Jul 2025 18:44:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 4/8] media: renesas: vsp1: Fix crop left and top
 clamping on RPF
Message-ID: <6ub7ckelxn6ln47ml6xm4g35em3l22lunv3afsgrhyktng5qsw@3d272lxmg3nq>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250704001812.30064-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704001812.30064-5-laurent.pinchart+renesas@ideasonboard.com>

On Fri, Jul 04, 2025 at 03:18:08AM +0300, Laurent Pinchart wrote:
> The RPF doesn't enforces the alignment constraint on the sink pad
> format, which could have an odd size, possibly down to 1x1. In that
> case, the upper bounds for the left and top coordinates clamping would
> become negative, cast to a very large positive value. Incorrect crop
> rectangle coordinates would then be incorrectly accepted.
>
> A second issue can occur when the requested left and top coordinates are
> negative. They are cast to a large unsigned value, clamped to the
> maximum. While the calculation will produce valid values for the
> hardware, this is not compliant with the V4L2 specification that
> requires values to be adjusted to the closest valid value.
>
> Fix both issues by switching to signed clamping, with an explicit
> minimum to adjust negative values, and adjusting the clamp bounds to
> avoid negative upper bounds.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 56464875a6c5..ffc1b3ab54e2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -201,6 +201,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_selection *sel)
>  {
> +	unsigned int min_width = RWPF_MIN_WIDTH;
> +	unsigned int min_height = RWPF_MIN_HEIGHT;
>  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *format;
> @@ -229,18 +231,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>  	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>
>  	/*
> -	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
> -	 * shifting the color plane.
> +	 * For YUV formats, restrict the crop rectangle coordinates to multiples
> +	 * of 2 to avoid shifting the color plane.
>  	 */
>  	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
>  		sel->r.left = ALIGN(sel->r.left, 2);
>  		sel->r.top = ALIGN(sel->r.top, 2);
>  		sel->r.width = round_down(sel->r.width, 2);
>  		sel->r.height = round_down(sel->r.height, 2);
> +
> +		/*
> +		 * The RPF doesn't enforces the alignment constraint on the sink
> +		 * pad format, which could have an odd size, possibly down to
> +		 * 1x1. In that case, the minimum width and height would be
> +		 * smaller than the sink pad format, leading to a negative upper
> +		 * bound in the left and top clamping. Clamp the minimum width
> +		 * and height to the format width and height to avoid this.
> +		 *
> +		 * In such a situation, odd values for the crop rectangle size
> +		 * would be accepted when clamping the width and height below.
> +		 * While that would create an invalid hardware configuration,
> +		 * the video device enforces proper alignment of the pixel
> +		 * format, and the mismatch will then result in link validation
> +		 * failure. Incorrect operation of the hardware is not possible.
> +		 */
> +		min_width = min(ALIGN(min_width, 2), format->width);
> +		min_height = min(ALIGN(min_height, 2), format->height);

I wonder if initializing min_width (and height) to RWPF_MIN_WIDTH and
then here unconditionally make it 2 (because of ALIGN) wouldn't just
be better expressed as

		min_width = min(2, format->width);

>  	}
>
> -	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
> -	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
> +	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
> +	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);

Regardless of the above
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  	sel->r.width = min_t(unsigned int, sel->r.width,
>  			     format->width - sel->r.left);
>  	sel->r.height = min_t(unsigned int, sel->r.height,
> --
> Regards,
>
> Laurent Pinchart
>
>

