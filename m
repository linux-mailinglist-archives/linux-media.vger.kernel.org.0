Return-Path: <linux-media+bounces-45191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DDBFA7D0
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC7D93B4238
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A22D2ECD11;
	Wed, 22 Oct 2025 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYY35DvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB233F3;
	Wed, 22 Oct 2025 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117250; cv=none; b=SihQUgjEGBqSXNWF+SYCDJHlDGhBL/TNjlyM6ZL1yJY4vX3H2CSJkS5YdTfaccrhfJijeA0IeOL/eDQwDEZQkc3puXNSkNNkM1mdm93ddiQ10dapkgxYRq4y4HLC1ZixVPBB7oIWR26fG891gUv6G/rcEP+X/f12wJpRydOdnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117250; c=relaxed/simple;
	bh=iymUx0nL06xQvGEiSAX6GeNOgkgj8lUvwGDVcpoO4CA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oPMiReOkYc6rcbpdU8CZ6uZWwQKzQ5E/n/p8uq0TcEGvb5YeUhrlkRDFPD2C03Csm19GqEGOKWXxk2S0M/uxI7I5Gxem3NU0UXaqx2Bx1KwmTGmiat5seKjT7KxxBe/xUw8//wN2MSg0GYbQHKmcAgHhZ1C+E8YMtGPhasHjZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYY35DvQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD6BC4CEE7;
	Wed, 22 Oct 2025 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761117247;
	bh=iymUx0nL06xQvGEiSAX6GeNOgkgj8lUvwGDVcpoO4CA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VYY35DvQqqWm2q1iIPOYOX4o+xGPH85nzH8stGoLLCUR9/WfEMgh7C9Xd0hc07/qY
	 oMV0OQAzFi6FuaTP6DQgwmgjr8Onc33/yf2f5CxJ5axrKAMWifMYKAcw6IFOkRBQ3I
	 xcQxM4WqmHGIsdGbZP3C2FuZkRuoErO5BjhOsBcE+EdKglC8kdI68aRapbB4V7WXdu
	 new+WM8tjS96jdWtJ91Vs+e8NdMMSGEA2NDsWePKF8iDeuLSg3/pw1oofdRPWu04Qh
	 bj2dk98y8JI+ZKNgvCNv/+9ixXxYtBla92k/5eKaxpzes56eK8ydcRyrVB4hZjHJZf
	 YtB35eHqIk+Uw==
Message-ID: <8199bec4-b9e1-4d6e-98da-a4d7eb667437@kernel.org>
Date: Wed, 22 Oct 2025 09:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in
 validate_av1_sequence()
To: Pavan Bobba <opensource206@gmail.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, yunkec@google.com,
 sakari.ailus@linux.intel.com, james.cowgill@blaize.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250913105252.26886-1-opensource206@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250913105252.26886-1-opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pavan,

On 13/09/2025 12:52, Pavan Bobba wrote:
> Complete the "TODO: PROFILES" by enforcing profile-specific and
> monochrome constraints as defined by the AV1 specification
> (Section 5.5.2, "Color config syntax").
> 
> The validator now checks:
> 
>  - Flags: reject any unknown bits set in sequence->flags
>  - Profile range: only profiles 0..2 are valid
>  - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=1, sy=1),
>    monochrome allowed
>  - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=0, sy=0),
>    monochrome forbidden
>  - Profile 2:
>     * 8/10-bit: only 4:2:2 allowed (sx=1, sy=0)
>     * 12-bit: 4:4:4 (sx=0, sy=0), 4:2:2 (sx=1, sy=0), or 4:2:0 (sx=1, sy=1)
>       allowed
>  - Monochrome path (all profiles except 1): forces subsampling_x=1,
>    subsampling_y=1, separate_uv_delta_q=0
> 
> These checks prevent userspace from providing invalid AV1 sequence
> headers that would otherwise be accepted, leading to undefined driver
> or hardware behavior.

This patch was merged in our media-committers next branch, but I noticed that
it now fails the v4l2-compliance test for the visl driver.

The cause is that the new validation now fails with the default values for
this control as set in std_init_compound().

You can test this yourself by loading the visl driver and then running
v4l2-compliance -d /dev/videoX -E --verbose
(-E stops at the first error)

Can you provide a patch to initialize this control with sane values?

