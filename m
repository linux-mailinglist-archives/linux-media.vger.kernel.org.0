Return-Path: <linux-media+bounces-58343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCgdE/uw12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:00:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5CA3CBB22
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA5363024552
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96633D75B6;
	Thu,  9 Apr 2026 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MSFlSKBh"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB23D813E
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743149; cv=none; b=gYg8NHK1cNwvfgL2/ww8Tfo41ncxX6u0h8k8IGdrPnq0ebx6Ao54JVLXPD+jtXQtF+DiM8yyZ3XuZjQtkknOX1Fr5Zdct4puAmWsnGYgtdieDC1vdT86ZI+qddZIVDVkBm9XsISAMs1E1EHw8KW2/2OhHRyYX5T2RFmhtyl8VgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743149; c=relaxed/simple;
	bh=SjUVD1JC1R0gPuwyuI6arJxxJM/n1CCSElx0byNqKaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0Pc8C1jpTh2t5hayuJoq5lrL/tykHX8zpMLVGcRZIEmpR15Hj9jWKry6w/TAmyfz9KH+ZUwl0ijNLMmnEsivV0Nmqc2B1HsaCFgPR2u9AsYPbW19vZbgkZf4w4QamyYJzhzZOWYV1LNkDO7Sq5AqQaiJA1n/tC4jjT4jtkXmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MSFlSKBh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cQyv2LnxUKMjBM+EOj064AVlbTpkbGhSbXBnBwtzWn0=; b=MSFlSKBh67kJ1UZ+jodufZmqM6
	ZRnMe7w4LtvMYi0/X4UYlmxBF11TKCKCpLGEdAw8azbovuId5HdABuuSoEEZ2sM2h4fCDKLwv3Ua0
	wClCrzN3+rQU1YwFUANnIu5Bk6qReZOvEvEKQ0xwx0iL0D4puHQgc4NQAByIOtLpIrCMdynQgcLru
	Kqtj0O4uaNEUG0Sf1fDtgFMyV8RviToihKGvmgDws89WpB5Rn8qYoJrxEHKWCWVFffq1Z/kTVtqL1
	kP10+umJ/hdDdIr9SQOrHKWs7JVHGLf05OMuWbxqZVovZuFPukMFxJJImIuwlu7OGivIN8mUWoldo
	YC+lFOng==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wApuB-00Dxtg-Um; Thu, 09 Apr 2026 15:58:47 +0200
Message-ID: <918805b0-2cb9-454a-9048-84cc5bfc8798@igalia.com>
Date: Thu, 9 Apr 2026 14:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Move signalling tracepoint to before ops
 detach
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
 <20260331094944.772833c0@fedora>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260331094944.772833c0@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,linaro.org:email,igalia.com:email,igalia.com:mid]
X-Rspamd-Queue-Id: DB5CA3CBB22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 31/03/2026 08:49, Boris Brezillon wrote:
> On Mon, 30 Mar 2026 14:36:23 +0100
> Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
> 
>> Move the signalling tracepoint to before fence->ops are reset otherwise
>> tracepoint will dereference a null pointer.
> 
> I suspect other trace points are impacted too
> (trace_dma_fence_destroy() is, at the very least).

Indeed. I wonder why that did not trigger for me, while the one I fix 
here was an insta-crash...

To fix trace_dma_fence_destroy I think we need a new tracepoint 
definition ie. move it away from the existing event class - make it just 
log the context and seqno.

Anyone has a better idea?

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> ---
>>   drivers/dma-buf/dma-fence.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 1826ba73094c..1c1eaecaf1b0 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   				      &fence->flags)))
>>   		return;
>>   
>> +	trace_dma_fence_signaled(fence);
>> +
>>   	/*
>>   	 * When neither a release nor a wait operation is specified set the ops
>>   	 * pointer to NULL to allow the fence structure to become independent
>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   
>>   	fence->timestamp = timestamp;
>>   	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>> -	trace_dma_fence_signaled(fence);
>>   
>>   	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>   		INIT_LIST_HEAD(&cur->node);
> 


