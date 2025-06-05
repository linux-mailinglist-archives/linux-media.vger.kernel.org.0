Return-Path: <linux-media+bounces-34124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86829ACEF4C
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAF91764F8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B0D19BBA;
	Thu,  5 Jun 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COomPcny"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071B8488
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126876; cv=none; b=OIq0AeXAzSfDMYY6dcHIZ+NI/GChLKVIKEYGcg9mLG+qPSQtLW/kNXdX2eoXuQ42XxoIBs8syChatYbSN5AQaTR4xq5PyYBsGMijdXFuAwioX3kzHpSSt0J62znGz/OKR7LCDzwcSjHV6KSKC5jguxxt+gR4/JdoG5GYFMKgaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126876; c=relaxed/simple;
	bh=cjbh1iJPcHo1SoPgqjrQYH/wQ/TWFV5f6hNewSpBYZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuwT6P48eWp87q1N+DdhJ/EezcLW9jGDPwo93rfc+70lCQIkfK3mDrGTE73SpmXkivqEpQNPz3yCSfBivyyc7Si2A8k6nm2TzaoMknbpuW84aGryF/LMaFvO0Z/4yFaDEdLxHgaXXGeJ35WZs3+mXsirTpRpwpiea1ERzQidH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COomPcny; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36e090102so506552f8f.2
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749126873; x=1749731673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=COomPcny5A6K7VTC/wQpkYlI1Vk9iawGMSCH6TtUwofIa5ELpV/+mMAuQcBtY4+zeE
         5Pufd1iXSQ1G4YyhcYsvtbsw1eQ6twnprFisxnsN4zCtjLAfqV1Cz6qGpxlTsmRECNEJ
         r5Zn26cHGXiJxsZYS96yU/NCsHy3Hbes1cgZQpSvVYsrQQDm7an3xWv1gsZhi6xZ5xCX
         MO8dp5oJzbRfBsLCijhmSmDh8PV1H/55cI7lKW+Z1OcGilbcFB1sR0wWAanz0ULlwKs7
         n12FTWqw7RWUJck9R70vK3ZDjqgX2t502xjwcANIWD2bldew9LwM3ih774jGI/MryaFB
         ZIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126873; x=1749731673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=JaHAoowEIOMrrJQimdQ/oTlhVRGHDfbxrdbm72K+YyXjtC9vrpgb/SaLxYS8aJ4/LJ
         mhrrR4EPRhBY7HIsetm++xcZtlrRrxcAQ0U7cLE5f2jy26W/mjfIBnoc7S7UoD5bj5W3
         m+CQxE1GzK47UkZHUWgq0ZW1/4AXwWgsx4TRB7FNKdVb7ysUFIu/rr6v+njcsKCmGT7F
         8mNtzcbf16MBF/MyQpINtIQ5C0YOAJqLM9ChLgctA8HZGPU4LPgUGnta5SUE+tIvwVJ3
         /SQsoh3cePS+vk5bwosibTm9GkAd2iiYyfSz+22EugtuJEwHe7Cb3GzpRVt5c3mzmcT6
         p1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUleeMDRRXc5gv3l1K/IsCBVqnlkUgJkQ3CsrYOknAzHI97fkl8CD/3UoYtdZhobOCHaDmE/9p/4TtoWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQx1KkNj6SZZcQfCSVDrYuvOkBdp3BcomKJG1Z6bSPAS6VwO6p
	fqnuB9cDHhngcAmuPBdjnr7Dwlp5fq1e44tZdAOtpvc0x20iri4rAZqM1lAHaZXmh4k=
X-Gm-Gg: ASbGnctVIwTEmQg5jRLH0D45x8NZ3HFuFOKINRjmk6L2WDzCSbfUBCkMo3hx/wz102s
	wpU7vnjdrkCo30AK7hu76qK1bpfAdmQFzFeA7KG9wGVu0fK/CI6jC021SgKxcduimqYZJOhPuYQ
	/iNLOj8qY/8fpIFKzPqpQec1hQ+jsJ1D5UfpxbKhv+9DNB2k5HZ6Fs9Zq7+TUMntpBZCB8gsxak
	vZVqY8aSQPhCTxbZHOPg3MQyJz8rmRaZX2gm+Cr6XPG8Anbxjmb9tDg6qz5yFAsrAgXur+Uoe84
	7bxvqrPvTBfSn1lXTNphT3gtvM04oexUkb+OZhEMZFde9BmfP+BGjdazKmqH1SFkdwd2ImmuIFg
	jNoTXNP2p6pB8+d+Q
X-Google-Smtp-Source: AGHT+IFay1Kv4O/AIX3uTmBLPt0/aev+6Rj7lbZSat73UDWQjBuMnLbHPYrx37RB3wdZf5F86HsTfA==
X-Received: by 2002:a5d:5f90:0:b0:3a4:d41d:8f40 with SMTP id ffacd0b85a97d-3a51dc3182amr6168249f8f.46.1749126873038;
        Thu, 05 Jun 2025 05:34:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5236d4466sm3690446f8f.100.2025.06.05.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:34:32 -0700 (PDT)
Message-ID: <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
Date: Thu, 5 Jun 2025 13:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2025 01:05, Renjiang Han wrote:
>>>
>>> Note:
>>> This series consist of DT patches and a venus driver patch. The patch
>>> 1/3, which is venus driver patch, can be picked independently without
>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>> DT patches, still depend on [1].
>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>> on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after 
> the DT patch.

This statement is confusing.

1/3 states that there will be a fallback if there is no OPP table present.

Giving the code a glance, I believe that is so, freq_table should be 
used if there is no OPP specified in the DT.

I think we are having a hard time here understanding what you are saying.

My understanding:

- venus modification is standalone 1/3
   Qcs615 will fallback if no OPP is present

- dt modification 2/3 3/3 is therefore also independent of driver

---
bod

