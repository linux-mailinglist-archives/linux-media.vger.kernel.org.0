Return-Path: <linux-media+bounces-62312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM3LOtbXDWp44AUAu9opvQ
	(envelope-from <linux-media+bounces-62312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:48:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750459131F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB15332D2774
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED8D3F54D3;
	Wed, 20 May 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="dFcv12YC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C23EF647;
	Wed, 20 May 2026 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289486; cv=pass; b=JRsizeU7YJw94HJt1TE9Rk69YVDHtUfdrHBeZNjoH1YNNFJZ7dLJ1VrehVJdqoqvCw37PitR+03hvilF18iI7dtyhEi6LH7n8sc/SyFdglY/bg4JJGejEopr4NwwIolmz3PBVl0rD5h0aF8JcTvAOhWuNcYkxz08CDpSQ6GakkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289486; c=relaxed/simple;
	bh=glHPaZzUi4OSH2qNpXzuKmnnplibFsR17/L3DDNefT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4TygFb6JbOCf2My2HKjgTQFvJ40fn+FovIjAePXR15N3ZvU6/2oh4o5mJKPHn9kB7gIoeYdv3EiJiY1UnEbFlgUjyzH8D8ks2+5sMQIMyoRYY+HbZfZnPqHi+z3ZdU6gFYgBOmGZXmrUhbaG+scuCXJZU4fI+funs9ARB1mN2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=dFcv12YC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779289462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H4H9wEPzL9F9DtuKYxJuHWRJCQZJ+AAQw8eTXUTgsdbgqWtPrLXuthO8YzeD7hBaiEIkya9PIMfxVfyKL4Wb03QL8904gzYW8epPtVniRJVqom0HlZ117Rmj+V7oOxuZc+FYgW5GzSJKQFfOXBLA1dktMobMc/9jIOUCO/7nSuU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779289462; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aAAzUd7Ncpn7EM5gP2WjySDMAYuUVcl4Vo7wSz2utqs=; 
	b=QNgx0gDg6ZY+o9niXoiW2GvJ7eGduzuJno2L/zBG95jaT8yIPmFS3Aj0cMu0y39yN9IgdGC+yLEgCmKrr+1ncQS58oFau0e6SxvOIMOO1IiSIvG3Ls4Z42sRcoXNC3q3eRrzWbjtLbhSEqS09p0hl4je0el9gC5P1AEixMT52Zg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779289462;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aAAzUd7Ncpn7EM5gP2WjySDMAYuUVcl4Vo7wSz2utqs=;
	b=dFcv12YC0WznA1JT+JNTOS5TAFX6vTuko9xjGSV+lXFs0GA2SxRRu7hj3KVE9qqj
	GuGFs78IcujNEp8CelYiL56dllabikrYRboVcEnFZ2WYppQlVWzO1NjQyrDDugJU2GG
	b+Dep1367e1TNtswNSddn/u0Fn08057sudkdzdTM=
Received: by mx.zohomail.com with SMTPS id 1779289460798445.48512037796513;
	Wed, 20 May 2026 08:04:20 -0700 (PDT)
Message-ID: <43ecdd2f-5faf-432a-a814-77190b3ef239@collabora.com>
Date: Wed, 20 May 2026 18:04:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: use uninterruptible resv lock for plane
 updates
To: Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260519082247.34470-1-kartikey406@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260519082247.34470-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62312-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:mid,collabora.com:dkim,appspotmail.com:email]
X-Rspamd-Queue-Id: 4750459131F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 11:22, Deepanshu Kartikey wrote:
> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
> ignore its return value. The function can fail with -EINTR from
> dma_resv_lock_interruptible() (signal during lock wait) or with
> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
> leaving the resv lock not held. The queue path then walks the object
> array and calls dma_resv_add_fence(), which requires the lock held;
> with lockdep enabled this trips dma_resv_assert_held():
> 
>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>   Call Trace:
>    virtio_gpu_array_add_fence
>    virtio_gpu_queue_ctrl_sgs
>    virtio_gpu_queue_fenced_ctrl_buffer
>    virtio_gpu_cursor_plane_update
>    drm_atomic_helper_commit_planes
>    drm_atomic_helper_commit_tail
>    commit_tail
>    drm_atomic_helper_commit
>    drm_atomic_commit
>    drm_atomic_helper_update_plane
>    __setplane_atomic
>    drm_mode_cursor_universal
>    drm_mode_cursor_common
>    drm_mode_cursor_ioctl
>    drm_ioctl
>    __x64_sys_ioctl
> 
> Beyond the WARN, mutating the dma_resv fence list without the lock
> races with concurrent readers/writers and can corrupt the list.
> 
> Both call sites run inside the .atomic_update plane callback, which
> DRM atomic helpers do not allow to fail (by the time it runs, the
> commit has been signed off to userspace and there is no clean
> rollback path). Moving the lock acquisition to .prepare_fb was
> rejected because the broader lock scope deadlocks against other BO
> locking paths in the same atomic commit.
> 
> Introduce virtio_gpu_lock_one_resv_uninterruptible() that uses
> dma_resv_lock() instead of dma_resv_lock_interruptible(). This
> eliminates the -EINTR failure mode -- the realistic syzbot trigger
> -- without extending the lock hold across the commit. The helper
> locks a single BO and rejects nents > 1 with -EINVAL; both fix
> sites lock exactly one BO.
> 
> Use it from virtio_gpu_cursor_plane_update() and
> virtio_gpu_resource_flush(); check the return value to handle the
> remaining -ENOMEM case from dma_resv_reserve_fences() by freeing
> the objs and skipping the plane update for that frame. The
> framebuffer BOs touched here are not shared with other contexts
> and lock contention is expected to be brief, so the loss of
> signal-interruptibility is acceptable.
> 
> Other callers of virtio_gpu_array_lock_resv() (the ioctl paths)
> continue to use the interruptible variant.
> 
> The bug was reported by syzbot, triggered via fault injection
> (fail_nth) on the DRM_IOCTL_MODE_CURSOR path, which forces the
> -ENOMEM branch in dma_resv_reserve_fences().
> 
> Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
> Fixes: 5cfd31c5b3a3 ("drm/virtio: fix virtio_gpu_cursor_plane_update().")
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v4: Rename the helper to virtio_gpu_lock_one_resv_uninterruptible()
>     and reject objs->nents > 1 with -EINVAL. The v3 helper's
>     multi-object branch used drm_gem_lock_reservations(), which is
>     interruptible, contradicting the "uninterruptible" name; both
>     fix sites lock a single BO so the multi-object path is dropped.
>     (Dmitry Osipenko)
> v3: Drop the prepare_fb/cleanup_fb approach from v2 (it deadlocked
>     against virtio_gpu_resource_flush(), which also locks the BO in
>     the same atomic commit). Instead add an uninterruptible variant
>     of the resv lock helper and use it in both
>     virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush().
>     (Dmitry Osipenko)
> v2: Move resv lock acquisition from .atomic_update (which must not
>     fail) to .prepare_fb (which may), per maintainer review of v1.
>     The v1 approach of silently skipping the cursor update on lock
>     failure violated the atomic-commit contract with userspace.
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_gem.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++--
>  3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..2f3531950aa4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -317,6 +317,7 @@ virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents
>  void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
>  			      struct drm_gem_object *obj);
>  int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
> +int virtio_gpu_lock_one_resv_uninterruptible(struct virtio_gpu_object_array *objs);
>  void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
>  void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
>  				struct dma_fence *fence);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index f22dc5c21cd4..435d37d36034 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -238,6 +238,23 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
>  	return ret;
>  }
>  
> +int virtio_gpu_lock_one_resv_uninterruptible(struct virtio_gpu_object_array *objs)
> +{
> +	int ret;
> +
> +	if (objs->nents != 1)
> +		return -EINVAL;
> +
> +	dma_resv_lock(objs->objs[0]->resv, NULL);
> +
> +	ret = dma_resv_reserve_fences(objs->objs[0]->resv, 1);
> +	if (ret) {
> +		virtio_gpu_array_unlock_resv(objs);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>  void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
>  {
>  	if (objs->nents == 1) {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a126d1b25f46..652352424744 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -215,7 +215,10 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
>  		if (!objs)
>  			return;
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
> -		virtio_gpu_array_lock_resv(objs);
> +		if (virtio_gpu_lock_one_resv_uninterruptible(objs)) {
> +			virtio_gpu_array_put_free(objs);
> +			return;
> +		}
>  		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
>  					      width, height, objs,
>  					      vgplane_st->fence);
> @@ -459,7 +462,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  		if (!objs)
>  			return;
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
> -		virtio_gpu_array_lock_resv(objs);
> +		if (virtio_gpu_lock_one_resv_uninterruptible(objs)) {
> +			virtio_gpu_array_put_free(objs);
> +			return;
> +		}
>  		virtio_gpu_cmd_transfer_to_host_2d
>  			(vgdev, 0,
>  			 plane->state->crtc_w,

Applied to misc-next, thanks

-- 
Best regards,
Dmitry

