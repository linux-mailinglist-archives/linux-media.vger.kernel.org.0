Return-Path: <linux-media+bounces-63050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB9GIgWuGWpyyQgAu9opvQ
	(envelope-from <linux-media+bounces-63050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:17:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9260478E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE1CC32AE6A8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A50356760;
	Fri, 29 May 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsDy7Hxe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B184F33F8BC;
	Fri, 29 May 2026 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067209; cv=none; b=Dg2CfPBdNhEfV0wb381Awh4l0s0zXaNH/TUHHMsJ6+tqtx5aNoOUFOO3+qUgGiuun7MYmnqYhKQPcEUO5jt0pTWdj6SO5+a3++mXMd6qmXxnMP72jDBRMZKrfqj687181nq+3yw2TJht9SIjhvj/xi84SCziMH3KVcWKodyziSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067209; c=relaxed/simple;
	bh=ydxXxhOYB3uKsBg8lm72ucYKPT59Tebx63w45Jbk4XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcAbePPsqFOoRQWojxue01GeKPHFyu59MlssAybnW0ED2KM0ellSPSIUy2eTuXqOtYc9YD3zkcRSxkx9TVBDJVkbLjAX9bsZIs3kLVjsu4TUREleEIJ4H8iLc39i5UdviYHwR+InXv4FPcwnHkQJlGrZATED4aYSUSPcn9y2YQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsDy7Hxe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4BA1F00893;
	Fri, 29 May 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780067208;
	bh=pJrpc/0Rjq2d5GXNAElO4nk+xNGZj/e71nP8ybvwuOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JsDy7Hxe98Rqfov8re5K/ZlPuX8sR7l1ggC434/5ZyrVJhwqp07y6MQ5doTXRyyrq
	 W26TCUfDfaPaRaX3O8KoODIC7Rpgmv/Hjp3Jy8GokNNvdmkB3EHM6OZCS01uXRlYpO
	 gKoek43VCbp8NKdOXuaQ8GVR+03XJ6zyxEvZEHm0A1WlLajFmVfC3hm03pLAD1Cud5
	 bd7jegDMNa9e44Ia9E/21BK9571tJK2oK5t/lHAwiigVE4d/kxGOi4UkiM2SjhS6Jw
	 f4yQBlUfOqdBS3CHHGaJykyR/YxmfDpgsStxDdCXcfvzhWeqJ0zd5ZqjzQyMhZceTu
	 WHjS5vLjWl7iQ==
Message-ID: <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
Date: Fri, 29 May 2026 18:06:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
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
 <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63050-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D8D9260478E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
>> When requesting log status, the block might be powered off, but registers
>> are being read.
>> Avoid reading the registers if the device is not resumed, thus also avoid
>> powering up the device just for log status.
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>> Changes in v2:
>> - changed to use pm_runtime_get_if_active()
>> - add corresponding put()
>> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>>
>> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> To: Florian Fainelli <florian.fainelli@broadcom.com>
>> To: Ray Jui <rjui@broadcom.com>
>> To: Scott Branden <sbranden@broadcom.com>
>> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>> To: Sakari Ailus <sakari.ailus@linux.intel.com>
>> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> To: Hans Verkuil <hverkuil@kernel.org>
>> To: Naushir Patuck <naush@raspberrypi.com>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-rpi-kernel@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..93815b8ab930 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>>   		 node->fmt.fmt.pix.pixelformat);
>> +
>> +	if (!pm_runtime_get_if_active(unicam->dev)) {
> 
> Well, if I am picky I would say that pm_runtime_get_if_active() can 
> return -EINVAL if runtime PM is disabled for the device. It should then 
> be tested against '<= 0' ?
> 
> I suppose this should not happen really often, as very few drivers 
> actually test this case...

I saw that. Some do. This driver enables runtime pm in probe though. So
I guess it cannot happen, unless runtime pm would not selected in kernel
config, but the driver depends on PM.

Ultimately I guess it's up to Sakari or Hans to decide whether it's
worth checking for error code, but I picked the simpler path (and
considering <depends on PM> in Kconfig) .
> 
> With or without this small change:
> Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Thanks,
> JM
> 
>> +		dev_info(unicam->dev,
>> +			 "Live data N/A due to device inactive\n");
>> +		return 0;
>> +	}
>> +
>>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
>> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
>>   		 unicam_reg_read(unicam, UNICAM_IBWP));
>>   
>> +	pm_runtime_put(unicam->dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260521-bcmpipm-6c578e73239c
>>
>> Best regards,
>> --
>> Eugen Hristev <ehristev@kernel.org>
>>
> 


