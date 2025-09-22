Return-Path: <linux-media+bounces-42906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFBB8F67A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C131895FAB
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DDB2FCC17;
	Mon, 22 Sep 2025 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gxt4kE6b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07478223DD0;
	Mon, 22 Sep 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528424; cv=none; b=E7Sqn1z/8DYpe40QbAf5h99JQzfqvOHlcPPCQWUXpYuv8EXAlPmT+PDULC1k+ovKV/klUHk3CL2KEHl0H/zsROxL04kbZyyt7axthE5emKG6oyuJNTCMmI7mgsVptjLFCCBe3z701yrSXgZwEAE03kg8Qmtk27mOXM9I8PoqsQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528424; c=relaxed/simple;
	bh=WvfLQCaZYoECA+x/WK/pWse3oxQLuALUEc/LsimrXOA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oKCMP0L3Unt2uJJ5HZ7JpRbmICP86VRUL1qYXXzS1MamRWcoAYhKHJqkkQkjaaKZNyn6zVPg8Wik0ZrW4Si0gp6gl+WgL3L0lKIv3S02/wWYZy3TXVrsvRGVDulaUqsfqwrm6pHwaiBRoTE2U5WNQ6e15H1tMOV9byJwkhNeYRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gxt4kE6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E549C4CEF0;
	Mon, 22 Sep 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758528423;
	bh=WvfLQCaZYoECA+x/WK/pWse3oxQLuALUEc/LsimrXOA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Gxt4kE6b3am6LufpMzE/eoC8PWDHXDOUO9DEQyd5rUY9wVFoQuDzxFFhjf8ODGcas
	 wLxpTeHwmb2rHcpfWMVlZ3zxE1lOz6h4OTuoD9ruzFqwDDZJPTT3tPrugCyl7ipfgA
	 ZZA7s563QV2am/KcaUTcycGb767kP0FvOcETUiJn1I8k9G6lRaO7ftEiKsS1fOfqS/
	 K+k+5xC782qMPbOqU+hph8Im0mW86chQF+zBEAdjFlVGRBgWuF54dHG91mdzlSepyr
	 Yd2Q2kBQAGBmRTzgu4cE5yQG6XozA9GLFABvdhH2LSDjRBCy/yQwsLAZgshhQ61tx9
	 p1iO5wHPhtCRQ==
Message-ID: <f2178b2d-d8ea-470f-8f8f-8ffc0380cee5@kernel.org>
Date: Mon, 22 Sep 2025 10:06:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 04/10] media: v4l2-dev: Add helpers to get current
 format from the state
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-4-b2c42426965c@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250919-vdev-state-v2-4-b2c42426965c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2025 11:55, Jai Luthra wrote:
> Add a helper function that drivers can call to retrieve the current
> v4l2_format stored in a video device state for internal use.
> 
> Additionally, provide a G_FMT ioctl implementation that drivers can use
> instead of writing their own when the format is stored in the active
> state.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> --
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 23 +++++++++++++++++++++++
>  include/media/v4l2-dev.h           | 18 ++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index dff23c6a0b56fb3d29e1c04e386bb445fa8773bb..2606077538be0e83032c6ae8956c1d67da0d0c5d 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -199,6 +199,29 @@ void __video_device_state_free(struct video_device_state *state)
>  }
>  EXPORT_SYMBOL_GPL(__video_device_state_free);
>  
> +struct v4l2_format *video_device_state_get_fmt(struct video_device_state *state)
> +{
> +	if (WARN_ON_ONCE(!state))
> +		return NULL;
> +
> +	return &state->fmt;
> +}
> +EXPORT_SYMBOL_GPL(video_device_state_get_fmt);
> +
> +int video_device_g_fmt(struct file *file, void *priv, struct v4l2_format *fmt)
> +{
> +	struct video_device_state *state = priv;
> +	struct v4l2_format *vfmt = video_device_state_get_fmt(state);

Obviously, if multiple format types are stored in state (e.g. video capture and
output), then this code needs to pick the right format based on fmt->type.

I would also suggest moving this to v4l2-common.c and renaming it to v4l2_g_fmt,
consistent with other helpers there (v4l2_g/s_parm_cap).

Regards,

	Hans

> +
> +	if (!vfmt)
> +		return -EINVAL;
> +
> +	*fmt = *vfmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(video_device_g_fmt);
> +
>  static inline void video_get(struct video_device *vdev)
>  {
>  	get_device(&vdev->dev);
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index d327be16f6def70554a7d92d10436a29384ae32a..b5312823fbff9c236d4394d48fa9a14412b17c68 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -612,6 +612,24 @@ __video_device_state_alloc(struct video_device *vdev,
>   */
>  void __video_device_state_free(struct video_device_state *state);
>  
> +/**
> + * video_device_state_get_fmt - get current v4l2_format.
> + *
> + * @state: pointer to struct video_device_state
> + */
> +struct v4l2_format *
> +video_device_state_get_fmt(struct video_device_state *state);
> +
> +/**
> + * video_device_g_fmt - fill v4l2_format from the state.
> + *
> + * @file: pointer to struct file
> + * @state: pointer to struct video_device_state
> + * @format: pointer to struct v4l2_format
> + */
> +int video_device_g_fmt(struct file *file, void *priv,
> +		       struct v4l2_format *format);
> +
>  /**
>   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
>   *
> 


