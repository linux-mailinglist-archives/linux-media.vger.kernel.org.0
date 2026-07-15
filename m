Return-Path: <linux-media+bounces-67644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NzqwMIpWV2o6KAEAu9opvQ
	(envelope-from <linux-media+bounces-67644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996A75CA46
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67644-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67644-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0069A3006697
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5D143B487;
	Wed, 15 Jul 2026 09:44:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD17435522
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 09:44:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108670; cv=none; b=B3cCdrQVWxauZzQ+A3RahaxghXkNMl46E6x0/Tp5ws2E7s+xNm4N+xxzCe+R2d/Qq2xAF/5h2RqdCiExij+VD6h9vJ8ozTMy1KOReRK1k4clgFcRIH7q1CKZqyUjtGMXsE6nKLuV0CG+RslcXEdSDOZeRE2bID7BKydYLSrYh1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108670; c=relaxed/simple;
	bh=vkqflzHe5tu7vJFcAezQeSEiDko0g07fk9la2K18Of4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwTXDOs3fTB/wcn4bf0arvEgh8sj+Wa+vRDzZ129J5vTLcxhWPWsXK5E/Op85pOexUeOrIrFcuKkc2yR4PG5Ii7S9AqliRi/9c7vMx5Uty0zUdRdTyE3Xc90mWAIOinxw2ZgzXTmGgfBqvARJnBo8XP3lg5+bu6964n4IcRNNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wjw9t-0007kR-EY; Wed, 15 Jul 2026 11:44:05 +0200
Message-ID: <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
Date: Wed, 15 Jul 2026 11:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs
 in parallel
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
 <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67644-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8996A75CA46

Hi,

On 7/10/26 11:18 PM, Nicolas Dufresne wrote:
> Hi,
>
> Le samedi 06 juin 2026 à 00:06 +0200, Sven Püschel a écrit :
>> Add support for running multiple jobs in parallel for SoCs containing
>> multiple identical devices. An example is the Rockchip RK3588 SoC,
>> which contains two identical RGA3 devices. Therefore it is desirable to
>> have the kernel schedule the work across all available devices and only
>> expose one video device to the userspace.
>>
>> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
>> currently running context. But the currently running context will always
>> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
>> check if the queue head is already running, the curr_ctx member can be
>> completely dropped
>>
>> To avoid queueing too many parallel jobs, the
>> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
>> to set the number of parallel jobs and avoids calling device_run when
>> the given number of jobs is already running. This is set to 1 by default
>> to prevent parallel job runs. Drivers with the need and support for
>> scheduling jobs can adjust this value accordingly.
>>
>> Note that this change doesn't allow a context to be used multiple times
>> in parallel. So a single stream won't be able to utilize multiple devices
>> at once, but N streams can utilize up to N devices. This is caused by the
>> fact that a context is not added multiple times to the job_list and also
>> holds the job_flags to distinguish if it's currently running.
> I do prefer this over Detlev proposal, so let's move toward this. Would be it
> cleaner though to first remove curr_ctx and then add
> max_parallel_jobs ?

Nice idea. I could move the max_parallel_jobs variable and the new 
function to a new small commit.

I could also move the whole looping and counting of running jobs over 
the jobs to the new commit. But this would cause replacing the curr_ctx 
variable with a `list_first_entry(...)->job_flags & TRANS_RUNNING` and 
drop it in the commit afterwards to replace it with loops.

While the commits would look a bit nicer in the latter example (as the 
removal of curr_ctx wouldn't also prepare for parallel jobs), I think 
the addition and direct removal style is frowned upon and therefore I 
tend towards the first option. On the other side I'm unsure if a 10 line 
patch to just add max_parallel_jobs variable and function with 
everything done in a (removal) patch provides benefit or harms to get to 
the related changes.

>> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>>   static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>>   {
>>   	unsigned long flags;
>> +	struct v4l2_m2m_ctx *ctx;
>> +	struct v4l2_m2m_ctx *chosen_ctx = NULL;
>> +	u32 running_jobs = 0;
>>   
>>   	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> -	if (NULL != m2m_dev->curr_ctx) {
>> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> -		dprintk("Another instance is running, won't run now\n");
>> -		return;
>> -	}
>>   
>>   	if (list_empty(&m2m_dev->job_queue)) {
>>   		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
>> *m2m_dev)
>>   		return;
>>   	}
>>   
>> -	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>> -				   struct v4l2_m2m_ctx, queue);
>> -	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
>> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
>> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
>> +			chosen_ctx = ctx;
>> +			break;
>> +		}
>> +
>> +		running_jobs++;
>> +	}
>> +	if (running_jobs >= m2m_dev->max_parallel_jobs) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("Maximum number of parallel jobs reached\n");
>> +		return;
>> +	}
>> +	if (!chosen_ctx) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("All jobs already running\n");
>> +		return;
>> +	}
>> +
>> +	chosen_ctx->job_flags |= TRANS_RUNNING;
>>   	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

This is the most prominent example on how to split it up. E.g. either 
keep everything in the curr_ctx removal commit (and just use 1 for 
max_parallel_jobs) or use list_first_head to check if we have a curr_ctx 
and drop it afterwards for the counting logic.


Sincerely
     Sven


