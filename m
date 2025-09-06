Return-Path: <linux-media+bounces-41914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF1B477A9
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 23:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B92A7AEA7C
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 21:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970202D29C3;
	Sat,  6 Sep 2025 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K2W/llDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A882D0C76;
	Sat,  6 Sep 2025 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757194629; cv=none; b=NqqXrJgzMh4d3NJ0tzqbCb9ONUJgANZ+clOOcJUoXpWDp/k3qYLCgJDqgLSJ7StD2a0SDr7RuDkJ2iY4cRut49KyHC0+NBT0XjHL9rDb6/n0wxgrywplrSJdV+aXQQbNEjaOVXN5K9t1d9ZY3Bd55qYD0IPp5L79uHH1Ai2+UsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757194629; c=relaxed/simple;
	bh=55uaeWV/aBUQtp9LkGlPTEcjHah/6AIZRIwqNC7DGV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H68HsXzvHqNnnRAPAtiMbwmcYt1bKd2Lzi2PGoYL+j7MVlzf8xHVbEb4sU9F66W6pnMdh8f50NDQTdY0VqQWL56nxGsXvmCRbdwuFa5alsFZSy55clmYPKsHwReAjsOPGGZyZyTqnCtS0Rca5DbWSWrOIVqghSBAuQTU2Q2SUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K2W/llDd; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cK64B0917z9sm3;
	Sat,  6 Sep 2025 23:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757194618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p81LzOsOYNsdOTSUXvokaC8zBIJglqa1ttqhdnLPofE=;
	b=K2W/llDdgZ6H8bXUb8m2FGz08OzeQWYqvyYRR4fh1i+JXw5nsM6MdsK01JhLztgOFTtviD
	qmdlSmWwfjSjdiGvSRuJq8SH8/MBZH32y/8b/xOQSGqwYK0E8E+TObZohfwXV0SoNmghS5
	CvFGUT4Rg/SDZAlhUUsjJ9MCelxBsOIiv8w46dfdquCpODsQvcdOyvLw+ALsNJpM4/aEUs
	uqetv7SDjLzNZqtusbCTEuNiuMCyxieSA1ZvoKkH3Veux3MnL4xtlwEhMNFed5shnvG1Mx
	rvc4yiFYejOSZ7gPNQe+xUZZkHsvUSTNJLEBN6IWjly2IZuztPCccqe4mv89bg==
Message-ID: <6f476105-0091-4da8-8941-2794686cf45a@mailbox.org>
Date: Sat, 6 Sep 2025 23:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cxe8848dpu17ughnqfsffthzmjiprqsj
X-MBO-RS-ID: 67428cf859e6fa40881

On 9/4/25 5:54 PM, Nicolas Dufresne wrote:

Hi,

[...]

>> gst-launch-1.0 -v filesrc location=/test.mp4 ! qtdemux ! h264parse !
>> v4l2h264dec ! fpsdisplaysink text-overlay=false video-sink=waylandsink
> 
> Thanks for the detail. Since you have a running setup, perhaps consider testing
> with the following, left/right keyboard arrow will let you jump around in the
> media.
> 
>    gst-play-1.0 --audiosink=fakeaudiosink --videosink=waylandsink /test.mp4

Seeking seems to be working fine.

> That would at least cover seeking use cases. I provided Nas a stream that
> aggressively do resolution changes to reproduce a Wave5 crash, I would expect
> him to test and report against Wave6 too. If you'd like to have that sample, let
> me know, its not very big, and free, but I'd rather not do attachements over the
> mailing list.

That one seems to be working fine too, thanks for sharing it off-list.

