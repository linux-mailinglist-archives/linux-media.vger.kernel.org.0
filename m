Return-Path: <linux-media+bounces-1945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62A80A411
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 924E71C20CEE
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0397F1C694;
	Fri,  8 Dec 2023 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QDGgSb6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE021710
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702040407; x=1702645207; i=wahrenst@gmx.net;
	bh=J8K9qk1OTdH/R0CYFP8yDSZPTGbI2XYwMc2Z/jEk66Q=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=QDGgSb6etPmn5C6GRW7Mr4fXYY+1r6pfkOLky6SL594IY9d6Zc9zPiytacNyW2Ke
	 82Cy59Pxt+4oRNNbOOiAotYAFXGYbaz5t8RTVWQahlccAsETFPhb08Xl0ywTcFsre
	 rdeqgF2pC6QzCB3WZYe4w2nTrOpb97iyHPQNEcNQaFMZip6T22VrDMgjUQl9+4Q2F
	 I8VDCDjUgfxERddzMTAy/K3EDbJ5dKsl7+p12FKr7jw86+2JELfjytO0luTY247Mz
	 OxYE+zDSWGBwPGm1N3eu5NpBM2T2sxgeBNJqK/l6goz+84iM0Msd2orxd6RK6XxS4
	 ibOLdnypAzq8HTmb7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJmF-1rWueb3kw7-00nN2h; Fri, 08
 Dec 2023 14:00:06 +0100
Message-ID: <21f30b11-6695-4540-80b7-5f7b9b4325b2@gmx.net>
Date: Fri, 8 Dec 2023 14:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] staging: vc04_services: Drop vchiq_log_debug() in
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
 <20231205084157.73819-5-umang.jain@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231205084157.73819-5-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mjY3vhVKfFYG1ICi74dRg/R2OPuX1wOM8eFOZgHfa2Z1awxqw0S
 2haNP5DvuwJnGzgKVBvgaYybhQuVVtBJCoDyy/wLv3Ra4uHCyc17KDdUjX6q6e9D6O7Iy65
 K4w6h6QOGePSoY1iF9FgZ4i/RXJv6Jdshgp1ZULrZg7BCmjkZ0HrgOb95hE4WDTwWyfQesS
 3evaQ6XkpZg2IxeMrDDPg==
UI-OutboundReport: notjunk:1;M01:P0:wWRmkxh5qlk=;iL/20aLk7MXaMctWI/G2oZOQTL0
 XbKTDdUfG44BE5kAdr7Daoifjxcsx719khOhpmV2g2pLR4saT9GITk56HebJ0Y6iPQr8K6CSt
 ymAX97NTJ1Q8ZniYWrKYDN5z8M1tpmth19+0WWmklne0iNp2v75mAcAubCMyHzyzu7KLbVofY
 w0X9PSFv7ZhQ5ec2lhbTdNzzuyysHYAO0gNl3lsjVZ+NwXW3Mx7iry5pDpz2EmCiHIA3eIZFj
 orVu4VWGiybeoGJVCjdJLL4QOGwIQLJhmflN7+iTLCqvB19r5vIKj9OcajnqUKvgCpOWmsZf5
 EJZqPWt4dzd+VKMUWeKXViMb7CBxHK3pXL5TG3+bZjevatccu+Ht5qyEymFpXpwX8tmWH54nY
 cQhAwn1C5sr1MCI27TBlNamvJQZJQnDDiXaXNKPWWKlC21BoRa7gbaEKZbJWU7kRseh5FB9mo
 wdT/clcRHbqiWINDucDHM9eHPBc02oilEazpdC93PsKicL97ZEF5YYMoJPDLiKra2xRxbLFeo
 Tlwm0Z0mb/ZyX67crJlsdY5oeKUAGVyEqQbUH7NJ/uzodUFC564s0IRQI3xCrGw7MFmwmCNnR
 Hs7TA+FvSU7xxzUKS8mZ42CIl25p0/q53NeJuh4E1h3IXl4Qr4eFjsnew0d0vZy2hMb3i5yWG
 AQSYdIa94KCaT20kJxAUVVJaz32gtzXxsBeJa+37DiH+/RKijsjW/WrOzYkJ3bW+PwY8iPlM4
 tOl+EMhU6fnMR+Yz9ipTttbm7EsHJO+3Z0BI2YIntNo3qn017yK8aKrz95gVU8qlnK/vIyluT
 GOgBeTR0MFzE2blpWkhy/F9qTnFik/TpB5Y9IQsAhGwZvB+fEzKbqAqU+FqPfHTPr3kpgvAzO
 UKH9ztSf03VyzllpBCFo9FbOavh/YDclPMIOo0HDjgnPYl3uIik3gkZB28i648oLkQ9GC3TAP
 qCVtyDxriZM/rBebJqueqNkSy5g=

