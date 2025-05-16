Return-Path: <linux-media+bounces-32625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B166AB970F
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 10:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ECC8189403B
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 08:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481B422CBD2;
	Fri, 16 May 2025 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="CgXcYEZX";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="cr+6076D"
X-Original-To: linux-media@vger.kernel.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA521FF4A;
	Fri, 16 May 2025 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382503; cv=none; b=tcT6pRHErEd3c1YN1VyfjTN8ZGTaa2wsQh5Mp36xOisC4hrfDR+medADCpSlwNbDQQ5UArnFq6U0fHK1/SPMx7fW1Z/0uOAXjM7T1wOFaQ6DbyZCU8hHP2wBxlBzuzeJ5Xfx5orqBTWZPv5jrbYpWu5SIsm55rcAT8G2D2KSVr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382503; c=relaxed/simple;
	bh=yUSd1lLOUTfXqwk/RalMi6aO3FyaQpO1WZ3T1xPz8kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ3uUunyhD1mAMJAYKlbzcGg7ZN1wZy62MfFsHPjWmY7j/fpl8n8XOBvzfx06/Q8Cz3U54FPnUDi8W4CJ14SDXt/gDgar6qNEFuQTrtS50c3FQGQxTpejrTvEWa1sYgMX/Cx28gyY76XmFOxHHt1k7yHlfXcWYWdFrc7NvSKBhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=CgXcYEZX; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=cr+6076D; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747382182; bh=YPy+tEZL6apKgfvAMCRSsSk
	8zKBxHWC7t2m1Vfn3jPs=; b=CgXcYEZX8hN/Q2e8M/80XSvSboXrdC5slsIEaxO8MEjbT6Mt06
	NdM43xSHHG2AVxLNrAJ4Z/rw82f8ujBNTnDLilcOjG59X7I7rVHF//JMltYERkh69ySJFndsqSx
	2HhmYqvQC7SUV5omtgvmMwLo0ARUefbpfAS/r+YYeQl/GundzUUsICBAzgrplwocwNIoenYkdiW
	goHq/TnW15uWBkrP31QDMpLX2C8+q4Gm30YK12rfwlU0W2q4vIPu1XLqmwTw79bf5dWhsKd/qJi
	RepcAKpFb9Gsi4geYsjwp19Die7hbGY4GrXm9agLG5xJ3BpvoG7HBdb1iKUDvsec6cQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1747382182; bh=YPy+tEZL6apKgfvAMCRSsSk
	8zKBxHWC7t2m1Vfn3jPs=; b=cr+6076Dkxypklpp92ebvSZPCsy2GPT7BKIzpqigg57qRQwr/u
	kl/P0+TezIcHj+VIk3KIKeqKsYydjFqRI+Aw==;
Message-ID: <7f04847e-9549-47cc-9b61-7b32df24ef8e@damsy.net>
Date: Fri, 16 May 2025 09:56:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] drm/doc: document some tracepoints as uAPI
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
 <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <27825c551adeda28f4b329f44c316ad2ab67fa5d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 14/05/2025 à 14:53, Philipp Stanner a écrit :
> On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
>> This commit adds a document section in drm-uapi.rst about
>> tracepoints,
>> and mark the events gpu_scheduler_trace.h as stable uAPI.
>>
>> The goal is to explicitly state that tools can rely on the fields,
>> formats and semantics of these events.
>>
>> Acked-by: Lucas Stach <l.stach@pengutronix.de>
>> Acked-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst                | 19
>> +++++++++++++++++++
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 19
>> +++++++++++++++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-
>> uapi.rst
>> index 69f72e71a96e..4863a4deb0ee 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -693,3 +693,22 @@ dma-buf interoperability
>>   
>>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst
>> for
>>   information on how dma-buf is integrated and exposed within DRM.
>> +
>> +
>> +Trace events
>> +============
>> +
>> +See Documentation/trace/tracepoints.rst for information about using
>> +Linux Kernel Tracepoints.
>> +In the DRM subsystem, some events are considered stable uAPI to
>> avoid
>> +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means
>> that fields
>> +cannot be removed, nor their formatting updated. Adding new fields
>> is
>> +possible, under the normal uAPI requirements.
>> +
>> +Stable uAPI events
>> +------------------
>> +
>> +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>> +
>> +.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +   :doc: uAPI trace events
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 781b20349389..7e840d08ef39 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -32,6 +32,25 @@
>>   #define TRACE_SYSTEM gpu_scheduler
>>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>>   
>> +/**
>> + * DOC: uAPI trace events
>> + *
>> + * ``drm_sched_job_queue``, ``drm_sched_job_run``,
>> ``drm_sched_job_add_dep``,
>> + * ``drm_sched_job_done`` and ``drm_sched_job_unschedulable`` are
>> considered
>> + * stable uAPI.
>> + *
>> + * Common trace events attributes:
>> + *
>> + * * ``dev``   - the dev_name() of the device running the job.
>> + *
>> + * * ``ring``  - the hardware ring running the job. Together with
>> ``dev`` it
>> + *   uniquely identifies where the job is going to be executed.
>> + *
>> + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
>> + *   &drm_sched_fence.finished
>> + *
>> + */
> 
> For my understanding, why do you use the double apostrophes here?

To get similar formatting to function arguments and make the output a bit nicer to read.

> 
> Also, the linking for the docu afair here two requires you to write
> 
> &struct dma_fence.seqno
> 
> If I am not mistaken
> 
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#highlights-and-cross-references

Indeed, thanks. I fixed this.

Pierre-Eric

> 
> 
> P.
> 
>> +
>>   DECLARE_EVENT_CLASS(drm_sched_job,
>>   	    TP_PROTO(struct drm_sched_job *sched_job, struct
>> drm_sched_entity *entity),
>>   	    TP_ARGS(sched_job, entity),


