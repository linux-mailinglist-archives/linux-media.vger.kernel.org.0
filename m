Return-Path: <linux-media+bounces-26656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AEEA40BB5
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2025 22:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0E5189EE23
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2025 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298A82045B6;
	Sat, 22 Feb 2025 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OLJCMGjE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22861EA7D4;
	Sat, 22 Feb 2025 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259579; cv=pass; b=DW9utnYIRcwldEdjmb5onxOhNK+NP74JU0FIdecOTkNmrHsR8UKkzQEw+/ZM74uOy01/9tPUmhWC3wH1Kv0RSBodxXq4xwxQOHhPyjnagc7oWEEDa5civTuNPeqQfUflleCAVUEJcVg/7zgG5bP9MP2cWW1qAtXhndS5SkiKVa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259579; c=relaxed/simple;
	bh=zCvYe3s1S8w1LI2+NFee1pbAFTm/lUZRUu+i5RJPw7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfYcdLWgR4ojc1fToFW5lVUKJaL/8sQAHDoelz+JZnhTsge/WL51NODGhdQ/9BC7l5qMQ5Dg1pBWogSWkXpvscG+HsLRLaAxLG5CBuTi5IbPlgl1t4KjQopJHhCkLDZTiQ+lxsdYuCzpsfh5pSmS/NecOLI8z1q8n4YIvS7k1Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=OLJCMGjE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740259531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kahvBBzC/sE5LzO7udW6on5iWQY6boAaWgpShXdSq3ZopHjNleUp5y/noGK051JyO29yFaUhLQ00F9gITZjlOzCkVySoTpuJ0fN2BfS8iGKp6CheJoZmQLWbnwnvyUW/jYJtTEcu9QoHRFnNIRgZclMNLHoXnCYh0ym51yzHKDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740259531; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HHhVwOm8XCVyTGfKeefhbmzIfD+mbGXuyzinCDr/k+8=; 
	b=lhwJVlRdv79ql3NhjmhU0772ptdonzIUfRZbzoqBBqJKjMc+/G9mbVp8oqqsAAebIp03wX2hWOoEuLOTUNplLKJIXw4F+c+9NSstsy7bWjU6B2qtereggchIA/v0dGEdc/f6lbig3wvhPezr3tb8250YE2b7SdYfMAe2qLQifJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740259531;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HHhVwOm8XCVyTGfKeefhbmzIfD+mbGXuyzinCDr/k+8=;
	b=OLJCMGjEEoSmAKmRUvUvA00/1MMQFy9EED6VKygTYzduAjvSSeNVrm7uSj2rQKv2
	+QtQnzqoyeeE9ieDueRneNoL0uG/mfc+Cl4p89cY7JivNFBXpyiTNwRQJ+SKCNoPnHj
	UV6qWYJehOaweRPxe/dHUfzh0ptkPInR9jZgKMpw=
Received: by mx.zohomail.com with SMTPS id 1740259529876548.7189453271194;
	Sat, 22 Feb 2025 13:25:29 -0800 (PST)
Message-ID: <dfb0ef63-8867-4d00-abdd-8280623c3405@collabora.com>
Date: Sun, 23 Feb 2025 00:25:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Markus Elfring <Markus.Elfring@web.de>,
 Dingxian Wen <shawn.wen@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nelson Costa <Nelson.Costa@synopsys.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 Tim Surber <me@timsurber.de>
References: <20250218184439.28648-5-dmitry.osipenko@collabora.com>
 <9e46e0f9-ef0d-406f-9fa9-9c4464a8db88@web.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <9e46e0f9-ef0d-406f-9fa9-9c4464a8db88@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/19/25 23:56, Markus Elfring wrote:
> …
>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> @@ -0,0 +1,2718 @@
> …
>> +static u32 hdmirx_readl(struct snps_hdmirx_dev *hdmirx_dev, int reg)
>> +{
>> +	u32 val;
>> +
>> +	guard(spinlock_irqsave)(&hdmirx_dev->rst_lock);
>> +
>> +	val = readl(hdmirx_dev->regs + reg);
>> +
>> +	return val;
>> +}
> 
> May such a function implementation be simplified?
> 
> {
> 	guard(spinlock_irqsave)(&hdmirx_dev->rst_lock);
> 	return readl(hdmirx_dev->regs + reg);
> }

That will work, thanks.

> …
>> +static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
>> +				       struct v4l2_dv_timings *timings)
>> +{
> …
>> +	mutex_lock(&hdmirx_dev->work_lock);
>> +retry:
>> +	memset(timings, 0, sizeof(struct v4l2_dv_timings));
> …
>> +	mutex_unlock(&hdmirx_dev->work_lock);
>> +
>> +	return ret;
>> +}
> …
> 
> Would you become interested to apply a statement like “guard(mutex)(&hdmirx_dev->work_lock);”?
> https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/mutex.h#L201

That will make code less consistent and less intuitive to me. Anyways,
thanks for the suggestion.

-- 
Best regards,
Dmitry

