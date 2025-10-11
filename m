Return-Path: <linux-media+bounces-44199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B46BCFADB
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0E254E505E
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3B82820D1;
	Sat, 11 Oct 2025 18:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XNNHBd+B"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599927F4CE
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760207747; cv=none; b=Nbj/M5Jskb3dbaIy7X8mM545ye3es4KtGbyCU/phN5MVag5vgtsWT2VttkxdHcQU6c8oQclqWEnmz3eTJ/R/SK+2vw0KpR/62Vj0n/r4hAz/VUZFtrnBtXlw8YXjvR+lVfryJQj8wsIpOnKxC4JtD7rImfQ8KE3oBFh/WIqJc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760207747; c=relaxed/simple;
	bh=1Hc2HneiS43TBLmGYhvCv2bXHJo4DFtoRpCKikPbuBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqjMtL0w/AqMnetoR4haD3JugiT2KeKhZoydFQN4PDUHEF/xioflo1+UPIYf3kP6JpHdBHdRps4gWQtPHNYqnNAELrEH8HDKZrJE4/SDVF89EIzWRk7D8RszG0CMxFmPt2cgjC10kQlgz6XouW/pTrcejGZ/qGyVEoGwUjCYoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XNNHBd+B; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckXNt1T5Sz9sQ0;
	Sat, 11 Oct 2025 20:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HY4m/FONveNaWcSS1mf6emH9GnjZnG2K76xoPH6Z0gE=;
	b=XNNHBd+BXpYDqvIbAMY++Khh3qfJIPw8kb8LKIqC94CRLcDZuZezKOzGE5/URv+Ljk6FkX
	2pQlj+buYYBakbfnH4G7h2NZ7m+S4YFN0fxSGGZBttjkIlXgx6IPck0NaV8ti+WVElUNPM
	dqHhIDHGpi+UBJpIsZ729tmNKLGRojZd3C5MmNt6SY0qNhK44A+n/zdbIg95zn8eNToOpi
	dnb+4CwPwNEphEoSgoSUFONynYa+pnYgwzyVXaNIPT2Z0rShRlWzuF4F6S5FGCRD4KPYTf
	AzPe206aGrTytDhghillMQ3uejKnzxpipT9YyVgILL+ZIOSUQS2EeYlxRlO54g==
Message-ID: <64d2edd4-b641-4f2f-b831-bf2f49da1508@mailbox.org>
Date: Sat, 11 Oct 2025 20:35:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
 <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
 <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
 <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
 <c1289df9-01b1-4c0c-ba09-7cf18ee8baaf@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c1289df9-01b1-4c0c-ba09-7cf18ee8baaf@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 88s5m3yomg8di3i7cge4qxz99rh69p7j
X-MBO-RS-ID: bd78701d31789afd021

On 8/22/25 2:58 AM, Ming Qian(OSS) wrote:

Hello Ming,

sorry for the very late reply.

>>>>> Using sram instead of dram only improves timing, but doesn't 
>>>>> completely circumvent the hardware bug
>>>> Does it make sense to upstream this patch anyway ?
>>>
>>> I think this patch is helpful.
>>>
>>> But so far, we don't have any SRAM resources for jpeg.
>>> The i.MX95 does have sram, but it is very limited, and it has been
>>> assigned to arm_scmi and VPU.
>>
>> I found out the SM can work fine with only 192 kiB of SRAM instead of 
>> 256 kiB of SRAM. That frees up 64 kiB of SRAM for NS world. Each JPEG 
>> IP needs 20544 Bytes for descriptors, which fits into those freed up 
>> 64 kiB of SRAM.
>>
>> The alternative would be to handle those AXI read errors and restart 
>> the encoding. I always observe these errors in the CONFIG phase of 
>> encoding. Do you happen to have any details of this issue you could 
>> share ? Do you know whether the problem occurs only during CONFIG 
>> phase, or also during image read phase ?
>>
>> If the problem occurs only during CONFIG phase of encoding, it would 
>> be easy to retrigger the CONFIG I think. If the problem occurs also 
>> during image read, that might need some more creative fix.
>>
> 
> This is a hardware bug that affects not only the jpeg encoder but also
> the jpeg decoder.
> 
> This issue occurs under conditions of high backpressure on the AXI bus,
> meaning the latency on the write/response channel is high, while the
> read channel latency remains low.
> 
> When error occurs during CONFIG phase of encoder, it will trigger a
> interrupt. But in other phase, there is no interrupt, then the running
> job is stalled until timeout.
I sent a V2 now, thank you for the clarification, I tried to include 
that in the commit message too.

