Return-Path: <linux-media+bounces-40541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51920B2F32A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3596A563CD3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D1F2D3A9F;
	Thu, 21 Aug 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fvbApd/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769B2D47F9
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766968; cv=none; b=L39b2YVahgRo5o+kO3D+r3PSPF4ZV6Gj8wp/mF5dZ02MtEz/VuWksWWohTzmR8JyJhRe3pFRwyxs4ZPUvBJao31eCd4HndApdSD+lBVrQ3P/EUs+6nQwg5JMpHaND+qwiGiYnemGvfgH2mOxZcDMtai+/seh7dDmojkvlGaLUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766968; c=relaxed/simple;
	bh=iOER0SlM9iKv390OJzvBl4AQp6k4sk6gz7YFRbMoeRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtUDJDaiGOUxSDDi0miSXJV1P6OcSa+3/84OHo+T/WVSEfUoF9L/02M4qcDzGbqRjgsr0NzaSSZfGmXplyaExV4moHenEJMpDI8o3aEwWm8rZUa8gL4dJ7d5pxE+U0eg/2SJ/Tuxm1FHsiAZ/WNzOJuj9eMBi7dhCEmD8D0eupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fvbApd/r; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c6y5F0LMbz9tXv;
	Thu, 21 Aug 2025 11:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755766961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6BOkbyAGtdvgUiMh/kKj7ZRKD/HbLjntfFa+ezIW/E=;
	b=fvbApd/r5kcBywhJ0vUs5fAoOSamigpM4ZP0fsASAtCE1VeCQ4zMvjQZSIx93J4LKUNom9
	QpFK/0TP1VlYxEvj7APkLg/XUVSJsUOQxvztaTBFGdpjvmSAVERBFG3LhZl84sKssJ6WY/
	jzwSl4A7R1q+R7c0HXPEXP9akoT7JS5bKMq4CSz9FJlN/W7DPzJcH9wYkAT0SheLcdWR54
	48VfiHLaJVopokeN8GmNWw5t2ki/lmTETQGSa1FGzuB9R5t4URnqul3CTQKYSHKwMzw3p4
	Do4PEWu1QZrbFjXp5zC5dVfNt9SjU3Z9OjOD1Ii09+696vuWSBBaR6XUpbj6Fw==
Message-ID: <1a25c41e-1139-41da-b056-50be47016138@mailbox.org>
Date: Thu, 21 Aug 2025 10:59:49 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4a8531f9-801b-4744-8821-923961211199@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 657304f80e464479387
X-MBO-RS-META: kf8p9grk6m41y7e848e8q7d7ugzz8s6y

On 8/21/25 9:06 AM, Ming Qian(OSS) wrote:
> Hi Marek,

Hi,

> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The current mxc_jpeg_job_ready() implementation works for JPEG decode
>> side of this IP, it does not work at all for the JPEG encode side. The
>> JPEG encode side does not change ctx->source_change at all, therefore
>> the mxc_jpeg_source_change() always returns right away and the encode
>> side somehow works.
>>
>> However, this is susceptible to a race condition between 
>> mxc_jpeg_dec_irq()
>> and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
>> start decoding another frame before mxc_jpeg_dec_irq() indicates 
>> completion
>> of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, which is
>> set in three locations, first when streaming starts to indicate the 
>> encoder
>> is ready to start processing a frame, second in mxc_jpeg_dec_irq() 
>> when the
>> encoder finishes encoding current frame, and third in 
>> mxc_jpeg_dec_irq() in
>> case of an error so the encoder can proceed with encoding another frame.
>>
>> Update mxc_jpeg_job_ready() to check whether the encoder is in this new
>> MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
>> new frame.
>>
> 
> The jpeg encoder and jpeg decoder are 2 different devices, so they won't
> compete with each other.

I know.

> For encoder, we always want mxc_jpeg_job_ready() to return true.

For encoder, mxc_jpeg_job_ready() currently returns !ctx->source_change 
, which is only set by decoder side of the driver. This seems wrong.

> And v4l2_m2m has ensured that there will be no race condition between
> mxc_jpeg_dec_irq() and mxc_jpeg_start_streaming().
> 
> After v4l2_m2m_job_finish() is called in the mxc_jpeg_dec_irq(),
> then it is possible to start encoding the next frame.
This part would be true if the IRQ function couldn't be called by 
anything except end of configuration or end of encoding, but it can be 
triggered by other things, like AXI READ error IRQ.

