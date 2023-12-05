Return-Path: <linux-media+bounces-1692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0D805EA8
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 20:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19607281FB5
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 19:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662346A336;
	Tue,  5 Dec 2023 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="stGJzJdn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D0DA5
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 11:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701804765; x=1702409565; i=wahrenst@gmx.net;
	bh=tzVTlWqho8OD/yE09J1CnFYsUEzmFcW5qDtwDxAyp0g=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=stGJzJdnJ8kw1uJLblAy9xhTwBol55TRjmS/tfw3Kj5FkWIY4QLGtE4VU1EgpNE4
	 m9OD9PLPHyqZfjNXaOnTkaEkz394H+6/ycqZ1oYDNHKAk6nI1ZPEapy+x8rDnxmI0
	 medt4rBPWSHvFnzNTGKOExmpNkvAWLld+lGmuJpLAZegnZyoUnBZhhSUgX9VzTrlv
	 OulGiXJek68Wkx6nSXczzVpuJBFCipE7nKo7qyZKCNwagbdELXCwQA05+OYlz69Wr
	 1sxHroMTfGzEqJZeGt3ObVz34iQD+IdqN7hs0HeyZ5UJQan8z0hG8sS+hjNJuMedy
	 u6+pj5WIC0PVoqYZTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1rWeDN1rX6-00vQm4; Tue, 05
 Dec 2023 20:32:45 +0100
Message-ID: <d6bf7115-dd15-43a0-b45a-41fc778ff160@gmx.net>
Date: Tue, 5 Dec 2023 20:32:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] staging: vc04_services: Drop vchiq_log_error() in
 favour of dev_err
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
 <20231205084157.73819-2-umang.jain@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231205084157.73819-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MDAKMaw3TTndClCtE11Tc8MaCHj0bCG+fJpa+ULwLPg7TaILwt/
 2L1iRpqj/Grk7c4lJVA5glWbFczS4PmAFxRuuM0CPiL3LWtFj1Noeb39dR6ZH4R3edxLmRW
 3S3A2apg/BDUYZyVvOhZgHd0foI8E9dcjJzGyUOoxadWK3ER0tuNtBZ3Cu/r0n1WDq90IW9
 PI5JNNd2QE5zez3BAeYCQ==
UI-OutboundReport: notjunk:1;M01:P0:PnESvkf7zTw=;CJSASxsLBbrs9BOEcaJwyQqxmFE
 IMfMgJ+H5cAZC/c0ryyXmi53U/SdgggrdkXL/F13IzxrIUEgCoAkKUFCZiTIfjdFgVvWXajI9
 Z3XAA/iMXYNUA8SGregB2WZnsz55bblnusvkK2+M0gLpjHD4Iy1IMbMyeu/47fw37Y2ZfnzLV
 HgISTefEnY2zmGtufaE9e5sUZfSEBK05UdCe05I2EAHy6AnSBacSg2QMrAk8v3L3aytRIzayc
 WmZM7zVZQ31Xukq/VzVPhMNuycOuoo/A2JtDPZqhHnUpOjSlivH9l9TiOw3qaFKUvBHL4o4qP
 GFXzQ6nfUTVOtNQuPviirBxLIXKfOGuO3R5FC9FNKh4yCk8FnFTwg3R1bWHFdLu9woiI1RzAD
 w/TYYqSGAuUdXFDdSrbWligduqQg6xDndtNALjWckALc9foU7oXEwwyHkv3h9a2Z6sTC2bHVm
 AHoGMF/oeCGUu/ZUACXZRw+pYWviqRR9EOYa01IEJRaEy/y3tXc8zZtYg2QEnM2OldlLj55nO
 5l+IlTJcKeAKv5UICvqNdUwkxLPbDKvmbWvM/RErV5cVzmIlhzKC5QygsctKIq6Zx5DauUwO6
 hSz3585fE8sEUTUAT1gX1Flldb+jRBSIpJXwycCmJue8YfZBiLpESkDnxUTK5KS8uVU8Ag3j6
 o+k3NCNZXvDxMH8XJNNxALSPiZC5z3G2XNEMQo2gLOEeF8gAqPbBurSdPh2AmBCGmD+wtnK+O
 1Gi+MCUo5rhcykqdIBuExTxZP1DVly3rWojRcdfmX94u7MliS/FPTjIpLPRXe7PNAhK8DubYT
 U/crTP7RUKqehM41ImNBvE4UfeSeSyeXLQRTBuRN8R9iaCVeRtTPXJCNU2a+0gb4WCLIi6/7D
 8QiCP6hRN5JakdCJ6EXKpBuQEidg28mUr36qHCqrKezpmAG46qnFRrmO0WXyHTm4+w1Rqz0Kk
 5urZs9KWjcKxbON88ZuMMKjSXtY=

