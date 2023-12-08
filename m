Return-Path: <linux-media+bounces-1944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2480A2D3
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03DA01C2093D
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 12:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A121BDF4;
	Fri,  8 Dec 2023 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Kh7oyIgD"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009B11727
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 04:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702037285; x=1702642085; i=wahrenst@gmx.net;
	bh=SNf8w6bB3oOj0kBCyk/hy8efg+PhwImmOlBmTX6N2K4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Kh7oyIgDyQox2wTs26iGkDydVsQaR+S0+fSoWwM9BmZvMuH1HEjjzsXrY3gVMSr2
	 X9mF6FUFZ/fqgLl0Du02yKQ/BubGhBRSrbm0t8wonjeVP0eGliV9j7YoWFQNHd4K8
	 v3GZ2+zYzID+XNyZYuVnEDzKglQw1emoo508Zg0WyBFxf7mWnGwfJiqohX++HtVPI
	 K6Hk+QXSXubhoYKy5l11XEc0ZTpHo0+MikxUyLF5PjVlLs+KG4cs7tC3CIW457/0o
	 mvx3O6lVPQkcB2ovd+a9ZGXgQdcrBW+b7pJFAj0OhfegeCfpCrTgqx9Fx/g+c8Iy5
	 b7l+IDkcQlEdwlzwPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1rWPM005BF-00udLR; Fri, 08
 Dec 2023 13:08:05 +0100
Message-ID: <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>
Date: Fri, 8 Dec 2023 13:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] staging: vc04_services: Drop vchiq_log_trace() in
 favour of dev_dbg
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-4-umang.jain@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231205084157.73819-4-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cIgVOSZcl9QZ1Wn29zFeZg/DNWi1EAVRnzatSMbDs6rXYUfZdtw
 hex4UJYKXp0IPab6xInDd4dQGdZ5SttwBMRaiaAGDcknKWrVjIDfn44o0M+CmmrxPzNFwjn
 /0KXKU+gx6NAHyLGA/29NFutuueSLLg4uNqmmevNloVNcmLPKXm9hYZb+T2sAQsLoUjmtWN
 8jMSwpwKqYGcPFHSE8Qug==
UI-OutboundReport: notjunk:1;M01:P0:fu6xkSDD0AM=;/fXbKUye0BxLw/jXr27tzy4wNqv
 DwLX3qCXlQ6vP7aHNDmdV+n1O3scdIEUmrDwXVQvYp5MQFNXwfb9fDXSQo4iP8d0vWqJT2KZ3
 MEhA1qkrBG5YgbwmKGxtcXEcQ+MMwdAzYzTyoW4azhBioF7Vb8FcnUoaTz4alYxHVk8U0z5Bi
 KwrIFKfWB08N9E1JaJkBGkdPky3XUsqrQxWmi+fwThRnfHkL8dI6hkt64vjZdcD0jH4rDK0ac
 o6CdJLoQD9rtlCgVzkwam6z7hBn8z4yPCPCuSD4J0qi2STxsJcsk5ZHz9POYwH4RPar95kfjT
 34HyLuEcXY7CUmHZCQXhUW1NejyQmxTEn4uQWI4b43vobc3aSgkhR7PZWH1xFDtUCE67Fu09x
 dU2kBd2xRnSWDgNv0FihHcM12ztuxF2XvCFYFeosdgB4Rk93EqcfvYp97+hAjDj9x5RFeQTLM
 egUzUyBZnYfFeyK2jA0hW7vGZWj7dmqGdRtD6nqF9a7GC/uFQuNU9cgyMdDNJXDqlBizSia9N
 aPNt+EFupdExgxZjwtd3/sxqvMG1zZdZhYDm3n9yXxm5KpWw/SYGDjm70hOmco7K+qE6h3eYO
 kxzilCY7hOBw02qlWuPoGo/knQflmemKz9C62vwAeyDoho/uxa+dZRtmQcnj8W5SYIEzfeSi5
 joynoLeB9tfi671q1QhkEZz3gck/w6moPOlYcKdTXmyXLMaWUUiO5P3v/XBj2oDkf13JTtZax
 3ELSQBIKvblOQ5Wl0Brrj7Jv+Aikt82aYuvzgQIo/7CmZ9Su5U3OVoeLNcxIUtR/XPfkcXFd2
 ZEBZ8X/V3zvp4ZbvGvdo+6ARZdazfIt+M+k7F1sSN9RNB57xWkIksV8AqAhGtUY5htF/JQ0L5
 07P8GbsAQNB6tOywmTmLsu6xL7fgwozOM3WhypVXh/TbkQfp8UuA2bpxoRD+jH1EM/4IKAvFG
 gLXYRg==

