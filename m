Return-Path: <linux-media+bounces-61034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJVtNI70AGqKOwEAu9opvQ
	(envelope-from <linux-media+bounces-61034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 23:11:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0015066AA
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 23:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 021E43002512
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 21:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD54433D6ED;
	Sun, 10 May 2026 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="YCSMJhEt"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1443254B3;
	Sun, 10 May 2026 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778447496; cv=pass; b=R8z5Duy3JguO58qJy35YW1NPp1xsc2X2N4I24DXGo7wHvL506OJt8dOrDO1C6TVy62KDAKxLaAeEzqZFBdu+wHDOIXEfL3qTRZTLo1np1KlS7n22l4UiV4WXQJ7lb9BuP3RFK5Xtt5OJuohOz7DBXI45E+RO1RLLPumbz0M2Mv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778447496; c=relaxed/simple;
	bh=YykXtioms2na/6ou6mHxW3mlKFXNYklrDeZ6wHNJgJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5nR4VWMAhB95kgosK3W3phm5VDJ3pK4F3YZmhcmu53fIhn+ZSSuBlkXfLugCJLyYbapYfoZmyyJPORKhSkbb3a0Z3xqHzSAHsJLWu62/kvRZu5ch0XPn6Q3olN+rbNo/GgozWguzTNl0r2CGZDWj9CWmOmptWvmJDaXoPno+SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=YCSMJhEt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778447473; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m3hSG6VFA+VMKYC8uPHLLw+wZYxxe9fYN8ypjfVbDkigy4DKmO12uvbuxZ3FA8D9y/0lm5vQ5OwZGGw1ObfkaViBdz4nbuhTQz1UErSc1BYMDopo+8iqO1y/SUo8M0FGHNvX8HsXT+WCTOpcqw8B6Tdofyd0OQF2VKyfjR2A0uQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778447473; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dC+SQBvHA00jKA55ndpglBB83kxP2d4e2FYSPidsICs=; 
	b=kkSx1L5UJJ8bV7RIPevje+2oDORYVMfNuawEG5Afp4WyPIIOSuyYG3WIqfa+KTecYPxOpSgT+8wsL5YPULdy7JMqCtvnH5M3AykccFeLitMf7V+SmxgF8eqlEp9S3B2vGBWgh5MeJfNzvTAl4XBe3FZu47FgNLWmp1ScgpsyOiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778447473;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dC+SQBvHA00jKA55ndpglBB83kxP2d4e2FYSPidsICs=;
	b=YCSMJhEtdE86ILIB75QrvWALkfFwT7oSr+tZzZkTC8HGMiTMuOoDVMOfWxkzDc+l
	nrxJLX92/a4dI86I+cXxe1KfyKnDXJfBep7BXqWhPA/rHIU2kUe6aTdHE4GlDhrYauL
	YhQVdOa4/Wpwx1RYBH8K31mtabAXxEntI2AY4jaE=
Received: by mx.zohomail.com with SMTPS id 1778447470381353.01025610308295;
	Sun, 10 May 2026 14:11:10 -0700 (PDT)
Message-ID: <e1741cf2-3416-4464-bcae-741f0c87448b@collabora.com>
Date: Mon, 11 May 2026 00:11:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: check virtio_gpu_array_lock_resv() return in
 cursor update
To: Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260510053025.100224-1-kartikey406@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260510053025.100224-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Queue-Id: DE0015066AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61034-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

Hello,

On 5/10/26 08:30, Deepanshu Kartikey wrote:
> virtio_gpu_cursor_plane_update() calls virtio_gpu_array_lock_resv()
> but ignores its return value. The function can fail in two ways:
> 
>   - dma_resv_lock_interruptible() returns -ERESTARTSYS when a signal
>     is delivered while waiting for the reservation lock.
>   - dma_resv_reserve_fences() returns -ENOMEM if it fails to allocate
>     a fence slot; in this case lock_resv unlocks before returning.
> 
> In both cases the resv lock is not held on return. The cursor path
> proceeds to queue a fenced transfer command. The queue path then
> walks the object array and calls dma_resv_add_fence() on the cursor
> BO's reservation. dma_resv_add_fence() requires the resv lock to be
> held; with lockdep enabled the missing lock trips
> dma_resv_assert_held():
> 
>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>   Call Trace:
>    virtio_gpu_array_add_fence+0xcd/0x140
>    virtio_gpu_queue_ctrl_sgs
>    virtio_gpu_queue_fenced_ctrl_buffer+0x578/0xfb0
>    virtio_gpu_cursor_plane_update+0x411/0xbc0
>    drm_atomic_helper_commit_planes+0x497/0xf10
>    ...
>    drm_mode_cursor_ioctl+0xd4/0x110
>    drm_ioctl+0x5e6/0xc60
>    __x64_sys_ioctl+0x18e/0x210
> 
> Beyond the WARN, mutating the dma_resv fence list without the lock
> races with concurrent readers/writers and can corrupt the list.
> 
> Check the return value of virtio_gpu_array_lock_resv(). On failure,
> drop the references taken by virtio_gpu_array_add_obj() with
> virtio_gpu_array_put_free() (which does not unlock, matching the
> not-locked state) and return without queueing the command. A
> skipped cursor frame is harmless; the WARN and the underlying race
> are not.
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
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a126d1b25f46..ca379b08b9ec 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -459,7 +459,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  		if (!objs)
>  			return;
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
> -		virtio_gpu_array_lock_resv(objs);
> +		if (virtio_gpu_array_lock_resv(objs)) {
> +			virtio_gpu_array_put_free(objs);
> +			return;
> +		}
>  		virtio_gpu_cmd_transfer_to_host_2d
>  			(vgdev, 0,
>  			 plane->state->crtc_w,

Thanks for the patch. Atomic update shouldn't fail due to non-critical
errors like on a signal interrupt. Could you please move this code that
may fail in update() to .prepare/cleanup_fb() callbacks?

-- 
Best regards,
Dmitry

