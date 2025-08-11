Return-Path: <linux-media+bounces-39457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DDB215DE
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983D31A23AC3
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 19:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BB129E0ED;
	Mon, 11 Aug 2025 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="OneJKKKf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5531FBEB6
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941661; cv=none; b=Znbg7T6J1+eG0zA8oAJvCvaYAFj7ibRhOzHZ+dMn5zUxOVDTsCM+k7uUrKFKG4cI9MqsK6eMLNvR3nkPe1tX9SINOxY1MKFb8hQC38sOv7ElooHXYgec0QlEIjs4zc3BM8v/vW1bgtZcYqAInurc4hzUjpvBM7Y/A89V7GFO3KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941661; c=relaxed/simple;
	bh=8VP4+SXuBWDYxMejSZPkzLZued5y6P3qoQt3VsSOjQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ey3rw/KBA0zJdufpm5e1yqjqVy2ZKqjoYSqdlfhNxeA6HJiDIPF70WEiyAlesOOFYgAVY7eNdA02F6wT/7lTg4/PHTWCx+cSbRhH1by3jJ8EZivkYXeKE6w6Z7Z7fnh3nl+aBu4xlFAiJplv11Mi+7a+nEV77ALyuU/iWP9xKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=OneJKKKf; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754941658;
 bh=LbVk/fpTYYUx2D//VVnb557+OAlwMeSeZqu2R2SQyeE=;
 b=OneJKKKfpWaJ1U45wzdHxGotxPeOQPq5dRHw3cqoU4wLZpFQuuKAlR+3TtNAaBoDIqAQzia+F
 DLxduQkuBIbm/ta3wh095DNvIOHEpE8TSyY0DGquPXGGbUYT6IQud2XKwNcHs6KhHDE1/Nph1QG
 acy1JefkdoNBwDgkti8hvxbCuSmk22wBYt+tRKBVORz2q8Peh0QZOAS2cKwsxXz1kpeLgUOilRb
 8xbIsmTSHcyI6mpbtbUa/MSh+d6QcI3Kac/loTg26zj7ZQtASJFa9SwychxZ/cZ8hj9+K3c1oc5
 Cmo5veEwX5cwup3wEGN9Wg4fjLseuj2JCfvoZ1TQycow==
X-Forward-Email-ID: 689a48a7de615f3104e044ef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d0d50da8-f8bb-4a6f-bd44-5199d26b7a86@kwiboo.se>
Date: Mon, 11 Aug 2025 21:46:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se>
 <9c8cb837d10d3cdd54fe34dedfe40c10e848f648.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <9c8cb837d10d3cdd54fe34dedfe40c10e848f648.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 8/11/2025 9:12 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> The Rockchip VDEC supports the HEVC codec with the Main and Main10
>> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
>>
>> Add the backend for HEVC format to the decoder.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v2:
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> ---
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>  6 files changed, 2745 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile
>> b/drivers/media/platform/rockchip/rkvdec/Makefile
>> index cb86b429cfaa..a77122641d14 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
>> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
>> @@ -1,3 +1,3 @@
>>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
>>  
>> -rockchip-vdec-y += rkvdec.o rkvdec-h264.o rkvdec-vp9.o
>> +rockchip-vdec-y += rkvdec.o rkvdec-h264.o rkvdec-hevc.o rkvdec-vp9.o
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>> new file mode 100644
>> index 000000000000..eac4ea604949
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>> @@ -0,0 +1,1848 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Rockchip Video Decoder driver
>> + *
>> + * Copyright (C) 2023 Collabora, Ltd.
>> + *	Sebastian Fricke <sebastian.fricke@collabora.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#define RKV_CABAC_TABLE_SIZE		27456
>> +
>> +/*
>> + * This file is #include from rkvdec-hevc.c and not compiled.
>> + */
>> +static const u8 rkvdec_hevc_cabac_table[RKV_CABAC_TABLE_SIZE] = {
>> +	0x07, 0x0f, 0x48, 0x58, 0x58, 0x40, 0x40, 0x40, 0x40, 0x40, 0x0f,
>> 0x40, 0x40, 0x40, 0x0f,
> 
> Nit, in H.264 case, we managed to fill the CABAC based on the spect with macros,
> didn't we figure-out this one ? I didn't check in Detlev tree, I'm just asking
> here.

As hinted at in the cover letter: in the initial implementation used for
LibreELEC I just shamelessly copied the cabac data 1:1 from the Rockchip
mpp library, for this series it was replaced with the cabac table from
Sebastian Fricke prior series to add a HEVC backend [1]. Sebastian
mentioned following regarding the cabac table:

"""
Notable design decisions:
- The giant static array of cabac values is moved to a separate c file,
I did so because a separate .h file would be incorrect as it doesn't
expose anything of any value for any other file than the rkvdec-hevc.c
file. Other options were:
  - Calculating the values instead of storing the results (No clear pattern
    found for the calculation using the static array and the formulas from the
    specification)
  - Supply them via firmware (Adding firmware makes the whole software
    way more complicated and the usage of the driver less obvious)
"""

I have not explored any other way to handle the cabac table based on
these design decisions.

[1] https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com/

Regards,
Jonas

> 
> Nicolas

[snip]

