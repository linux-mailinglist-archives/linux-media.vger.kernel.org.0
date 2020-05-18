Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B631D7504
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 12:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgERKT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 06:19:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42901 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726127AbgERKT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 06:19:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id acsBjtCgitKAsacsEjKwVy; Mon, 18 May 2020 12:19:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589797194; bh=76pF00Wv0juosHXkvoedVD/uuV5yDbseXxvDrLn36gs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EEvrd8hlFQLLLRPPECT9lSXuMvC1crEGVW0cRyouTjL46ueQeY3RT9zZOSjOmJBSW
         Q0MhD6UthOVj1b4DTfi29JJhMeApOTVsa0qAcHo8C4uiPg/9KTO4Kvg6qxaZdTqNTh
         JkkFh6z+DRAfWWrg7mUnEnudErverZ8o48zGuGPLmkOvu474Bo5nwvzwIj1tnGHcPJ
         UdBpZQIX/1GRWhWeJjcQvDa/vtqI1sJHWq74jJwJqc+ECUPzzxNvqnAgGkXQHf99AZ
         4jc25B/lNmDui+LktFown3iVru1+6N9c5SLW80VH5pDS8C0SqTm+Y9QKpRANn9VUqm
         MD/ozjB/MpdaQ==
Subject: Re: [PATCH v2 16/34] staging: mmal-vchiq: Fix client_component for 64
 bit kernel
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-17-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dc9b0b12-1d99-549d-5189-4dc56ddfaa11@xs4all.nl>
Date:   Mon, 18 May 2020 12:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200504092611.9798-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL1cHsbJvT18J7NfqPIY5Y1b1S9ZF/+5WBWI4NvSgHgLqgDItgZxXWBr+Y8LTpdwKhc/Y4hxJflDiIr84vtJAccQk9uYuHpJLqTDRfBXkn74rSiX4zhQ
 7qiZZUdOudN1JGQBI3oxb1RQjCmWJAyFUC6Kc8oPMJ+124kq9akGFxBlf3wKccA+1KE0SMWvUud6dVq7/JqQ3XhnZDmJMV06nDbO74wheTzCoYyahosZCeUi
 oeSlmbh+bkzX0kKACTGNwe/9MOnkd1GBIwKoX+KxwYEZxEK7flqGV7CXS5j20aCi78eZC7jm0/vrqfll9pCAvaeNoaIu9MO3AvEZgq3v2QNwCKNpS3X+aYok
 TfgYOLlcpcIaYkqz9o0QY+vDKdi4k+Yenl+tXgHeEdZ/LT8zNKG9OoYl3cdOLhmAv4bC1kH4LGMmib2nbOoGf8IpETdvB2OJQWk0WrVG1ad+CePQyFg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2020 11:25, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> The MMAL client_component field is used with the event
> mechanism to allow the client to identify the component for
> which the event is generated.
> The field is only 32bits in size, therefore we can't use a
> pointer to the component in a 64 bit kernel.
> 
> Component handles are already held in an array per VCHI
> instance, so use the array index as the client_component handle
> to avoid having to create a new IDR for this purpose.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../staging/vc04_services/vchiq-mmal/mmal-vchiq.c    | 12 +++++++++---
>  .../staging/vc04_services/vchiq-mmal/mmal-vchiq.h    |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index c65c262cffbb..5872690b404d 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -467,9 +467,9 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
>  static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  			     struct mmal_msg *msg, u32 msg_len)
>  {
> -	/* FIXME: Not going to work on 64 bit */
> +	int comp_idx = msg->u.event_to_host.client_component;
>  	struct vchiq_mmal_component *component =
> -		(struct vchiq_mmal_component *)msg->u.event_to_host.client_component;
> +					&instance->component[comp_idx];
>  	struct vchiq_mmal_port *port = NULL;
>  	struct mmal_msg_context *msg_context;
>  	u32 port_num = msg->u.event_to_host.port_num;
> @@ -1068,7 +1068,7 @@ static int create_component(struct vchiq_mmal_instance *instance,
>  
>  	/* build component create message */
>  	m.h.type = MMAL_MSG_TYPE_COMPONENT_CREATE;
> -	m.u.component_create.client_component = (u32)(unsigned long)component;
> +	m.u.component_create.client_component = component->client_component;
>  	strncpy(m.u.component_create.name, name,
>  		sizeof(m.u.component_create.name));

I recommend that another patch is made that replaces any strcpy/strlcpy/strncpy
calls to strscpy (since that's the standard for media drivers).

Regards,

	Hans

>  
> @@ -1863,6 +1863,12 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
>  		goto unlock;
>  	}
>  
> +	/* We need a handle to reference back to our component structure.
> +	 * Use the array index in instance->component rather than rolling
> +	 * another IDR.
> +	 */
> +	component->client_component = idx;
> +
>  	ret = create_component(instance, component, name);
>  	if (ret < 0) {
>  		pr_err("%s: failed to create component %d (Not enough GPU mem?)\n",
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> index ae6c69ba16ee..247521fbcc1d 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> @@ -97,6 +97,7 @@ struct vchiq_mmal_component {
>  	struct vchiq_mmal_port input[MAX_PORT_COUNT]; /* input ports */
>  	struct vchiq_mmal_port output[MAX_PORT_COUNT]; /* output ports */
>  	struct vchiq_mmal_port clock[MAX_PORT_COUNT]; /* clock ports */
> +	u32 client_component;	/* Used to ref back to client struct */
>  };
>  
>  int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance);
> 

