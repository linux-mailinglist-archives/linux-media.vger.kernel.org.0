Return-Path: <linux-media+bounces-44565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34287BDDF53
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 12:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9648519A7CA0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6615C31BC94;
	Wed, 15 Oct 2025 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ry6UKIWI"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694F31A569;
	Wed, 15 Oct 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523856; cv=none; b=OyeE7MWvTSrIwk3YDCUXhDrQs5zRQ4N4kSO4dMgiCWnj8bkMPS12QzkVy27uLNeVftQcv1DbVPSvlplTdaA7X9G9UBYfCUwPQ/jvBkk7kfitN5bRVVTe4UDxgXJqF5NE0VAz8dOIxxWRtg4VFhN+YUeVt6W1R0pnUinVFWAOVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523856; c=relaxed/simple;
	bh=SWKJxvp2cWH/x+ecIMPmYVOtknYL0/Pv8YgrDhmm0Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tp5JeL3obRBHBcgrV46l8UyLcNm1LYJRZCFo3dw++C/g9D6LRS1NDpCJ4qQHGMapl3rEE0UzmCp9ii1wUZDnf/KkuTpuxWY6NrkhxpcV97WGrkpBGiArOQoqba8kcrSp0fFIIAVpzl70sCb8UzebD1wFj3h76HQ/JzLbEzkDcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ry6UKIWI; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmnHv1WlHz9shw;
	Wed, 15 Oct 2025 12:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760523851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtqIp9rap5dI2OPXXFT7nUOGTwK5ImKsm4i8QwDrT0U=;
	b=ry6UKIWIKJB6Fpb+1sYK1nStnghma+V6pczy3ia9nWZIAPOUkdUiAvQIvvKDL81XS5d37q
	MaMIPuApKmq8KgVJPLBp4c+C3JcN0QhcV4zhg7bD7iPdIo4gnVfBiGIg2Tqhs/Qeq86wZE
	FSgCuJ65c+/ePlQ1kZM2/gfp3k2PlrBgpovkz5at2prdeVL6AWS9p71X0bioAW0z4on6v1
	9mHh1HXZtwXZpQpXYbRDRdwM/bO0j+BRZlxP17bABz6pGH5EJKCutb2ClqlRl/JIevrHqw
	MLOvLstQAOw9bnKQBG6gAG/jE3A8gz9jS+4lxgamVVYj3ZyrZML0j8VYdWuz3A==
Message-ID: <efa2f3e6-fa36-48a3-a85a-68c7c1335ba5@mailbox.org>
Date: Wed, 15 Oct 2025 12:24:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Nas Chung <nas.chung@chipsnmedia.com>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, "jackson.lee"
 <jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
 <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
 <SL2P216MB12469FADA7A4A6872D1C5D05FBE8A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SL2P216MB12469FADA7A4A6872D1C5D05FBE8A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 485b11631051f7a830d
X-MBO-RS-META: dz8bwxzy9j4ehrdnhbzg3z3q6m45g36n

On 10/15/25 7:11 AM, Nas Chung wrote:

Hello Nas,

>>> Would you please share the stream to me? I want to test this resolution-
>> change case too.
>> How can we proceed with the wave6 driver upstreaming ?
> 
> Patch v3 was posted before you replied to v2. I plan to post v4
> shortly and will include your Tested-by tag.

Can you please put me on CC with this email address ?

Thank you !

-- 
Best regards,
Marek Vasut

