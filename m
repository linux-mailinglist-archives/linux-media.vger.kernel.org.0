Return-Path: <linux-media+bounces-15361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0C93D2E1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 14:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335D21F231CA
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8216A17B4E6;
	Fri, 26 Jul 2024 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ZY2okx7U"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A35178399;
	Fri, 26 Jul 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721996190; cv=none; b=W6iDIxBKur/U6e12Wa9WczvBJVuLbDIukbzFfnM7NKYGDTR9mnV3926RV51/5pSJE1liiy1v3QOzfELCbAgai94zUUjEFWZPtuiTxP7E5fmf4/8DRlOp/U4N6PBO7jBzXIDT2zX2U7RmRuA34yb4JLSPIN/UrLbj0kahp8qHr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721996190; c=relaxed/simple;
	bh=EKxhdOOgldYUX3epbyf3o7zi1yBmGlOkw9vISam+8w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPVmMdThK96c5BIBUZqlimOLarrgs3QIJJz4tQmiLHGj+kWk2q80q55snLGc7fTKyUnK+SZm0u3mtAKaRti+0sVEkVnVq5no3yCtLi8dvKpdR/xsCKGJYXEGlodX+IIHKhhuhXahk8kmEtePWXI/39U0qS0mYO/nJ+o8vjWH/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ZY2okx7U; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3elkBGi780aPe4wVl1oeACPtRruuFHebc1c5YmjLFR8=; b=ZY2okx7UiwE08BLIgwev1B7z16
	6nFn+G4nQqcjtwPVRJwV1EYxbJTWN1kCyuunm5Uy3eRrKeAdqNlDxQFY1ZppHnRURMiY9vSJrPL5P
	ABjkv8BJ/WVySNLVl/Ax2nN/wMS/pdCSmRPTKHBDTIu7YX/PtPXSddv7rjH++zTiVAEw=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62774 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1sXJrl-00AkNV-Ep; Fri, 26 Jul 2024 14:16:09 +0200
Message-ID: <3e38bf09-734d-4cbf-a0a5-b01cd1998037@emfend.at>
Date: Fri, 26 Jul 2024 14:16:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-mipi-csis: avoid logging while holding
 spinlock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger
 <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240723060909.534584-1-matthias.fend@emfend.at>
 <20240726104255.GH14252@pendragon.ideasonboard.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20240726104255.GH14252@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Laurent,

Am 26.07.2024 um 12:42 schrieb Laurent Pinchart:
> Hi Matthias,
> 
> Thank you for the patch.
> 
> On Tue, Jul 23, 2024 at 08:09:08AM +0200, Matthias Fend wrote:
>> Refactor mipi_csis_log_counters() to prevent calling dev_info() while
>> IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.
> 
> Should we add
> 
> Cc: stable@vger.kernel.org
> 
> to get this backported to stable kernels ?


Hard for me to tell. Since this problem only occurs when you explicitly 
trigger the debug output from this driver, it probably only affects very 
few end users. So I'm not sure if a backport would be worth it.

> 
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
>> index f49b06978f14..0c34d316ed29 100644
>> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>> @@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>>   {
>>   	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
>>   				: MIPI_CSIS_NUM_EVENTS - 8;
>> +	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>>   	unsigned long flags;
>>   	unsigned int i;
>>   
>>   	spin_lock_irqsave(&csis->slock, flags);
>> +	for (i = 0; i < num_events; ++i)
>> +		counters[i] =  csis->events[i].counter;
>> +	spin_unlock_irqrestore(&csis->slock, flags);
>>   
>>   	for (i = 0; i < num_events; ++i) {
>> -		if (csis->events[i].counter > 0 || csis->debug.enable)
>> +		if (counters[i] > 0 || csis->debug.enable)
>>   			dev_info(csis->dev, "%s events: %d\n",
>>   				 csis->events[i].name,
>> -				 csis->events[i].counter);
>> +				 counters[i]);
> 
> The last two lines now fit in a single line. No need for a v2, I'll
> rewrap the code myself, and add the Cc line if you think that's a good
> idea.

Thanks! Regarding Cc, I would like to leave it up to you; you have the 
necessary experience and overview to judge that.

~Matthias

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>   	}
>> -	spin_unlock_irqrestore(&csis->slock, flags);
>>   }
>>   
>>   static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> 

