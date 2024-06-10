Return-Path: <linux-media+bounces-12806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38917901C0B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E951F226CC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 07:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A2C3CF4F;
	Mon, 10 Jun 2024 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d29hRgK+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E126286
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005200; cv=none; b=dV8RDdgl2b+K6v5I8mMdZRJdITk1Tr2dCpXaA7D7iZx0YT8z73ptxLhy4hyTWhi3gXOorbrcNYUrg/arE+ejPhN+B23rqxvdlqSBwC4T8Aau3pTWEup0WWm78s7qgjHIDIPmt1JhuIWyabU7tjayKIm8ibv2RHxXbIK6kSlyciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005200; c=relaxed/simple;
	bh=Pl77bQGDVfj6d6436tUg9NqhuIW1Q6mVmn4dFwdM2so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EByAio36gy2rCjzdZZQOVVioQqsTjugK1VcT+Dmb/LY8s0JO0kQoRa05FfoF2ePVeeYdjR+Ue2UXXjH1jNzvEkN5looh+zMUFbMlLbrcC+dMPbnPfxh1djzr7DBQVP4yGkgVDreUcbnHmyCENCaYK+v+1nG9c0uQG1o1x/wcBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d29hRgK+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421792aa955so15275145e9.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718005197; x=1718609997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMjwlRoB1zUBrxnoriQTxC4qGPUpj37/BX99GwdlmqQ=;
        b=d29hRgK+tiCkGKm0DamqIAJl3g4Qh0EMH0smk2muJ/rkyMmVU+e4RUySdOBBAbCeMW
         9NQqWwwdJXpr5HCeQU93tny2pWki2NiztNXZ0hIO52S6nyyoaJzTcN+cAN87XH4/W/P9
         whwFG8yDB5leVGfWKjIcLjxO0yfGmfIgOA4zJRUIRhkxBuh0JGdfN6hZ5y79bmIVS+ci
         MI5hgRHQzUzsk5/AwXVdlxDyT9htJeBfUCw3jS4l4V4Jt9NI/pq3K9StoLr22V+kvJdt
         g0RP3IbtnipmA/xU7B54ttWWA55HpEHRnx8IGiTsfBW1YxRRgpteiCAYbPQAqiCdM6Re
         m8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005197; x=1718609997;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMjwlRoB1zUBrxnoriQTxC4qGPUpj37/BX99GwdlmqQ=;
        b=TST5m/YGMVjVBvckN0/hD8Rbi/wUglCm68aghcOolTccfNvURxKtdkOOe1AKyqD+gU
         Z2GReOcp/po482/jdKswwQgKpZaV1a22koTtCej2nmu20NmQwFDPwjcYDCukdFneVsma
         E5eGPw7LatVai1EJvDV71EJRcv9pMEWSjOgX1S24HT/sGV0KTtwupi1QigsgSv2AdeYu
         tKmiT9XhNlS8DSFanZbgjRvhbSUW4kdKgO++e3cYXvU5Mv9VIGtxYp2Uk8VPyWgH+34n
         MhrDlCOC90uvEp6WGPw1AHJIVc/9Wsgv3U4WqnFdAchmZWhD4T/MnNOCJ4w4VmqJ6SfM
         Or+w==
X-Forwarded-Encrypted: i=1; AJvYcCVtpSMhh2BgjMOadJ99ZpBMNaVyRnyJbiZfb2m+O2h6HIpIOk9eX/D+E/pNIs3tNhyRtpDU/IR8R7Rm05YMe3O66IDkM6/BLqb69NU=
X-Gm-Message-State: AOJu0YyJwGQtUDToYsmO/LhCtrw1GyZ1dZLh/wKyVhURYkW348uHhf5B
	x+s4VbQiKksRytfhQncUtV0L9lGbskUYKd/3eJNXJHx+0n4/KP0Va77L+/w34Ws=
X-Google-Smtp-Source: AGHT+IHMiLWtX71Xx57Du6Ke2BkcUOQRP6QZlXWDuZkcsDBndrQKFGzjYwkJnyZxt0sr/S5vnuNI5A==
X-Received: by 2002:a05:600c:1d88:b0:421:7e76:b85c with SMTP id 5b1f17b1804b1-4217e76b8b1mr33386945e9.23.1718005197169;
        Mon, 10 Jun 2024 00:39:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421dd8c3a9esm21868815e9.27.2024.06.10.00.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 00:39:56 -0700 (PDT)
Message-ID: <68c9bf8d-38c6-4f1b-b73d-a8ea03f8e1cd@linaro.org>
Date: Mon, 10 Jun 2024 09:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen
 <pnguyen@baylibre.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/06/2024 10:52, Julien Stephan wrote:
> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a écrit :
>>
>> On 10/01/2024 15:14, Julien Stephan wrote:
>>> From: Louis Kuo <louis.kuo@mediatek.com>
>>>
>>> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
>>> some Mediatek SoC, such as the mt8365
>>>
>>
>> ...
>>
>>> +  clock-names:
>>> +    items:
>>> +      - const: camsys
>>> +      - const: top_mux
>>> +
>>> +  phys:
>>> +    minItems: 1
>>> +    maxItems: 4
>>> +    description:
>>> +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
>>> +
>>> +  phy-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: csi0
>>> +      - const: csi1
>>> +      - const: csi2
>>> +      - const: csi0b
>>
>> Why one hardware has flexible number of phys?
> 
> Hi Krzysztof,
> 
> seninf can have multiple port depending on the soc, each requiring its own phy

So it is fixed per soc? Then make it fixed per soc.

Best regards,
Krzysztof


