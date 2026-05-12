Return-Path: <linux-media+bounces-61272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKdBK303A2ow1wEAu9opvQ
	(envelope-from <linux-media+bounces-61272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:21:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 596FF5224C2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1E6E3059C58
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BB73ABD90;
	Tue, 12 May 2026 14:14:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD73AB5C6
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595271; cv=none; b=OVlMojAKP0/U6DTpHjciklBCCuGuV7bNxf9UvoHsHnN6pKEQW5UpfjBuO3RkiMjrrGLOsJBK0fTItCKgqnEAsawv1bhbqQe5sE2tj4hXIwl1TwBfH2SmVWLjw3FCrxu3VR/5EzwhHj+gcVhTuRxnSRfE9mA3uXRz8TcqX+JMcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595271; c=relaxed/simple;
	bh=ZaQyJxlxOmY7xkwyuR+IwZinC980PpOQWXApt+r8JDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNQaPnKuPAtVsUTtLZlTCPcxb5dQryIh4UGAXEBd/rQjVXKv+kt6eAhxzABtO1oEhIzpYOdvFZLL+WVaisMGTmbK7+wTYJi6+K6/Sc5t8TfRzRh/q0P8fizrv4MDiUw0bw1tkz6PWYyb0y9DJB9rkFdELjcK3dWZIiv9/5qUD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMnsJ-0003VA-2A; Tue, 12 May 2026 16:14:19 +0200
Message-ID: <2138b7ee-641f-4727-bcaa-f16dc9982a90@pengutronix.de>
Date: Tue, 12 May 2026 16:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/29] media: rockchip: rga: fix too small buffer size
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
 <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 596FF5224C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61272-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Nicolas,

On 5/8/26 11:11 PM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Fix the command buffer size being only a quarter of the actual size.
>> The RGA_CMDBUF_SIZE macro was potentially intended to specify the length
>> of the cmdbuf u32 array pointer. But as it's used to specify the size of
>> the allocation, which is counted in bytes. Therefore adjust the macro
>> size to bytes as it better matches the variable name and adjust it's
>> users accordingly.
>>
>> As the command buffer is relatively small, it probably didn't caused
>> an issue due to being smaller than a single page.
>>
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>
>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
>>   drivers/media/platform/rockchip/rga/rga-hw.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index 43ed742a16492..d1618bb247501 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   {
>>   	struct rockchip_rga *rga = ctx->rga;
>>   
>> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> So we had a buffer overrun ?

 From my point of view, yes [1]:

     /* Create CMD buffer */
     rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
                        &rga->cmdbuf_phy, GFP_KERNEL,
                        DMA_ATTR_WRITE_COMBINE);


Given that 0x20 * 4 is smaller than a page, it probably didn't caused an 
issue as we didn't write out of the one page allocated.

Btw.: I've noticed it while reading a bit over the comments from 
sashiko.dev [2]. I'll also add this link for clarity to the comment in 
my next series (seems to be the common way of referring to sashiko.dev).

Sincerely
     Sven


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/rockchip/rga/rga.c?id=50897c955902c93ae71c38698abb910525ebdc89#n880

[2] 
https://sashiko.dev/#/patchset/20260325-spu-rga3-v4-0-e90ec1c61354%40pengutronix.de?part=10

>
> Nicolas
>
>>   
>>   	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>>   	/*
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index cc6bd7f5b0300..2b8537a5fd0d7 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -6,7 +6,7 @@
>>   #ifndef __RGA_HW_H__
>>   #define __RGA_HW_H__
>>   
>> -#define RGA_CMDBUF_SIZE 0x20
>> +#define RGA_CMDBUF_SIZE 0x80
>>   
>>   /* Hardware limits */
>>   #define MAX_WIDTH 8192

