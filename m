Return-Path: <linux-media+bounces-17024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D296280C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814D81C24010
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C9417C9BA;
	Wed, 28 Aug 2024 12:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294115B12F
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849975; cv=none; b=mPQvzM44vIEFRLaKJQ2ULPur9CE5TfTFM/QzDXke8xyzKo2TC7yE1Q4IjmGFTZ3QEbPCcBbZ1iaMFxEq8OLb3teEiU6Y+CSnACR5WKIwXmKhWHp4txsGfwQSREGD0p2pa3alj6wEwOvNeC7UrUQb2vkoAo29el2fvrq/ni+uzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849975; c=relaxed/simple;
	bh=sFaP6aNP1Nry06rhcCsQC6+y8VKzJC+NY1yrgb7PUw8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=l3ENWLV4yRB49YZmIl9cXet1BnaB1CotNaS2TRKLkTGdbebY6sX/ttAvBPekNE/hwsmEMmWLNTPmoxeMGVkRQbYi6F3s6KQVmikQsKCVS6+TaP6T9TC3FLb04QYFNLqzZVkI7je/UMA8qpPOOign96Jmm/FFsxD8mYi4Ztc3ou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B9AC4CAAF;
	Wed, 28 Aug 2024 12:59:34 +0000 (UTC)
Message-ID: <88770f46-f0d7-4b18-afda-11d2fd74ca52@xs4all.nl>
Date: Wed, 28 Aug 2024 14:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: mc: add manual request completion support
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <cover.1724848660.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Please ignore, I'll post a v2 soon.

Regards,

	Hans

On 28/08/2024 14:37, Hans Verkuil wrote:
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
> patch adds this to vicodec and the last patch is an updated old
> patch of mine that adds debugfs code to check if all requests and
> request objects are properly freed. Without it it is really hard to
> verify that there are no dangling requests or objects.
> 
> Regards,
> 
> 	Hans
> 
> Hans Verkuil (4):
>   media: mc: add manual request completion
>   media: vicodec: add support for manual completion
>   media: mc: add media_debugfs_root()
>   media: mc: add debugfs node to keep track of requests
> 
>  drivers/media/mc/mc-device.c                  | 28 ++++++++++++
>  drivers/media/mc/mc-devnode.c                 | 16 +++++++
>  drivers/media/mc/mc-request.c                 | 43 ++++++++++++++++++-
>  .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++--
>  include/media/media-device.h                  |  9 ++++
>  include/media/media-devnode.h                 | 15 +++++++
>  include/media/media-request.h                 | 38 +++++++++++++++-
>  7 files changed, 163 insertions(+), 7 deletions(-)
> 


