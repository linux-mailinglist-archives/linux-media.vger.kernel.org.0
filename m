Return-Path: <linux-media+bounces-17759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE896F25D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE77E1F25866
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080081CB150;
	Fri,  6 Sep 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQL3zS7M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175A1C9DFE
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620813; cv=none; b=RNrK1Nw9RAPF1Ln1updBRSl8VD8SBKQnkpAtTy/+AqYzXuTZiVfQdlqQq3fcyf7eNvkyMd9aWAFhBUvPI94t/nX13y3fAkY0rzyc4luhpIZMc4oRJs8q5WfegiJgWXxy09EbBBKGk205314lrRgHtenTZF2ruTBh4l/yrvRst1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620813; c=relaxed/simple;
	bh=h1vwEP0cuQMdp14/UgZnixBfsliTd6QLTnCPDcR39+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMBBtgEjMIMLxuZ8O5El8JDKriLPFYtJo/MQg2rh614tKL0G6h5Pq8M3LGK+wfu6cw/mnkxY4F71yide8COp1QmFe3LZpi4GPdKWkioXkt9MizWNkdxMxPJmrNQQboTndrPwVCwwNALbPlpdUy9QtiIx6x1BVD3RLo3/GXW845U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQL3zS7M; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53569e624a9so321328e87.0
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725620810; x=1726225610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChifwwOuuB/6xRZn3gwrFiT8292fujEUOwkXOINezS8=;
        b=YQL3zS7MlzL25qOts7El5GxwoB7jYUVANnbHeCXfTdPRp8dMOMs+s1qcRrSy5Rzy2e
         cgTKvjcq6WikNiomL0jzbkbd3xW61zoT9iCjT8u7HSS4vwKjNU679irxoleCPN0RfN7N
         ScR/HXkhEWem3jCy2wM3b86BCrLOeTpsCqa9VsPsh4BorqfKcK9J8OK7m1lvgKF2ABuW
         p0uU8ApW76xBt3hSwCT9rAaClOqC5GzoiEO8fEEAGCTmX/uJzgrzu9b2Bu0DjO55xIqd
         4Ia7zT9nzOjb9C2CCdplXIfL+jI/R2j68Mcw+BTGJrYNOCgIXomiwOjtA46NueX/V7rd
         BxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725620810; x=1726225610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChifwwOuuB/6xRZn3gwrFiT8292fujEUOwkXOINezS8=;
        b=u7QYuL/E+kXho6hD0f0ziRwbiUwMrfQWDrXAXn4dM+G8WZIMxDR9pF6XbHBPyntKKe
         1cmMp9zTVAqCN3HxMJLId8Pw2IQNlXw7msoTeSgPiYhaXd7+kh24w56M9PQ6jtdc9sxm
         mJzTvpCNbJvT4vbXVE6l+J8zVrBj39fg2TsMViquD7KqMVTgTS6f3pBW0iaSbEeRohyn
         hxh4me5hHZokeVIt4dcXPtO3iIlHf5iFK4Jo0rX5oJQZvgZb1+sNi8otOR+WNq23bD+F
         HYMGL+sMf64VzwPLvLCmwSpEkIeTfzej9MQaD+9rW0UY4usaF8pd3li0f6WW34kArmjL
         XdJg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1y2nEcpJvYaAmyJkCPv6o0kxQLQVa8vyjiTI/0/KGndByCnFYc0Q+Kvbv1AA0+Nna2Yb7mR20iL95A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBi3xsk4G5npLlatlm3F5ofKRuhT8QFIpdT6sPDx0mXEFalIj
	ONmy42A5wt8/z2davbr9uo9VISZGkY4hSnsBbRbggikHU33bYXPjCDzz+pRMyx8=
X-Google-Smtp-Source: AGHT+IFHkE3GGJigRGGkkRpsgVp6469WptDk6ts3BfHIOiLZVXKNnY2eY3gLz53vzL007VIPxDGuIg==
X-Received: by 2002:a05:6512:b25:b0:535:4144:f9d3 with SMTP id 2adb3069b0e04-536588197c5mr723241e87.11.1725620809618;
        Fri, 06 Sep 2024 04:06:49 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655aa72adsm257995e87.304.2024.09.06.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:06:49 -0700 (PDT)
Message-ID: <9f64102b-407d-482b-bd0b-b158fd7b255d@linaro.org>
Date: Fri, 6 Sep 2024 14:06:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-2-vladimir.zapolskiy@linaro.org>
 <run5ffs6udya6a2opphkt2chenjgelnlmnjtyeyulinpuxacmn@im72ytiz33q3>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <run5ffs6udya6a2opphkt2chenjgelnlmnjtyeyulinpuxacmn@im72ytiz33q3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 9/6/24 13:31, Krzysztof Kozlowski wrote:
> On Thu, Sep 05, 2024 at 07:41:37PM +0300, Vladimir Zapolskiy wrote:
>> The expected type of all CAMSS interrupts is edge rising, fix it in
>> the documented example from CAMSS device tree bindings for sc8280xp.
> 
> Subject: drop duplicated media. One media is enough (the first).
> 

thank you for review, here I've attemted to follow the established practice.

% git log -n 500 --oneline Documentation/devicetree/bindings/media/ | grep "media:.*media:" | wc -l
166

So 1/3 of relevant commits to the folder have the duplicated "media:"
in the subject, the reason is not totally clear to me, thus I've just
inflowed into the same.

--
Best wishes,
Vladimir