Hi Umang,

Am 05.12.23 um 09:41 schrieb Umang Jain:
> Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usage
> of dev_err() directly.
sorry, i missed to review the last change. So the change won't be that
trivial.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           |  50 ++++----
>   .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
>   .../interface/vchiq_arm/vchiq_core.c          | 113 +++++++++---------
>   .../interface/vchiq_arm/vchiq_core.h          |   4 -
>   .../interface/vchiq_arm/vchiq_dev.c           |  45 ++++---
>   5 files changed, 101 insertions(+), 117 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 7978fb6dc4fb..b403400edd8e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -683,8 +683,7 @@ int vchiq_initialise(struct vchiq_instance **instanc=
e_out)
>   		usleep_range(500, 600);
>   	}
>   	if (i =3D=3D VCHIQ_INIT_RETRIES) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialize=
d\n",
> -				__func__);
> +		dev_err(state->dev, "core: %s: Videocore not initialized\n", __func__=
);
>   		ret =3D -ENOTCONN;
>   		goto failed;
>   	} else if (i > 0) {
> @@ -694,8 +693,7 @@ int vchiq_initialise(struct vchiq_instance **instanc=
e_out)
>
>   	instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
>   	if (!instance) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE,
> -				"%s: error allocating vchiq instance\n", __func__);
> +		dev_err(state->dev, "core: %s: Cannot allocate vchiq instance\n", __f=
unc__);
please drop because kzalloc already report such errors
>   		ret =3D -ENOMEM;
>   		goto failed;
>   	}
> @@ -967,8 +965,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *=
instance, unsigned int handl
>   	} else {
>   		waiter =3D kzalloc(sizeof(*waiter), GFP_KERNEL);
>   		if (!waiter) {
> -			vchiq_log_error(service->state->dev, VCHIQ_CORE,
> -					"%s - out of memory", __func__);
> +			dev_err(service->state->dev, "core: %s: - Out of memory\n", __func__=
);
ditto
>   			return -ENOMEM;
>   		}
>   	}
> @@ -1290,8 +1287,8 @@ vchiq_keepalive_vchiq_callback(struct vchiq_instan=
ce *instance,
>   			       struct vchiq_header *header,
>   			       unsigned int service_user, void *bulk_user)
>   {
> -	vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
> -			"%s callback reason %d", __func__, reason);
> +	dev_err(instance->state->dev, "suspend: %s: callback reason %d\n",
> +		__func__, reason);
>   	return 0;
>   }
>
> @@ -1315,22 +1312,20 @@ vchiq_keepalive_thread_func(void *v)
>
>   	ret =3D vchiq_initialise(&instance);
>   	if (ret) {
> -		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -				"%s vchiq_initialise failed %d", __func__, ret);
> +		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __fu=
nc__, ret);
>   		goto exit;
>   	}
>
>   	status =3D vchiq_connect(instance);
>   	if (status) {
> -		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -				"%s vchiq_connect failed %d", __func__, status);
> +		dev_err(state->dev, "suspend: %s: vchiq_connect failed %d\n", __func_=
_, status);
>   		goto shutdown;
>   	}
>
>   	status =3D vchiq_add_service(instance, &params, &ka_handle);
>   	if (status) {
> -		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -				"%s vchiq_open_service failed %d", __func__, status);
> +		dev_err(state->dev, "suspend: %s: vchiq_open_service failed %d\n",
> +			__func__, status);
>   		goto shutdown;
>   	}
>
> @@ -1338,8 +1333,7 @@ vchiq_keepalive_thread_func(void *v)
>   		long rc =3D 0, uc =3D 0;
>
>   		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
> -			vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -					"%s interrupted", __func__);
> +			dev_err(state->dev, "suspend: %s: interrupted\n", __func__);
I think this isn't an error and we should use dev_dbg here.
>   			flush_signals(current);
>   			continue;
>   		}
> @@ -1359,16 +1353,15 @@ vchiq_keepalive_thread_func(void *v)
>   			atomic_inc(&arm_state->ka_use_ack_count);
>   			status =3D vchiq_use_service(instance, ka_handle);
>   			if (status) {
> -				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -						"%s vchiq_use_service error %d", __func__, status);
> +				dev_err(state->dev, "suspend: %s: vchiq_use_service error %d\n",
> +					__func__, status);
>   			}
>   		}
>   		while (rc--) {
>   			status =3D vchiq_release_service(instance, ka_handle);
>   			if (status) {
> -				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -						"%s vchiq_release_service error %d", __func__,
> -						status);
> +				dev_err(state->dev, "suspend: %s: vchiq_release_service error %d\n"=
,
> +					__func__, status);
>   			}
>   		}
>   	}
> @@ -1403,7 +1396,7 @@ vchiq_use_internal(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   			 service->client_id);
>   		entity_uc =3D &service->service_use_count;
>   	} else {
> -		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __f=
unc__);
> +		dev_err(state->dev, "suspend: %s: null service ptr\n", __func__);
Instead of dev_err() i would suggest a WARN() here
>   		ret =3D -EINVAL;
>   		goto out;
>   	}
> @@ -1686,10 +1679,10 @@ vchiq_check_service(struct vchiq_service *servic=
e)
>   	read_unlock_bh(&arm_state->susp_res_lock);
>
>   	if (ret) {
> -		vchiq_log_error(service->state->dev, VCHIQ_SUSPEND,
> -				"%s ERROR - %p4cc:%d service count %d, state count %d", __func__,
> -				&service->base.fourcc, service->client_id,
> -				service->service_use_count, arm_state->videocore_use_count);
> +		dev_err(service->state->dev,
> +			"suspend: %s:  %p4cc:%d service count %d, state count %d\n",
> +			__func__, &service->base.fourcc, service->client_id,
> +			service->service_use_count, arm_state->videocore_use_count);
>   		vchiq_dump_service_use_state(service->state);
>   	}
>   out:
> @@ -1722,9 +1715,8 @@ void vchiq_platform_conn_state_changed(struct vchi=
q_state *state,
>   					      (void *)state,
>   					      threadname);
>   	if (IS_ERR(arm_state->ka_thread)) {
> -		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
> -				"vchiq: FATAL: couldn't create thread %s",
> -				threadname);
> +		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
> +			threadname);
>   	} else {
>   		wake_up_process(arm_state->ka_thread);
>   	}
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_con=
nected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connect=
ed.c
> index 21f9fa1a1713..3cad13f09e37 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.=
c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.=
c
> @@ -39,9 +39,9 @@ void vchiq_add_connected_callback(struct vchiq_device =
*device, void (*callback)(
>   		callback();
>   	} else {
>   		if (g_num_deferred_callbacks >=3D MAX_CALLBACKS) {
> -			vchiq_log_error(&device->dev, VCHIQ_CORE,
> -					"There already %d callback registered - please increase MAX_CALLBA=
CKS",
> -					g_num_deferred_callbacks);
> +			dev_err(&device->dev,
> +				"core: There already %d callback registered - please increase MAX_C=
ALLBACKS\n",
> +				g_num_deferred_callbacks);
>   		} else {
>   			g_deferred_callback[g_num_deferred_callbacks] =3D
>   				callback;
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e0022acb4c58..63f412815a32 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -741,10 +741,10 @@ process_free_data_message(struct vchiq_state *stat=
e, u32 *service_found,
>   		 */
>   		complete(&quota->quota_event);
>   	} else if (count =3D=3D 0) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE,
> -				"service %d message_use_count=3D%d (header %pK, msgid %x, header->m=
sgid %x, header->size %x)",
> -				port, quota->message_use_count, header, msgid, header->msgid,
> -				header->size);
> +		dev_err(state->dev,
> +			"core: service %d message_use_count=3D%d (header %pK, msgid %x, head=
er->msgid %x, header->size %x)\n",
> +			port, quota->message_use_count, header, msgid,
> +			header->msgid, header->size);
>   		WARN(1, "invalid message use count\n");
>   	}
>   	if (!BITSET_IS_SET(service_found, port)) {
> @@ -766,9 +766,9 @@ process_free_data_message(struct vchiq_state *state,=
 u32 *service_found,
>   			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_u=
se->%d",
>   					state->id, port, header->size, header, count - 1);
>   		} else {
> -			vchiq_log_error(state->dev, VCHIQ_CORE,
> -					"service %d slot_use_count=3D%d (header %pK, msgid %x, header->msg=
id %x, header->size %x)",
> -					port, count, header, msgid, header->msgid, header->size);
> +			dev_err(state->dev,
> +				"core: service %d slot_use_count=3D%d (header %pK, msgid %x, header=
->msgid %x, header->size %x)\n",
> +				port, count, header, msgid, header->msgid, header->size);
>   			WARN(1, "bad slot use count\n");
>   		}
>   	}
> @@ -831,9 +831,9 @@ process_free_queue(struct vchiq_state *state, u32 *s=
ervice_found,
>
>   			pos +=3D calc_stride(header->size);
>   			if (pos > VCHIQ_SLOT_SIZE) {
> -				vchiq_log_error(state->dev, VCHIQ_CORE,
> -						"pfq - pos %x: header %pK, msgid %x, header->msgid %x, header->si=
ze %x",
> -						pos, header, msgid, header->msgid, header->size);
> +				dev_err(state->dev,
> +					"core: pfq - pos %x: header %pK, msgid %x, header->msgid %x, heade=
r->size %x\n",
> +					pos, header, msgid, header->msgid, header->size);
>   				WARN(1, "invalid slot position\n");
>   			}
>   		}
> @@ -1167,8 +1167,8 @@ queue_message_sync(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   		int oldmsgid =3D header->msgid;
>
>   		if (oldmsgid !=3D VCHIQ_MSGID_PADDING)
> -			vchiq_log_error(state->dev, VCHIQ_CORE, "%d: qms - msgid %x, not PAD=
DING",
> -					state->id, oldmsgid);
> +			dev_err(state->dev, "core: %d: qms - msgid %x, not PADDING\n",
> +				state->id, oldmsgid);
>   	}
>
>   	vchiq_log_debug(state->dev, VCHIQ_SYNC,
> @@ -1616,10 +1616,10 @@ parse_message(struct vchiq_state *state, struct =
vchiq_header *header)
>   		}
>
>   		if (!service) {
> -			vchiq_log_error(state->dev, VCHIQ_CORE,
> -					"%d: prs %s@%pK (%d->%d) - invalid/closed service %d",
> -					state->id, msg_type_str(type), header, remoteport,
> -					localport, localport);
> +			dev_err(state->dev,
> +				"core: %d: prs %s@%pK (%d->%d) - invalid/closed service %d\n",
> +				state->id, msg_type_str(type), header, remoteport,
> +				localport, localport);
>   			goto skip_message;
>   		}
>   		break;
> @@ -1640,9 +1640,8 @@ parse_message(struct vchiq_state *state, struct vc=
hiq_header *header)
>
>   	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
>   	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE,
> -				"header %pK (msgid %x) - size %x too big for slot",
> -				header, (unsigned int)msgid, (unsigned int)size);
> +		dev_err(state->dev, "core: header %pK (msgid %x) - size %x too big fo=
r slot\n",
> +			header, (unsigned int)msgid, (unsigned int)size);
>   		WARN(1, "oversized for slot\n");
>   	}
>
> @@ -1668,8 +1667,8 @@ parse_message(struct vchiq_state *state, struct vc=
hiq_header *header)
>   			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
>   			complete(&service->remove_event);
>   		} else {
> -			vchiq_log_error(state->dev, VCHIQ_CORE, "OPENACK received in state %=
s",
> -					srvstate_names[service->srvstate]);
> +			dev_err(state->dev, "core: OPENACK received in state %s\n",
> +				srvstate_names[service->srvstate]);
>   		}
>   		break;
>   	case VCHIQ_MSG_CLOSE:
> @@ -1740,11 +1739,10 @@ parse_message(struct vchiq_state *state, struct =
vchiq_header *header)
>   			}
>   			if ((int)(queue->remote_insert -
>   				queue->local_insert) >=3D 0) {
> -				vchiq_log_error(state->dev, VCHIQ_CORE,
> -						"%d: prs %s@%pK (%d->%d) unexpected (ri=3D%d,li=3D%d)",
> -						state->id, msg_type_str(type), header, remoteport,
> -						localport, queue->remote_insert,
> -						queue->local_insert);
> +				dev_err(state->dev,
> +					"core: %d: prs %s@%pK (%d->%d) unexpected (ri=3D%d,li=3D%d)\n",
> +					state->id, msg_type_str(type), header, remoteport,
> +					localport, queue->remote_insert, queue->local_insert);
>   				mutex_unlock(&service->bulk_mutex);
>   				break;
>   			}
> @@ -1790,8 +1788,8 @@ parse_message(struct vchiq_state *state, struct vc=
hiq_header *header)
>   		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
>   				state->id, header, size);
>   		if (state->conn_state =3D=3D VCHIQ_CONNSTATE_PAUSED) {
> -			vchiq_log_error(state->dev, VCHIQ_CORE,
> -					"%d: PAUSE received in state PAUSED", state->id);
> +			dev_err(state->dev, "core: %d: PAUSE received in state PAUSED\n",
> +				state->id);
>   			break;
>   		}
>   		if (state->conn_state !=3D VCHIQ_CONNSTATE_PAUSE_SENT) {
> @@ -1821,8 +1819,8 @@ parse_message(struct vchiq_state *state, struct vc=
hiq_header *header)
>   		break;
>
>   	default:
> -		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: prs invalid msgid %x@%pK=
,%x",
> -				state->id, msgid, header, size);
> +		dev_err(state->dev, "core: %d: prs invalid msgid %x@%pK,%x\n",
> +			state->id, msgid, header, size);
>   		WARN(1, "invalid message\n");
>   		break;
>   	}
> @@ -1932,7 +1930,7 @@ handle_poll(struct vchiq_state *state)
>   			 * since the PAUSE should have flushed
>   			 * through outstanding messages.
>   			 */
> -			vchiq_log_error(state->dev, VCHIQ_CORE, "Failed to send RESUME messa=
ge");
> +			dev_err(state->dev, "core: Failed to send RESUME message\n");
>   		}
>   		break;
>   	default:
> @@ -2032,10 +2030,10 @@ sync_func(void *v)
>   		service =3D find_service_by_port(state, localport);
>
>   		if (!service) {
> -			vchiq_log_error(state->dev, VCHIQ_SYNC,
> -					"%d: sf %s@%pK (%d->%d) - invalid/closed service %d",
> -					state->id, msg_type_str(type), header,
> -					remoteport, localport, localport);
> +			dev_err(state->dev,
> +				"sync: %d: sf %s@%pK (%d->%d) - invalid/closed service %d\n",
> +				state->id, msg_type_str(type), header, remoteport,
> +				localport, localport);
>   			release_message_sync(state, header);
>   			continue;
>   		}
> @@ -2077,15 +2075,15 @@ sync_func(void *v)
>   			    (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPENSYNC)) {
>   				if (make_service_callback(service, VCHIQ_MESSAGE_AVAILABLE, header=
,
>   							  NULL) =3D=3D -EAGAIN)
> -					vchiq_log_error(state->dev, VCHIQ_SYNC,
> -							"synchronous callback to service %d returns -EAGAIN",
> -							localport);
> +					dev_err(state->dev,
> +						"sync: error: synchronous callback to service %d returns -EAGAIN\=
n",
> +						localport);
>   			}
>   			break;
>
>   		default:
> -			vchiq_log_error(state->dev, VCHIQ_SYNC, "%d: sf unexpected msgid %x@=
%pK,%x",
> -					state->id, msgid, header, size);
> +			dev_err(state->dev, "sync: error: %d: sf unexpected msgid %x@%pK,%x\=
n",
> +				state->id, msgid, header, size);
>   			release_message_sync(state, header);
>   			break;
>   		}
> @@ -2118,8 +2116,8 @@ vchiq_init_slots(struct device *dev, void *mem_bas=
e, int mem_size)
>   	num_slots -=3D first_data_slot;
>
>   	if (num_slots < 4) {
> -		vchiq_log_error(dev, VCHIQ_CORE, "%s - insufficient memory %x bytes",
> -				__func__, mem_size);
> +		dev_err(dev, "core: %s: Insufficient memory %x bytes\n",
> +			__func__, mem_size);
>   		return NULL;
>   	}
>
> @@ -2500,11 +2498,10 @@ vchiq_open_service_internal(struct vchiq_service=
 *service, int client_id)
