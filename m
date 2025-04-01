Return-Path: <linux-media+bounces-29173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDCA78383
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD9003AD4BF
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 20:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9CD21CFEA;
	Tue,  1 Apr 2025 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DqhOAfP7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7622E21B91F;
	Tue,  1 Apr 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540418; cv=pass; b=qg37rgxXHV93bQdY9Qt7M1913LL6Vd+LXoTjvzZ8xkFtwS9E05r+IfEWainkq+ReZCP2wx97ktKPg8uPZzK6hPqymUWtRd4jmJjiG+V3U7wIFJPE4TqMn2HeaSOXnkSN+HTQJMl4RMLtFQ8zKmckCsBiDsGXHFKDKGnQ6S/LA5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540418; c=relaxed/simple;
	bh=ykNK66j1CazBrZP9CHPI3BUzn02GTKCILRduWrU/G7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl/DM9Avoddm/FxroLQT4EW4f4dcqqwjnLAzAPXSXZENroDkVsWSRoxXqAar4X8739uvK2k86+X1wg6K5JUYFbAQDaXKU+4MjfIxP3LucIFK2rai/of1XQUctN0dtKT3s17v7anK6+SEHOCW8X5FuZ2RORa/lDLVXblWmOA7aE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=DqhOAfP7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743540398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PN5bYGeqXLvmp2/TycPIAPO5A62oJmUbeSau36lmUibgJRei9L0BGXG4mOEMt0pRJmOz2NaF7fa7fhqtLonPLzkECyUiPnNMww8DplzKRec0tYRLEnLtRbnxmuSuhoO9feoTWcks1DERJen7ch52U8lDOMFqCIh4sQSkba+oGQE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743540398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nwoofyd9hzvVQbQplsmXjWgL9RWGfB+EP1jAWvqqixw=; 
	b=hjhWbEITx355cUzmz/Lz4w1lug59q2FlhYbFrvR4L12EaC9hiorFdDxrom7mKWRBZZnRxuq4O++O/R+pfYTr51O6DyBTTGPZvzfCpT6kirr3e72ydJi0sQZVgKA4sonQLCZUDpIpEuNBxEplETT1pAOYc8a0gZinQJWvzK83TWA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743540398;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Nwoofyd9hzvVQbQplsmXjWgL9RWGfB+EP1jAWvqqixw=;
	b=DqhOAfP7s+x3awV10qSgOHGLpEl+4TV62M+3VSQI7W2enL3XCajX+9LpKk4kZUw6
	WtNRlWYZt9XnfPoUJZwIJL7vwlMYybQABEzwJmbKgta84eNlCZzhbVDA4ghz7P9JNEP
	CZ6g3toZEkl2qtQIm1cIZuH5ePUJy68KDXktQs1Y=
Received: by mx.zohomail.com with SMTPS id 1743540396592221.6940754924799;
	Tue, 1 Apr 2025 13:46:36 -0700 (PDT)
Message-ID: <ff614cb7-94ca-4d74-9bbb-f97c95893113@collabora.com>
Date: Tue, 1 Apr 2025 23:46:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250401155758.48855-1-robdclark@gmail.com>
 <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/1/25 23:40, Rob Clark wrote:
> On Tue, Apr 1, 2025 at 8:58 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Add support for exporting a dma_fence fd for a specific point on a
>> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
>> syncobj support, as it needs a way to turn a point on a timeline back
>> into a dma_fence fd.  It also closes an odd omission from the syncobj
>> UAPI.
>>
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
>> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
>>
>> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
>> v3: Add unstaged uabi header hunk
>> v4: Also handle IMPORT_SYNC_FILE case
>> v5: Address comments from Dmitry
>> v6: checkpatch.pl nits
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++--------
>>  include/uapi/drm/drm.h        |  4 +++
>>  2 files changed, 41 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 4f2ab8a7b50f..636cd83ca29e 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>>  }
>>
>>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>> -                                             int fd, int handle)
>> +                                             int fd, int handle, u64 point)
>>  {
>>         struct dma_fence *fence = sync_file_get_fence(fd);
>>         struct drm_syncobj *syncobj;
>> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>>                 return -ENOENT;
>>         }
>>
>> -       drm_syncobj_replace_fence(syncobj, fence);
>> +       if (point) {
>> +               struct dma_fence_chain *chain = dma_fence_chain_alloc();
>> +
>> +               if (!chain)
>> +                       return -ENOMEM;
>> +
>> +               drm_syncobj_add_point(syncobj, chain, fence, point);
>> +       } else {
>> +               drm_syncobj_replace_fence(syncobj, fence);
>> +       }
>> +
>>         dma_fence_put(fence);
>>         drm_syncobj_put(syncobj);
>>         return 0;
>>  }
>>
>>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>> -                                       int handle, int *p_fd)
>> +                                       int handle, u64 point, int *p_fd)
>>  {
>>         int ret;
>>         struct dma_fence *fence;
>> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>         if (fd < 0)
>>                 return fd;
>>
>> -       ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
>> +       ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>>         if (ret)
>>                 goto err_put_fd;
>>
>> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>                                    struct drm_file *file_private)
>>  {
>>         struct drm_syncobj_handle *args = data;
>> +       unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
>> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
>> +       u64 point = 0;
>>
>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>>                 return -EOPNOTSUPP;
>> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>         if (args->pad)
>>                 return -EINVAL;
>>
>> -       if (args->flags != 0 &&
>> -           args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>> +       if (args->flags & ~valid_flags)
>>                 return -EINVAL;
>>
>> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
>> +               point = args->point;
>> +
>>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>>                 return drm_syncobj_export_sync_file(file_private, args->handle,
>> -                                                   &args->fd);
>> +                                                   point, &args->fd);
>> +
>> +       if (args->point)
>> +               return -EINVAL;
>>
>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>>                                         &args->fd);
>> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>                                    struct drm_file *file_private)
>>  {
>>         struct drm_syncobj_handle *args = data;
>> +       unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
>> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
>> +       u64 point = 0;
>>
>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>>                 return -EOPNOTSUPP;
> 
> oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
> send a v7 a bit later

Christian already applied to misc-test, please rebase and make it as a
new patch

-- 
Best regards,
Dmitry

