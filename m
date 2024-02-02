Return-Path: <linux-media+bounces-4614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F21847183
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 14:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42871F2CCBF
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 13:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2854F47796;
	Fri,  2 Feb 2024 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ryAFXfwg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494147794
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882196; cv=none; b=PMNeWgqcGh8F9TIYuURIeL1SPZBIx4aoLiNl65/vp81GLU8mH/98aIaWezkyAd/OfPFvDcnQy+AKxHFMplUbbdU+m7rZeXZgApyepWwFC/nRCxQzVu+NxbqxAXFAGnobbdjKARdWRX3BHwYZqYWU4pwuc8yh3yIGXwmy1PjTIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882196; c=relaxed/simple;
	bh=4aEoEwz9J0ML0BYwouE/JF/KwUQI6gO0VKN/ylqPVRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7OrfKrost1zd3YlPD4fSkEpka5zu+05bY0HsCea3Jg2X3WV6jd14YDmKMeJ83pmurLJNWOhLdBpn7Pkhd7MMRWSYtmJLZvaP41bPSbnAWrFPDkDnumb57cQMk2t1MO1ZVBKQJDXOrO02FDfUkGs+zrG/owFfvwp8TI7nop1NCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ryAFXfwg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2881055a12.1
        for <linux-media@vger.kernel.org>; Fri, 02 Feb 2024 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706882193; x=1707486993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbhO/HLgRhJa/oq9y2kZ5q3vZ9YnasSrguN9TQP9dbQ=;
        b=ryAFXfwgY7QLGNi7gfncGHOA8by9gHxebKj2o8V2zuiTQ86/xRSzeKBjhh9NpgleC7
         0DQJMWkIYX1yJRWDzHYQjWS28q65CxDY63aOx1Pdh41etj/4P1S9M5fYHfehVvEKF5On
         rM6U3ke80gzl2MYhJvi5EdXIWpc7k/z0clG7qrFUpzAtpE4ILEzHdmLjSoCNCcZWMg2t
         Y/Yrxe5v3elRReZP5nCM/uRCGjsXPszg7TX5+SN38FxrPLXMhncdkQA1yXcTzGnag99f
         9WEAyXQud8vCIg4W+HJaz9Zz5Opfc4ZMwlqSShNCxd+J0y2XDy905h3C/bIfabG7Tlhc
         H4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706882193; x=1707486993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbhO/HLgRhJa/oq9y2kZ5q3vZ9YnasSrguN9TQP9dbQ=;
        b=UjrfTA07PzrT2Nc+ENfQUgkvhcfjT+sc4h7A9VBkPCRB92lRCPIX/tAGHQ5c3bqFz1
         yodAth0mig2l4qhpUlb3f57Ba5Q74t6m7kRkQwsSP9dT8JHHSPDpW18RxJryFGcJhgd7
         qmBs+jsFRvXTN7c5uh1eiimPN9Prmrx3GZmT0LtvyqaDJxrfAf+EAcGnS46LtwqU3RNo
         eCsmeFuXUBubIMJ4G97ckIp+cEzuePMQOFyZrqN7K1Rd70Ddcr9JFyYFU66dV0/LcI4L
         0X4huXojgZns7dyZzDH0gakxzjs5HxvqeC2ver9/TiNXtgqCz2MoS3Xz9sQExaY2mx7c
         okLQ==
X-Gm-Message-State: AOJu0YwLK0PzZ9Zf3WYfWX4RmGOvDvzzTZz252Cl0+u+nJpVhUNpDuhK
	xSbcIRUAktGer9sKkHBo79+9nzjG6AWue2r7Mda34/QXQ0NHAGPHOcJB0d87vaw=
X-Google-Smtp-Source: AGHT+IGC5NhQdFlw/mWeUkpJqMRH5oKYqgl9vYcQeZMUN2yjk3pn7swkYwv9lKdadYsM3jUMBp5CcQ==
X-Received: by 2002:aa7:c316:0:b0:560:8f9:5a8a with SMTP id l22-20020aa7c316000000b0056008f95a8amr216350edq.42.1706882193002;
        Fri, 02 Feb 2024 05:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW22s6XUIO5gsHUcS0t2iXzmDgTc9WVXGb1UJrI1CxB1GFKFOwwQRcbX3Vzbmu07Bgi/jghgtftPJWvGOMfUiHrZT8VBQM3uWi54tSWyazgH9liClbAO1Worc8qQHPZYEaxq7Npy5mQFbqm74HJoSy1yLgoNQFvqw4WhaydDHr8Vzxy/TX0XIFLZNnOt1oV+sktbxsVT/mMw4vWzDBhh+19j2R3eDn6xdPchibUP/k/KNcdghRhfKIxaqrxtcdXICbmEqtM6XNJ6ubhjwrAQPW7XTBjgKHhCQ846qCpcAlrEgSx2yRBr65GowIu1IhZOQcOTXklD6X1849K5KbfuHkB4U3XvGnCLRUnGCG+M0QpzavfHQcg1TYrFLfWFbstsqvIpwc/fnqzVsLczn2I97AZTuqg0MnZdTTGO4h1AsTOy4E=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id cs7-20020a0564020c4700b0055ff708dee3sm502920edb.11.2024.02.02.05.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 05:56:32 -0800 (PST)
Message-ID: <8091a8cf-c1c0-49b0-b136-1ad0d185aa6a@linaro.org>
Date: Fri, 2 Feb 2024 14:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: media: Add sram-size Property for Wave5
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
Cc: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Darren Etheridge <detheridge@ti.com>
References: <20240201184238.2542695-1-b-brnich@ti.com>
 <1209b7cf-5be2-4107-aa6b-d67a32ea3737@linaro.org>
 <20240202125257.p4astjuxpzr5ltjs@dragster>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240202125257.p4astjuxpzr5ltjs@dragster>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2024 13:52, Nishanth Menon wrote:
> On 11:47-20240202, Krzysztof Kozlowski wrote:
>> On 01/02/2024 19:42, Brandon Brnich wrote:
>>> Wave521c has capability to use SRAM carveout to store reference data with
>>> purpose of reducing memory bandwidth. To properly use this pool, the driver
>>> expects to have an sram and sram-size node. Without sram-size node, driver
>>> will default value to zero, making sram node irrelevant.
>>
>> I am sorry, but what driver expects should not be rationale for new
>> property. This justification suggests clearly it is not a property for DT.
>>
> 
> Yup, the argumentation in the commit message is from the wrong
> perspective. bindings are OS agnostic hardware description, and what
> driver does with the description is driver's problem.
> 
> I will at least paraphrase my understanding:
> In this case, however, the hardware block will limp along with
> the usage of DDR (as is the current description), due to the
> latencies involved for DDR accesses. However, the hardware block
> has capability to use a substantially lower latency SRAM to provide
> proper performance and hence for example, deal with higher resolution
> data streams. This SRAM is instantiated at SoC level rather than
> embedded within the hardware block itself.

That sounds like OS policy. Why would different boards with the same
component have this set differently? Based on amount of available
memory? This, I believe, is runtime configuration because it might
depend on user-space you run. Based on purpose (e.g. optimize for
decoding or general usage)? Again, run-time because same hardware board
can be used for different purposes.

Best regards,
Krzysztof


