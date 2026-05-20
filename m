Return-Path: <linux-media+bounces-62222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK8uMKltDWrgxAUAu9opvQ
	(envelope-from <linux-media+bounces-62222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:15:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EDE589852
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99C9C3045981
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F73137D10F;
	Wed, 20 May 2026 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="clv5UKGK"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE443ACF01;
	Wed, 20 May 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264840; cv=none; b=jIDoXToTbpnxoCISrjcMXsDjGJMWNWDLjJ4Cwrxvsqar8dEMX6vHp5Ch3vrI5hWq7mVybjg6E/vd9d0yEsEC82xgPka6riJNPlPtF+ghRZdG3m7QaWuYJwKmJw6RH65yRPjz4IkXK3xjARgH1I8Tud2mbVmxP8BUxiWKwpyzDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264840; c=relaxed/simple;
	bh=FZTrBn7fkmwsCJCTyHYiBauWuoHQJYgl2wmHWfwcWkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4lgYlZ2G3Nt1Ji5tSpYCSXn98NHbA+W7PUpquQjCJqgj0aQhKU7yoOQPixEFm+Vt3niWuwYAy0NzkDnimlOPdw41nsDzWm64lv3ird5Hsr4Cgmzfxrr8FOn5HVc9t6aT7qVunxq3/kKRnDpk0uU1F4/abn82cnALme0Tn3w1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=clv5UKGK; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gL47J5KHPz9v1L;
	Wed, 20 May 2026 10:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779264828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQXDOHc4G7dDQ3kQbTmT21spqpc7LlPAUB+S3ExR0h4=;
	b=clv5UKGKubY2vtMtbud3ZYfrqBJNr87Hwa1wylUBd92LNwEvCBU6e1tOetr8sn8iHHgpjP
	0QgpQDMdE+Nbhx7zYTijf3Ayy1/90aJX4Os8kv88Q+/WVPpozCCY2MMPY9BWifiL4/AWgH
	leboD+Zf7QGE4Vf9X9p4gpBTSnQD3CUVPp0TG5SpxFugxWBszWxPYFyG4jOO4VnQVOoI6G
	QZoj/xqBhSVcB53FhMYLEZysfLSRFQd7MwARa7wRiRmcOtV7QqUC+QuuMAZSNr2q+Hdlw7
	wUy5LXQ4bWur8dtC0QeVuLFyRsBcZ230ta29gNIuOJGV9B4zu4UzfpX0pKZuFg==
Message-ID: <385a4d4f-fe22-41a7-8d4b-4dc6bc9930d3@mailbox.org>
Date: Wed, 20 May 2026 10:13:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xaver Hugl <xaver.hugl@kde.org>
Cc: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
 <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
 <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
 <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jpk3endswr6szttqjbsbpohbo1sccyz9
X-MBO-RS-ID: 17008d7d8dbc6b85f09
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	TAGGED_FROM(0.00)[bounces-62222-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 68EDE589852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 18:00, Christian König wrote:
> On 5/19/26 17:31, Xaver Hugl wrote:
>> Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian König
>> <christian.koenig@amd.com>:
>>>> 1. This series makes the ability to manipulate syncobjs available
>>>> independently of attached hardware.
>>>> 2. It makes it available under a consistent path /dev/syncobj.
>>>
>>> Exactly that is a big no-go. This has to be under /dev/dri.
>> FWIW udmabuf is also under /dev directly, but I don't think any
>> compositor developer would complain about a different path.
>> What are the rules for that? Could this simply be put in /dev/dri/syncobj?
> 
> The syncobj are actually the DRM specific way of doing things. The general kernel wide way is to use sync files (see drivers/dma-buf/sync_file.c).
> 
> But there has already been tons of problems with those sync files. E.g. they doesn't support your use case at all since they don't have wait before submit behavior.
> 
> So there are already ways to do this, but the Linux kernel so far told everybody that this is forbidden. The DRM syncobj wait before signal functionality is much better, but then basically the second try to do this.

I'm not quite sure what you're getting at here, just to be clear though:

While the syncobj Wayland protocol extension supports wait-before-submit behaviour at the Wayland protocol level, it doesn't need or cause wait-before-submit behaviour for DMA fences in the kernel. The usual rules apply to fences attached to syncobj timeline points. The wait-before-submit behaviour at the Wayland protocol level comes from allowing submit before a fence is attached to the acquire timeline point.

(It took me a while to realize this distinction, before which I mistakenly thought the kernel's DMA fence rules would prohibit wait-before-submit behaviour at the Wayland protocol level as well)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

