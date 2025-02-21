Return-Path: <linux-media+bounces-26550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD39A3EF3D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0671703423
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB12202C2F;
	Fri, 21 Feb 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9cGXNvV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15E20125F;
	Fri, 21 Feb 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740128143; cv=none; b=VYyz38DnZsF58GZNDhhE/iKvPS8zLtfIQ29bJiNRnWKpfpKJKlPHHzBK2S9em4n/xn18BXF2XC5O1/1r5d//PZUPdtnE1upIOkCoCjBFEl/02i6wxQq1KYxky4tqL2TAu2cus5+tb7mvzw+9lY/EjPg+qgEP1sGlPOdlNe0nWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740128143; c=relaxed/simple;
	bh=/T0ySwxp4mZLQQcazkrub5eHoCD6jJrDkL2LKn29irI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8T5fRKqh7jzF/Crvf8dxAW7wG9ZnYZl2b99bSVFQII2SBAdZRhVKr3TrwOsNDdIyQLCuz0ZGxtpOWrc7yntfcK/CDX4JN/7FlCeg67QzKiFcZnz4TQQuyRCQLAdK47qfjpyOUlResQG941HeyQSIb4LhBKoe+4aJ8rdm/nLa7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9cGXNvV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so3161869a12.3;
        Fri, 21 Feb 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740128138; x=1740732938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=m9cGXNvV/Ez4/XI+Lnw7o3nUjo6JSSBHTjRMX4Byzej2EUOZ5qIEfeK3iY3XA3kpvn
         CWTABCwpMHw03kjmdg6y0YmbmcNthxvn7DheNz7R1/XgxZjspc1Upp5J6UDaCUFugOx4
         S8/bP83WdI5/gVRmdFpt+HnkH4iIdcLBE3j2bPFLDDtohKg1VFWhsnPj0xFcAaCfONzq
         bSL16w7T8Qc2KdnVrc0M94XVyljF8iJGLqo2BvYLPyrKGt9URqz7nt88ShSgf+jFe0gQ
         T7ZJKyGcav89W4Xbhek5FFsIL71CNk8tmaxQjN6M5dkOhFmhe2tqxFn/8qFJonvF6PRK
         MpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740128138; x=1740732938;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=iKd9Ia9QfOFH0+MSbK9BTejoQQBkr7aM71vC7AByuTmDyTz7YygyIkC3TNJhChztCG
         RbEGZ28pVqVSO1FiUd85trEaEK7TyemZGfHrT8aqOZXJJ908grFxf6altf1RfkI+DqZ1
         yLtCKj51Pcf8YPxUTdKWzQJALCJlkNJ/eWZAgrY8cET1tjFTUFyBvlDx/ZL37w5Erqly
         F2WP0hS582LCrwPwfBscVG3PB6vNBZVSxp4pF6ebVAI6B5AzCrNC2309luQ0kdD4n+wH
         jZhKk0j1kQCEejrLTwkVMR/3BPfssSH7UeJ5GtbtpdPRR/7vvuS0kOAwRzbjNpZtc5nA
         SZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4YwSaBo87U6oc5nqnUqrz+ssxG/B72SWej4RF9XqHtV1MqnMfhiVauSPBQccOdbxTYD9Y52PfIwBK@vger.kernel.org, AJvYcCULZD9IOFuf7RR3ea1hXisikjEK/fV4Hr2o/BIhbsPMthpb1XDlugbybXIOQ2TT1wNcC2cNteP14S0ZTs8=@vger.kernel.org, AJvYcCWEohds5lzy/bsuuXOVQ41GycoJyYxOizWBgb1AGLDSSQOK4Va3+Zs5BXpWHMAfQpQbuvNKnUDVlyXff52t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BoQJAOZI4r2pK2vEVvyMUjYwfIN2vQfiCyyxbL5QLzVGp4fq
	+sCbVmM5507t1hvjlBkdZP2ZlBUTt1fuL3WR4/93vA/kfnbp634j
