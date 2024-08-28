Return-Path: <linux-media+bounces-17048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5024962C08
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 17:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739C0287365
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F7313BC1E;
	Wed, 28 Aug 2024 15:20:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157F13C3D5
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858411; cv=none; b=iG7je59PcwWpG7CeMQPNGTlMvw4uNUdkv/NaMS5T+s2dOukt6sUghBmw1QQYWFOuxqJl3hnu+8DZV17YLvJjNxnW/AB8DBA6/Am5aOO8Ab6d9tPBGkZdRPHy8AykXFL4GqNfvt+9nWau3FlpRxrR/xw//ELydIdPWJsXoL97Rc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858411; c=relaxed/simple;
	bh=HTlhTMS/oA9ZNrpVA7Y8RF8NhLkIj/wc3TCClbfXcHc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kJdDzlH5BsbmLCXm5Rqtmi5GJGS4HVw37F0wA4PXdD2/9UkXy79WyIxwXOuawDYf87deTTkFmhTfPvx1L7WdbQLkaZhEO1RoXoHcS2q50Kycp+lougeooYgiWLhxX4XDa0+T5WrujQ53L6kQblKVHPSqUlYDk/HBFL4w2cJ1T14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FBBC4CEC2;
	Wed, 28 Aug 2024 15:20:09 +0000 (UTC)
Message-ID: <006d1b86-3612-482c-85fa-18900b2d59c1@xs4all.nl>
Date: Wed, 28 Aug 2024 17:20:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/3] media: mc: add manual request completion support
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <cover.1724852163.git.hverkuil-cisco@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <cover.1724852163.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hmm, the gitlab virtme has a kernel oops with this series, but I don't
see that when I test locally. Clearly something is wrong, I'll have to
dig a bit more.

Regards,

	Hans

On 28/08/2024 15:36, Hans Verkuil wrote:
> Normally a request contains one or more request objects, and once all
> objects are marked as 'completed' the request itself is completed and
> userspace gets a signal that the request is complete.
> 
> Calling vb2_buffer_done will complete a buffer object, and
> v4l2_ctrl_request_complete will complete a control handler object.
> 
> In some cases (e.g. VP9 codecs) there is only a buffer object, so
> as soon as the buffer is marked done, the request is marked as
> completed. But in the case of mediatek, while the buffer is done
> (i.e. the data is consumed by the hardware), the request isn't
> completed yet as the data is still being processed. Once the
> data is fully processed, the driver wants to call
> v4l2_ctrl_request_complete() which will either update an existing
> control handler object, or add a new control handler object to the
> request containing the latest control values. But since the
> request is already completed, calling v4l2_ctrl_request_complete()
> will fail.
> 
> One option is to simply postpone calling vb2_buffer_done() and do
> it after the call to v4l2_ctrl_request_complete(). However, in some
> use-cases (e.g. secure memory) the number of available buffers is
> very limited and you really want to return a buffer as soon as
> possible.
> 
> In that case you want to postpone request completion until you
> know the request is really ready.
> 
> Originally I thought the best way would be to make a dummy request
> object, but that turned out to be overly complicated. So instead
> I just add a bool manual_completion, which you set to true in
> req_queue, and you call media_request_manual_complete() when you
> know the request is complete. That was a lot less complicated.
> 
> The first patch adds this new manual completion code, the second
> patch adds this to vicodec so it is included in regression testing,
> and the last patch is an updated old patch of mine that adds debugfs
> code to check if all requests and request objects are properly freed.
> Without it it is really hard to verify that there are no dangling
> requests or objects.
> 
> I prefer to merge this third patch as well, but if there are
> objections, then I can live without it.
> 
> Regards,
> 
> 	Hans
> 
> Changes since the RFC:
> 
> - Added WARN_ONs
> - vicodec was calling media_request_manual_complete() without
>   checking that it was the stateless output queue first.
> - Some minor cleanups in patch 3.
> 
> Hans Verkuil (3):
>   media: mc: add manual request completion
>   media: vicodec: add support for manual completion
>   media: mc: add debugfs node to keep track of requests
> 
>  drivers/media/mc/mc-device.c                  | 30 +++++++++++++
>  drivers/media/mc/mc-devnode.c                 |  5 +++
>  drivers/media/mc/mc-request.c                 | 43 ++++++++++++++++++-
>  .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
>  include/media/media-device.h                  |  9 ++++
>  include/media/media-devnode.h                 |  4 ++
>  include/media/media-request.h                 | 38 +++++++++++++++-
>  7 files changed, 143 insertions(+), 7 deletions(-)
> 


