Return-Path: <linux-media+bounces-37002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABCAFB4AF
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F9A4A4EB4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC38B29CB3E;
	Mon,  7 Jul 2025 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2HRdFvtm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9UZxAhEp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2HRdFvtm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9UZxAhEp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660C29B8C7
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895219; cv=none; b=I+jVAp0+Q23Am1y3f+9MsUzqX0HuE+b/8kEhoLndPIOGh8+3OIAfeKu6RNJEWPaplbrZSutTdn/2iIBsQB/+pZnf8shB7Ucmygw4cXYIOfAkYDFOT7gRRfZG4TvkMcUZeDzLp9UDkQ83SMP1kCSeqv2W2J51JtDLikWnJCLiA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895219; c=relaxed/simple;
	bh=ef2P+c2p9MB2G6rkZzfHJnAfCTKbynW6yIMx0Gbfh1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBwPE9fDYz0zl5/M5awdOuPnsZC4DuwWPYQbod3NwE1DvUR4CJVri8w7at1CyVtvT2uRtZOAtdH32fNTBudoDh0Up5a/JvUElQ9uxnyTyc61Fha9tdxfmB5lc9fShHuXuUVLP3/VV0FGYJbkuz8XFONFZTYVPeUx/aoRyhD/6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2HRdFvtm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9UZxAhEp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2HRdFvtm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9UZxAhEp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99B3D210F9;
	Mon,  7 Jul 2025 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751895213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=chuu5gdJhTry/FYbKteVhpzSetLsEYOLr6nzGLwfKmU=;
	b=2HRdFvtmnWk/4qlRqjQacbX0wOVfu0ClTAIZu3icmvJFVHemHKwA55HMGL7lrBFGJ0S11W
	fliw5G0VohOSxJ5OhzieLCfzif2p286trQGX44ypsilNKwIcPxBD5AcraUgUfH1Cjb/K5A
	z/LtQFFfZ+AzOW7GGufLgyoWoJewquQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751895213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=chuu5gdJhTry/FYbKteVhpzSetLsEYOLr6nzGLwfKmU=;
	b=9UZxAhEpF7iHtiaLfd499fX6ox7Vt+Qb6Rzbl14HCglQJtWUW/GfSSa/oy8zLvi+v4BYUM
	EyO/7F8aPzTC6VDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2HRdFvtm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9UZxAhEp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751895213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=chuu5gdJhTry/FYbKteVhpzSetLsEYOLr6nzGLwfKmU=;
	b=2HRdFvtmnWk/4qlRqjQacbX0wOVfu0ClTAIZu3icmvJFVHemHKwA55HMGL7lrBFGJ0S11W
	fliw5G0VohOSxJ5OhzieLCfzif2p286trQGX44ypsilNKwIcPxBD5AcraUgUfH1Cjb/K5A
	z/LtQFFfZ+AzOW7GGufLgyoWoJewquQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751895213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=chuu5gdJhTry/FYbKteVhpzSetLsEYOLr6nzGLwfKmU=;
	b=9UZxAhEpF7iHtiaLfd499fX6ox7Vt+Qb6Rzbl14HCglQJtWUW/GfSSa/oy8zLvi+v4BYUM
	EyO/7F8aPzTC6VDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15A1F13757;
	Mon,  7 Jul 2025 13:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ozdEA63Ma2grHAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 07 Jul 2025 13:33:33 +0000
Message-ID: <4c1bc40d-6bd4-4102-b12f-fda320216e1d@suse.de>
Date: Mon, 7 Jul 2025 15:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 asrivats@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, jean-christophe@guillain.net,
 superm1@kernel.org, satadru@gmail.com, bp@alien8.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250707131224.249496-1-tzimmermann@suse.de>
 <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
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
In-Reply-To: <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,guillain.net,alien8.de];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,web.de,linaro.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 99B3D210F9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51

Hi

Am 07.07.25 um 15:21 schrieb Christian König:

>>   
>> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)	BIT(0u + (_i))
> Why the "0u + (_i)" here? An macro trick?

You mean why not just BIT(_i)? internal_flags could possibly contain 
additional flags. Just using BIT(_i) would make it look as if it's only 
for those handle refs.

Best regards
Thomas

>
> Regards,
> Christian.
>
>> +
>>   /**
>>    * struct drm_framebuffer - frame buffer object
>>    *
>> @@ -188,6 +191,10 @@ struct drm_framebuffer {
>>   	 * DRM_MODE_FB_MODIFIERS.
>>   	 */
>>   	int flags;
>> +	/**
>> +	 * @internal_flags: Framebuffer flags like DRM_FRAMEBUFFER_HAS_HANDLE_REF.
>> +	 */
>> +	unsigned int internal_flags;
>>   	/**
>>   	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
>>   	 */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


