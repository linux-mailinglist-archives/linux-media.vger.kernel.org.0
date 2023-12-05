Return-Path: <linux-media+bounces-1693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29306805EB1
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 20:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A9161F21656
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CEF6AB94;
	Tue,  5 Dec 2023 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ndjYTD/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9EE135
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701805059; x=1702409859; i=wahrenst@gmx.net;
	bh=uSqNzqEiDjK4KC1PHbda+YgTmvfPz7wepmRB/7L6lkY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ndjYTD/r7unWH5w/zObwe1/KXMiDR5c7dvYlEF7lElMmACIwGnjjbMaUQs49XOgg
	 Vjb0xSBAtD6brKExKwW2Z64q/imwI4JXNyk6Hsqg8g919FYbgt5FX+G/gRDMEJ9Ot
	 /4P6INx//1Vlv1WMASPCjjoV+iRhvavTS75QQfdNoPDwONLL1mM7bxGJN0TMUTajK
	 rJ/rcckY3zMLJGihwetOMIU2uSwF5dVE4MIu8/sRLp5SVWgj1HXIqjA0ZKeoI2O2X
	 EgwivJrFJgRplw4+CBb424iOGI3LD4IgoSzn1b/gFhRnH2nyHnMCSrqeQaTGJl+vh
	 nLDFP+YiHuAswu7FfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1qsNtZ2amY-00I9u6; Tue, 05
 Dec 2023 20:37:39 +0100
Message-ID: <cd08e69d-a54e-411d-bee9-5c827ed257ba@gmx.net>
Date: Tue, 5 Dec 2023 20:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] staging: vc04_services: Drop vchiq_log_warning()
 in favour of dev_warn
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
 <20231205084157.73819-3-umang.jain@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231205084157.73819-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gpb9oVl3QS8X1cnhoRMvZxP/epKwCnYcJEeylAG6jXTg+s66gTc
 plf98QlCHpkA+Yic3JpWWYyDeXWSO7EWuZhH7YHt44hDZsBI2Svqb5peAURM1Egi1V/oBxC
 RwGShiJ68mnADU/gexeyXZ+dGMyw64+RU3GywDm4LrorX/lPMyNdxq9mvZdCKa0fYnilrHG
 UnR3ZfKLkjzLi9TEzbreg==
UI-OutboundReport: notjunk:1;M01:P0:k+gnkTss+IQ=;x3xCfXDEv+iL4e3L/BHSQxTB5Q1
 nR49cq6S4hozUuD9e20qbjGn0pY2StCSIE5NCDPVo6zPK1ifwnaMRfMfSmi4Ngd4AJO7COoN6
 89SCj7jNnnnGBdrrSrK0KoY6uwMe71EZtIamrQeFrz9dkLGVTWUucO27LSZkXyVmRMgBjtkpH
 avrd8ZtWj1dG/ALgmDauF3iOD06jN0W7UllkpRYPv5X+iIzWteMEk2LXbD3cz4aja0vwqPnlS
 X0zuSknG4TAs9B2jKg3azkvcOFgymg+vYEjj55HyaSAvWf0lSykS+qHGzM7pRdfo1HdkWlk9W
 x7OdcywC+b+2ryxhQyjS6upZms+oFlcNw+jaN5a7cRh04RNgNke0fC6k4xCxeq/fBn6hJo4a+
 DWB0P8GhfoihoiBhQ7z5S5egiiVD3til+pXwitE0rI1N6XWtjxATMyQnidb2qb55dG/BCfIhz
 l5cWGJ/r/oSTCPqd7Y/z0A5LaFBdj/K7oLmGjTUfy2aRMPJwl6Lq63pMnNolRYeHcCoQWXWJM
 G+6ToSriSO+5RY91tAqlNXhHOcj+5hiR8K2Dmx0nx8OROrbpUhBObzeotiJqP+/m6NiOMSwqM
 4997VWyXuZC9gnC5nlRvsHAuHQax0zB1uZvrEYuXT9204Klkc+1ZDHkoJSA/X0PTvhmYvulUz
 +PzwowGmiE4o139d3YUvxkvW/XyFe746IBQ5Qaxq/h0acRJEYWqeBNTy7o84GxOT6txRWy83q
 nhbg9yOyW8/7sGHfDeyXY5iLhvpgQioGJKrzuAtJxmMrC5Jp14ve/AU82cKxsiVUyXlnMbdzv
 mS/Uzo1s9BwdF1j/BMw2+VKMc5UJog1JD1iw+yh4ctSt7prRGUZbV5ZbE96shFd8gYlQEWClA
 TLF7EJQxHG708f1shNh27n53YCR0jMTTpRy7bFtXuSVuUTU+umOSpq1IS81qCcJEu6tRVSH4u
 hxehsD33HgUIkCfF0oOCdD8dEfQ=

