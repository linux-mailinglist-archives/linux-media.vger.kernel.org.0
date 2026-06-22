Return-Path: <linux-media+bounces-65363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rKg9Od0iOWppnQcAu9opvQ
	(envelope-from <linux-media+bounces-65363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:56:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9436AF3EF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=gXqVCwUZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65363-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65363-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B7B303A533
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8D2E0413;
	Mon, 22 Jun 2026 11:55:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78124886A;
	Mon, 22 Jun 2026 11:55:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129350; cv=none; b=ScPE40RWX65jl3lMwdjW3tVIIq08mSlwGULUFKsYfH/6hNoZXnFO/bEXbvC4w/2Q7ipdMHXJyZWw7Ioft494MwBN/nDDwsqKpybBWLgytjypavXaYeEkq6SBtzfT/rIXWGqDLk3c9QXiMBpKGji48SfFT3VC3WHFnASjBluurvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129350; c=relaxed/simple;
	bh=TDWFD3aVcqsYOWPdtLK1KFJLiTGZTVKDYeLf7bJYrTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE3bMDLInphmx8ZOGARJlcTjzchFZjMLKgwHmRvCXZ589yREMVTJXt3i4PJuW6E2MTJV5UbTseyXFeMy/Z9ciM+WDCOgxLX7HjP1roQgWocHi/4alVo5tji/MCeGAUQs5DC4xV4MKcezODR7DtH9NIa6gyB9LaEJAthxQSABITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gXqVCwUZ; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A7F29CE;
	Mon, 22 Jun 2026 13:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782129308;
	bh=TDWFD3aVcqsYOWPdtLK1KFJLiTGZTVKDYeLf7bJYrTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXqVCwUZLPEnE7+3WkZgPXN8wj92R1iMQN4M2WulFhoKn0NvAfnk3KZEWuZgsup5D
	 8RoaWA0hX6YTShku4A/WXvC7oWXoVYz8aYCGcrzpDgRyQdiF9DSQq8L4frK/138L3R
	 7KtnEvqzi26otYw6b7lxtx7g1yobSEfXkbX8oo5A=
Date: Mon, 22 Jun 2026 14:55:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
Message-ID: <20260622115544.GA3899302@killaraus.ideasonboard.com>
References: <20260616181956.61476-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616181956.61476-2-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65363-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E9436AF3EF

On Tue, Jun 16, 2026 at 11:49:57PM +0530, Biren Pandya wrote:
> Several GEM core functions manually managed mutex_lock() and
> mutex_unlock() over single scopes or error paths. This adds boilerplate
> and carries the risk of lock leaks if error paths are refactored.
> 
> Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> macro. This ensures that the locks are reliably dropped when the block
> exits, cleanly removing goto out_unlock paths and tightening the
> lifecycle.

What's the reason for doing so in in drm_gem and not other areas in DRM
?

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> 
> Compiled locally, but requires IGT validation by the DRM CI.
> ---
>  drivers/gpu/drm/drm_gem.c | 66 ++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 891c3bff5ae0..d3a061d42ba7 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -346,13 +346,13 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	 * we checked for a name.
>  	 */
>  
> -	mutex_lock(&dev->object_name_lock);
> -	if (--obj->handle_count == 0) {
> -		drm_gem_object_handle_free(obj);
> -		drm_gem_object_exported_dma_buf_free(obj);
> -		final = true;
> +	scoped_guard(mutex, &dev->object_name_lock) {
> +		if (--obj->handle_count == 0) {
> +			drm_gem_object_handle_free(obj);
> +			drm_gem_object_exported_dma_buf_free(obj);
> +			final = true;
> +		}
>  	}
> -	mutex_unlock(&dev->object_name_lock);
>  
>  	if (final)
>  		drm_gem_object_put(obj);
> @@ -374,11 +374,8 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> -	mutex_lock(&file_priv->prime.lock);
> -
> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> -
> -	mutex_unlock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock)
> +		drm_prime_remove_buf_handle(&file_priv->prime, id);
>  
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
> @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  		goto out;
>  	}
>  
> -	mutex_lock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock) {
> +		spin_lock(&file_priv->table_lock);
> +		ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> +				GFP_NOWAIT);
> +		spin_unlock(&file_priv->table_lock);

And why don't you use guards for the spinlock as well ?

>  
> -	spin_lock(&file_priv->table_lock);
> -	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> -			GFP_NOWAIT);
> -	spin_unlock(&file_priv->table_lock);
> +		if (ret < 0)
> +			break;
>  
> -	if (ret < 0)
> -		goto out_unlock;
> +		if (obj->dma_buf) {
> +			ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
> +						       handle);
> +			if (ret < 0) {
> +				spin_lock(&file_priv->table_lock);
> +				idr_remove(&file_priv->object_idr, handle);
> +				spin_unlock(&file_priv->table_lock);
> +				break;
> +			}
>  
> -	if (obj->dma_buf) {
> -		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
> -					       handle);
> -		if (ret < 0) {
> -			spin_lock(&file_priv->table_lock);
> -			idr_remove(&file_priv->object_idr, handle);
> -			spin_unlock(&file_priv->table_lock);
> -			goto out_unlock;
> +			drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
>  		}
>  
> -		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> -	}
> -
> -	ret = 0;
> -
> -	spin_lock(&file_priv->table_lock);
> -	idr_remove(&file_priv->object_idr, args->handle);
> -	spin_unlock(&file_priv->table_lock);
> +		ret = 0;
>  
> -out_unlock:
> -	mutex_unlock(&file_priv->prime.lock);
> +		spin_lock(&file_priv->table_lock);
> +		idr_remove(&file_priv->object_idr, args->handle);
> +		spin_unlock(&file_priv->table_lock);
> +	}
>  out:
>  	drm_gem_object_put(obj);
>  
> 
> base-commit: 72c25183cac9bc584c9de21797a5883af44bcc7a

-- 
Regards,

Laurent Pinchart

