Return-Path: <linux-media+bounces-55352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMhDMi4xsWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:09:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518B260045
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACE5E304EEF3
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440743C5DA7;
	Wed, 11 Mar 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JUuREP4d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9873C1961;
	Wed, 11 Mar 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220084; cv=none; b=VlTthohuRQWBKseNl4YDJL2BydWJJ/L9BG4xVzr8qlyDZI2wI02zvbyoKnEUR82s6vlibFIcQdjvwA7YjrKsXdscX2c4wQHAz6/hkB76/plFe5dcXnP2GwfqRO/XQfOW7PymDNIlsG3wWbbosNCNL4Wa4xMQwleL+i50j+vMFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220084; c=relaxed/simple;
	bh=l0NY2xtEHPjp+H8rgkKWL4QitRlo/A7rCDhYtuhmGTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdiyNSyX5sTXYMiTdLTCa9Z/yATQDuNroiaXekyyz8LxmJ+evNG0J0m2dh9B7zDK77lHBlThb4QCs2ZF6WqcCdXQeB153cFj4XHrxIrMskaFqg6ehbuhSyCM1wTZ3yysJs9PM/McwBcoysbh/Mld8ZQKxrSAtbkdOnZYJKnn2IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JUuREP4d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFB9C82A;
	Wed, 11 Mar 2026 10:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773220006;
	bh=l0NY2xtEHPjp+H8rgkKWL4QitRlo/A7rCDhYtuhmGTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JUuREP4dhkWLg17qHmtnbH4rCzX8XTLz8Y9pQ2ns9vqz883JnLoO4h8B0e/FlT7bt
	 8hCalz/9IzlDkJfsGiRVmiQCUJeikcTkLyEEfOtwhTu8RRsItakV88OAOqSbSpDL17
	 pp3+xygtz+GOx8wcp5wq5zF3dJ+aO8ewgGPpWeEg=
Message-ID: <17915103-09f7-40a3-8330-dc4ecb6c3bd6@ideasonboard.com>
Date: Wed, 11 Mar 2026 11:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
 <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
 <abEwF39-dSVPWVAb@zed>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <abEwF39-dSVPWVAb@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8518B260045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55352-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Hi,

On 11/03/2026 11:06, Jacopo Mondi wrote:
> Hi Tomi
> 
>    I intend to send out soon a series for other Renesas components
> which shouldn't be controversial. If I can get tags quickly I intend
> to send a pull request for v7.0 next week.
> 
> I can include this patch and your other one which I don't see collected yet:
> [PATCH] media: renesas: vin: Fix RAW8 (again)
> 
> unless someone else intends to handle it.

Sounds fine to me.

 Tomi

> 
> On Wed, Mar 11, 2026 at 08:15:43AM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> Ping. Would be good to have this fix merged.
>>
>>  Tomi
>>
>> On 15/01/2026 11:22, Tomi Valkeinen wrote:
>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>
>>> When unloading the module on gen 4, we hit a NULL pointer dereference.
>>> This is caused by the cleanup code calling vsp1_drm_cleanup() where it
>>> should be calling vsp1_vspx_cleanup().
>>>
>>> Fix this by checking the IP version and calling the drm or vspx function
>>> accordingly, the same way as the init code does.
>>>
>>> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> ---
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>>> index 6c64657fc4f3..30df9b36642d 100644
>>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>>> @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
>>>  		media_device_unregister(&vsp1->media_dev);
>>>  	media_device_cleanup(&vsp1->media_dev);
>>>
>>> -	if (!vsp1->info->uapi)
>>> -		vsp1_drm_cleanup(vsp1);
>>> +	if (!vsp1->info->uapi) {
>>> +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
>>> +			vsp1_vspx_cleanup(vsp1);
>>> +		else
>>> +			vsp1_drm_cleanup(vsp1);
>>> +	}
>>>  }
>>>
>>>  static int vsp1_create_entities(struct vsp1_device *vsp1)
>>>
>>> ---
>>> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
>>> change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
>>>
>>> Best regards,
>>