Hi Umang,

Am 05.12.23 um 09:41 schrieb Umang Jain:
> Drop vchiq_log_warning() macro which wraps dev_dbg(). Introduce the usag=
e
> of dev_warn() directly.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 30 +++++++++----------
>   .../interface/vchiq_arm/vchiq_core.c          | 30 +++++++++----------
>   .../interface/vchiq_arm/vchiq_core.h          |  4 ---
>   3 files changed, 29 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index b403400edd8e..56326b59a718 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -687,8 +687,8 @@ int vchiq_initialise(struct vchiq_instance **instanc=
e_out)
>   		ret =3D -ENOTCONN;
>   		goto failed;
>   	} else if (i > 0) {
> -		vchiq_log_warning(state->dev, VCHIQ_CORE,
> -				  "%s: videocore initialized after %d retries\n", __func__, i);
> +		dev_warn(state->dev, "core: %s: videocore initialized after %d retrie=
s\n",
> +			 __func__, i);
>   	}
>
>   	instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
> @@ -1644,20 +1644,19 @@ vchiq_dump_service_use_state(struct vchiq_state =
*state)
>   	read_unlock_bh(&arm_state->susp_res_lock);
>
>   	if (only_nonzero)
> -		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
> -				  "Too many active services (%d). Only dumping up to first %d servi=
ces with non-zero use-count",
> -				  active_services, found);
> +		dev_warn(state->dev,
> +			 "suspend: Too many active services (%d). Only dumping up to first %=
d services with non-zero use-count\n",
> +			 active_services, found);
>
>   	for (i =3D 0; i < found; i++) {
> -		vchiq_log_warning(state->dev, VCHIQ_SUSPEND,
> -				  "%p4cc:%d service count %d %s",
> -				  &service_data[i].fourcc,
> -				  service_data[i].clientid, service_data[i].use_count,
> -				  service_data[i].use_count ? nz : "");
> +		dev_warn(state->dev,
> +			 "suspend: %p4cc:%d service count %d %s\n",
> +			 &service_data[i].fourcc,
> +			 service_data[i].clientid, service_data[i].use_count,
> +			 service_data[i].use_count ? nz : "");
>   	}
> -	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "VCHIQ use count %d", pee=
r_count);
> -	vchiq_log_warning(state->dev, VCHIQ_SUSPEND, "Overall vchiq instance u=
se count %d",
> -			  vc_use_count);
> +	dev_warn(state->dev, "suspend: VCHIQ use count %d\n", peer_count);
> +	dev_warn(state->dev, "suspend: Overall vchiq instance use count %d\n",=
 vc_use_count);
