Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9806917BFB4
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 14:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCFN5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 08:57:12 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52963 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbgCFN5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 08:57:11 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADTPj3Az9EE3qADTQjCbJA; Fri, 06 Mar 2020 14:57:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583503029; bh=7C8ejfAlywNN851hAmFB/5ub06nq6fiGYK6/JJLtDDY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mstb2LcpHR8PJe5gVVe+QxU8IKeKx+BU4OWJ5GAjwC4MzBA56IJg51BZyn4t7RaXf
         p8+QCR0T8MwXbBml3/zzdSoMRwYdrbXj1CXdjWZpgHN3cYvMJv+2Z32XanV0JU4bNf
         iKXg6A/U12KM3+RYsq+bnhdF4FL1g+mzIM13UBU0r9XRTT4XyVdLQU6ZA9HM+IKPu+
         JDJdFW4d9EJ0pYojfLRPNgF9hxR8BaZ31FTiBPDWzteleCgq8uCgldcxMsjJWFDVmH
         RMAnR+pFWo9ZAtLi/OAG9A///glkZB2m/H43pD8CsYp+EVdA62nHMu/87bH6o+p1fe
         TvMVBAj55beDQ==
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
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
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
Date:   Fri, 6 Mar 2020 14:57:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEgAKs0orUOER4VSkqFKGXXNyskcC09fhd+Y7xYxpI22EsO3XH2NFF5+JuaxQXNPGyALegrne0XA/wbXmSTcqEZfgICUJcXJDpByFEz3SKW3KNI1GjxU
 pFCA0bOtDcxSvNRJ679z5rLvw9v5GgoDkaJACiWKDLnsVNQbgHfRZ2+ic61ERGPGEEtdmRGl6D8BdFsFpPRhnbgADoMjRAGSjiOFvDm07KRbrrw0zX2Tp7Fl
 zbxakj6okI4aiuOjC6ptdn1GU0eBaM3wfCtx4FLqSozA5UyXlWp2nwMkWl2dxRYVtL0DrwGqVE5ADgtmY6BCVVA9i2XiWKXsB9pWEn6J4Qu3hQYoenskgUqT
 RcBdlMOiDtW4+B4SGAjQSf+UCJoxLqkjQTdGRBeYs2Au7FMNWh8tpr6CK10+RU3MfmQohCcy+JeIH9Ba+XZOmPoyhqLVI/OA/iyubs6dczGZ4ZdQGxNcxZAw
 pqvaz9HTnKl740FnKfdxbcrcyPRRDf6sPg859K8dwU7V9XabUgdN7/noJFUvCoC8xgktAIY4SQ2Sff9YpVDh/ZZ6phLrRh6C/caBVHu6U3Pt/Hq5kBQCArKT
 ORG27MEip3JZbBQXfiLVhJmZd9fNn/vul4CFD7m0DAyGtQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
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
> struct with two new members ->need_cache_sync_on_prepare and
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

checkpatch complains about a space before a tab in the two lines above.

Regards,

	Hans

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

