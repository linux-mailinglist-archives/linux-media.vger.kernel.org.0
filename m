Return-Path: <linux-media+bounces-26231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AAA38B2C
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4061C3B286A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D3821CC41;
	Mon, 17 Feb 2025 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="gbWOKyv0"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17320215F5E;
	Mon, 17 Feb 2025 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816233; cv=pass; b=fxKdZSkk6XS0UPbgC3VqAYcaIwMS30U5LkHyVXnFO0xgyPaXcDb12JtnutCjrUR38K4GGEgyfdFF/o3Vw93PikDAIbIvcWx8+c0VK/o1iACsPjjKSfPo7pvBLPhKAcvm3lZ59o2p0lTJbCL1qFXlkyJQOv0UNYkmM3UL4vkV+rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816233; c=relaxed/simple;
	bh=NUqQknZpg2LliGTzyKHfciU1oNwwa+2zKooTZkcKwpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiAZ2Yqb3O3QTdl/OI52tOFuIvTdUhwNPC04DWLtEobOzShBtmSMnLNEhdCvsNj7q7c63FpSq6Da6Tcr4A4Kt4mnmamIV+pHoJVS6D81Bnb8oUZ8mgq1UAm5b4PswaLop33PXhCr0NRxt2gORr5dU442RqmSYDitCJceOgD3LSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=gbWOKyv0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739816173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ijxtj4U8Q8R7wF2cKrBvAlztwsF7BHKE9ppJN+H5P+dWjGidAuFnAINvHWu1ugpr1KKFjNOgD/BL58cpHHg++bIB3cgTGtd+138I0XmM/pVkAuBePh6asJxzZZMGGMoyhMupfIuxXSd/uLFYhu5zZvFe8thfq19iLR86rB7HSy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739816173; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dW0tidsgp/Ub4s++qsOhA6oRQ1/t0kgWfjgFSGuKGjs=; 
	b=VWX3H4OTkoH1XaxjU+7vO6RIlxGvOjomnJz7kotKI1KEc0niNqCmLO+6ZU3/FRYcWsEPh1MFGezrCeZCWkkI0kHDH8Ri/Dd39HFKoKhZDdiT9/iFRNqKihl3JLRPEOdW3P4yIC2RNb4XD9pLIy6+810nBWMZQZicB/G9SR0mRQQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739816173;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dW0tidsgp/Ub4s++qsOhA6oRQ1/t0kgWfjgFSGuKGjs=;
	b=gbWOKyv05QL9Uq1RX9ObrSEFjSLUUYqJL4UkEvlwp9CkWJ0/PcKYAAYsm3/0jTeq
	QCuyxQNT+HnCsGpH5M8FTziAhyx0CZ9H4Skf6c8CzlGWVneXBUkOCtOgEHE+KW8ITKN
	vhrnDpCyr+AuRER+kPYRZehu6lb+gDzTSWXIDSmA=
Received: by mx.zohomail.com with SMTPS id 1739816172379218.1983866353495;
	Mon, 17 Feb 2025 10:16:12 -0800 (PST)
Message-ID: <6638b286-2e5e-4861-bb85-2e29556b0b02@collabora.com>
Date: Mon, 17 Feb 2025 21:16:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
 <0218c59c-ed97-4315-9306-041636462293@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <0218c59c-ed97-4315-9306-041636462293@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/17/25 11:34, Hans Verkuil wrote:
> Hi Dmitry,
> 
> On 15/02/2025 22:04, Dmitry Osipenko wrote:
>> This series implements support for the Synopsys DesignWare
>> HDMI RX Controller, being compliant with standard HDMI 1.4b
>> and HDMI 2.0.
>>
>> Features that are currently supported by the HDMI RX driver
>> have been tested on rock5b board using a HDMI to micro-HDMI cable.
>> It is recommended to use a good quality cable as there were
>> multiple issues seen during testing the driver.
>>
>> Please note the below information :-
>> * HDMIRX driver now only works with the opensource TF-A.
>> * We have tested the working of OBS studio with HDMIRX driver and
>> there were no issues seen.
>> * We tested and verified the support for interlaced video.
>> * We tested capturing of YUV formats.
>>
>> To test the HDMI RX Controller driver, following example commands can be used :-
>>
>> root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video0 \
>> --set-fmt-video=width=1920,height=1080,pixelformat='BGR3' --stream-mmap=4 \
>> --stream-skip=3 --stream-count=100 --stream-to=/home/hdmiin4k.raw --stream-poll
> 
> This looks a bit odd. This commandline should work just as well:
> 
> v4l2-ctl --stream-mmap --stream-count=100 --stream-to=/home/hdmiin4k.raw
> 
> v4l2-ctl will call QUERY_DV_TIMINGS, then (if a valid signal is found) S_DV_TIMINGS.
> That in turn updates the v4l2_format. So there is no need to set the video format,
> it should happen automatically.

Your cmdline works fine, setting format isn't necessary.

> Also, why skip the first three frames? And why select --stream-poll?
> 
> It could be that these are just left-overs from previous attempts, but it's
> weird.

It's indeed the left-overs, will edit the cover letter in v7.

> I also commented on the debugfs InfoFrame code in patch 4/6, that's not
> correct.

Thanks for the thorough review! :)

Additional note: I'm going to finish upstreaming of the driver because
Shreeya is currently busy. She will be maintaining driver afterwards.

-- 
Best regards,
Dmitry

