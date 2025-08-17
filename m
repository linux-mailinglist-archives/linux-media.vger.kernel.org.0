Return-Path: <linux-media+bounces-40040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C5B29427
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 18:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE271963933
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 16:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7632FB963;
	Sun, 17 Aug 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="oqArMeRt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75711FE47C
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755448420; cv=none; b=tQ0YrmBq8k9/P8cFWi/XJDAx8BbvFbEXw7Cqv39WOhAB0uaHobnTmPHaJuAu7GpIdqc8+Y8rKSu/eFgRdNuJjZ7RX1QUelqblTLxxRwqpsbgQ+lBnVgkihL9R/L7n/8DMqM3jySqudgugHN8wKr8Zd1HJn9cYFacCE9HoPFg6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755448420; c=relaxed/simple;
	bh=16KfWKmXnvMG8XienSHousVwtT9tO5Q9/eKeHJpXN9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTkP1S4YUe3sK3dA20rDxPFr3QMZUc2NjUdWBd80cuV63BI50MsBhdCGjyAbSfAzY3o1M2+EX+eHbGd1t+sg1yQiWPwjYNGhmMRZSGgYx5Z2kBkDH1gPT4+DCoXgE8fpviOpLrSO9puMRkUYyBMnz/lw5LJ4GIDA7BiljmMz/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=oqArMeRt; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755448412;
 bh=05X/I2SqxVTRC5UNwPe0jX77RC5+lAMs+Sp0TwX0JKY=;
 b=oqArMeRtB1wUrqOJIa/tNCwJeZERHj4oOz2Iv6THpZMYyrdt3RDfCp2b4NSAFoItZgc3nVbiK
 bFAVmvWcZ58FgOgdXxlNS6kh2stOulquuCtMOlIil4uSxek4hT0H9reU+vydJ/4eztJd7/ommlc
 FzotVX+1iQJ9O2+BZNnAYnM4wABbdP5r+GP7eurJCiFVGm0Fw3WvMUAmIpY7IyBITpRg3vgY5X1
 oO/ybICrLNVl0xkegPgqNaoLh354cJyaI+wPlAjLKWNf8XIlZ/uqnIRL0MABTi8Uy+yZIVESl27
 Amiem3g5MP0HOwtT4ZzBPxTmsfjbEAzj2iBltew3N7cg==
X-Forward-Email-ID: 68a204589a82a81f459cf7d1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <f55f6c64-f720-437b-ac88-80b6930a9c2c@kwiboo.se>
Date: Sun, 17 Aug 2025 18:33:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
 <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
 <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
 <efdf8c99-d166-4b78-afc5-d4a6eb5ac046@kwiboo.se>
 <25ce30446e8e8d038273fcdfb398c90995c242db.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <25ce30446e8e8d038273fcdfb398c90995c242db.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 8/12/2025 8:26 PM, Nicolas Dufresne wrote:
> Hi Jonas,
> 
> Le mardi 12 août 2025 à 19:31 +0200, Jonas Karlman a écrit :
>> On 8/12/2025 2:44 PM, Nicolas Dufresne wrote:
>>> I forgot, 
>>>
>>> Le mardi 12 août 2025 à 08:38 -0400, Nicolas Dufresne a écrit :
>>>>> JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
>>>>>
>>>>> - DBLK_D_VIXS_2 (fail)
>>>>> - DSLICE_A_HHI_5 (fail)
>>>>> - EXT_A_ericsson_4 (fail)
>>>>> - PICSIZE_A_Bossen_1 (error)
>>>>> - PICSIZE_B_Bossen_1 (error)
>>>>> - PICSIZE_C_Bossen_1 (error)
>>>>> - PICSIZE_D_Bossen_1 (error)
>>>>> - SAODBLK_A_MainConcept_4 (fail)
>>>>> - SAODBLK_B_MainConcept_4 (fail)
>>>>> - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
>>>
>>> I'me getting the same result if I force a single job in fluster. The test I
>>> posted was with 2 jobs. Detlev found that the iommu reset is required in
>>> more
>>> cases on RK3588/3576, perhaps the HEVC decoder in older hardware needs the
>>> same,
>>> I will try and report.
>>
>> Vendor kernel [1] check following bits from RKVDEC_REG_INTERRUPT reg to
>> decide if a full HW reset should be done.
>>
>>   err_mask = RKVDEC_BUF_EMPTY_STA
>>   	   | RKVDEC_BUS_STA
>>   	   | RKVDEC_COLMV_REF_ERR_STA
>>   	   | RKVDEC_ERR_STA
>>   	   | RKVDEC_TIMEOUT_STA;
>>
>> Adding proper reset support can be rather involved and main reason why
>> this series does not handle it, better suited for a separate future
>> series.
>>
>> Proper HW reset will require e.g. dt-bindings, DT updates, pmu idle
>> request integration and for rk3328 vendor even moved VPU reset to TF-A.
>>
>> Doing the iommu detach/attach dance not only on RKVDEC_SOFTRESET_RDY
>> could possible improve some cases, until full reset can be implemented.
> 
> Rockchip is following VSI design of "self reset" on error. But since the iommu
> is part of the device, it also gets reset, which imply having to reprogram it.
> This showed to be very reliable logic, despite RK doing a hard reset.
> 
> Since self reset is documented for RKVDEC_BUS_STA, RKVDEC_ERR_STA,
> RKVDEC_TIMEOUT_STA, it would seem that RKVDEC_BUF_EMPTY_STA is redundant, unless
> its asynchronous operation that need to be polled. Possibly something to
> investigate. RKVDEC_BUF_EMPTY_STA and RKVDEC_COLMV_REF_ERR_STA are not
> documented a such, so its not quite logical to reprogram the iommu.
> 
> I don't immediately trust reference software for these type of things, we should
> find what works best and have a rationale for. The hard reset is every
> expensive, and hard to upstream.

I fully agree, and I tried a few things like issue iommu reset for more
errors, skip use of iommu completely, disable use of performance cache,
write 0 all regs before writing correct values and nothing seem to
resolve this issue.

So more investigation will be needed to fully understand what we need to
do to get a more reliable result.

Will do a visual inspection of the decoded frames on the tests that is
flaky to see if that can give any clue on the extend of the issue.

Regards,
Jonas

> 
> Nicolas
> 
>>
>> [1]
>> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L924-L931
>>
>> Regards,
>> Jonas
>>
>>>
>>> Nicolas


