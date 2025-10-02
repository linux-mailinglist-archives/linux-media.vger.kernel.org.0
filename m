Return-Path: <linux-media+bounces-43664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B14BB466F
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C379E326840
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE442356D9;
	Thu,  2 Oct 2025 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Jk0maqcU"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B439460;
	Thu,  2 Oct 2025 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420277; cv=pass; b=smcjz8O2Jy17oQnd/Xs0ZwCS5hENeezX4oUzQTW457nn2QprIGNdfb9UrxCvd0qbCZEgYsHG2pmF2dL3g5xCxx4GiL7twNbcxro1kOCDy1RPUJGjgQMeTD12a+uy/pDI0aPvHoXGK02AM2aOd7KZiB1jorAiin+jqt3leSw5kHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420277; c=relaxed/simple;
	bh=qbssQKuQaom4m795PA7iywGUdWorLZn0ryyZ8FnOa8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WN/S4wX+dkcGhJPht+4H/bwmmzXT7A93zvVgT0456Ms+GRuIjQo+BnyCBrLmaCTiX/0kSlsziz11IhXJbCaAPxKHz7r86qf8l3uDQXbjbQjwDCqp6fDLHZX5Ph5BW8vsOaBhDRHE0ILQ+zLgtQIRu2Cf10Uh5jOWnKu+bfcxpOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Jk0maqcU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759420250; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BBmF9prk/9z+d/PIko3gG5IAT2wZMeU/HJGNEXDhsL79OLHLgbEgpOeLVoJnl5DXS+DoGGzkwff1tTDsHOfd3jUXPP16XMT87Ubd3PkGDGUxxUeKgqJ3NsNiOQylMZPMMAzWQDHw1XD81wPAWyemhcLgQku0QejlYuAXimBPizA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759420250; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cjZk9P3mPo8vEXyNeg2cfL82WiNZDB6NKkkVZEOqqe4=; 
	b=hA43kO52+tz+ehJfz9xv7c/voKNs3CmoZ91Fc96JxIZxLf09+kvn0qCnRzSimdIPYQSV/2f6MtRz1b4KQOtk5lb3lLTYhxKFtRoTacky7A8T9ddjd/RbDLuqKcg0q8yv1+jOkdpqNvq/jjxywTLBTV9Aa/hlevSZtWHsdYuMTbo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759420250;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cjZk9P3mPo8vEXyNeg2cfL82WiNZDB6NKkkVZEOqqe4=;
	b=Jk0maqcUR5RFGMo9gQtZKBtwo79YQjWnsCWrWNDjB4GcjyI7SexYYl2RnOZnmPUW
	dfEJJiUN46+9ElIDZbIA4k63oloHRyOx4q/De1OcfrkybweMzm0oJ7Ng3Gybr7h94aq
	HCnHbf6vXLEfoeLA9DKLx1mieVPuvtOsGIB7RolM=
Received: by mx.zohomail.com with SMTPS id 1759420248615533.0821852004965;
	Thu, 2 Oct 2025 08:50:48 -0700 (PDT)
Message-ID: <169cf964-85a7-4f96-9a0c-0f06c7bfa012@collabora.com>
Date: Thu, 2 Oct 2025 18:50:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: synopsys: hdmirx: Detect broken interrupt
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com, kernel@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251002140750.579059-1-dmitry.osipenko@collabora.com>
 <wrzkhnslrwnpsv7gbdcvxobahun7l6foftftk676hxinfeqwjr@v3di5okva7co>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <wrzkhnslrwnpsv7gbdcvxobahun7l6foftftk676hxinfeqwjr@v3di5okva7co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/2/25 18:33, Sebastian Reichel wrote:
> Hello Dmitry,
> 
> On Thu, Oct 02, 2025 at 05:07:50PM +0300, Dmitry Osipenko wrote:
>> Downstream version of RK3588 U-Boot uses customized TF-A that remaps
>> HDMIRX hardware interrupt, routing it via firmware that isn't supported
>> by upstream driver.
>>
>> Detect broken interrupt and print a clarifying error message about a need
>> to use open-source TF-A with this driver.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>> Changelog:
>>
>> v2: - Added PHY r/w lock and moved the clarifying error message as
>>       was suggested by Sebastian Reichel.
>>
>>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 90 ++++++++++++++++++-
>>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  2 +
>>  2 files changed, 90 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> index b7d278b3889f..e6456352dfa5 100644
>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> 
> #include <linux/cleanup.h>
> 
> Otherwise LGTM and hopefully helps people to figure out the root
> cause of their problems:
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks for the review. The cleanup.h always included by mutex/spinlock
headers, there is no need to include it explicitly.


-- 
Best regards,
Dmitry

