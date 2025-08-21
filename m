Return-Path: <linux-media+bounces-40543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B400B2F34D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C21724BB4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978382D3759;
	Thu, 21 Aug 2025 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b2V6OGIK"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C032D2488
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767034; cv=none; b=t2Y3/doUn1RFQUJG808TrLZBA8uFrnj02UjMDLQxOXTpYZIi7DTF4q47kVlkzHOABOC3upAPAp64yY6UdNjuhGOqqZZuPQX/87fcahpPGbUiJtYAxOyXJBRCXCw7bJpjdi1skDcvJmZnJ5es5c4d8Rl4oCVYRbLRiBQX7fYsHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767034; c=relaxed/simple;
	bh=hKwooneBeXNXC9VHxFlTJTTYQNLjTKQkokn5Qgw+zSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgKPN25uiAAXflM0mw0QeSwd5jOUgLJnFtFDmK+dVv3NYAgqOV4KZz2AZYxkcEnMU4+2car7xztqGCodniuyCDCmeSLemhntWyXO4g7H6ikWxJbrttQdgkzdNqEwTHlTonoGtTfgYWDk901sg+ih0CIYn/QZ7TZFvhV1Gsd0njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b2V6OGIK; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c6y6X3tZTz9tPJ;
	Thu, 21 Aug 2025 11:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755767028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbHVx0AjhuMt4y2W1PFPxfaxziXKltNhN58wsnEMP24=;
	b=b2V6OGIK+9faRLgIyZYk6uRabl45mm0HCdGaL9s465n3dtJ3XMH35fcyk3NnBsqvmmxHAA
	dMUMj+e2RqYo3JYdzZEnKijCAugtBUaSj9Z4qnUwjRykf//RRJWqPri69DY7v9wGIA4nM1
	AB7FOUC4K3Z3gjYtotbnzv2wvvVvNO2kcjXZOqULnAMzCCbPJJeugtv+6rIUT7LBJMEqGT
	KAaQ/bHhOB7ZsVLuZCvBA/F2cdvb64Uw52U45xMROpDI12jU8SbNzC4lNzUOScBcpwhkjW
	n2XHjV9YzJxTIDjDsOyUNmNIj0FTdtMUqKayIsj6CZxCeLwwcuPPXm4t1j4XUA==
Message-ID: <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
Date: Thu, 21 Aug 2025 11:03:46 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 79b755643f9efdfb172
X-MBO-RS-META: 5w55qm7f67jhh9dnw5fsdc7xw59emh36

On 8/21/25 8:28 AM, Ming Qian(OSS) wrote:
> Hi Marek,

Hello Ming,

> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add support for optional allocation of bitstream descriptors from SRAM
>> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
>> property which points to 'mmio-sram', the driver will attempt to use
>> the SRAM instead of DRAM for descriptor allocation, which might improve
>> performance.
>>
>> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
>> being triggered during JPEG encoding. The following pipeline triggers the
>> problem when descriptors get allocated from DRAM, the pipeline often 
>> hangs
>> after a few seconds and the encoder driver indicates "timeout, cancel 
>> it" :
> 
> It's a hardware bug in i.MX95 A0, and the i.MX95 B0 has fixed this issue.

Ahh, this helps, thank you.

> Using sram instead of dram only improves timing, but doesn't completely 
> circumvent the hardware bug
Does it make sense to upstream this patch anyway ?

