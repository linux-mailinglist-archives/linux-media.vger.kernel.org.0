Return-Path: <linux-media+bounces-40487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA68B2E64C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E989C7244C0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 20:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF87296BD3;
	Wed, 20 Aug 2025 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="thmT+mqF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F10296BB7
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720983; cv=none; b=YoRtzkUhfufgatIGcf4TGkJ27Ft6FRWEJ20Y3VUTyhBydtsIai8NCAkpOMFqqWATzRi8gVSpbwuzYyMJprlCQ0e8qbi+UbetFCLOINZl3xJY3yFGIKqDya/DHph0/cuJGifPLgu7lgvy/6TxlAESPgHndNmAVxOlCN88iukcvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720983; c=relaxed/simple;
	bh=Yi+PBZb1EWOOSZQz9iuidhSt3PsYKwmwrDS5W+yHa9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaQZ6EKikpyBJs7ZUG1z/THqjkGklMHPTN2F9upxxfFgmWkIfzbamZZOi2sXF8z3JoqVrzz3FByGK8N4871I+6kaYJoG3pi5J8sxfvZoYozpRaQBn0DjRWxHVOomSrxZ2yLasbNFLEMLPsyI4NOa9k6GzfpHgVotO5IKuMKqwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=thmT+mqF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c6d4r1PQ1z9tl3;
	Wed, 20 Aug 2025 22:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755720972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZkfwfwfTeX9xKiyluvpSeN+SljxQilGHMFzDl2Ut3o=;
	b=thmT+mqFkvUWxOST7w3lIhBT/ZnSS/23CZjb82gojGfPqOrYJlSxn+nl8uU2CM1Vapp7ZV
	MawHA3OwAM9h2erNKumdO+YhuaEAaqL6WOQvjaNHygFXgHiVJRNq4rnEdxRSlwmYxwlaVO
	RD8j44qRahAy7PP4p9062+y31PLfeyAhfclpQlbkdDr2HWgzM+W4l5M603sbx8qc89srup
	ESm2CRhGzmnEBOeZHVKlNRkMbIPGB5TtImnYoc2rg3haoL0GQFegI1sASLXgyEUfKwgkPA
	1ghQ+yrmEsu8v1Op0QqpDOjYQr0IC4eicCkYUr7WRnmJAw7Kzpb6ABPCrDf8Hg==
Message-ID: <7439c678-5369-4c31-9c89-5a015ce7582f@mailbox.org>
Date: Wed, 20 Aug 2025 22:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian
 <ming.qian@oss.nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <aKYRJap9Gwc2mFXh@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aKYRJap9Gwc2mFXh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: tnphkcixmh1bsfberp5t1io7r5gk6qad
X-MBO-RS-ID: 21a2f8d06e7699e12a5

On 8/20/25 8:17 PM, Frank Li wrote:
> On Wed, Aug 20, 2025 at 06:29:53PM +0200, Marek Vasut wrote:
>> Add support for optional allocation of bitstream descriptors from SRAM
>> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
>> property which points to 'mmio-sram', the driver will attempt to use
>> the SRAM instead of DRAM for descriptor allocation, which might improve
>> performance.
>>
>> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
>> being triggered during JPEG encoding. The following pipeline triggers the
>> problem when descriptors get allocated from DRAM, the pipeline often hangs
>> after a few seconds and the encoder driver indicates "timeout, cancel it" :
> 
> Do you know why this happen if descriptor is in DRAM? why sram help this
> case?

No. Did NXP ever observe this ?

It seems to me the encode never received much testing, considering the 
severe bugs that showed up in there.

>> gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
>>                 queue ! v4l2jpegenc ! queue ! fakesink
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
> ...
>> -							   GFP_ATOMIC);
>> +	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
>> +						       &jpeg->slot_data.cfg_dec_daddr);
>>   	if (!jpeg->slot_data.cfg_dec_vaddr)
>>   		goto err;
>>
>> @@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>   	jpeg->dev = dev;
>>   	jpeg->mode = mode;
>>
>> +	/* SRAM pool is optional */
>> +	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> 
> Need update binding doc nxp,imx8-jpeg.yaml
Sure

