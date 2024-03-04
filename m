Return-Path: <linux-media+bounces-6335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5586FAF9
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 08:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A918281ECD
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 07:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60AF14F8C;
	Mon,  4 Mar 2024 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N9iw3a6r"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656CF13FFD
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709537942; cv=none; b=Oadd3luU6XzxSCOYm0UiWql/4IUA74SgbHpiKnJjxfMyk0ACd1zUSsXX05WckExuWYXryVK/ig/1zLx2eThKijqGMioAJ3CUC2zR8FLJzuqUTOnVilxbP1wnLoJAjhIPr+vknqo/hr7XF6w6Aq1TpBl3eH2BDJhzHS5NivtZWDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709537942; c=relaxed/simple;
	bh=mFmlnvyh7LUji76YPrWiC0+QjXkqktDFpJmIM0Ds7OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLdm/88Y5jGiRXdf7IqB/09AvNuzTgnFSVZnMPFS6IqH4nBap5D792HwXZXC9UBma1WlKAbeIE02TjzVtWQqIBIRUb66SWIG4jRjUjPmeoo56N9lGNb4Lqn4Wzm2u9QlJk78cscb5GXWJRSD81N3mSnQMpDsYA2oEqLLlp7NMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N9iw3a6r; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709537938;
	bh=mFmlnvyh7LUji76YPrWiC0+QjXkqktDFpJmIM0Ds7OM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N9iw3a6riBfWAEKWFZ0LTX06MNyY1cMB/5BRyZ24T/w0uKcziXszZxagqH/gqrDyI
	 z16o/zOGQ8eFgDMuZyhpZOrg9SlPnD3A1FGQ1x8gp5aDtj5CrVC6BerJ5JauH6Jcx3
	 5A4kRAXYHC4eZFN4cFyx9g4+rFYbzWK/i73E6U6EVsiX1AViwM1cHHuIbfsKR5P4WH
	 +qqeL0fCyY+WE//r3AaC5F4m+4iHbzErXOa80yhM6v4/T58jlXZYLMzW3OUn/7I5TW
	 aSOTETwD/i2JsUheIIESxTX6o4x0Sqh1ZSBsC4m2SL27Vj+FiHbFlQapjRCZCjZzG7
	 KZjxeKvyclXIA==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A59037813E3;
	Mon,  4 Mar 2024 07:38:58 +0000 (UTC)
Message-ID: <00f3c02e-a71b-4e41-a50b-f0494ce1a73d@collabora.com>
Date: Mon, 4 Mar 2024 08:38:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/13] staging: mmal-vchiq: Fix memory leak in error
 path
Content-Language: en-US
To: Maarten Vanraes <maarten@rmail.be>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-4-maarten@rmail.be>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240303152635.2762696-4-maarten@rmail.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maarten,

W dniu 3.03.2024 o 16:09, Maarten Vanraes pisze:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> On error, vchiq_mmal_component_init could leave the
> event context allocated for ports.
> Clean them up in the error path.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> staging: mmal-vchiq: Free the event context for control ports
> 
> vchiq_mmal_component_init calls init_event_context for the
> control port, but vchiq_mmal_component_finalise didn't free
> it, causing a memory leak..
> 
> Add the free call.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
> ---
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 29 ++++++++++++++-----
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 2e616604943d..1209b7db8f30 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -1825,9 +1825,26 @@ static void free_event_context(struct vchiq_mmal_port *port)
>   {
>   	struct mmal_msg_context *ctx = port->event_context;
>   
> +	if (!ctx)
> +		return;
> +
>   	kfree(ctx->u.bulk.buffer->buffer);
>   	kfree(ctx->u.bulk.buffer);
>   	release_msg_context(ctx);
> +	port->event_context = NULL;
> +}
> +
> +static void release_all_event_contexts(struct vchiq_mmal_component *component)
> +{
> +	int idx;
> +
> +	for (idx = 0; idx < component->inputs; idx++)
> +		free_event_context(&component->input[idx]);
> +	for (idx = 0; idx < component->outputs; idx++)
> +		free_event_context(&component->output[idx]);
> +	for (idx = 0; idx < component->clocks; idx++)
> +		free_event_context(&component->clock[idx]);
> +	free_event_context(&component->control);
>   }
>   
>   /* Initialise a mmal component and its ports
> @@ -1925,6 +1942,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
>   
>   release_component:
>   	destroy_component(instance, component);
> +	release_all_event_contexts(component);
>   unlock:
>   	if (component)
>   		component->in_use = false;
> @@ -1940,7 +1958,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
>   int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
>   				  struct vchiq_mmal_component *component)
>   {
> -	int ret, idx;
> +	int ret;
>   
>   	if (mutex_lock_interruptible(&instance->vchiq_mutex))
>   		return -EINTR;
> @@ -1952,12 +1970,9 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
>   
>   	component->in_use = false;
>   
> -	for (idx = 0; idx < component->inputs; idx++)
> -		free_event_context(&component->input[idx]);
> -	for (idx = 0; idx < component->outputs; idx++)
> -		free_event_context(&component->output[idx]);
> -	for (idx = 0; idx < component->clocks; idx++)
> -		free_event_context(&component->clock[idx]);
> +	release_all_event_contexts(component);

The way I understand this chunk is that you factor out the 3 "for" loops into
the new function "release_all_event_contexts()", because it is then reused 
elsewhere. "release_all_event_contexts()" already contains invocation of
"free_event_context(&component->control)"...

> +
> +	free_event_context(&component->control);

... but it is repeated here. Why?

Regards,

Andrzej

>   
>   	mutex_unlock(&instance->vchiq_mutex);
>   