>   	} else if ((service->srvstate !=3D VCHIQ_SRVSTATE_OPEN) &&
>   		   (service->srvstate !=3D VCHIQ_SRVSTATE_OPENSYNC)) {
>   		if (service->srvstate !=3D VCHIQ_SRVSTATE_CLOSEWAIT)
> -			vchiq_log_error(service->state->dev, VCHIQ_CORE,
> -					"%d: osi - srvstate =3D %s (ref %u)",
> -					service->state->id,
> -					srvstate_names[service->srvstate],
> -					kref_read(&service->ref_count));
> +			dev_err(service->state->dev,
> +				"core: %d: osi - srvstate =3D %s (ref %u)\n",
> +				service->state->id, srvstate_names[service->srvstate],
> +				kref_read(&service->ref_count));
>   		status =3D -EINVAL;
>   		VCHIQ_SERVICE_STATS_INC(service, error_count);
>   		vchiq_release_service_internal(service);
> @@ -2565,9 +2562,9 @@ release_service_messages(struct vchiq_service *ser=
vice)
>   			}
>   			pos +=3D calc_stride(header->size);
>   			if (pos > VCHIQ_SLOT_SIZE) {
> -				vchiq_log_error(state->dev, VCHIQ_CORE,
> -						"fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->si=
ze %x",
> -						pos, header, msgid, header->msgid, header->size);
> +				dev_err(state->dev,
> +					"core: fsi - pos %x: header %pK, msgid %x, header->msgid %x, heade=
r->size %x\n",
> +					pos, header, msgid, header->msgid, header->size);
>   				WARN(1, "invalid slot position\n");
>   			}
>   		}
> @@ -2621,8 +2618,8 @@ close_service_complete(struct vchiq_service *servi=
ce, int failstate)
>   	case VCHIQ_SRVSTATE_LISTENING:
>   		break;
>   	default:
> -		vchiq_log_error(service->state->dev, VCHIQ_CORE, "%s(%x) called in st=
ate %s",
> -				__func__, service->handle, srvstate_names[service->srvstate]);
> +		dev_err(service->state->dev, "core: (%x) called in state %s\n",
> +			service->handle, srvstate_names[service->srvstate]);
>   		WARN(1, "%s in unexpected state\n", __func__);
>   		return -EINVAL;
>   	}
> @@ -2677,8 +2674,8 @@ vchiq_close_service_internal(struct vchiq_service =
*service, int close_recvd)
>   	case VCHIQ_SRVSTATE_LISTENING:
>   	case VCHIQ_SRVSTATE_CLOSEWAIT:
>   		if (close_recvd) {
> -			vchiq_log_error(state->dev, VCHIQ_CORE, "%s(1) called in state %s",
> -					__func__, srvstate_names[service->srvstate]);
> +			dev_err(state->dev, "core: (1) called in state %s\n",
> +				srvstate_names[service->srvstate]);
>   		} else if (is_server) {
>   			if (service->srvstate =3D=3D VCHIQ_SRVSTATE_LISTENING) {
>   				status =3D -EINVAL;
> @@ -2765,8 +2762,8 @@ vchiq_close_service_internal(struct vchiq_service =
*service, int close_recvd)
>   		break;
>
>   	default:
> -		vchiq_log_error(state->dev, VCHIQ_CORE, "%s(%d) called in state %s", =
__func__,
> -				close_recvd, srvstate_names[service->srvstate]);
> +		dev_err(state->dev, "core: (%d) called in state %s\n",
> +			close_recvd, srvstate_names[service->srvstate]);
>   		break;
>   	}
>
> @@ -2805,8 +2802,8 @@ vchiq_free_service_internal(struct vchiq_service *=
service)
>   	case VCHIQ_SRVSTATE_CLOSEWAIT:
>   		break;
>   	default:
> -		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: fsi - (%d) in state %s",=
 state->id,
> -				service->localport, srvstate_names[service->srvstate]);
> +		dev_err(state->dev, "core: %d: fsi - (%d) in state %s\n",
> +			state->id, service->localport, srvstate_names[service->srvstate]);
>   		return;
>   	}
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 564b5c707267..d7dcd17e4bff 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -53,10 +53,6 @@ static inline const char *log_category_str(enum vchiq=
_log_category c)
>   	return strings[c];
>   };
>
> -#ifndef vchiq_log_error
> -#define vchiq_log_error(dev, cat, fmt, ...) \
> -	do { dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##__VA_ARGS=
__); } while (0)
> -#endif
>   #ifndef vchiq_log_warning
>   #define vchiq_log_warning(dev, cat, fmt, ...) \
>   	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_A=
RGS__); } while (0)
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> index 307a2d76cbb7..ba287cb4c87b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -271,9 +271,9 @@ static int vchiq_ioc_dequeue_message(struct vchiq_in=
stance *instance,
>   			ret =3D -EFAULT;
>   		}
>   	} else {
> -		vchiq_log_error(service->state->dev, VCHIQ_ARM,
> -				"header %pK: bufsize %x < size %x",
> -				header, args->bufsize, header->size);
> +		dev_err(service->state->dev,
> +			"arm: header %pK: bufsize %x < size %x\n",
> +			header, args->bufsize, header->size);
>   		WARN(1, "invalid size\n");
>   		ret =3D -EMSGSIZE;
>   	}
> @@ -318,8 +318,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_i=
nstance *instance,
>   		}
>   		mutex_unlock(&instance->bulk_waiter_list_mutex);
>   		if (!waiter) {
> -			vchiq_log_error(service->state->dev, VCHIQ_ARM,
> -					"no bulk_waiter found for pid %d", current->pid);
> +			dev_err(service->state->dev,
> +				"arm: no bulk_waiter found for pid %d\n", current->pid);
>   			ret =3D -ESRCH;
>   			goto out;
>   		}
> @@ -501,10 +501,10 @@ static int vchiq_ioc_await_completion(struct vchiq=
_instance *instance,
>   			msglen =3D header->size + sizeof(struct vchiq_header);
>   			/* This must be a VCHIQ-style service */
>   			if (args->msgbufsize < msglen) {
> -				vchiq_log_error(service->state->dev, VCHIQ_ARM,
> -						"header %pK: msgbufsize %x < msglen %x",
> -						header, args->msgbufsize, msglen);
> -						WARN(1, "invalid message size\n");
> +				dev_err(service->state->dev,
> +					"arm: header %pK: msgbufsize %x < msglen %x\n",
> +					header, args->msgbufsize, msglen);
> +				WARN(1, "invalid message size\n");
>   				if (ret =3D=3D 0)
>   					ret =3D -EMSGSIZE;
>   				break;
> @@ -618,9 +618,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, uns=
igned long arg)
>   		}
>   		rc =3D mutex_lock_killable(&instance->state->mutex);
>   		if (rc) {
> -			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
> -					"vchiq: connect: could not lock mutex for state %d: %d",
> -					instance->state->id, rc);
> +			dev_err(instance->state->dev,
> +				"arm: vchiq: connect: could not lock mutex for state %d: %d\n",
> +				instance->state->id, rc);
I think this should be dev_dbg
>   			ret =3D -EINTR;
>   			break;
>   		}
> @@ -630,8 +630,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, uns=
igned long arg)
>   		if (!status)
>   			instance->connected =3D 1;
>   		else
> -			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
> -					"vchiq: could not connect: %d", status);
> +			dev_err(instance->state->dev,
> +				"arm: vchiq: could not connect: %d\n", status);
>   		break;
>
>   	case VCHIQ_IOC_CREATE_SERVICE: {
> @@ -700,13 +700,13 @@ vchiq_ioctl(struct file *file, unsigned int cmd, u=
nsigned long arg)
>   				vchiq_use_service_internal(service) :
>   				vchiq_release_service_internal(service);
>   			if (ret) {
> -				vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
> -						"%s: cmd %s returned error %ld for service %p4cc:%03d",
> -						__func__, (cmd =3D=3D VCHIQ_IOC_USE_SERVICE) ?
> -						"VCHIQ_IOC_USE_SERVICE" :
> -						"VCHIQ_IOC_RELEASE_SERVICE",
> -						ret, &service->base.fourcc,
> -						service->client_id);
> +				dev_err(instance->state->dev,
> +					"suspend: cmd %s returned error %ld for service %p4cc:%03d\n",
> +					(cmd =3D=3D VCHIQ_IOC_USE_SERVICE) ?
> +					"VCHIQ_IOC_USE_SERVICE" :
> +					"VCHIQ_IOC_RELEASE_SERVICE",
> +					ret, &service->base.fourcc,
> +					service->client_id);
>   			}
>   		} else {
>   			ret =3D -EINVAL;
> @@ -1173,8 +1173,7 @@ static int vchiq_open(struct inode *inode, struct =
file *file)
>   	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
>
>   	if (!state) {
> -		vchiq_log_error(state->dev, VCHIQ_ARM,
> -				"vchiq has no connection to VideoCore");
> +		dev_err(state->dev, "arm: vchiq has no connection to VideoCore\n");
>   		return -ENOTCONN;
>   	}
>


