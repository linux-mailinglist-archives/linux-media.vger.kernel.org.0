Return-Path: <linux-media+bounces-44201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE4BCFB0B
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CEC0189B8C5
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D3B283153;
	Sat, 11 Oct 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Jq9h/UN3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F721770C
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760208496; cv=none; b=R9+EFSdtV+bUbdONoeonALtUgXAgF6W9ZdSSN8h0g9KXvlvaM+QWD5XglusmX9IRlcxn6w9SoOjV28TJ5wH3vxPOrQAmk3gn60DbEXVRJHQDN9SDNYVfpLSTAfUw8/E6G9G9vP9AZAkmUu7KfxjY9B5c4hY74umj+KtkaI+BoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760208496; c=relaxed/simple;
	bh=Vl3W1dyG+VWQnbQjADx6bUgr5tUIFo8wayZhVyn6R/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rhjhr3fKIE2xJy3cb3OOx73M4KcymDK9+52y2mtaeU6XduhBHEjyo3GeF/uDZu14UiuSHr+yz8b88u1gkFrCCotUQ6x4SafPq321ug0rcRfDQdekEdGObL2EfeNXgwliEGlgs3QN0OOoNJsCu84OxZv3cizRtyioBhrnqa6OmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Jq9h/UN3; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckXgG5ny4z9snK;
	Sat, 11 Oct 2025 20:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760208490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0IoRmI9dIdW/8tPvD1y1soViMNpZ5KK4la8nRiO8vo=;
	b=Jq9h/UN3orRqvLMiSTIsWeNqeWFNhDzhw0w/XhrQgk+Rf8dSNzK5EGqkkoEcZOg24xlrrc
	2gBDQw0ccVpdg0ENxRtCycSHfrM9qOPgNYi5/KT9fbzOyWJvhTNSn4mFVdNCUsfDa4CUKm
	3RF8lckp+Z5CSkSvu1WeGElfFErzMoTsgd1wW0E42irV95lxpNHZENYf9Ojsd1vXt3xn3d
	d2IijdtqxzkwZWScoktp26428trHtEWz5gnl/2iM/Nwtjgz2m436buL0i/evIGbQot6IVM
	vwFUAfKCXhpKMkDgknD3Ux0RkJDtP720mc619GH9Emw/qxSTzqlIZXHAnH7IzA==
Message-ID: <6c53d0bb-e623-4b56-8ea5-79e4ac9f059c@mailbox.org>
Date: Sat, 11 Oct 2025 20:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820162938.209892-1-marek.vasut@mailbox.org>
 <4a8531f9-801b-4744-8821-923961211199@oss.nxp.com>
 <1a25c41e-1139-41da-b056-50be47016138@mailbox.org>
 <218903ea-82fa-45f8-9826-481ded93281a@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <218903ea-82fa-45f8-9826-481ded93281a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: io95sxgpo1hgi1kyyw1yycjx6mdditcw
X-MBO-RS-ID: 5a203776b7cd3b5680e

On 8/21/25 11:24 AM, Ming Qian(OSS) wrote:

Hello Ming,

sorry for my late reply.

> On 8/21/2025 4:59 PM, Marek Vasut wrote:
>> On 8/21/25 9:06 AM, Ming Qian(OSS) wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>>>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> The current mxc_jpeg_job_ready() implementation works for JPEG decode
>>>> side of this IP, it does not work at all for the JPEG encode side. The
>>>> JPEG encode side does not change ctx->source_change at all, therefore
>>>> the mxc_jpeg_source_change() always returns right away and the encode
>>>> side somehow works.
>>>>
>>>> However, this is susceptible to a race condition between 
>>>> mxc_jpeg_dec_irq()
>>>> and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
>>>> start decoding another frame before mxc_jpeg_dec_irq() indicates 
>>>> completion
>>>> of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, 
>>>> which is
>>>> set in three locations, first when streaming starts to indicate the 
>>>> encoder
>>>> is ready to start processing a frame, second in mxc_jpeg_dec_irq() 
>>>> when the
>>>> encoder finishes encoding current frame, and third in 
>>>> mxc_jpeg_dec_irq() in
>>>> case of an error so the encoder can proceed with encoding another 
>>>> frame.
>>>>
>>>> Update mxc_jpeg_job_ready() to check whether the encoder is in this new
>>>> MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
>>>> new frame.
>>>>
>>>
>>> The jpeg encoder and jpeg decoder are 2 different devices, so they won't
>>> compete with each other.
>>
>> I know.
>>
>>> For encoder, we always want mxc_jpeg_job_ready() to return true.
>>
>> For encoder, mxc_jpeg_job_ready() currently returns !ctx- 
>>  >source_change , which is only set by decoder side of the driver. 
>> This seems wrong.
>>
> 
> That is what we want, the ctx->source_change of encoder is never set, so
> mxc_jpeg_job_ready() will always return true.
> If you think this is not clear enough, maybe the following code is
> enough:
> 
>      if (jpeg->mode == MXC_JPEG_ENCODE)
>          return 1;
> 
> 
>>> And v4l2_m2m has ensured that there will be no race condition between
>>> mxc_jpeg_dec_irq() and mxc_jpeg_start_streaming().
>>>
>>> After v4l2_m2m_job_finish() is called in the mxc_jpeg_dec_irq(),
>>> then it is possible to start encoding the next frame.
>> This part would be true if the IRQ function couldn't be called by 
>> anything except end of configuration or end of encoding, but it can be 
>> triggered by other things, like AXI READ error IRQ.
> 
> The mxc_jpeg_dec_irq() has filtered out the irrelevant interrupts:
> 
>      ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>      if (WARN_ON(!ctx))
>          goto job_unlock;
> 
>      if (slot != ctx->slot) {
>          /* TODO investigate when adding multi-instance support */
>          dev_warn(dev, "IRQ slot %d != context slot %d.\n",
>               slot, ctx->slot);
>          goto job_unlock;
>      }
> 
>      if (!jpeg->slot_data.used)
>          goto job_unlock;
> 
> 
> In other cases, it means the v4l2 m2m job has been started, we just need
> to call v4l2_m2m_job_finish()
> 
> If CONFIG ERROR occurs, driver still call
> v4l2_m2m_job_finish().
> 
> So I don't think this patch changes anything.
I can't seem to be able to reproduce the issue on MX95 A0 with the SRAM 
patch in place, I will keep an eye on this and possibly revisit this if 
it shows up again.

Thank you for your help.

