Return-Path: <linux-media+bounces-27821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA6A56439
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D46F16F2C0
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FA220C473;
	Fri,  7 Mar 2025 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RIzsMLC5"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5D1A4AAA;
	Fri,  7 Mar 2025 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340851; cv=pass; b=ZT/sdsXfw7LwXWRQf4NqBaSb7WVhh7B71xQn1ITnaVpm3CPud1lhzLJEIIyA2x0auXTNeHmurMJadRnElQ1GPfO1IHl1nWreUXU0gztfhAQGFM8hLy4kTSAVrnDBEj710Qdp3YgGq/5+uvTFsU6hxAJ12cUKqj9v19CRlnxYosw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340851; c=relaxed/simple;
	bh=TKYfuOxdy1s1UVd0RHd4x0Y5IOTTNY9r8ooPj+t8xB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLT7UQWQjduic6z12kOOJKeDL1m+fssQC8qMRsQr0zHB6Bn6mDNNQNSy6ON5fj2Ijnk4gcLEtawwvKd1YfpOTA2wA5D2S04LBVqfqTMmdLlqOJ5m57csDkD1JsZaMKRmNlIl6B8YuB27V69tijLjiaNPfxV61IFm7QygICL9iFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=RIzsMLC5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741340825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BN4GZTqqX1hFEfPVXNwX2SdMjQ2FKPy9d0OOArjsJ94AvV7sqHN65TZVRUMoszNuuU9z9Vu5+Yok+gabiijboF5oS6pMG35NOJQ/eeEz7GvFJ/JI7OoANrqIOjkfLFq+ghBcpYNaIhf8RE/xikWoNnDFIDY9wLDBdIxi5L5wxgw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741340825; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9pKHj4mQjvLd9ro+KI2xNvG5tbJUvO6/hXW3wWj049E=; 
	b=YO+nBI2MItXU7EOSjfdZPr+4OVx1ZFDcrNbRqJwGWsBSDdBnuwkyICpYFkTE95jqsZ7Df8xX5ojUSLUP4QTzf2s0IVINGdnvj81wL/di3KiqXKNGxhwuwQP6yS4n2pCP9E4d+BUiIKOfKyj2L/x7qretSjTLaF75cO9mCbB8XvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741340825;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9pKHj4mQjvLd9ro+KI2xNvG5tbJUvO6/hXW3wWj049E=;
	b=RIzsMLC5CPOidIFYfG7xXjtVSnLKeCLh5PtccOr6ArCYcFK/wkGdb7R1akPJUxel
	bQPk4OerLJ6IWk4Huy2326o112byizq7POFQbNdHHnrF0RE7NiibWzWL29oscBNWvpu
	H9cOgiQwfOxgWo766WyvQQrMJlbWB194Ybh6i7AY=
Received: by mx.zohomail.com with SMTPS id 1741340823435860.073154154047;
	Fri, 7 Mar 2025 01:47:03 -0800 (PST)
Message-ID: <51d0781b-1da4-46c6-b772-718d7833798e@collabora.com>
Date: Fri, 7 Mar 2025 12:47:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
 <54d5eef8-66a9-44aa-9e9b-0324d6fee46d@collabora.com>
 <4a50949d-e472-4942-9152-3e5a54c6b076@stanley.mountain>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <4a50949d-e472-4942-9152-3e5a54c6b076@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/7/25 12:45, Dan Carpenter wrote:
> On Fri, Mar 07, 2025 at 12:36:47PM +0300, Dmitry Osipenko wrote:
>> On 3/7/25 12:30, Dan Carpenter wrote:
>>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>> index 4ffc86ad6c35..e0d3fed87a92 100644
>>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>> @@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
>>>  	bool hpd_trigger_level_high;
>>>  	bool tmds_clk_ratio;
>>>  	bool plugged;
>>> -	u32 num_clks;
>>> +	int num_clks;
>>>  	u32 edid_blocks_written;
>>>  	u32 cur_fmt_fourcc;
>>>  	u32 color_depth;
>>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Would be also good to return the original error code. There is no need
>> to check for the < 1 clock, it should be the < 0 check. Can be done in a
>> separate patch later. Thanks for the fix!
> 
> I'm not very familiar with th edevm_clk_bulk_get_all() function and it's
> not documented.  But clk_bulk_get_all() does return zero, so I can see why
> people would be confused.

We will take care of it, thanks again.

-- 
Best regards,
Dmitry

