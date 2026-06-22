Return-Path: <linux-media+bounces-65371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDoCLho8OWoFpAcAu9opvQ
	(envelope-from <linux-media+bounces-65371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:43:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849B6AFF5A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:43:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iybQGBpg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5ywDEOoL;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S0+lk3e0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=95xpVfDw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65371-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65371-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA92302F250
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D6D3B3C17;
	Mon, 22 Jun 2026 13:39:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2880188596
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:39:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135581; cv=none; b=Fl0m//N+nMcGhJ0701FfLdVBUZlW0UIN2ibyRts2lpq3MTSv4z8t1QRwNgnVIepuOb38yb3vwzpZszG4uKNrSqPjG8CTf7EbHo48+0o0ivKNW0oRmJA60JR7tgOZfShVlxC3oaFevK8O27eDHchK0DBRrb7l1SYhmmbcqFCtTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135581; c=relaxed/simple;
	bh=J9uUP74UxARtxhx4ZsjLYz2gfndQaBxfO2OaKMJLc3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VF4z0gB+WjPnVRT5qX6BZ30T8WEziXqvrN2VPkwteVsi0KsIdRB19FDPfpVsNEtoDpGsfTT24nSW1/lmoh/pBkXxFWP5njnLLgUQslZsXnaGQLZ4tz7/h7FDbzLjrgLO0bRl8aKR0aaq9NZCrhRb4US/SuUUlzgXFEzrvpul31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iybQGBpg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ywDEOoL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S0+lk3e0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=95xpVfDw; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E42D1707F3;
	Mon, 22 Jun 2026 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782135578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dpJRlfBOR0XL6TN6Z95Arkt5VBwN3sve5QEYdNo1kg=;
	b=iybQGBpg6VGbDQ5JJwzwitsZp4BEGSidAB9nVaNKEfxxB/5Hc3o9T6jeXPDZuBLCvBImf4
	ckyep4c2ca7mSv4fRJo0U0M6JInTCEqAJNHVBie8uL5UhQ59JF/JaAvy3QaBBiKRR6yhhi
	pebgiOxox/+uUL0Hpm3C5J/F5fzRrfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782135578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dpJRlfBOR0XL6TN6Z95Arkt5VBwN3sve5QEYdNo1kg=;
	b=5ywDEOoLY1Y391N4FhWPvjwfV7Il+zw37rlFqQPyzFdGUw6fHLgi5WjBph9PGxYV1JSpnf
	RbnGaWZgt6Ol4tDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782135577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dpJRlfBOR0XL6TN6Z95Arkt5VBwN3sve5QEYdNo1kg=;
	b=S0+lk3e0rLSAlD+NE7b0w1TnBLtkfcIAC19CsB96qbWhkcdOc7F/TEXlSdXly3vYkXTjzO
	tawWrqXJYFv8ofE0xOmuBmb10El81Y3IvOyW3gslEdPnUcyMyvrncmRfEEVJUVuo/PzrgO
	9W5aRMzvVGrOZ0vZxpmRPYa6aTgeuz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782135577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dpJRlfBOR0XL6TN6Z95Arkt5VBwN3sve5QEYdNo1kg=;
	b=95xpVfDwtY3jGPRK7fpBLg8SC6TH4w97UT7tjG2dQtFWpNavdHqwt6/R6Fjdow00R2LpNC
	4N4STeYAPntw15DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95245779A8;
	Mon, 22 Jun 2026 13:39:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7TZLIhk7OWrvLwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 22 Jun 2026 13:39:37 +0000
Message-ID: <8b969c15-3044-4531-b518-d3efc280432d@suse.de>
Date: Mon, 22 Jun 2026 15:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
To: Biren Pandya <birenpandya@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260616181956.61476-2-birenpandya@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260616181956.61476-2-birenpandya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65371-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid,suse.de:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2849B6AFF5A

Hi

Am 16.06.26 um 20:19 schrieb Biren Pandya:
> Several GEM core functions manually managed mutex_lock() and
> mutex_unlock() over single scopes or error paths. This adds boilerplate
> and carries the risk of lock leaks if error paths are refactored.
>
> Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> macro. This ensures that the locks are reliably dropped when the block
> exits, cleanly removing goto out_unlock paths and tightening the
> lifecycle.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
>
> Compiled locally, but requires IGT validation by the DRM CI.
> ---
>   drivers/gpu/drm/drm_gem.c | 66 ++++++++++++++++++---------------------
>   1 file changed, 30 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 891c3bff5ae0..d3a061d42ba7 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -346,13 +346,13 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>   	 * we checked for a name.
>   	 */
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
>   	}
> -	mutex_unlock(&dev->object_name_lock);
>   
>   	if (final)
>   		drm_gem_object_put(obj);
> @@ -374,11 +374,8 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>   	if (obj->funcs->close)
>   		obj->funcs->close(obj, file_priv);
>   
> -	mutex_lock(&file_priv->prime.lock);
> -
> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> -
> -	mutex_unlock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock)
> +		drm_prime_remove_buf_handle(&file_priv->prime, id);
>   
>   	drm_vma_node_revoke(&obj->vma_node, file_priv);
>   
> @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,

There have been a number of revisions to this function recently and you 
want to make sure that you have the latest.  At least the code in v7.1 
looks different from yours.

>   		goto out;
>   	}
>   
> -	mutex_lock(&file_priv->prime.lock);
> +	scoped_guard(mutex, &file_priv->prime.lock) {
> +		spin_lock(&file_priv->table_lock);

Could this spin lock also use a guard?

Best regards
Thomas

> +		ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> +				GFP_NOWAIT);
> +		spin_unlock(&file_priv->table_lock);
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
>   		}
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
>   out:
>   	drm_gem_object_put(obj);
>   
>
> base-commit: 72c25183cac9bc584c9de21797a5883af44bcc7a

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



