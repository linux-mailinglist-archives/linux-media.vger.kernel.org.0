Return-Path: <linux-media+bounces-30269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5AEA8A23E
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 17:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FBC63BEF9F
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF1929A3F2;
	Tue, 15 Apr 2025 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uyop780x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rkfQoFmM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a+PgHyaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ZkGO1he"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3E2C2589
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728936; cv=none; b=CajcltAuqqWpllTu0rwU/4XX5mBurrVA8nPQy3mGIAFUxQNd3aW9htzbPHS7ksS9YE2sr1cP3QbpZAzH8OHezCG7aCJKLa+7pj98hLm6WTo0sZaEhJO70u0diOVbiJ/+/UFXh0NBQZZNC3M/5VXtcvG5RDxb04YI/7j50TkEQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728936; c=relaxed/simple;
	bh=6L80MR4QKXs8WV42QEcBi2GgpcpGNspCqDED1fEPFGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoH9fSGDerRPaT01ywlrbPKET7sAr5fTLZIEBCTBffqUzb2HxyMuNrOrRSSAgIoeWWim8Kp68XCCxy+4P5Y547wCIkGtAyDEMQRxKD230qvlYjpwGvBQbYKGMS6h3GfHXWYyh20qD8+Ud+nJ3xI2BHsnVRHExU7VAgvaKF9Byb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uyop780x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rkfQoFmM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a+PgHyaC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ZkGO1he; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33EAE1F747;
	Tue, 15 Apr 2025 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744728932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cczx83oilq/PTHd3XSgxeMT61flxkAXX2ABOaB7TGqE=;
	b=uyop780xNavaucuk5uScW9eDhCcMCllF2q1Hd+YdrTM76KCczEzmka+R0BEBIyMLZt8g5n
	pCjNIRLbRdHQSoD5goSL4mVHZZ3sTcUZm6UnQqOlNj24hXkM4nkT36LzHpJUYtJSB+jQvt
	S6p5GL2W947qqBc32fUbckRb6bHXlmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744728932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cczx83oilq/PTHd3XSgxeMT61flxkAXX2ABOaB7TGqE=;
	b=rkfQoFmMFho6yY1KEJJoImoToUXF0yNoXsE44QuJdrYKg1CH7z2Qq+hZ2v4WWEyxdZ2qkP
	+PBTnS95SpYiQJBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744728931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cczx83oilq/PTHd3XSgxeMT61flxkAXX2ABOaB7TGqE=;
	b=a+PgHyaCeoPaxtHrEKfX3iH0HwVy0Kjb4LTGEVD/s0yQUluVSAah4Rx9VSiM+FWlISx57R
	KI9P0pnBg+jw0PCsPyjX6scUior6FhFspgMP97/nxHosPNl/QT6cjm5WRo0/CFjIaOrWu+
	+O8Huk/TqQ53mqvf8a0y9/VRt1VmU3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744728931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cczx83oilq/PTHd3XSgxeMT61flxkAXX2ABOaB7TGqE=;
	b=2ZkGO1heylEfLJtaKbOnoxyiYUmKceXnVBlFzBUcYcNzgryQtKpQNUhXa+Pi5DKVy+JcIA
	ZUr7aWUllfNdBjAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D81E2137A5;
	Tue, 15 Apr 2025 14:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RFFnM2Jz/meAQwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 14:55:30 +0000
Message-ID: <28f735b7-2ecd-4f64-a71f-1364ed9d5cdf@suse.de>
Date: Tue, 15 Apr 2025 16:55:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gem: Internally test import_attach for imported
 objects
To: Boris Brezillon <boris.brezillon@collabora.com>,
 maarten.lankhorst@linux.intel.com
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415140256.299550-1-tzimmermann@suse.de>
 <20250415161943.7c51c388@collabora.com>
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
In-Reply-To: <20250415161943.7c51c388@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,amd.com,kernel.org,lists.freedesktop.org,linaro.org,vger.kernel.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,intel.com:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

Hi

Am 15.04.25 um 16:19 schrieb Boris Brezillon:
> On Tue, 15 Apr 2025 16:02:20 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Test struct drm_gem_object.import_attach.dmabuf to detect imported
>> objects. Warn if the stored state is inconsistent.
>>
>> During object clenaup, the dma_buf field might be NULL. Testing it in
>> an object's free callback then incorrectly does a cleanup as for native
>> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
>> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>
>> v2:
>> - use import_attach.dmabuf instead of dma_buf (Christian)
>>
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
>>   include/drm/drm_gem.h | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 9b71f7a9f3f8..464b9c7feec0 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -579,6 +579,21 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>   	return (obj->handle_count > 1) || obj->dma_buf;
>>   }
>>   
>> +/**
>> + * drm_gem_owns_dma_buf() - Tests if GEM object backs a DMA-buffer object
>> + * @obj: the GEM object
>> + * @obj: the DMA buffer
>> + *
>> + * Returns:
>> + * True if the DMA buffer refers to the GEM object's buffer.
>> + */
>> +static inline bool drm_gem_owns_dma_buf(const struct drm_gem_object *obj,
>> +					const struct dma_buf *dma_buf)
>> +{
>> +	/* The dma-buf's priv field points to the original GEM object. */
>> +	return dma_buf->priv == obj;
>> +}
>> +
>>   /**
>>    * drm_gem_is_imported() - Tests if GEM object's buffer has been imported
>>    * @obj: the GEM object
>> @@ -588,8 +603,15 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>    */
>>   static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>   {
>> -	/* The dma-buf's priv field points to the original GEM object. */
>> -	return obj->dma_buf && (obj->dma_buf->priv != obj);
>> +	const struct dma_buf *dma_buf = NULL;
>> +
>> +	if (!obj->import_attach)
>> +		return false;
>> +
>> +	dma_buf = obj->import_attach->dmabuf;
>> +
>> +	/* Warn if we somehow reimported our own buffer. */
>> +	return !drm_WARN_ON_ONCE(obj->dev, !dma_buf || drm_gem_owns_dma_buf(obj, dma_buf));
> I'm honestly not sure I see the point of checking
> obj->import_attach->dmabuf. If obj->import_attach != NULL, we're sure
> it's a foreign buffer already, otherwise we would get the original GEM
> object which has ->import_attach=NULL. So why not go for a simple
>
> 	return obj->import_attach != NULL;
>
> check, and extend the check when you get to implement imports without
> import attachments (not sure what those would look like BTW).

I have no strong opinion. I just found it confusing to rely on 
import_attach when the dma_buf is what we originally imported.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


