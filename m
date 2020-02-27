Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B8D171675
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 12:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgB0L4B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 06:56:01 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42017 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728865AbgB0L4B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 06:56:01 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7HlijDj97jmHT7HlmjiPmT; Thu, 27 Feb 2020 12:55:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582804559; bh=rkvyyVta2hxnKW42ty2q7HDwkXGODZ7Lq9syVkbUKMI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Q1HCX6eTnJ8xhzLzR7sSIMgqyWH6maEG+r8PXqkC0tQuvY1k0HyCQ13jSEFzkwFip
         vcmDnxFD/ykEI2vL8SO84DQtsSfyLs+0L5hsSvCOe1q8nWH3RkcbxxzJ6tU/V1r31b
         7HERQBrps3k18qfHgP9WkWWKwvQogdljXJVf7mwHcF69XUhrDjEJIDr2feGO821MuM
         N1JDFyfG8aH1Lha6Yq9asJoyi3qjZJndnvhDvg87QuZBbUcasvPFXCKirodUo38yA+
         7PKbfPvcZCr6f+YWXyorfsfSNE3fJzVh8W0m4P31cr7sjwg3vuZ3N0wtl3h/YQtX5K
         3QiSl7PyMzCXw==
Subject: Re: [PATCHv3 01/11] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-2-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c20606f-5cde-47d3-afd2-d1bbde668136@xs4all.nl>
Date:   Thu, 27 Feb 2020 12:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226111529.180197-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIqKjjcCBwBp3JGQQwP+FSOkPJM19LYUTMhtVyPpW8TGo26I6R4Kfwcm4enP15VDw2ViWHWfFAZC+MakWscTm8G/iAFi9Ue9EbRyBUTBet/SQGNqdEap
 71ulWCMO5lHVhWdHmb3QuTTZSfXvFB8Ygz/2tv/IgU71DbfXu/aqilJJXUM1g8JKvMidaJnvK3j8X5FfIGmv7osu08gPNkogxsBHbtO1qjJ32L9gPkufDspw
 eEkgOvX2o/OQi/x3xcDCJjQUk8rA0ETne2xSdWTi5p3EKGdpJPMGEvDm2QpDJHotox+uj58xlFtXZ11QOLe8e2grHvuaey8yKse8n4gSJuENUHADXeuxDu+s
 Pmhkk2MqTcbqn4RSE8f3FQN3FfNo5gPHeqjuFkEAAGCmtY7b3u84nZ9RGfUGN4m2rlxM/wrYC52v1CHJ9FiVa+rPc0mTvPKmaC+5eWqgnscZkIHP+lnX5ZLN
 8EAZcs3DUY3SvqA4CxFnDAo8m8UpKlknS2l/63r8rrQF38Mg8QoPgXy7RvGfdLl/KAiY8fFMPStqCbC17Uhw5oVracjXEkqYwFs2qJALPIr+NU9AV8YX2XRQ
 s3dIkuVf8sQk0WzBLGIfIs3qS/HpS29j2iBwAXrfExz6GO+T3xJkH+fsN6BcXHICWic=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
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

memebers -> members

Regards,

	Hans

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
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  include/media/videobuf2-core.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index a2b2208b02da..4a19170672ac 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -263,6 +263,10 @@ struct vb2_buffer {
>  	 *			after the 'buf_finish' op is called.
>  	 * copied_timestamp:	the timestamp of this capture buffer was copied
>  	 *			from an output buffer.
> +	 * need_cache_sync_on_prepare: when set buffer's ->prepare() function
> +	 *			performs cache sync/invalidation.
> +	 * need_cache_sync_on_finish: when set buffer's ->finish() function
> +	 *			performs cache sync/invalidation.
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

