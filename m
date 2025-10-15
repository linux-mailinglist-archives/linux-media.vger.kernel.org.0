Return-Path: <linux-media+bounces-44636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E103BE0D93
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 23:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 462B05467AC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732373016F5;
	Wed, 15 Oct 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNcsUy3O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127D3002D6
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564613; cv=none; b=U91Sr1CJ8gp17bRQn7ZV+ubqmT7OVf9i8xYp+i9Bqdev5TjRkcwwXNBU1Hr1CjZK0vf3CKWhKBnGYXs98tz3VsQLlQ2uzdYgL9vkqvc9YzEc8J3/klb4OIJ4/S0AIUPGUX67msRUVZ52YoFT2dvoCVHuMBxk6vlrxFJgxTMN3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564613; c=relaxed/simple;
	bh=AoGR0N/WRa1KwSM19W6VN8WXSjWSD6KuRKpcEKai8Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpMm/T/NCE3CDVW3niw4EiLA2FjFCe1v6jYl6UMcpvo63d2WlYOQKaKQwOv6/8P/ExYn5UceifwXlZEk51R89PMprEQcvSFRSyK9pcwzLIrjwPcvm6cjoCg2CItQ9tOZww/CW4SJg1HiEueAiabZuNW7+KdsFhKD9l1Qx/6Se3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNcsUy3O; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso55870f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760564610; x=1761169410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDF8d+4H3i2iv4u1yiFtrqUVQxc1Kn/G01hl0muKOgA=;
        b=CNcsUy3Ol7xzE8L++OkzH05UyK7SGRYPqrU4282wKBhBI2fRgEKGcNutEjSlc91KE6
         Q0uCV9hE6bWYje+NKSLt8Ny6rZDc+Ac4QySGlPCVaW1H4TafOzVzSH7yQIA9jbP3UpkV
         Ufi5NZHL0Xv15ZRW2U8ePR1KPv8NmAuii7OVA9MavsQdRi5WvY0xU2t0dI9w6a4xSac0
         s6NAay1hscAH8ibWpbug2wyG9Ox0EX4Y2+IC6f9n/MKAUWSOqOzjd27vZXnrqGXrmxpD
         lm9IS0ZEYwqVXpqv3LNU0AAsWtfYQwR2yJAz3nVjFbM1i15QRAOUmxDssITWIVR6krEm
         igjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760564610; x=1761169410;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDF8d+4H3i2iv4u1yiFtrqUVQxc1Kn/G01hl0muKOgA=;
        b=pvowEVKzS2lydMVLYxsj7vgfSo8ACX9y7MOqy2O5RhhgLl8KAXE6MlZ7wreBML08kM
         sqJB8rnfiLeqNNHtxgaFgRVsuddZeyt98bsAwKYNVe6SIHZJKFjjG2TmRfLdCawUIck7
         hTiBPMRKwFSQftWxJNn8nDKiilXj4ZlLlL8OkW9u0Tcltz9k0P4SWQEkb5q74lE5YE0Y
         rS2yc+Ox5leT2w7UElr6au8EIOEFnWckZw4l3uSXOpgwPtYArEVcfLi/UbAPsAE8MY+4
         lixzYa7rA0yDkAl5L5svSu7AdA3hfLmqGmvaYID4HF+0qm0H2CrQ8Lqt9+wkE9/R5zUA
         /zxA==
X-Forwarded-Encrypted: i=1; AJvYcCUmZNhEkADK7deHhBOBuoskuUYrC6+G5AOr1X00wc3EFYi3cU9NoxlxUP9BcmtgbwwB/N31W2i7U5c4WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybdgg/6ogQggz+BDYOJfH+fR8wdZqZKsWq4CqJkStKLdTuVuDB
	KvHFaxwUcbZ9rK1DCS4SeTP1Jf3QHnbMoSO0dWSW5XWYVJV61fw2wuBAsJAsQNXHhXw=
X-Gm-Gg: ASbGncsR+6HSZ7UEpTNa9sbkm3ajwoBMYBn3UP4Z6nKCiVt0tEIr/5Fi9KfU/hvWPT9
	hKyCa4aqTXRHwjJVLiik5JMyDcXKAh6U9RReq6BErr4z7M8bgNbyWTVTowJq4LwnoVNhAUaFZVe
	nYvrFC2Q9LRhXrMrpVOFiY+T+7n1/3khBVaruYAcIKpnCALpHLfnPPzAfoQUEK5ky+wyn0LnAi7
	NURLUGvlkVXzmEN/8vN/tPudrlFdp03yx1ltOCluij4YTRX7bxqe6DHyfuo6oQnmCrgAUZkXNxz
	gpeAIPdCinBcg+O3aw44jJESa+ZbcLGmhMhW321I2JaK3uf8teJfpc8Hh556zgB0Hrq8v2QQI0W
	FQq/+PhRnnMZ6qhH3HscsuBcdrtx3yebmG1egG1AJMiY8YfSMvF97ibGY6UgdDsEp0/plBx4abh
	PtxcxXvN5RwC9Aj3P/WI7H7fGISZHfilBZyt3TWMMMURujX6bKH13nr/pK
X-Google-Smtp-Source: AGHT+IGnQKKNQd7/bwUbO/GQuYepHvtuUzlr5o5rKuZYtYUxhm0e4zkPUt4aDvFWg6NhRrSxe6cX1w==
X-Received: by 2002:a05:6000:310a:b0:414:a552:86b1 with SMTP id ffacd0b85a97d-4266e8e48ccmr20004387f8f.63.1760564610303;
        Wed, 15 Oct 2025 14:43:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426fc54b32dsm1314209f8f.30.2025.10.15.14.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 14:43:29 -0700 (PDT)
Message-ID: <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
Date: Wed, 15 Oct 2025 22:43:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 20:45, Vladimir Zapolskiy wrote:
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          Titan GDSC - Titan ISP Block Global Distributed Switch 
>> Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: tfe0
>> +      - const: tfe1
>> +      - const: tfe2
> 
> Please remove all 'tfeX' power domains, they are not going to be utilized
> any time soon.
> 
> When 'power-domains' list is just a single Titan GDSC, 'power-domain-names'
> property is not needed.

Each one of these TFEs powers an individually power-collapsible TFEs.

This is also so with the other xFE power-domains on previous SoC 
generations.

You'll need the TFEx power-domain to process any data on TFEx with the 
'lite' versions being tied to the TOP GDSC.

So please keep the power-domain list, TOP isn't enough.

---
bod