Hi Umang,

Am 05.12.23 um 09:41 schrieb Umang Jain:
> Drop vchiq_log_debug() macro which wraps dev_dbg(). Introduce the usage
> of dev_dbg() directly.
>
> Meanwhile at it, drop the usage of __func__ from the logs.
> Dynamic debug supports this via the 'f'  decorator flag.
>
> Remove the entry from TODO regarding custom logging. VC04 is now
> aligned according to the standard kernel logging mechanisms.
personally i would have mentioned that this patch also drop the now
unused logging categories. Except of this i'm fine with the patch.

Possibled future improvements are mentioned below
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TODO  |   5 -
>   .../interface/vchiq_arm/vchiq_arm.c           |  45 +++--
>   .../interface/vchiq_arm/vchiq_core.c          | 159 ++++++++----------
>   .../interface/vchiq_arm/vchiq_core.h          |  26 ---
>   .../interface/vchiq_arm/vchiq_dev.c           |  32 ++--
>   5 files changed, 106 insertions(+), 161 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index 6d9d4a800aa7..05eb5140d096 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -23,11 +23,6 @@ should properly handle a module unload. This also inc=
ludes that all
>   resources must be freed (kthreads, debugfs entries, ...) and global
>   variables avoided.
>
> -* Cleanup logging mechanism
> -
> -The driver should probably be using the standard kernel logging mechani=
sms
> -such as dev_info, dev_dbg, and friends.
> -
>   * Documentation
>
>   A short top-down description of this driver's architecture (function o=
f
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index e337b8387647..4b4ff469d3a3 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -310,9 +310,8 @@ create_pagelist(struct vchiq_instance *instance, cha=
r *buf, char __user *ubuf,
>   						   type =3D=3D PAGELIST_READ, pages);
>
>   		if (actual_pages !=3D num_pages) {
> -			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -					"%s - only %d/%d pages locked",
> -					__func__, actual_pages, num_pages);
> +			dev_dbg(instance->state->dev, "arm: Only %d/%d pages locked\n",
> +				actual_pages, num_pages);
>
>   			/* This is probably due to the process being killed */
>   			if (actual_pages > 0)
> @@ -554,8 +553,8 @@ static int vchiq_platform_init(struct platform_devic=
e *pdev, struct vchiq_state
>   		return -ENXIO;
>   	}
>
> -	vchiq_log_debug(&pdev->dev, VCHIQ_ARM, "vchiq_init - done (slots %pK, =
phys %pad)",
> -			vchiq_slot_zero, &slot_phys);
> +	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
> +		vchiq_slot_zero, &slot_phys);
>
>   	vchiq_call_connected_callbacks();
>
> @@ -719,9 +718,9 @@ void free_bulk_waiter(struct vchiq_instance *instanc=
e)
>   	list_for_each_entry_safe(waiter, next,
>   				 &instance->bulk_waiter_list, list) {
>   		list_del(&waiter->list);
> -		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -				"bulk_waiter - cleaned up %pK for pid %d",
> -				waiter, waiter->pid);
> +		dev_dbg(instance->state->dev,
> +			"arm: bulk_waiter - cleaned up %pK for pid %d\n",
> +			waiter, waiter->pid);
>   		kfree(waiter);
>   	}
>   }
> @@ -981,9 +980,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *=
instance, unsigned int handl
>   		mutex_lock(&instance->bulk_waiter_list_mutex);
>   		list_add(&waiter->list, &instance->bulk_waiter_list);
>   		mutex_unlock(&instance->bulk_waiter_list_mutex);
> -		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -				"saved bulk_waiter %pK for pid %d", waiter,
> -				current->pid);
> +		dev_dbg(instance->state->dev, "arm: saved bulk_waiter %pK for pid %d\=
n",
> +			waiter, current->pid);
>   	}
>
>   	return status;
> @@ -1006,12 +1004,10 @@ add_completion(struct vchiq_instance *instance, =
enum vchiq_reason reason,
>   		dev_dbg(instance->state->dev, "core: completion queue full\n");
>   		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
>   		if (wait_for_completion_interruptible(&instance->remove_event)) {
> -			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -					"service_callback interrupted");
> +			dev_dbg(instance->state->dev, "arm: service_callback interrupted\n")=
;
>   			return -EAGAIN;
>   		} else if (instance->closing) {
> -			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -					"service_callback closing");
> +			dev_dbg(instance->state->dev, "arm: service_callback closing\n");
>   			return 0;
>   		}
>   		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> @@ -1113,8 +1109,8 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
>   				instance->completion_remove) < 0) {
>   				int status;
>
> -				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -						"Inserting extra MESSAGE_AVAILABLE");
> +				dev_dbg(instance->state->dev,
> +					"arm: Inserting extra MESSAGE_AVAILABLE\n");
>   				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>   				status =3D add_completion(instance, reason, NULL, user_service,
>   							bulk_userdata);
> @@ -1127,14 +1123,12 @@ service_callback(struct vchiq_instance *instance=
, enum vchiq_reason reason,
>
>   			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>   			if (wait_for_completion_interruptible(&user_service->remove_event))=
 {
> -				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -						"%s interrupted", __func__);
> +				dev_dbg(instance->state->dev, "arm: interrupted\n");
>   				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>   				vchiq_service_put(service);
>   				return -EAGAIN;
>   			} else if (instance->closing) {
> -				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
> -						"%s closing", __func__);
> +				dev_dbg(instance->state->dev, "arm: closing\n");
>   				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>   				vchiq_service_put(service);
>   				return -EINVAL;
> @@ -1686,8 +1680,8 @@ void vchiq_platform_conn_state_changed(struct vchi=
q_state *state,
>   	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(st=
ate);
>   	char threadname[16];
>
> -	vchiq_log_debug(state->dev, VCHIQ_SUSPEND, "%d: %s->%s", state->id,
> -			get_conn_state_name(oldstate), get_conn_state_name(newstate));
> +	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
> +		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstat=
e));
>   	if (state->conn_state !=3D VCHIQ_CONNSTATE_CONNECTED)
>   		return;
>
> @@ -1751,9 +1745,8 @@ static int vchiq_probe(struct platform_device *pde=
v)
>
>   	vchiq_debugfs_init();
>
> -	vchiq_log_debug(&pdev->dev, VCHIQ_ARM,
> -			"vchiq: platform initialised - version %d (min %d)",
> -			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
> +	dev_dbg(&pdev->dev, "arm: platform initialised - version %d (min %d)\n=
",
> +		VCHIQ_VERSION, VCHIQ_VERSION_MIN);
>
>   	/*
>   	 * Simply exit on error since the function handles cleanup in
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index d197e4504bd4..76c27778154a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -217,10 +217,10 @@ static const char *msg_type_str(unsigned int msg_t=
ype)
>   static inline void
>   set_service_state(struct vchiq_service *service, int newstate)
>   {
> -	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: srv:%d %s->%s",
> -			service->state->id, service->localport,
> -			srvstate_names[service->srvstate],
> -			srvstate_names[newstate]);
> +	dev_dbg(service->state->dev, "core: %d: srv:%d %s->%s\n",
> +		service->state->id, service->localport,
> +		srvstate_names[service->srvstate],
> +		srvstate_names[newstate]);
>   	service->srvstate =3D newstate;
>   }
>
> @@ -245,8 +245,7 @@ find_service_by_handle(struct vchiq_instance *instan=
ce, unsigned int handle)
>   		return service;
>   	}
>   	rcu_read_unlock();
> -	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
> -			"Invalid service handle 0x%x", handle);
> +	dev_dbg(instance->state->dev, "core: Invalid service handle 0x%x\n", h=
andle);
 From my PoV this is a real error, so maybe a WARN_ONCE. But looking
deeper at this shows that the error handling must be reworked first :-(

