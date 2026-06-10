Return-Path: <linux-media+bounces-64427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cb/PIx1VKWqGVAMAu9opvQ
	(envelope-from <linux-media+bounces-64427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D675666926C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ursulin.net header.s=google header.b=cAceAniF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64427-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64427-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B0BD31140C9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D82403B05;
	Wed, 10 Jun 2026 12:12:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CD3DBD76
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:12:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093547; cv=none; b=r8nyeXwnCB/vWNQ8nI583Bof6DSis9sAmMZ7UpICSpF/84VNUd3t1DTTBrfIzfs2CtXXfjTywU7aY43iHVLxANu9AwunJfGAkRWh6FdHumick6PkBKFJ3kScRNaKTmtr/zqSSTcE/F6X4FQRdO7X/vTmes3dwvIWCinOiGhputo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093547; c=relaxed/simple;
	bh=xKxml6eXRDHsraxuYzByMtlW+4xeMIj8kQS+dM67NiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKOmwjp30U9l06mwdKAVDb/lPaedXKrutpWs5FHo/z84RyAdJ5AdheDnaGo9gODz02Uoe4MthNsQHV3xtFewfeNFSLYYyAaTaEHJHOxzPeGJKuGtLSBf7zwNeNW0W2VIii/thG8OxVGY6Wr16ZE7CttdDP+bJmZ4idiipMq17Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=cAceAniF; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5896606a12.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1781093545; x=1781698345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJe1xz1ZMNVnBlNAhTok//gR+6F59R46BnGd4lcF8bY=;
        b=cAceAniF11DkABv4isZHZvCfrwevBxHwmIJA5a0mL33/LvqTzQAZEbEzytAoueTmz2
         FQpy67uhJjMjHEo7sMcYOQNm0hUvivHLRnT9chWEItYpn7zyPrBtvCWOVKzsXc+dnrGL
         MdO1ocQbTgFU11xsIIykeBeNFZ/lSMK5ttn82WZ+Gf+LO4Z9w9bNT4OD/focS67GeulY
         +p+iALdajotIXBzQ7Ul1vfC3c3Ee6ELeYbZFGsG03KYPHdw2iqg/cxoyrot/2sJYKE7y
         zs2SEW9amoDkO0brEDkEd4m1MN2tUyWzuLG87FrKtsehlNfE0LEJS3bOcrJW8JdzJovw
         mpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093545; x=1781698345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJe1xz1ZMNVnBlNAhTok//gR+6F59R46BnGd4lcF8bY=;
        b=qdIR9Gv9UBT9LmGghI99GwKuxT9kk6yHgCR4ExIHrAZEBKmULPMfURLrIGSAjpWDOA
         QOYmYfwYrD7ILQtNw85DLAFjtsaezeCxbv+URHiVd2iNOwMShuO8bZ4DKHqB9Sv1Asgx
         r0UbLfrVv9Un5tpa68DHsQl6xDlqUFKX3sG28MM49iWO9cNSaUQD5nyATDQd+ly88uOY
         jZ6SXXs/+g+msv3N/L1AqAiGoIQDXhXbcz/LD0wAOr1gIdqwP0kIfQHwzWx1jmsOCRdp
         Nl8eVHB4fCs0uuac2AgGfk50i1pXDnGprxtG/IrY3aUhDLKDtYTIC/8wRXx/6fBrgTpZ
         wtqw==
X-Forwarded-Encrypted: i=1; AFNElJ8uBTK3XP/2dVCPSS+ibN87W5E3sutXr+Aupl3wt9H5y4YT9gCaNMdUp4wpB/AcK7txBxTKFU5P11WCRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNPLXurBD2G4VrvKhRJUqPQiv9PpMK58gudkykGl+f7Imjjro
	92/xcw4Y2VM3Ds/OBykK6HdCme1WCJD2DE5U5WWo0ZBMPFwrTztnvCk9IZkW/fsevIM=
X-Gm-Gg: Acq92OF9OD0sPGBl4ZggO+MDui6QzAgkxPpkvxAdk+RFu5WZNsQ8Ia02BJAhi4eucGW
	4kto1ojfwNuaBY8N7A5KrnPRUUEB651ylpzhU+PllQg1kgTEOLEIGvoZamx87OLsK/H2Nb617FP
	COTcIo/0pJRLo/f/6knApEuizjtet5MB1h0wjvpmsUoyuXtAlif/Cya6whVNLWj7kNwfpyIBc+8
	Yj7DqSHw4IWQkHL6Puop3VQj1LE0eMf4rNRFuxeg/qhanMowarmgeyu/36YGr1IyHu5EnooDYfO
	QQ7Tp6VyYO0DF/kqVpXxElC41JGPgzxS1nPpVms6p/z0ecG9b+FadlK0rpp2XS2P1cYew91DMwI
	c8rcAwSokbQ0KZatGu/JO7ddjj76i+MqJBtUcTEquMdB5HGdPY4wwc2KhinJlvgYfYvfSC3Gn3z
	JWkJbyhAwUMdjSUAplgcRits0hJQIB1ldkI9oYCqbd1Ci7Jav4EwwWeGXmiuX/7IziDg==
X-Received: by 2002:a05:6402:5193:b0:66e:abe5:ab22 with SMTP id 4fb4d7f45d1cf-68fa4c0039fmr11944776a12.5.1781093544179;
        Wed, 10 Jun 2026 05:12:24 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm9966710a12.9.2026.06.10.05.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:12:22 -0700 (PDT)
Message-ID: <b5f634e3-ca52-4674-82a7-fabce99ec364@ursulin.net>
Date: Wed, 10 Jun 2026 13:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Document weird looking bugfix
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260610082602.1292853-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260610082602.1292853-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-64427-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ursulin.net:dkim,ursulin.net:mid,ursulin.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D675666926C


On 10/06/2026 09:26, Philipp Stanner wrote:
> commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
> fixed a race. To do so, it replaced the automatically locking
> dma_fence_is_signaled() with manual locks plus
> dma_fence_is_signaled_locked().
> 
> For someone browsing through the code, this reads very much like a
> cleanup or rework leftover. Future contributors and / or new maintainers
> not familiar with the history might be tempted to remove that bugfix.
> 
> Document the bugfix.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> (I did not test this)
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42a81166f3a9..519a0c164a72 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -159,6 +159,13 @@ nouveau_cli_work_ready(struct dma_fence *fence)
>   	unsigned long flags;
>   	bool ret = true;
>   
> +	/*
> +	 * This is not a cleanup / rework leftover, but a bugfix to prevent a
> +	 * race with someone signalling the fence. The locked
> +	 * dma_fence_is_signaled() cannot be used. The dma_fence implementation
> +	 * is not fully synchronized with locks, but also uses atomic bits,
> +	 * which can cause the dma_fence_put() below to be executed too soon.
> +	 */

IMHO it would also be interesting to document why this happens from the 
nouveau point of view.

For example I see the two references held on this fences in the call 
chain, but apparently neither are enough to close the race. Which 
suggests a third party has a pointer to this fence but with no reference.

I talk about this:

nouveau_gem_object_unmap -> nouveau_cli_work_queue

There it grabs a reference before queing the worker. In the worker it 
drops it before calling the callback nouveau_gem_object_unmap installed:

static void
nouveau_cli_work(struct work_struct *w)
{
	struct nouveau_cli *cli = container_of(w, typeof(*cli), work);
	struct nouveau_cli_work *work, *wtmp;
	mutex_lock(&cli->lock);
	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
		if (!work->fence || nouveau_cli_work_ready(work->fence)) {

... nouveau_cli_work_ready can drop one reference

			list_del(&work->head);
			work->func(work);

... then work->func was set to nouveau_gem_object_delete_work by 
nouveau_gem_object_unmap, which will end up calling:

nouveau_gem_object_delete -> nouveau_fence_unref

On possibly the same fence.

So if there a path inside nouveau itself which signals the fence without 
holding a reference then could be it that the problem is self-inflicted 
and not due a dma-fence quirks?

I am not entirely sure since it is not very clear. It needs someone with 
nouveau expertise to clarify.

Regards,

Tvrtko

>   	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_is_signaled_locked(fence))
>   		ret = false;


