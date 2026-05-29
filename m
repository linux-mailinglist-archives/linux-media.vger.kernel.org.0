Return-Path: <linux-media+bounces-63000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPcqKnAgGWqnqggAu9opvQ
	(envelope-from <linux-media+bounces-63000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:13:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 035525FD444
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF73D3078AEB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 05:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A75539FCC4;
	Fri, 29 May 2026 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="QTaGrf2p"
X-Original-To: linux-media@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AE38E113;
	Fri, 29 May 2026 05:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780031559; cv=none; b=X/R5435Kdq5aCALtmkQ5PPw6s3nFcvNGd9EFobwxFR1s4VJ4cFt6iuhcEiYW9gwRrofVbvm/Acx1v6Q05YKF5NJP7tzr7isvZ3Ulh20m4SJmM+4UYiTgERn1bsFfhG1TrQTz09QlVCcunxqk7pp3FA9XRRQeD+DMUK5zISxdxKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780031559; c=relaxed/simple;
	bh=d71PiTI2p/0a2o3Put362HuRDmc0CfXtxEBf7MpbV1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VicNjb/i71Ch4Fmiun8wLbKDFjoGi4VtvkaKjiapNvQodc+qDHywWt3L6vztOqwYXnDvLkPk1q+fOlBJ0hw7wjL3qTBwT8nCpNctbirE9Uw+lhFZqt7W2wSL7oY54dZw/Q0EL6m2cj+/Q1QtmLCwo6gMIyeRfCgDhGYOOoViFxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=QTaGrf2p; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 740FF3EC79;
	Fri, 29 May 2026 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780031549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BttzE/fX7kpFiyMECta2BQYA4zESLmMgKfBxXAnML3A=;
	b=QTaGrf2pdfrCoV6beJM+TI/zonhCWkPRlcMkodOdAkqZvKCMaPseNOF9hav1WXK0WmGbYD
	Q1jI8xiOEAieDkfiOK/oiCxJDDEZP/Dixi3udWL/pgmmdE5zkS/J1THwSKNDoCTHa5lGWD
	6zXg3AQZf18AF1FzzAGdkN9k6F6ePEegGN8Lf7JLqEozVbzjG6mk/VPwC5qwJ3utbwFWI1
	9OThQzMCLLk/HZp9i7Q5K2YfBRZaH436+mvn8iTUNQ+fnfqxIjPUdHmxRBE3Fr+dsOIeuT
	0EGqyVcbSASU+5VgbraZb3aUY89oTWAqUrrBl1JbZicBEoSxWtgFevn1wE85wQ==
Message-ID: <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Date: Fri, 29 May 2026 07:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
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
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTFP7v61qAXaDtMJlaPuR+iahK4NnAc5ChdxPN86ogDXQpgj7OFiRtQMgoE0rp8UQzVA9VRBBpOtdM4wiZrwtmFajBw1oHW9V7FcITTffacofi4KIQYotDKuBBXRb1V4OI7LKdgHnWdhls6wf8OBPV1pjQwk3g4G3KSdU4FgelGlv95JAnPOAxu5t7e7RSFosFzOrUpIURGPaH5DwBAhxvxtPVOQdue5Cpq5Q8V3/4ZKLV911UhBTRrwG+WrXqpWq13xJpYX0fRd1h5n5oQ1Bt4hDFx2qCNUcRP2A/cPhYl6yHjExZUkdb6Hf9TeiPCVPIz5nhbNcLoTWx4OTN6Y7k8Xnb5ErLxZJEYMOgOLIH0tJsskaCpRxJecjyVk7XlJVF3Z1JFhs5390Zz6OvI19nXRlHYND8cmQPDR1QUtbA28JTmXoP3GKUYei8oHPyX6kE9+anGwZTn3JI+1+yeOgxrX310gshlTP6QfzpFoFNSVpyEKAzyk0yDgogIye4qyXuPSebyMzE3S7BRDumiOFAJMOyn+aHB8hAvpX/0vaKkr6PNYMTmq4DAh8dKlT7RGxuZF4waEyx6LeSwWfl/7+d/69O5BssSYwNcZ0cAYe+ize5vUlk2RILlgAYkj9hTwP5etaiNqdOLX8OsffT0/S4PDMUeRp4wJ+bK6yCZfstoz0Q
X-GND-State: clean
X-GND-Score: -100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63000-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yoseli.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 035525FD444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen,

Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
> 
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..93815b8ab930 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>   		 node->fmt.fmt.pix.pixelformat);
> +
> +	if (!pm_runtime_get_if_active(unicam->dev)) {

Well, if I am picky I would say that pm_runtime_get_if_active() can 
return -EINVAL if runtime PM is disabled for the device. It should then 
be tested against '<= 0' ?

I suppose this should not happen really often, as very few drivers 
actually test this case...

With or without this small change:
Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks,
JM

> +		dev_info(unicam->dev,
> +			 "Live data N/A due to device inactive\n");
> +		return 0;
> +	}
> +
>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
>   		 unicam_reg_read(unicam, UNICAM_IBWP));
>   
> +	pm_runtime_put(unicam->dev);
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