Apologies for not noticing this before: there are some issues with the automatic
regression tests in our CI, so the tests weren't run.

Regards,

	Hans

> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
> v1 -> v2 : Added more checks for subsampling combinations per profile.
>          : Added a TODO note in the function header for checks to be implemented later.
> 
> v2 -> v3 : Patch generated properly with all the changes
> 
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 125 +++++++++++++++++-----
>  1 file changed, 100 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 98b960775e87..fa03341588e4 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -827,39 +827,114 @@ static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  	return 0;
>  }
>  
> +/**
> + * validate_av1_sequence - validate AV1 sequence header fields
> + * @s: control struct from userspace
> + *
> + * Implements AV1 spec §5.5.2 color_config() checks that are
> + * possible with the current v4l2_ctrl_av1_sequence definition.
> + *
> + * TODO: extend validation once additional fields such as
> + *       color_primaries, transfer_characteristics,
> + *       matrix_coefficients, and chroma_sample_position
> + *       are added to the uAPI.
> + *
> + * Returns 0 if valid, -EINVAL otherwise.
> + */
>  static int validate_av1_sequence(struct v4l2_ctrl_av1_sequence *s)
>  {
> -	if (s->flags &
> -	~(V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE |
> -	 V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF |
> -	 V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION |
> -	 V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME |
> -	 V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE |
> -	 V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
> -	 V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y |
> -	 V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT |
> -	 V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q))
> -		return -EINVAL;
> +	const bool mono  = s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME;
> +	const bool sx    = s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X;
> +	const bool sy    = s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y;
> +	const bool uv_dq = s->flags & V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q;
>  
> -	if (s->seq_profile == 1 && s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
> +	/* 1. Reject unknown flags */
> +	if (s->flags &
> +	    ~(V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE |
> +	      V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF |
> +	      V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION |
> +	      V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME |
> +	      V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE |
> +	      V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
> +	      V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y |
> +	      V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT |
> +	      V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q))
>  		return -EINVAL;
>  
> -	/* reserved */
> +	/* 2. Profile range */
>  	if (s->seq_profile > 2)
>  		return -EINVAL;
>  
> -	/* TODO: PROFILES */
> +	/* 3. Monochrome shortcut */
> +	if (mono) {
> +		/* Profile 1 forbids monochrome */
> +		if (s->seq_profile == 1)
> +			return -EINVAL;
> +
> +		/* Mono → subsampling must look like 4:0:0: sx=1, sy=1 */
> +		if (!sx || !sy)
> +			return -EINVAL;
> +
> +		/* separate_uv_delta_q must be 0 */
> +		if (uv_dq)
> +			return -EINVAL;
> +
> +		return 0;
> +	}
> +
> +	/* 4. Profile-specific rules */
> +	switch (s->seq_profile) {
> +	case 0:
> +		/* Profile 0: only 8/10-bit, subsampling=4:2:0 (sx=1, sy=1) */
> +		if (s->bit_depth != 8 && s->bit_depth != 10)
> +			return -EINVAL;
> +		if (!(sx && sy))
> +			return -EINVAL;
> +		break;
> +
> +	case 1:
> +		/* Profile 1: only 8/10-bit, subsampling=4:4:4 (sx=0, sy=0) */
> +		if (s->bit_depth != 8 && s->bit_depth != 10)
> +			return -EINVAL;
> +		if (sx || sy)
> +			return -EINVAL;
> +		break;
> +
> +	case 2:
> +		/* Profile 2: 8/10/12-bit allowed */
> +		if (s->bit_depth != 8 && s->bit_depth != 10 &&
> +		    s->bit_depth != 12)
> +			return -EINVAL;
> +
> +		if (s->bit_depth == 12) {
> +			if (!sx) {
> +				/* 4:4:4 → sy must be 0 */
> +				if (sy)
> +					return -EINVAL;
> +			} else {
> +				/* sx=1 → sy=0 (4:2:2) or sy=1 (4:2:0) */
> +				if (sy != 0 && sy != 1)
> +					return -EINVAL;
> +			}
> +		} else {
> +			/* 8/10-bit → only 4:2:2 allowed (sx=1, sy=0) */
> +			if (!(sx && !sy))
> +				return -EINVAL;
> +		}
> +		break;
> +	}
> +
>  	return 0;
>  }
>  


