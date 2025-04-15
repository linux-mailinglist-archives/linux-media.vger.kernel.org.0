Return-Path: <linux-media+bounces-30228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A66A89AF1
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AAA13BB266
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0B928BAAF;
	Tue, 15 Apr 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cZAnh3Gf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mWnBbZ0v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cZAnh3Gf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mWnBbZ0v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA829B76A
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713909; cv=none; b=ARfgvCvoOr+fxMaOoGnrUCOuuZhhlWrMMhj6w2HGdmFuZ4aeMunOPOH0/xf82sbDDy0t5NmXTYgHac8CexLqune9Mun7Uer3EDR1tsIfRACq6M5r7ELBEzxnwviKhpg+ReJL9eEEIrZTw5BeuLQn+sz+FmRL+FqkoJvD2hr1bQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713909; c=relaxed/simple;
	bh=PctF8hj9ubjyYvdP8UIAC8s3SY43r9/lVeJ7RwSwKdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5dO/Hy9Oq9S+tUovZhbH1JpviL+PBXTGBpUIjupdQBdyYv6B8Ui5CpP/SwAmW0lsHbcY2d4UqhwW0GlIesEaPH5r9/h/DLRsUUikjNIh92M8APcM1EX1qyOkPVqFlbTldIIkA79SqgmlhCCsxMnnJQ0Drvh58HfHvg47JuZC3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cZAnh3Gf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mWnBbZ0v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cZAnh3Gf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mWnBbZ0v; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27A201F38D;
	Tue, 15 Apr 2025 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744713905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlMI7c7nbRs2faWdLeH0LEv4pweuvkoAbWOgYD9dM9k=;
	b=cZAnh3Gfws0Wb0vy/AHolcFf9wJsE25+vpB9wtDzdF8k/M6WKfKgUicH+gRRpPxjsnjy+U
	VbqRTxR3hoO4FJ1OOKQYh0EI0UqK4QIzDRbTvAyOO6DvqbCJU1eBRyKlSKXTsjA3SM25hG
	wb14jIihkzms3C2/XWvmE3iO6vFJwmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744713905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlMI7c7nbRs2faWdLeH0LEv4pweuvkoAbWOgYD9dM9k=;
	b=mWnBbZ0v7Y62EAxkawHQoIEYZEk7J6/BEiNqRl9OECxbnBckdooM2YuDG31eHlxi7BEUK/
	4tiTLYA5NUvjDyCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744713905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlMI7c7nbRs2faWdLeH0LEv4pweuvkoAbWOgYD9dM9k=;
	b=cZAnh3Gfws0Wb0vy/AHolcFf9wJsE25+vpB9wtDzdF8k/M6WKfKgUicH+gRRpPxjsnjy+U
	VbqRTxR3hoO4FJ1OOKQYh0EI0UqK4QIzDRbTvAyOO6DvqbCJU1eBRyKlSKXTsjA3SM25hG
	wb14jIihkzms3C2/XWvmE3iO6vFJwmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744713905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GlMI7c7nbRs2faWdLeH0LEv4pweuvkoAbWOgYD9dM9k=;
	b=mWnBbZ0v7Y62EAxkawHQoIEYZEk7J6/BEiNqRl9OECxbnBckdooM2YuDG31eHlxi7BEUK/
	4tiTLYA5NUvjDyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB46C137A5;
	Tue, 15 Apr 2025 10:45:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0ALDL7A4/meebwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 10:45:04 +0000
Message-ID: <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
Date: Tue, 15 Apr 2025 12:45:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
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
In-Reply-To: <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[amd.com,ffwll.ch,gmail.com,redhat.com,163.com,kernel.org,linux.intel.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,lists.freedesktop.org:email]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 15.04.25 um 11:39 schrieb Christian König:
> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
>> Test struct drm_gem_object.import_attach to detect imported objects
>> during cleanup. At that point, the imported DMA buffer might have
>> already been released and the dma_buf field is NULL. The object's
>> free callback then does a cleanup as for native objects.
> I don't think that this is a good idea.
>
> The DMA-buf is separately reference counted through the import attachment.

I understand that it's not ideal, but testing for import_attach to be 
set is what we currently do throughout drivers. Putting this behind an 
interface is already a step forward.

>
>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
> That is for exported DMA-buf and should *NEVER* be used for imported ones.

Did you look at the discussion at the Closes tag? Where else could 
dma-buf be cleared?

Best regards
Thomas

>
> Regards,
> Christian.
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>> Reported-by: Andy Yan <andyshrk@163.com>
>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>> Tested-by: Andy Yan <andyshrk@163.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> ---
>>   include/drm/drm_gem.h | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>   static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>   {
>>   	/* The dma-buf's priv field points to the original GEM object. */
>> -	return obj->dma_buf && (obj->dma_buf->priv != obj);
>> +	return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>> +	       /*
>> +		* TODO: During object release, the dma-buf might already
>> +		*       be gone. For now keep testing import_attach, but
>> +		*       this should be removed at some point.
>> +		*/
>> +	       obj->import_attach;
>>   }
>>   
>>   #ifdef CONFIG_LOCKDEP

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


