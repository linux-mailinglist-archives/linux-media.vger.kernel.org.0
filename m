Return-Path: <linux-media+bounces-7665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F78877F4
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 11:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7078D282BDA
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 10:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBB010A14;
	Sat, 23 Mar 2024 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmoC56K8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE52C80
	for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711189349; cv=none; b=PR3HdhyWBrvz9tBPyCN5g2O1N7hnFguAUBPJNxCMiTrxg7/kXR4oEKEsyppNAZZLVOrVlv+TCbgKRsR4ZwPFmCFVinkZyiAzAZ7nm5ztdUs98z0vbDwtUP2qFv5P07yxgHgS2d/4V31DInZ9HVwR5YUCFqQvmX9mrBWvQ/XRYfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711189349; c=relaxed/simple;
	bh=maYA6TPojxmMCR50lqXmD0Mifz4P+KTUcHOwdTmcM6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPbcaEjqub2nznmXyQ1lw3MBgxxmvWFyECpbHN4SXn3LsHWZkhL75QHXs1B8MeGJIgqmKRvDmRJzBTzzANcXSxZnmQBanbtqWZKM1MDgc544FQAQoIDL8uSA0nY107M8ZjHQYCSHBe4po05g33U72gAbQvVmi4Kpb/b+MrrKWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmoC56K8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a46d0a8399aso663630366b.1
        for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711189345; x=1711794145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=js4PIaXcQxhgLbPodRVWcO3IY0/eYmoev+fpsoez2d4=;
        b=gmoC56K8NXk+mZU0qWpim2E8QRa6G3wJskEVziWLof1piN0vEkJbur2JGg9KcMuaMr
         IZXd3i/vP5xIgFuMsApGsf6ByomLRS+/b+1yqd6Hm/+uIdI/bGRw1gj7xhjKjDo2RUX7
         yhPxS26wuaR1M6qaNdmY0u+1JUM7M7bYJsrAYwu6s6qYpgOvmsn9hZ9dDhx9kD5gXCyI
         /KZIY3R5CNlw8tJiGZKMtarKdfRnbYNYRlAIXUfL6Z4piTy/sIBGnLxGDnaHmbRX6GvH
         OHmsCQQxs2/AZvRMeJe32vHW9SJgJHzVLlIGg+8K4Mk0+jYrRO2PxO1P5dDaZypiQqry
         xGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711189345; x=1711794145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js4PIaXcQxhgLbPodRVWcO3IY0/eYmoev+fpsoez2d4=;
        b=IsGsxGdUvDSF0PvyF53up3lUvSiEt8iq2crJOlVq/iIbxzvszAq/oZ9qTGXLBpfTa7
         QBIbZsqXzGXGp3BkYMG8Jnuipei/7vbIMnHGY0r5nQDvH2+Z6DyBOwjwTHnlQ4r7jYBR
         WzSuZf9dq1bZjdRuUT+gYnLnWGTTjHroIytQHY9eOk51PNq4oGBirO20Yk+msVkJWS2w
         9dfsu8VBsy3qrwl2FLbB2Q2JEBcGALyupQt6Aj0ACr1PNazsYY5jUQz9Ugs+kZ0WXibN
         b9IXrpqxVqIEheSSWjaiBYEE0EXnHa9JKkiYwVcs0xZAGHKfo5d0omTFgF2Ar1GBR819
         sQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM0DG1wdQViuLfNBLzBrBt5PGrsiSuELOifjJnZ6kgk1w2waVq2QSHbwtP68EVX7zI+My6phJ+39j9w8rEjRH/VC7uX5B3rqzdCm8=
X-Gm-Message-State: AOJu0YzioOdSrRF/0veYW+i38109iiL+X+c+mr7mp1JWm3X8UH44Mu7s
	a6JbY+5SYlb8OFnhFIUrkdTSt2UHgioVXh+JBYpi928/X34Ayze5Bw0aBKoPUIs=
X-Google-Smtp-Source: AGHT+IG2Mjn8BezvSbIrsxNKvzbQCc4BQteR/QamUB88CUwTsVWu0/n5l1PE3Cl/rT26gl4+EI8Lww==
X-Received: by 2002:a17:906:69c2:b0:a47:3cd5:b3f1 with SMTP id g2-20020a17090669c200b00a473cd5b3f1mr1148989ejs.35.1711189345542;
        Sat, 23 Mar 2024 03:22:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906170400b00a473abcb9fdsm767413eje.90.2024.03.23.03.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Mar 2024 03:22:25 -0700 (PDT)
Message-ID: <4439d51f-072a-4b0f-a6e4-b95192eac83b@linaro.org>
Date: Sat, 23 Mar 2024 11:22:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
To: Conor Dooley <conor@kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
 <20240322-absence-endurable-dee8a25643b7@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240322-absence-endurable-dee8a25643b7@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 19:05, Conor Dooley wrote:
> On Fri, Mar 22, 2024 at 06:59:18AM +0100, Krzysztof Kozlowski wrote:
>> On 21/03/2024 21:43, Anatoliy Klymenko wrote:
>>> diff --git a/include/dt-bindings/media/media-bus-format.h b/include/dt-bindings/media/media-bus-format.h
>>> new file mode 100644
>>> index 000000000000..60fc6e11dabc
>>> --- /dev/null
>>> +++ b/include/dt-bindings/media/media-bus-format.h
>>> @@ -0,0 +1,177 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Media Bus API header
>>> + *
>>> + * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>
>> That's not true. Your SPDX tells something entirely different.
>>
>> Anyway, you did not explain why you need to copy anything anywhere.
> 
> I assume by "copy anything anywhere" you mean "why did you copy a linux
> uapi header into the bindings?

Yes, I trimmed context too much.

The reasoning of copying some UAPI and claiming it is a binding was:
"Copy media-bus-formats.h into dt-bindings/media to suplement TPG DT node."
so as seen *there is no reason*.

Commit msg should explain why we are doing things.

Best regards,
Krzysztof