X-Gm-Gg: ASbGncufSXo/m9GtG919BTcogkFC6GMYwmwUhS1XXqtpHvdTUjrrYtuFyX2GjYVc5do
	0+pyGMWpMVSs73oXxzbTwUeavRqIpc7RQVAlIkhOXALIgMXJ8gyD9/FXiKekwG7Wt7C5U1gCjgJ
	n2EdMFWcrCrzUGKoHLbpKOjAfsbb/R5mZ5bK1oOCVhDl9DE0ExnK2vJfVHj/Zp+isDK1Bo6qIr0
	GDnodPYiQcQdU4Y3hS7+5rEZ8FJ6jkMUMNWIppXesQbU3VInfGT/ltTOwOZmg83pFyT/hMB5ipA
	N9vO9fQCb9ileHqp8CSXyYuuqtgCL2C6
X-Google-Smtp-Source: AGHT+IFmTTdAgUDzbiHX+T9rWqsmdcKpPchN5TpDb6Tvrcof3AwRJCep4kmOdcOa6E6Gwr6wzr7kuw==
X-Received: by 2002:a05:6402:1d4e:b0:5e0:b542:fb32 with SMTP id 4fb4d7f45d1cf-5e0b70f002bmr1915674a12.19.1740128138254;
        Fri, 21 Feb 2025 00:55:38 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c58e2sm13515163a12.20.2025.02.21.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 00:55:37 -0800 (PST)
Message-ID: <51294a91-afd1-4e62-b320-88ee233fbfc9@gmail.com>
Date: Fri, 21 Feb 2025 10:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/21/25 10:38 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> Thanks for the patches.
> 
> On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
>> Multi-camera systems often have issues with receiving video streams
>> from multiple cameras at the same time because the cameras use the same
>> Virtual Channel IDs.
>>
>> CSI bridges might not support remapping the Virtual Channel IDs, making
>> it impossible to receive the separate video streams at the same
>> time, while the CSI receiver is able to de-mux streams based on VC IDs.
>>
>> Cameras sometimes have support for changing the VC IDs they output
>> themselves.
>>
>> For a practical example, GMSL2 deserializer chips do not support VC ID
>> remapping in tunnel mode, and neither do the serializers. Allowing the
>> cameras to have their VC IDs configured would allow multi-camera setups
>> to use tunnel mode.
> 
> We've tried to avoid having virtual channels in firmware and in UAPI,
> I'm not yet entirely convinced we need to depart from the established
> practices. Let's see. Apart from that, please see my comments below.
> 

Sadly there's no other way to handle multi-camera support for GMSL
devices that don't support VC ID remapping. And upcomming GMSL3 devices
only support tunnel mode which doesn't support any type of remapping.

>>
>> Add support for specifying these Virtual Channel IDs in Video Interface
>> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
>> Although the CSI-2 specification allows for up to 32 virtual channels,
>> most hardware doesn't support more than 4. This can be extended later
>> if need be.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> index 038e85b45befa..414b5fa8f3472 100644
>> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> @@ -231,6 +231,17 @@ properties:
>>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>>         busses only.
>>   
>> +  vc-ids:
> 
> Other properties aren't using abbreviations, at least most of them. How
> about "virtual-channels"?
> 

That works for me.

>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 

For the moment I picked 4 VC IDs (2 bits per VC ID) because any more
than that doesn't seem to be supported by CSI receivers, since most
do not support extended VC IDs.

Also, from the MIPI specification:

The Data Identifier byte contains the Virtual Channel Identifier (VC) 
value and the Data Type (DT) value as illustrated in Figure 32.

The Virtual Channel Identifier is contained in the two MS bits of the
Data Identifier Byte. The Data Type value is contained in the six LS
bits of the Data Identifier Byte.

>> +    items:
>> +      maximum: 3
> 
> 31 here, too.
> 
>> +    description:
>> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> 
> I'd leave out the explanation on the data type. It's redundant.
> 
>> +      the VC IDs used by the device for its data streams. This property is valid
>> +      for MIPI CSI-2 only.
>> +
>>     strobe:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       enum: [ 0, 1 ]
> 


