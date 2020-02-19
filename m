Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34776163E6C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgBSIFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:05:42 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49541 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbgBSIFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:05:42 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KMRjz84xP9a94KMVjnGer; Wed, 19 Feb 2020 09:05:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582099540; bh=TGmn708Y9zxHTvn2qEJKe1X4vwdgsSV8HFoJtlde7fQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mXdKF/wlv+9KIKTpw+p7K6YtS8oorQY5pjIaI40kjn1zsVzYSDoVtidblndRvIkKz
         ZapHijS9DMUppdkhFu4LhAQVNkT+RaZv58OBws20qNqTgpOBT9dTerXEALKGNhWvQ/
         AZiP8bcRNjnKx8XovAHkmBsliNrRts48AXd0u1dTXlH5wAoU7PSxYYW0wqTaVfqEuT
         kOU9qjaIIQYnJ6jrqbYhNjJIZdRziClG9rNBhTDD0IWZ0qpex+LVVtWWX/Y6pE0xEP
         DfL1SHl0jSAdicGf7ATLV765YaCOB3MUWqti+3nwiuvmSqLDNBpiLw/b2Rtp/bSvHj
         XMTGMim9RPruA==
Subject: Re: [RFC][PATCHv2 01/12] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-2-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <964aeb73-1474-032f-b2a6-b317cc15f7cb@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:05:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOs0xdWWvMofum8EYzW5VlpCwfPgnNmI0ort5y6kYYpWxb0Mcj3GsP2K7A8a263PWFDxHs1sawGHfs36zO0jQYFHRWfbKQy6J810DzkBFCWFNbeSZH9w
 Coq/C6E6btPHd7eTmy+mX1Rq2CpkgzxlspuulsydDM+1jUvf+VsbNf26fH0aAagFUlju0u+AOthOoAE3E48J5CoAsLCcA+1RrLdh0TV8r17UOnPkgomNPHNu
 wMhxaut/gRGUpKop5OTK/jKAhgCuWmzsyTUsnHG2mClNdOBUt+zkq0XC9YGkN9AL6Zy9QngwE3BlQFfe7EYagrd7N263XZ95YWyeXMf/KvL+Gy4umh1ClORE
 +H9PWynr5qZolmhZONoDvhfvz3VbIUBDlsN24exkTbxMJsp5KG8CckMhnDb/rcmlhx1DrwYu3AElmYu/AMpPY+h9+hVUV4ur3L9MjjTAa7thlO8HIg6tsWPU
 g62e23vM9pq2PvN4V8dy92xpGmR4AbtQrrBrHZ80fkxwd8DEMEqItwNAlvPxtl6ToAwI/9HOfKgTCRvf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> Extend vb2_buffer and vb2_queue structs with cache management
> members.
> 
> V4L2 UAPI already contains two buffer flags which user-space,
> supposedly, can use to control buffer cache sync:
> 
> - V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> - V4L2_BUF_FLAG_NO_CACHE_CLEAN
> 
> None of these, however, do anything at the moment. This patch
> set is intended to change it.
> 
> Since user-space cache management hints are supposed to be
> implemented on a per-buffer basis we need to extend vb2_buffer
> struct with two new memebers ->need_cache_sync_on_prepare and
> ->need_cache_sync_on_finish, which will store corresponding
> user-space hints.
> 
> In order to preserve the existing behaviour, user-space cache
> managements flags will be handled only by those drivers that
> permit user-space cache hints. That's the purpose of vb2_queue
> ->allow_cache_hints member. Driver must set ->allow_cache_hints
> during queue initialisation to enable cache management hints
> mechanism.
> 
> Only drivers that set ->allow_cache_hints during queue initialisation
> will handle user-space cache management hints. Otherwise hints
> will be ignored.
> 
> Change-Id: I52beec2a0d021b7a3715b4f6ae4bfd9dc5e94f0d
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  include/media/videobuf2-core.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index a2b2208b02da..026004180440 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -263,6 +263,10 @@ struct vb2_buffer {
>  	 *			after the 'buf_finish' op is called.
>  	 * copied_timestamp:	the timestamp of this capture buffer was copied
>  	 *			from an output buffer.
> +	 * need_cache_sync_on_prepare: do not sync/invalidate cache from
> +	 * 			buffer's ->prepare() callback.
> +	 * need_cache_sync_on_finish: do not sync/invalidate cache from buffer's
> +	 * 			->finish() callback.

Shouldn't 'do not' be deleted from the flag descriptions? If the flag is set,
then you need to sync/validate, right?

Regards,

	Hans

>  	 * queued_entry:	entry on the queued buffers list, which holds
>  	 *			all buffers queued from userspace
>  	 * done_entry:		entry on the list that stores all buffers ready
> @@ -273,6 +277,8 @@ struct vb2_buffer {
>  	unsigned int		synced:1;
>  	unsigned int		prepared:1;
>  	unsigned int		copied_timestamp:1;
> +	unsigned int		need_cache_sync_on_prepare:1;
> +	unsigned int		need_cache_sync_on_finish:1;
>  
>  	struct vb2_plane	planes[VB2_MAX_PLANES];
>  	struct list_head	queued_entry;
> @@ -491,6 +497,9 @@ struct vb2_buf_ops {
>   * @uses_requests: requests are used for this queue. Set to 1 the first time
>   *		a request is queued. Set to 0 when the queue is canceled.
>   *		If this is 1, then you cannot queue buffers directly.
> + * @allow_cache_hints: when set user-space can pass cache management hints in
> + * 		order to skip cache flush/invalidation on ->prepare() or/and
> + * 		->finish().
>   * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
>   *		driver can set this to a mutex to let the v4l2 core serialize
>   *		the queuing ioctls. If the driver wants to handle locking
> @@ -564,6 +573,7 @@ struct vb2_queue {
>  	unsigned			requires_requests:1;
>  	unsigned			uses_qbuf:1;
>  	unsigned			uses_requests:1;
> +	unsigned			allow_cache_hints:1;
>  
>  	struct mutex			*lock;
>  	void				*owner;
> 

