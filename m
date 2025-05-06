Return-Path: <linux-media+bounces-31816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C7AABC7E
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221983A2B00
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EC4220F36;
	Tue,  6 May 2025 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkMO06yo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J6odBsss";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkMO06yo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J6odBsss"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591B72612
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517181; cv=none; b=f4UkZqnf3drKdqPf0KTzkZKi7E+0HK4DXM0wBrEV6m6pPd2P/LTh5nFnP3FxTax3lpku1ETucurOkmvQ7mrQCd7MwhkkB4QkXIQ4jkGeM5fRYcVV/xNCBVY1+Qx4Bp+4xQDjgJ8QR68lDUW9ijBfHPemfkxFqpek3E7M5qh507Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517181; c=relaxed/simple;
	bh=SFSf6Nko0h/rR9soZt7QRFYTj5qWeqYNHqLZtxSfhAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9MxQPLlqhsh3rkMP1jjx1e7qgdx5+f+EQZOE2w3MjlfVpeCZ+vC4SRKLJAs+tMX7aBUfHKw/97EtDC33Z6hbFG9Ek1XZozSamK6PTEIk/yW1Goo+G1DzcU0XmGf732J5wWNVvy/1+/IFEvgxirNlE73Ylt78rMdpc+zLw2DbA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SkMO06yo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J6odBsss; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SkMO06yo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J6odBsss; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 929981F394;
	Tue,  6 May 2025 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746517177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
	b=SkMO06yoach6wLGwv+m29h4epdrHbnuEUjxt3MMGeBwNjEQMefXO2wrKWt9IKp0cbJ3kEJ
	NGwOrUSFhnAQYKYEkpSWxNsa4a6TZRnwxhr2q8CWy6dSlcuLnhQhV9858ZW+lRT6lCjSGz
	T3F3COVb2vtENSdJFE1pBrkNRipBdR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746517177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
	b=J6odBsssK3RtaI9VQnBx2yRbe5nOASXuMAzGT0Cz8GUoSCZTRBI4t+XlkdmaU/EDHsEfW+
	TaQGX4fKK6a7hfDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746517177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
	b=SkMO06yoach6wLGwv+m29h4epdrHbnuEUjxt3MMGeBwNjEQMefXO2wrKWt9IKp0cbJ3kEJ
	NGwOrUSFhnAQYKYEkpSWxNsa4a6TZRnwxhr2q8CWy6dSlcuLnhQhV9858ZW+lRT6lCjSGz
	T3F3COVb2vtENSdJFE1pBrkNRipBdR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746517177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
	b=J6odBsssK3RtaI9VQnBx2yRbe5nOASXuMAzGT0Cz8GUoSCZTRBI4t+XlkdmaU/EDHsEfW+
	TaQGX4fKK6a7hfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DE3D137CF;
	Tue,  6 May 2025 07:39:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YdmYDbm8GWgATAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 06 May 2025 07:39:37 +0000
Message-ID: <e8b91c26-77e4-41a6-ab32-b0ef1bb7962c@suse.de>
Date: Tue, 6 May 2025 09:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250416065820.26076-1-tzimmermann@suse.de>
 <Z_96e7Lv-sEDUS6U@phenom.ffwll.local> <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
 <20250505092949.1124657d@collabora.com>
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
In-Reply-To: <20250505092949.1124657d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,amd.com,kernel.org,linux.intel.com,lists.freedesktop.org,linaro.org,vger.kernel.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.de:mid,suse.de:email,linaro.org:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 05.05.25 um 09:29 schrieb Boris Brezillon:
> On Wed, 30 Apr 2025 11:07:17 +0200
> Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
>> On Wed, Apr 16, 2025 at 11:38:03AM +0200, Simona Vetter wrote:
>>> On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
>>>> Test struct drm_gem_object.import_attach to detect imported objects.
>>>>
>>>> During object clenanup, the dma_buf field might be NULL. Testing it in
>>>> an object's free callback then incorrectly does a cleanup as for native
>>>> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
>>>> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>>>
>>>> v3:
>>>> - only test for import_attach (Boris)
>>>> v2:
>>>> - use import_attach.dmabuf instead of dma_buf (Christian)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Also quick doc request: We do have a bit of overview documentation for
>> prime here about specifically this lifetime fun, and why there's a chain
>> of references and hence a distinction between imported foreign dma-buf and
>> re-imported native dma-buf:
>>
>> https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#reference-counting-for-gem-drivers
>>
>> I think it would be good to augment this with more links to functions
>> (like this one recently added and fixed in this patch here) and struct
>> members to that overview. And maybe also link from key function and struct
>> functions back to that overview doc. Otherwise I think the next person
>> will get confused by this rather tricky code again and break a corner
>> cases.
> BTW, could we also backmerge 6.15-rc5 into drm-misc-next so the fix is
> also present in drm-misc-next?

drm-misc-next is now at -rc5

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