Hi Umang,

Am 05.12.23 um 09:41 schrieb Umang Jain:
> Drop vchiq_log_trace() macro which wraps dev_dbg(). Introduce the usage
> of dev_dbg() directly.
>
> Meanwhile at it, drop the usage of __func__ from the logs.
> Dynamic debug supports this via the 'f'  decorator flag.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
in general i'm fine with this patch:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

but there some improvements, which could be addressed/improved later
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           |  53 ++++-----
>   .../interface/vchiq_arm/vchiq_core.c          | 101 +++++++++---------
>   .../interface/vchiq_arm/vchiq_core.h          |   4 -
>   .../interface/vchiq_arm/vchiq_dev.c           |  15 ++-
>   4 files changed, 78 insertions(+), 95 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 56326b59a718..e337b8387647 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -255,8 +255,7 @@ create_pagelist(struct vchiq_instance *instance, cha=
r *buf, char __user *ubuf,
>   	pagelist =3D dma_alloc_coherent(instance->state->dev, pagelist_size, =
&dma_addr,
>   				      GFP_KERNEL);
>
> -	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
> -			"%s - %pK", __func__, pagelist);
> +	dev_dbg(instance->state->dev, "arm: %pK\n", pagelist);
>
>   	if (!pagelist)
>   		return NULL;
> @@ -407,8 +406,7 @@ free_pagelist(struct vchiq_instance *instance, struc=
t vchiq_pagelist_info *pagel
>   	struct page **pages =3D pagelistinfo->pages;
>   	unsigned int num_pages =3D pagelistinfo->num_pages;
>
> -	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
> -			"%s - %pK, %d", __func__, pagelistinfo->pagelist, actual);
> +	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist=
, actual);
>
>   	/*
>   	 * NOTE: dma_unmap_sg must be called before the
> @@ -708,8 +706,7 @@ int vchiq_initialise(struct vchiq_instance **instanc=
e_out)
>   	ret =3D 0;
>
>   failed:
> -	vchiq_log_trace(state->dev, VCHIQ_CORE,
> -			"%s(%p): returning %d", __func__, instance, ret);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
>
>   	return ret;
>   }
> @@ -742,8 +739,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>
>   	mutex_unlock(&state->mutex);
>
> -	vchiq_log_trace(state->dev, VCHIQ_CORE,
> -			"%s(%p): returning %d", __func__, instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
>
>   	free_bulk_waiter(instance);
>   	kfree(instance);
> @@ -763,8 +759,8 @@ int vchiq_connect(struct vchiq_instance *instance)
>   	struct vchiq_state *state =3D instance->state;
>
>   	if (mutex_lock_killable(&state->mutex)) {
> -		vchiq_log_trace(state->dev, VCHIQ_CORE,
> -				"%s: call to mutex_lock failed", __func__);
> +		dev_dbg(state->dev,
> +			"core: call to mutex_lock failed\n");
>   		status =3D -EAGAIN;
>   		goto failed;
>   	}
> @@ -776,8 +772,7 @@ int vchiq_connect(struct vchiq_instance *instance)
>   	mutex_unlock(&state->mutex);
>
>   failed:
> -	vchiq_log_trace(state->dev, VCHIQ_CORE,
> -			"%s(%p): returning %d", __func__, instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
>
>   	return status;
>   }
> @@ -808,8 +803,7 @@ vchiq_add_service(struct vchiq_instance *instance,
>   		status =3D -EINVAL;
>   	}
>
> -	vchiq_log_trace(state->dev, VCHIQ_CORE,
> -			"%s(%p): returning %d", __func__, instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
>
>   	return status;
>   }
> @@ -840,8 +834,7 @@ vchiq_open_service(struct vchiq_instance *instance,
>   	}
>
>   failed:
> -	vchiq_log_trace(state->dev, VCHIQ_CORE,
> -			"%s(%p): returning %d", __func__, instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
>
>   	return status;
>   }
> @@ -1010,8 +1003,7 @@ add_completion(struct vchiq_instance *instance, en=
um vchiq_reason reason,
>   	while ((insert - instance->completion_remove) >=3D MAX_COMPLETIONS) {
>   		/* Out of space - wait for the client */
>   		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -		vchiq_log_trace(instance->state->dev, VCHIQ_CORE,
> -				"%s - completion queue full", __func__);
> +		dev_dbg(instance->state->dev, "core: completion queue full\n");
>   		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
>   		if (wait_for_completion_interruptible(&instance->remove_event)) {
>   			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> @@ -1099,11 +1091,11 @@ service_callback(struct vchiq_instance *instance=
, enum vchiq_reason reason,
>   	vchiq_service_get(service);
>   	rcu_read_unlock();
>
> -	vchiq_log_trace(service->state->dev, VCHIQ_ARM,
> -			"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_=
userdata %lx",
> -			__func__, (unsigned long)user_service, service->localport,
> -			user_service->userdata, reason, (unsigned long)header,
> -			(unsigned long)instance, (unsigned long)bulk_userdata);
> +	dev_dbg(service->state->dev,
> +		"arm: service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_u=
serdata %lx\n",
> +		(unsigned long)user_service, service->localport,
> +		user_service->userdata, reason, (unsigned long)header,
> +		(unsigned long)instance, (unsigned long)bulk_userdata);
>
>   	if (header && user_service->is_vchi) {
>   		spin_lock(&msg_queue_spinlock);
> @@ -1112,8 +1104,7 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
>   			spin_unlock(&msg_queue_spinlock);
>   			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>   			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
> -			vchiq_log_trace(service->state->dev, VCHIQ_ARM,
> -					"%s - msg queue full", __func__);
> +			dev_dbg(service->state->dev, "arm: msg queue full\n");
>   			/*
>   			 * If there is no MESSAGE_AVAILABLE in the completion
>   			 * queue, add one
> @@ -1405,8 +1396,8 @@ vchiq_use_internal(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   	local_uc =3D ++arm_state->videocore_use_count;
>   	++(*entity_uc);
>
> -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state coun=
t %d",
> -			__func__, entity, *entity_uc, local_uc);
> +	dev_dbg(state->dev, "suspend: %s count %d, state count %d\n",
> +		entity, *entity_uc, local_uc);
>
>   	write_unlock_bh(&arm_state->susp_res_lock);
>
> @@ -1425,7 +1416,7 @@ vchiq_use_internal(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   	}
>
>   out:
> -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret=
);
> +	dev_dbg(state->dev, "suspend: exit %d\n", ret);
In case we want to keep this kind of debug messages, i prefer to have a
common format:

returning %d vs exit %d
>   	return ret;
>   }
>
> @@ -1463,14 +1454,14 @@ vchiq_release_internal(struct vchiq_state *state=
, struct vchiq_service *service)
>   	--arm_state->videocore_use_count;
>   	--(*entity_uc);
>
> -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state coun=
t %d",
> -			__func__, entity, *entity_uc, arm_state->videocore_use_count);
> +	dev_dbg(state->dev, "suspend: %s count %d, state count %d\n",
> +		entity, *entity_uc, arm_state->videocore_use_count);
>
>   unlock:
>   	write_unlock_bh(&arm_state->susp_res_lock);
>
>   out:
> -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret=
);
> +	dev_dbg(state->dev, "suspend: exit %d\n", ret);
ditto
>   	return ret;
>   }
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 2fd793954001..d197e4504bd4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -459,9 +459,9 @@ make_service_callback(struct vchiq_service *service,=
 enum vchiq_reason reason,
>   {
>   	int status;
>
> -	vchiq_log_trace(service->state->dev, VCHIQ_CORE, "%d: callback:%d (%s,=
 %pK, %pK)",
> -			service->state->id, service->localport, reason_names[reason],
> -			header, bulk_userdata);
> +	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK)\n",
> +		service->state->id, service->localport, reason_names[reason],
> +		header, bulk_userdata);
>   	status =3D service->base.callback(service->instance, reason, header, =
service->handle,
>   					bulk_userdata);
>   	if (status && (status !=3D -EAGAIN)) {
> @@ -763,8 +763,8 @@ process_free_data_message(struct vchiq_state *state,=
 u32 *service_found,
>   			 * it has dropped below its quota
>   			 */
>   			complete(&quota->quota_event);
> -			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_us=
e->%d",
> -					state->id, port, header->size, header, count - 1);
> +			dev_dbg(state->dev, "core: %d: pfq:%d %x@%pK - slot_use->%d\n",
> +				state->id, port, header->size, header, count - 1);
>   		} else {
>   			dev_err(state->dev,
>   				"core: service %d slot_use_count=3D%d (header %pK, msgid %x, heade=
r->msgid %x, header->size %x)\n",
> @@ -809,9 +809,9 @@ process_free_queue(struct vchiq_state *state, u32 *s=
ervice_found,
>   		 */
>   		rmb();
>
> -		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq %d=3D%pK %x %x",
> -				state->id, slot_index, data, local->slot_queue_recycle,
> -				slot_queue_available);
> +		dev_dbg(state->dev, "core: %d: pfq %d=3D%pK %x %x\n",
> +			state->id, slot_index, data, local->slot_queue_recycle,
> +			slot_queue_available);
>
>   		/* Initialise the bitmask for services which have used this slot */
>   		memset(service_found, 0, length);
> @@ -980,10 +980,10 @@ queue_message(struct vchiq_state *state, struct vc=
hiq_service *service,
>   		       ((tx_end_index !=3D quota->previous_tx_index) &&
>   			(quota->slot_use_count =3D=3D quota->slot_quota))) {
>   			spin_unlock(&quota_spinlock);
> -			vchiq_log_trace(state->dev, VCHIQ_CORE,
> -					"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
> -					state->id, service->localport, msg_type_str(type), size,
> -					quota->message_use_count, quota->slot_use_count);
> +			dev_dbg(state->dev,
> +				"core: %d: qm:%d %s,%zx - quota stall (msg %d, slot %d)\n",
> +				state->id, service->localport, msg_type_str(type), size,
> +				quota->message_use_count, quota->slot_use_count);
>   			VCHIQ_SERVICE_STATS_INC(service, quota_stalls);
>   			mutex_unlock(&state->slot_mutex);
>   			if (wait_for_completion_interruptible(&quota->quota_event))
> @@ -1073,10 +1073,9 @@ queue_message(struct vchiq_state *state, struct v=
chiq_service *service,
>   		spin_unlock(&quota_spinlock);
>
>   		if (slot_use_count)
> -			vchiq_log_trace(state->dev, VCHIQ_CORE,
> -					"%d: qm:%d %s,%zx - slot_use->%d (hdr %p)", state->id,
> -					service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
> -					size, slot_use_count, header);
> +			dev_dbg(state->dev, "core: %d: qm:%d %s,%zx - slot_use->%d (hdr %p)\=
n",
> +				state->id, service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
> +				size, slot_use_count, header);
>
>   		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
>   		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
> @@ -1205,11 +1204,11 @@ queue_message_sync(struct vchiq_state *state, st=
ruct vchiq_service *service,
>   	svc_fourcc =3D service ? service->base.fourcc
>   			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
>
> -	vchiq_log_trace(state->dev, VCHIQ_SYNC,
> -			"Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d",
> -			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
> -			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
> -			VCHIQ_MSG_DSTPORT(msgid), size);
> +	dev_dbg(state->dev,
> +		"sync: Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d\n",
> +		msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
> +		&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
> +		VCHIQ_MSG_DSTPORT(msgid), size);
>
>   	remote_event_signal(&state->remote->sync_trigger);
>
> @@ -1298,11 +1297,11 @@ notify_bulks(struct vchiq_service *service, stru=
ct vchiq_bulk_queue *queue,
>   {
>   	int status =3D 0;
>
> -	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
> -			"%d: nb:%d %cx - p=3D%x rn=3D%x r=3D%x",
> -			service->state->id, service->localport,
> -			(queue =3D=3D &service->bulk_tx) ? 't' : 'r',
> -			queue->process, queue->remote_notify, queue->remove);
> +	dev_dbg(service->state->dev,
> +		"core: %d: nb:%d %cx - p=3D%x rn=3D%x r=3D%x\n",
> +		service->state->id, service->localport,
> +		(queue =3D=3D &service->bulk_tx) ? 't' : 'r',
> +		queue->process, queue->remote_notify, queue->remove);
>
>   	queue->remote_notify =3D queue->process;
>
> @@ -1425,11 +1424,11 @@ abort_outstanding_bulks(struct vchiq_service *se=
rvice,
>   {
>   	int is_tx =3D (queue =3D=3D &service->bulk_tx);
>
> -	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
> -			"%d: aob:%d %cx - li=3D%x ri=3D%x p=3D%x",
> -			service->state->id, service->localport,
> -			is_tx ? 't' : 'r', queue->local_insert,
> -			queue->remote_insert, queue->process);
> +	dev_dbg(service->state->dev,
> +		"core: %d: aob:%d %cx - li=3D%x ri=3D%x p=3D%x\n",
> +		service->state->id, service->localport,
> +		is_tx ? 't' : 'r', queue->local_insert,
> +		queue->remote_insert, queue->process);
>
>   	WARN_ON((int)(queue->local_insert - queue->process) < 0);
>   	WARN_ON((int)(queue->remote_insert - queue->process) < 0);
> @@ -1764,10 +1763,10 @@ parse_message(struct vchiq_state *state, struct =
vchiq_header *header)
>   					state->id, msg_type_str(type), header, remoteport,
>   					localport, bulk->actual, &bulk->data);
>
> -			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs:%d %cx li=3D%x ri=
=3D%x p=3D%x",
> -					state->id, localport,
> -					(type =3D=3D VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
> -					queue->local_insert, queue->remote_insert, queue->process);
> +			dev_dbg(state->dev, "core: %d: prs:%d %cx li=3D%x ri=3D%x p=3D%x\n",
> +				state->id, localport,
> +				(type =3D=3D VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
> +				queue->local_insert, queue->remote_insert, queue->process);
>
>   			DEBUG_TRACE(PARSE_LINE);
>   			WARN_ON(queue->process =3D=3D queue->local_insert);
> @@ -1780,13 +1779,13 @@ parse_message(struct vchiq_state *state, struct =
vchiq_header *header)
>   		}
>   		break;
>   	case VCHIQ_MSG_PADDING:
> -		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PADDING@%pK,%x",
> -				state->id, header, size);
> +		dev_dbg(state->dev, "core: %d: prs PADDING@%pK,%x\n",
> +			state->id, header, size);
>   		break;
>   	case VCHIQ_MSG_PAUSE:
>   		/* If initiated, signal the application thread */
> -		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
> -				state->id, header, size);
> +		dev_dbg(state->dev, "core: %d: prs PAUSE@%pK,%x\n",
> +			state->id, header, size);
>   		if (state->conn_state =3D=3D VCHIQ_CONNSTATE_PAUSED) {
>   			dev_err(state->dev, "core: %d: PAUSE received in state PAUSED\n",
>   				state->id);
> @@ -1802,8 +1801,8 @@ parse_message(struct vchiq_state *state, struct vc=
hiq_header *header)
>   		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
>   		break;
>   	case VCHIQ_MSG_RESUME:
> -		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs RESUME@%pK,%x",
> -				state->id, header, size);
> +		dev_dbg(state->dev, "core: %d: prs RESUME@%pK,%x\n",
> +			state->id, header, size);
>   		/* Release the slot mutex */
>   		mutex_unlock(&state->slot_mutex);
>   		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
> @@ -2040,10 +2039,8 @@ sync_func(void *v)
>
>   		svc_fourcc =3D service->base.fourcc;
>
> -		vchiq_log_trace(state->dev, VCHIQ_SYNC,
> -				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
> -				msg_type_str(type), &svc_fourcc,
> -				remoteport, localport, size);
> +		dev_dbg(state->dev, "sync: Rcvd Msg %s from %p4cc s:%d d:%d len:%d\n"=
,
> +			msg_type_str(type), &svc_fourcc, remoteport, localport, size);
>   		if (size > 0)
>   			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, siz=
e));
>
> @@ -2068,8 +2065,8 @@ sync_func(void *v)
>   			break;
>
>   		case VCHIQ_MSG_DATA:
> -			vchiq_log_trace(state->dev, VCHIQ_SYNC, "%d: sf DATA@%pK,%x (%d->%d)=
",
> -					state->id, header, size, remoteport, localport);
> +			dev_dbg(state->dev, "sync: %d: sf DATA@%pK,%x (%d->%d)\n",
> +				state->id, header, size, remoteport, localport);
>
>   			if ((service->remoteport =3D=3D remoteport) &&
>   			    (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPENSYNC)) {
> @@ -3111,9 +3108,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *ins=
tance, unsigned int handle,
>   	mutex_unlock(&state->slot_mutex);
>   	mutex_unlock(&service->bulk_mutex);
>
> -	vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: bt:%d %cx li=3D%x ri=3D%x=
 p=3D%x",
> -			state->id, service->localport, dir_char, queue->local_insert,
> -			queue->remote_insert, queue->process);
> +	dev_dbg(state->dev, "core: %d: bt:%d %cx li=3D%x ri=3D%x p=3D%x\n",
> +		state->id, service->localport, dir_char, queue->local_insert,
> +		queue->remote_insert, queue->process);
>
>   waiting:
>   	vchiq_service_put(service);
> @@ -3579,9 +3576,9 @@ void vchiq_log_dump_mem(struct device *dev, const =
char *label, u32 addr,
>   		*s++ =3D '\0';
>
>   		if (label && (*label !=3D '\0'))
> -			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_b=
uf);
> +			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
>   		else
> -			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_b=
uf);
> +			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
This looks like a open-coded version of a hexdump. AFAIR the kernel
already has such logging functions.

Best regards

