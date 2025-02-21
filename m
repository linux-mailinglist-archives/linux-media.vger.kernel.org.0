Return-Path: <linux-media+bounces-26585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A28A3F73C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DD06424FA2
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 14:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C147921019C;
	Fri, 21 Feb 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ef6Oxulx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0020F07C;
	Fri, 21 Feb 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148084; cv=none; b=XsXgexxjDw+W39FO0agN7pcE1W8ZfZkfJB02LjMGaoV6u4eUqTg7tpqmKdLNhsQDc5dOeY5kJLFE7Gck1dZMWJ+8vmS/KMBKGxg2L2htFuDloOixYbzsC3M3R63pjUlfLQYIQcogrfvNewOpoByKAza0/KaOkQF6PetQDVgZo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148084; c=relaxed/simple;
	bh=a1RRpP2MB+JIaxSkAwtrtiD0G1RvbN/tgAOlFZspAEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAWc10FYprLdfdurImj+U0ZcyB0WeFbnSDucogkSgZyIoh3WAhQh3VMotpbGsLL2xZZdFRQZqtSaZly5KCxAx882NKQMSreoEhi5mx6Akc/KYCofFw1MPPsf1AfIxQNepzmKrOniK+lQ25erRNdt4Ypxt4kLQak+5TgcrYkmrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ef6Oxulx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb90f68f8cso410381666b.3;
        Fri, 21 Feb 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740148081; x=1740752881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=ef6OxulxHj/P7pFJW9/RNL5Zu77rF2SdMCILzmlDni9zOZN/ADvhmF/DQDc52TIsUX
         ZgZACtW+w8Ag2Fl7WuNkjtw9x1yJRDierXkxZvi51EDEn0mHeE5FbRUjFEo81fxDdvtM
         oF1vM5gZRsKbK6ATjLyDH8FlvDm4HZytpc3ge/ykWrivpVAX7fFfCPA5gjm8k5UtleX4
         5LyEbSkg2rvwfoHoMhKF/3lIhNXII6R8aDIXJchIm1X7PrX1FeskoQi3fD3+dPpT1CRj
         HzVVI4rVuLLY/Pr1pLh6DRXQgE8gzlDyN//R2E0fyWnQxWtxlVIt65rOF5CD46+JpyyR
         MWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740148081; x=1740752881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=DOAjrfT0hue/DzbeySCdkylQwRP3nNhfwYmEM39R0ALAdVGgPYvc/PykNhij8FRj0R
         EGu2QZQkYegmUO6coWUICoiv/PP2tObDI5pNlGdR6BI6HFkzl3OaAigSUnZLDrbsWDUd
         6zhYe0IcClSFFNq6dvxt10SqfXNqMyJEq7QYF8T4mwFTqDPRh092N1JAebqY6mDuwVkn
         xlCdHWeVAcFmDGtTxr/fzP1U5wosDJykI1nRSphHN9YJLtsFWgpGolFoiuaBUElEeTQ5
         lIVLSzSEcIkhHdl+VSwNATEDdmLDoCDQRNCNlcJ5I4pgf0PvSZV2UVJRN+BDd+QcW0Nz
         nAPg==
X-Forwarded-Encrypted: i=1; AJvYcCViPHAkMGkDUF9Y4U/fUnu/hwFpN8u4ZnUSou4mWt050TtbLCDHBHXz/l5HeCsnf+GCvI3WxqE56Ndg@vger.kernel.org, AJvYcCW6x/TnbNiK3yjKGIk2fNNiQLYvPCoy6ZhAptkYgVT5sv0wOaYDUKIZAPsdmxXJ0VT3GkdJ6IWxOf/YxXE=@vger.kernel.org, AJvYcCWN6F3Z8BUCYxBwarKHgy7tFtXR/kukI/VIL4P8LQmwFi7HPmFzzhI1dqHR2VYzwdh0zf9aeLpDmaQJZJbj@vger.kernel.org
X-Gm-Message-State: AOJu0YynIYQtbjvXKvXSJOiiVAByj7r76/4yEAxfpLrtYYA5HQTRobag
	WYvshl8uNtypv5fKWHfTqHLp+gV+QiPTOk8gFAwfg3OouVm/Hmtg
X-Gm-Gg: ASbGncuWVG82fpqwSvYZyNRv7Y6Zz71gAtP8nBN+1BEqIgtay+Ku9Ux1SD5dAmBD5S8
	HyObqD1ojNLSe4GPu3ah2O+3htMUV1SSLSUCrF6qYb2ut+udr2BxXwYFo5+ZyaVU+wcUMTpFo4q
	NaXTmGDccDETrH1UHvvn2PRu9x5z5JNqvT4HdIMbnAucJddsH47vojaKxz+vDD7xUUpkyxtnpDD
	U9eEsnkkW0MdvVhEHMidys/lrevDaHMXddYG1kn7JEpgX3goVoJmu2PYynHJRMfztVlu8yGzFaj
	wFlFNzYJVrWn2UpPoalZZLR70rh/ECXD
X-Google-Smtp-Source: AGHT+IEw3WpudhQNFplJ29sjVHEYhC6rE/IVFnuZuPPiVWQyE+QjVu6xQp8nTv/VJK/U3W1OrZNliQ==
X-Received: by 2002:a17:907:7758:b0:ab6:4fa6:71e2 with SMTP id a640c23a62f3a-abc09a46c0amr310992766b.22.1740148080426;
        Fri, 21 Feb 2025 06:28:00 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e22sm850995466b.121.2025.02.21.06.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 06:27:59 -0800 (PST)
Message-ID: <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
Date: Fri, 21 Feb 2025 16:27:55 +0200
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

Can you think if any other way of handling this? The most useful way
would be to have it accessible at runtime so that devices upstream of
the cameras could assign the VC IDs dynamically.

This would be useful when having more cameras than the maximum supported
number of VC IDs (4, without extended VC IDs), and streaming from them
selectively.

For example, for 8 cameras, you'd have to prepare your VC IDs in advance
to fit the streaming selection you want to make. If the cameras 0 to 7
have the VC IDs 0, 1, 2, 3, 0, 1, 2, 3, you wouldn't be able to stream
camera 0 together with camera 4.

Dynamic configuration of the VC IDs would solve that usecase since it
would assign VC IDs based on the routed streams.

v4l2_subdev_pad_ops has a .set_frame_desc() that could be used to apply
an updated v4l2_mbus_frame_desc, after retrieving it using
.get_frame_desc(). Cameras that don't support VC ID remapping would just
modify the v4l2_mbus_frame_desc to restore the VC ID to the original one
(similar to how set_fmt() can modify the passed in format to what it
supports) and the caller would have to handle that situation how it sees
fit.

Does that sound better than sticking the VC ID in device tree?

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
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 
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


