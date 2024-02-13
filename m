Return-Path: <linux-media+bounces-5093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D78535D7
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 17:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BD31C21D0C
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 16:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C5C5F866;
	Tue, 13 Feb 2024 16:19:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78F5F848;
	Tue, 13 Feb 2024 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707841174; cv=none; b=hc1HXHDjQvZ8+UMHz5nyu0+8ykgAY9Ko1bFV/SuJAdr4/iNrKXz99xp2Pf0ZFpcd6Psq9iKYFZEPv4g+sFzUtGrMXXdx0fykHHuLLB+/7LWxGMy0iK5fmH2BcpQFGGjvb40ES8iaZfxfnZK9hbOQGuMAPoS/Ilc1qqmoGicbc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707841174; c=relaxed/simple;
	bh=AhGpVNqhDbiDl0MGgQawZtJuMCf903q/B/3w4GmjpPM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utjT7b3eipzZVOP50KXYbXTTKFwhfmqjJGflJQv9PS+/6BlAmvXh6mAQ0kyhCi3a4xM7EDDPiH1u8B7Pf/SyZi1KV3zQdrvT4yq8y1JB0Xs6fkaLeVm+DOYWMebOwqJ6s7xpfhfUmKGNl4Lh9fPdU4ICiEHoPZ8wUN5NrwXVxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13877C433C7;
	Tue, 13 Feb 2024 16:19:32 +0000 (UTC)
Date: Tue, 13 Feb 2024 11:20:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, "Alex Deucher"
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm: add drm_mode_atomic_commit event
Message-ID: <20240213112017.726016f0@gandalf.local.home>
In-Reply-To: <20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Feb 2024 16:50:31 +0100
Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:

> @@ -1503,6 +1504,24 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  		drm_mode_object_put(obj);
>  	}
>  
> +	if (trace_drm_mode_atomic_commit_enabled()) {
> +		struct drm_crtc_state *crtc_state;
> +		struct drm_crtc *crtc;
> +		int *crtcs;
> +		int i, num_crtcs;
> +
> +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
> +				GFP_KERNEL);

If the above allocation fails, this will cause a NULL kernel dereference.

-- Steve

> +
> +		num_crtcs = 0;
> +		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +			crtcs[num_crtcs++] = drm_crtc_index(crtc);
> +
> +		trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
> +
> +		kfree(crtcs);
> +	}
> +
>  	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
>  				&num_fences);
>  	if (ret)

