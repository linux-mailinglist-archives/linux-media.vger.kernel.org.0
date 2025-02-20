Return-Path: <linux-media+bounces-26466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C5A3DBC8
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2392017C8CD
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A4D1FA166;
	Thu, 20 Feb 2025 13:55:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B21F63F5;
	Thu, 20 Feb 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059748; cv=none; b=gDMXwXIjLOtqqKn7ovj3R2fhSVAEeiVkyfG4MH/95LR4sz05gUrADIHlE0x6STgwMMBhfC4t3s7aeYpy1QV/BWHbdqfBjJ6Fs04ucucLyPXIwluGsCjms8wm6FbLJFmNHkAVhRPVZ6JDcw073KteUeN9OrP7F0TECb7EFvzIjgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059748; c=relaxed/simple;
	bh=kAq/HYLtL9V56JsyiHkrDyP7zD0/m2fHT0iIr6/MOpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN+CCFaRy5DosAGZo/IUX/i0JoG9VYl8nInAA/WHuofEXlY+Pcs8i9dCi0FM70CzaFnyUWuS0tQC16Wnc9p1RscmaoMCsTRP/jGCmd7kYvQslQWjJsMqOtcP0+gyf9NWchRyWvWfLGjB7t5IiYhIS5DIZ+EJC1E5d2sWTVL5CEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B3C4CED1;
	Thu, 20 Feb 2025 13:55:43 +0000 (UTC)
Message-ID: <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
Date: Thu, 20 Feb 2025 14:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241203093114.0ca49c01@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/24 09:31, Mauro Carvalho Chehab wrote:
> Em Mon, 02 Dec 2024 15:47:15 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
> 
>> The code is running arithmentics with the enum, which when not done with
>> care makes the compiler a bit nervous.
>>
>> Because those enums are only used as defines (no argument or variable
>> from that enumeration type), convert it into a define and move on.
>>
>> It is required to build with llvm 9 without these warnings:
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
>>  1 file changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> index 5bc44f194d0a..62ffa16bb82c 100644
>> --- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> +++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> @@ -57,19 +57,17 @@ enum USB_SPEED{
>>  };
>>  
>>  #define TS_MASK         0x6
>> -enum TS_PORT{
>> -	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
>> +#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
>>  				   only offers Analog TV or Video */
>> -	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
>> +#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
>>  				Digital or External Analog/Compressed source) */
>> -	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
>> +#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
>>  				(Dual inputs from Digital and/or
>>  				External Analog/Compressed sources) */
>> -	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
>> +#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
>>  						to external clock */
>> -	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>> +#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>>  				   TS2 Input (from Compressor) */
>> -};
>>  
>>  #define EAVP_MASK       0x8
>>  enum EAV_PRESENT{
>> @@ -89,10 +87,8 @@ enum AT_MODE{
>>  };
>>  
>>  #define PWR_SEL_MASK    0x40
>> -enum POWE_TYPE{
>> -	SELF_POWER = 0x0,	/* 0: self power */
>> -	BUS_POWER = 0x40	/* 1: bus power */
>> -};
>> +#define SELF_POWER	0x0	/* 0: self power */
>> +#define BUS_POWER	0x40	/* 1: bus power */
>>  
>>  enum USB_POWE_TYPE{
>>  	USB_SELF_POWER = 0,
>>
> 
> IMO keeping them into enums are a lot better than defines.
> 
> Perhaps the right thing would be to join both enums here.

ORing enums is really not a good idea: you would normally never do that, and the
compiler warning is IMHO appropriate.

I think this is a good change and I plan to take this.

Regards,

	Hans

> 
> 
> Thanks,
> Mauro
> 


