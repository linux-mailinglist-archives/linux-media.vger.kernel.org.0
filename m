Return-Path: <linux-media+bounces-62570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIfMDq0UEGphTQYAu9opvQ
	(envelope-from <linux-media+bounces-62570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:32:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA65B0A10
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A69A6301CA52
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A43371CE0;
	Fri, 22 May 2026 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="ZkEk9Nwi"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B88533D515;
	Fri, 22 May 2026 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438725; cv=none; b=q5bLDeWTLj60wZvAC8IAtFwz5vsRy/SwlRFpQeqr46IZjzEfLEtiln3f32NRVJfK627EVKMp20IlvzYxcOKUXIw6Hp0Bj+opi6LcN7FK3eLZqxhDJn/3s+WidOT48FPJwSZBmSGO3DuG58mcidKf+eBPYI97PvIfLdlJm/TxJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438725; c=relaxed/simple;
	bh=Iady9+NbF47F22N34Vj5+Ibg0jHYs0Yu3xUv2Q1m2OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvte2Onfz/OGu3uvGZjzNL53F35HTkwMPKDJ/GNWhlcs5BiIwZbFU9+qBznU5cb3A1aoIEZ5gNKi0Ua1pMJec4ekdG7Q2xl+RXNU2AvOUtjez+VA/2STwOx9w7dAT74N8/3FszF2TUOEJCz98yvipZvv2s/51pi/mWMKjsdAPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ZkEk9Nwi; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id E574E3E949;
	Fri, 22 May 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1779438714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uS43xLoRfhTODKTKwo15Svv0trKosxXMBeI5sE6g/Iw=;
	b=ZkEk9Nwi9jCbB1sSuaSyR93+XO/vzUoyLiAGubnfT2HH6jNXeFpDvLujh2m9pmeaBxFZm2
	UJyRCW5JDM6A9chxo/kwSLbrougQGj2XbEsf6YINjOQTnHYgp/oUcxxyG0yFv/ZWuO2g06
	GY4t4mDzcjcVmEtxuZToS07klzxS65JQdNyYHXLB+MSlvdpdcSI/1qHVzMGs/F2INtHvuk
	5EKA7Zh4Vkg5wcSoqdT85ZS/EdQiK92Sn4z5F72VVx1uARND4Dc1/BShL6jjKD67iGlZ9R
	+JOGbrAIYkcn4rLdXlKZFEg7vqIDoY9I8YhoIZ7rTXQRRpoAOmEtJQNTcPm2Hw==
Message-ID: <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
Date: Fri, 22 May 2026 10:31:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix log status runtime access
To: Eugen Hristev <ehristev@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTFFsxZdjDYbGI/O5qas+S55Zs7dmoPxVtmp+czXqra4L2sIv8wbpaqEtn1bOdK8KIN2ag1M2Q3dKtTl6m6zi8wlIyQrykWZEM4aYNI25pd/9DorWT+QpvMcEZc0jjss4u4gDMz8fCc+WAYO8okFbwrlALjGvVzEe7zo6X6WNQMqcR4FWl52A1LvT3nIiQLHNZJ0uTzeKwDQopHDwUV9nocaPfGc/zWA/QdiIBibW+qj6GkJSfKIryIbWEJcu28gmS7LvHKWEQ+1LKh9PVc1fITB1iPcgUSxZrAZm8yQGUCvnTpg7zfjUQliYzawmk1GAOfe7mI9UpE4aVdV1CvdMrYzG3sRPfHYzQwuhIH9XK6a3u12kc94cutk+nBxm7f9P2vbyBvHO6b58ZLAfNZ3HzaJuaoYxFeCsutS8PyxcW4l5ykBUIX1shlvsDsVEBGWjhpKyqP8JyrV7PeEOsDJ0B2JQhEO4AOU33va4etuD1D3nZtFXgjVM5Z4xqhUMDufUqPBE1mr1cKZV74PuC9nYjHbBFALavonlq38lBJh0+gUowbmwMV9vBUOcbvMYgt78nACsTTGYRIJGIWlVZk/1FE+oWWbN5Taz5ANT1Et4k79BxeTfYV6xsjNgEj2NCacwVKO9y/Aw5tfACN1DyQbGkVzOD+7tT0HjJ3XQQYc5X037A
X-GND-State: clean
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62570-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[yoseli.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yoseli.org:mid,yoseli.org:dkim]
X-Rspamd-Queue-Id: 94AA65B0A10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen,

Thanks for the fix, the issue is real, but I think the patch leaks a 
runtime PM reference.

Le 21/05/2026 à 20:09, Eugen Hristev a écrit :
> When requesting log status, the block might be powered
> off, but registers are being read.
> Avoid reading the registers if the device is not
> resumed, thus also avoid powering up the device just
> for log status.
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..818694f007e2 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>   		 node->fmt.fmt.pix.pixelformat);
> +
> +	if (!pm_runtime_get_if_in_use(unicam->dev))
> +		return 0;
> +

pm_runtime_get_if_in_use() returns 1 and increments the usage counter is 
active and in use.

I think we need to add:
pm_runtime_put(unicam->dev);

Just before the return 0;

BTW, we may miss a dev_info explaining why the live data is skipped when 
the device is suspended ?

Thanks,
JM

>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


