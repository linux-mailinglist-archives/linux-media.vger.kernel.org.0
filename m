Return-Path: <linux-media+bounces-5296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03C858205
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FC7282CE2
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 15:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44563132C23;
	Fri, 16 Feb 2024 15:58:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDFE12F387;
	Fri, 16 Feb 2024 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708099079; cv=none; b=ORo+sVNFEtExD9WyiV3fCIsJvnigoCCNwUrLDEA/k62zwGhs2eoJ9MJs5xlFdzszz5fRedoqPHvuZhl4GBllnklMfMNMDvxXbKF8C7HO7s8zVhBblfSWKugaGqDqibANohT+MwEl+srdS0wEZ7p59wNWeG13Q6wCsk4bnNvctFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708099079; c=relaxed/simple;
	bh=sUrIlBk6VxsBPMMz/0ZSRNYcU+x7GykjiOgUj/9dZQM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdKNDlwPNtxVE+VFB0k2Qs0mXxux3LjbssiTwTfPM3q4Hur0IZaGO50wg68FsHaM/G205StQ5k83NYFuxHIsQSJDfevBUpC9ZLZrQCJrGr5CNncdL/jcJYmG21FHsSQx+I5uTcB0VjT/25zZ5juFOBbbaH5eDrpn/yan25JUJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2221CC433C7;
	Fri, 16 Feb 2024 15:57:58 +0000 (UTC)
Date: Fri, 16 Feb 2024 10:59:34 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: "Sumit Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/8] drm: add drm_mode_atomic_commit event
Message-ID: <20240216105934.7b81eae9@gandalf.local.home>
In-Reply-To: <20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
	<20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Feb 2024 16:09:55 +0100
Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_trace.h       | 23 +++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d4..f31b5c6f870b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -41,6 +41,7 @@
>  #include <linux/file.h>
>  
>  #include "drm_crtc_internal.h"
> +#include "drm_trace.h"
>  
>  /**
>   * DOC: overview
> @@ -1503,6 +1504,26 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
> +
> +		if (crtcs) {
> +			num_crtcs = 0;
> +			for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +				crtcs[num_crtcs++] = drm_crtc_index(crtc);

Hmm, looking deeper into this, could you just do the loop the trace event?

That is how different is the config.num_crtc compared to the final num_crtcs?
That way, we don't need to do this allocation if it's not too different.
That is, pass in the dev->mode_config.num_crtc to the tracepoint instead of
num_crtcs.

> +
> +			trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
> +
> +			kfree(crtcs);
> +		}
> +	}
> +
>  	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
>  				&num_fences);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
> index 11c6dd577e8e..63489923c289 100644
> --- a/drivers/gpu/drm/drm_trace.h
> +++ b/drivers/gpu/drm/drm_trace.h
> @@ -66,6 +66,29 @@ TRACE_EVENT(drm_vblank_event_delivered,
>  		      __entry->seq)
>  );
>  
> +TRACE_EVENT(drm_mode_atomic_commit,
> +	    TP_PROTO(struct drm_file *file, int *crtcs, int ncrtcs, uint32_t flags),
> +	    TP_ARGS(file, crtcs, ncrtcs, flags),
> +	    TP_STRUCT__entry(
> +		    __field(struct drm_file *, file)
> +		    __dynamic_array(u32, crtcs, ncrtcs)

Here the ncrtcs is what is passed in. It will always be allocated to that
size though.

> +		    __field(uint32_t, ncrtcs)
> +		    __field(uint32_t, flags)
> +		    ),
> +	    TP_fast_assign(
> +		    unsigned int i;
> +
> +		    __entry->file = file;
> +		    for (i = 0; i < ncrtcs; i++)
> +			((u32 *)__get_dynamic_array(crtcs))[i] = crtcs[i];

Here we have:

		int n = 0;

		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
			((u32 *)__get_dynamic_array(crtcs))[n++] = drm_crtc_index(crtc);

		__entry->ncrtcs = n;

But this is only viable if the ncrtcs is close to the same size as dev->mode_config.num_crtc,
otherwise it's not worth it.

-- Steve



> +		    __entry->ncrtcs = ncrtcs;
> +		    __entry->flags = flags;
> +		    ),
> +	    TP_printk("file=%p, pid=%8d, flags=%08x, crtcs=%s", __entry->file,
> +		      pid_nr(__entry->file->pid), __entry->flags,
> +		      __print_array(__get_dynamic_array(crtcs), __entry->ncrtcs, 4))
> +);
> +
>  #endif /* _DRM_TRACE_H_ */
>  
>  /* This part must be outside protection */


