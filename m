Return-Path: <linux-media+bounces-6501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEBE872621
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 19:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C0D1C26624
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 18:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EA917BCE;
	Tue,  5 Mar 2024 18:02:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4848817BBA
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709661745; cv=none; b=ArMNxKZ6Cq2ut4/mIcjLowU5RZs113oeKF4Io52bKsTHgdBwdYSN90UjzqtSeP3mgxVHRW3msGSPKrSruhdhknOdVgfX0IL2kK+aQein8QP2hq5MpsPyRgfOzuUn3NHuymlU9ofY0XVAE/4i02GhZj0U3G8tcTIKoCDd57Mnpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709661745; c=relaxed/simple;
	bh=Zt9FUREBgNwzIKHTcqSxqrrpNp/9rYwu28rbbSOxcf8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=b7KGd9jZ4QUZhKx5/GZG8dxqdhaWGjFVbTxpKkBJgrGWsrrY1h2olGCaen2u2tSFuJpznNmtANLZ8zdkSagME35QHIxG1ue8lGds42AbH8fPGYi/BpqDn7JeyBf6SJNwlx5R7Ef0iDMvOfBXVGUfEtSOc3XY/cgCHaVneyCLjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id 3DB524C6F5;
	Tue,  5 Mar 2024 19:02:20 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 19:02:20 +0100
From: Maarten <maarten@rmail.be>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-media@vger.kernel.org, Kieran Bingham <kbingham@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.org>
Subject: Re: [RFC PATCH 03/13] staging: mmal-vchiq: Fix memory leak in error
 path
In-Reply-To: <00f3c02e-a71b-4e41-a50b-f0494ce1a73d@collabora.com>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-4-maarten@rmail.be>
 <00f3c02e-a71b-4e41-a50b-f0494ce1a73d@collabora.com>
Message-ID: <cf98c79782d53d44d7f8be182aff8a57@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Andrzej Pietrasiewicz schreef op 2024-03-04 08:38:
> Hi Maarten,
> 
> W dniu 3.03.2024 o 16:09, Maarten Vanraes pisze:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>> 
>> On error, vchiq_mmal_component_init could leave the
>> event context allocated for ports.
>> Clean them up in the error path.
>> 
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>> 
>> staging: mmal-vchiq: Free the event context for control ports
>> 
>> vchiq_mmal_component_init calls init_event_context for the
>> control port, but vchiq_mmal_component_finalise didn't free
>> it, causing a memory leak..
>> 
>> Add the free call.
>> 
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
>> ---
>>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 29 
>> ++++++++++++++-----
>>   1 file changed, 22 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c 
>> b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> index 2e616604943d..1209b7db8f30 100644
>> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> @@ -1825,9 +1825,26 @@ static void free_event_context(struct 
>> vchiq_mmal_port *port)
>>   {
>>   	struct mmal_msg_context *ctx = port->event_context;
>>   +	if (!ctx)
>> +		return;
>> +
>>   	kfree(ctx->u.bulk.buffer->buffer);
>>   	kfree(ctx->u.bulk.buffer);
>>   	release_msg_context(ctx);
>> +	port->event_context = NULL;
>> +}
>> +
>> +static void release_all_event_contexts(struct vchiq_mmal_component 
>> *component)
>> +{
>> +	int idx;
>> +
>> +	for (idx = 0; idx < component->inputs; idx++)
>> +		free_event_context(&component->input[idx]);
>> +	for (idx = 0; idx < component->outputs; idx++)
>> +		free_event_context(&component->output[idx]);
>> +	for (idx = 0; idx < component->clocks; idx++)
>> +		free_event_context(&component->clock[idx]);
>> +	free_event_context(&component->control);
>>   }
>>     /* Initialise a mmal component and its ports
>> @@ -1925,6 +1942,7 @@ int vchiq_mmal_component_init(struct 
>> vchiq_mmal_instance *instance,
>>     release_component:
>>   	destroy_component(instance, component);
>> +	release_all_event_contexts(component);
>>   unlock:
>>   	if (component)
>>   		component->in_use = false;
>> @@ -1940,7 +1958,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
>>   int vchiq_mmal_component_finalise(struct vchiq_mmal_instance 
>> *instance,
>>   				  struct vchiq_mmal_component *component)
>>   {
>> -	int ret, idx;
>> +	int ret;
>>     	if (mutex_lock_interruptible(&instance->vchiq_mutex))
>>   		return -EINTR;
>> @@ -1952,12 +1970,9 @@ int vchiq_mmal_component_finalise(struct 
>> vchiq_mmal_instance *instance,
>>     	component->in_use = false;
>>   -	for (idx = 0; idx < component->inputs; idx++)
>> -		free_event_context(&component->input[idx]);
>> -	for (idx = 0; idx < component->outputs; idx++)
>> -		free_event_context(&component->output[idx]);
>> -	for (idx = 0; idx < component->clocks; idx++)
>> -		free_event_context(&component->clock[idx]);
>> +	release_all_event_contexts(component);
> 
> The way I understand this chunk is that you factor out the 3 "for" 
> loops into
> the new function "release_all_event_contexts()", because it is then
> reused elsewhere. "release_all_event_contexts()" already contains
> invocation of
> "free_event_context(&component->control)"...
> 
>> +
>> +	free_event_context(&component->control);
> 
> ... but it is repeated here. Why?


I'm sorry, I messed up in squashing 2 patches, that definately does not 
belong there, will fix in v2.

Thanks!

