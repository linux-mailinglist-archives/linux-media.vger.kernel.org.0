Return-Path: <linux-media+bounces-64538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OsgnKv1aKmr4nwMAu9opvQ
	(envelope-from <linux-media+bounces-64538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:51:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D693266F29D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yoseli.org header.s=gm1 header.b=ROm1fvS1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64538-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64538-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=yoseli.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C009F30E8510
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70793384CE6;
	Thu, 11 Jun 2026 06:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C637F72C;
	Thu, 11 Jun 2026 06:51:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160685; cv=none; b=jCYVrHJoMv6jG+5OW2aOyK4/e94tAm1zXBqZPW9XleJdWXcLrpLuWF7XexCNuQb3j+K4cndGv9qJUl3JsKHYdeNtqaAva7BmwYM0epxlUVd3ZT12pURKxm9I4jijXe3YUB7c9yh8uJUAVS2eHd9rCy/P4mJ870ox6I/6/O4ipec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160685; c=relaxed/simple;
	bh=7R/YVwl8PT1qG9uvDK0DZNK6LQlzSCuxvhqnZ6aeGds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCNoBgQOlVnx5GhJTe1KVB0L/+yjI0WsPpSJQeuPv3LCnTF+uj63m1yxDYuqc1tFGnCGq6tBtkssntHkIJCNDnro1FmRBfaTq0N712gYR8eHcYC8Zf/U9CNnAs7sJH174NB1z8yW5MmKs6FUt7Aqo6LeNghB6hOtaP8OqsIQbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ROm1fvS1; arc=none smtp.client-ip=217.70.183.196
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B5C3F6CB;
	Thu, 11 Jun 2026 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1781160667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Uq0BRqmbq18//RGzp9MNbSv0I/ZSh0cbswuoceC+fk=;
	b=ROm1fvS1dHwc7yD4AhVaXyPqF8H23bEv52OsVLFlWpAnTdroJyZ/AR5cDcp3tXSmx/etUI
	/r4YkrgJ3PnHaVWx0XouQUXbDWCqVADcamcFp4qW4rB3N0WNINgWDAowOkNQHIaf+C6b20
	svwB1OZ4bYDTR89ReA1Fpd8mgw160N9zRAF3XOi9D7DZ91fONLV8iPoPiMuZzb9ZLoMnJI
	LafDsgkxZPqtomuEK5Hujcgv109F3GGUMoKrk1cOyrwf247Fq8AzepmH1ZA52zFEhIwLbh
	++9x/8NFYg/1FhqQJyLYWgTTMUiZpvnAIh4PSsdFGch3L4qjN1tRQYC0w8heKA==
Message-ID: <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Date: Thu, 11 Jun 2026 08:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
To: Eugen Hristev <ehristev@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGn5wHXK1VYWY8unJ7pC8r27C+e1eBVncIQmL0NGz/4mZdGeqBFX705gEgXmLdXnHC3S5ttEVNfp1gfXfdH4eM347xOyJxbMqD6/89/wGoOWtQXxgpoOr2bJi9qN7bswAN4ojWPsuHqmVilsUSXkSJYPlAoLAp/KvbQbYSxC/KGzEGXWPeyABXvD8566W41PUhvVFXJXmAK8xgaHbUfzA0DFyr5rpRdI1iepTMloTOJmg1D7a08DWMhpzSAkNAPdOyYWKnfS0i+tMhJbarTV1OSb1d2bqCqGckxzlbmmAjtG7sFY2z+eZbTmQqS8+3qRL6Fl+fENvyV/cwMC8n3csvgT3HytwqnxbopGsnv6VTX/zp3Ewdw4QCxJRXICsp9CjdnLoi9MKKVAmn6QeN/ETrfQCzXxSPzHB/zW6fisNEDqxiR9r+zVSTawf5oLn3NlzQCXVTQT+liHkGdf0r8BChAwvyDNm5lO6YTJtlHWp1mEXJkxbYVn1SgWAkoHGVGhVz83bI+HnQwobb0JrD43Wvg65m2eqxw754BNMNNW+Rnmc3gJENfTC84ZFsk43LmaDGJ2bzEt0fR507TVAeb/GzY27R4G6UQ6YjPdIfZ1PeLhz/zBZo8HPKlNk4N/e2yayPAQT6Cv4ze3mhLveD74+kun+EaKqXuDaCtoQQpbSADtw
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:naush@raspberrypi.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jeanmichel.hautbois@yoseli.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64538-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yoseli.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D693266F29D

Hi Eugen,

Thank you for the patch.

Two issues with this one, I'm afraid.

Le 11/06/2026 à 08:09, Eugen Hristev a écrit :
> The unicam exposes two video nodes, one for image, another for metadata.
> Querycap should return the right caps for the respective node, not both.
> 
> video0:
> 
> Capabilities     : 0xa4200001
>          Video Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
>          Device Capabilities
> Device Caps      : 0x24200001
>          Video Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
> 
> video1:
> 
> Capabilities     : 0xa4a00000
>          Metadata Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
>          Device Capabilities
> Device Caps      : 0x24a00000
>          Metadata Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..4bf36ce80047 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
>   	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
>   	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
>   
> -	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
> +	if (is_image_node(node))

First, it does not compile, as node is not declared here.
'struct unicam_node *node = video_drvdata(file);' would be needed.

> +		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
> +	else
> +		cap->capabilities |= V4L2_CAP_META_CAPTURE;
>   
>   	return 0;
>   }
> 

Second, and more important,  I don't think the current behaviour is a bug.
Documentation/userspace-api/media/v4l/vidioc-querycap.rst states about 
the 'capabilities' field:

"The capabilities field should contain a union of all capabilities 
available around the several V4L2 devices exported to userspace.
For all those devices the capabilities field returns the same set of 
capabilities."

Per-node differentiation is the job of 'device_caps', which unicam
already sets correctly when registering each video device (your
v4l2-ctl output shows the Device Caps are already right).

So this looks like working as intended to me, and the patch should be
dropped.

Thanks,
JM

> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260611-bcmpiqcap-f893a9ea2da9
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