>
>   	kfree(service_data);
>   }
> @@ -1771,8 +1770,7 @@ static int vchiq_probe(struct platform_device *pde=
v)
>   	 */
>   	err =3D vchiq_register_chrdev(&pdev->dev);
>   	if (err) {
> -		vchiq_log_warning(&pdev->dev, VCHIQ_ARM,
> -				  "Failed to initialize vchiq cdev");
> +		dev_warn(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
I think a dev_err() would fit better here.
>   		goto error_exit;
>   	}
>
> @@ -1782,7 +1780,7 @@ static int vchiq_probe(struct platform_device *pde=
v)
>   	return 0;
>
>   failed_platform_init:
> -	vchiq_log_warning(&pdev->dev, VCHIQ_ARM, "could not initialize vchiq p=
latform");
> +	dev_warn(&pdev->dev, "arm: Could not initialize vchiq platform\n");
ditto
>   error_exit:
>   	return err;
>   }
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 63f412815a32..2fd793954001 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -465,9 +465,9 @@ make_service_callback(struct vchiq_service *service,=
 enum vchiq_reason reason,
>   	status =3D service->base.callback(service->instance, reason, header, =
service->handle,
>   					bulk_userdata);
>   	if (status && (status !=3D -EAGAIN)) {
> -		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
> -				  "%d: ignoring ERROR from callback to service %x",
> -				  service->state->id, service->handle);
> +		dev_warn(service->state->dev,
> +			 "core: %d: ignoring ERROR from callback to service %x\n",
> +			 service->state->id, service->handle);
>   		status =3D 0;
>   	}
>
> @@ -1609,10 +1609,10 @@ parse_message(struct vchiq_state *state, struct =
vchiq_header *header)
>   				vchiq_service_put(service);
>   			service =3D get_connected_service(state, remoteport);
>   			if (service)
> -				vchiq_log_warning(state->dev, VCHIQ_CORE,
> -						  "%d: prs %s@%pK (%d->%d) - found connected service %d",
> -						  state->id, msg_type_str(type), header,
> -						  remoteport, localport, service->localport);
> +				dev_warn(state->dev,
> +					 "core: %d: prs %s@%pK (%d->%d) - found connected service %d\n",
> +					 state->id, msg_type_str(type), header,
> +					 remoteport, localport, service->localport);
>   		}
>
>   		if (!service) {
> @@ -2903,10 +2903,10 @@ vchiq_close_service(struct vchiq_instance *insta=
nce, unsigned int handle)
>   		    (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPEN))
>   			break;
>
> -		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
> -				  "%d: close_service:%d - waiting in state %s",
> -				  service->state->id, service->localport,
> -				  srvstate_names[service->srvstate]);
> +		dev_warn(service->state->dev,
> +			 "core: %d: close_service:%d - waiting in state %s\n",
> +			 service->state->id, service->localport,
> +			 srvstate_names[service->srvstate]);
>   	}
>
>   	if (!status &&
> @@ -2964,10 +2964,10 @@ vchiq_remove_service(struct vchiq_instance *inst=
ance, unsigned int handle)
>   		    (service->srvstate =3D=3D VCHIQ_SRVSTATE_OPEN))
>   			break;
>
> -		vchiq_log_warning(service->state->dev, VCHIQ_CORE,
> -				  "%d: remove_service:%d - waiting in state %s",
> -				  service->state->id, service->localport,
> -				  srvstate_names[service->srvstate]);
> +		dev_warn(service->state->dev,
> +			 "core: %d: remove_service:%d - waiting in state %s\n",
> +			 service->state->id, service->localport,
> +			 srvstate_names[service->srvstate]);
>   	}
>
>   	if (!status && (service->srvstate !=3D VCHIQ_SRVSTATE_FREE))
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index d7dcd17e4bff..bc980a001711 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -53,10 +53,6 @@ static inline const char *log_category_str(enum vchiq=
_log_category c)
>   	return strings[c];
>   };
>
> -#ifndef vchiq_log_warning
> -#define vchiq_log_warning(dev, cat, fmt, ...) \
> -	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_AR=
GS__); } while (0)
> -#endif
>   #ifndef vchiq_log_debug
>   #define vchiq_log_debug(dev, cat, fmt, ...) \
>   	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARG=
S__); } while (0)


