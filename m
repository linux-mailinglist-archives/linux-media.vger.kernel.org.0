Return-Path: <linux-media+bounces-36805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB3AF8BD8
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D2211892B4A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E6328935F;
	Fri,  4 Jul 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h2yq6RkE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD82874F5
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617392; cv=none; b=jEzzMmR7A8cIP/TsA6rmgh6SY62HCvuFFkXB5tKn3LBuI2/6khXJ5WazBhkmMNDUvzBZlsgjSh62384TAsFG+v8q8i+IrRZtWQ9KdR9neqXglvOg1VYpEn7y+NyWgH5D0m0H/QUZAEFYdKLjRWXWR1pk4mlmTK6+Aa0U6CkiQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617392; c=relaxed/simple;
	bh=0vKgJofS2qfVbDLeJnc2bc+mCh9FaxZgAqij7cOILPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu/5Hs9OIkiFGZ9DzzUodsV2Erqul9hGdQ5nNNYRCiU74t2aynPG+b+xpaZriLFrjF/KwOFVPPdwoiH2bKtZsDo1RODSq9nDg59ID21OzPazwPNt2Eg1LjjlPPDVdlE6TG/wQfZuFGDayjVVmWk+NR3ZLNM7SCpmMQ037I8RQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h2yq6RkE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so382239f8f.0
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617389; x=1752222189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQl9Ypa8N/fQd7fiGf/U1lVWGmgfHhe4fQnd3suQNU0=;
        b=h2yq6RkEUxLi2dNB8LeODuf5RevRCS/+2/AVSY4zW9+odjyF/zNuRi8UemXJ0m1kPl
         ZErnMrzlAMn55CkLX4o/H9LBAVQfNLf/N/NOAGEJqwar45g3T3Qx37iGYB+Lpg88lvR4
         +crA4+ugZ7LZwC1rsu9bS1EB0h2onJBuPyEdKZ5kwT7NPQ6o++B/aGXxJGe+3+6/BjDN
         ud8BhzImFmKJmokQUGIqrZ2/bZo+m71E7xrpuYtQHhjxg9n5UHLQ8SPo7PhmRSJQydhw
         ejZ5toevOBZIZC5byEuCj5qfYFtuXPf40hVLBBnZbMt0ytJxK2DyCZN0s7UUTfwMOLE5
         06dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617389; x=1752222189;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQl9Ypa8N/fQd7fiGf/U1lVWGmgfHhe4fQnd3suQNU0=;
        b=LrwN18KSTnuo+MWoN/7M0enBN5lUT0S0eXx5Tqj/VUii+W26qMYHFjaitYteW91BlG
         lDecwAYmj5VdbAtt+9KkPQG1w52YGmdZwXN/SSsaiyCILUJGdZveT7SmtAEOHNa1YR2q
         b0N28q+CoXyavuQ/0ihf14as1zcSypV0hKQ3BS4WGQxe/IZyIjNJvOG4+QYY8x6v1+Pd
         3SRgtxtOhdozipvUG9Q6z2wQ3FA/fk6nGH9wsPRFNB2NmEJ372ARqxksAsAwg5FIKJy7
         GTvd3XmaVI4hDDlk44IZXQDBgRQR9cNiwglH63WVAdunvM4UxrrvwWATr84HxroX+vtU
         6xmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUupLXu1bh2oxs7LKA8oL80oen8Jj8uhUvFsjSwlCFb/p4DQ/mOd+z4U6OAd2mFWTPbgiQplLP9xV+t3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lrvwOl3bYQxeeW1XY+P0AcKHx4Fly8beN828afIlDaSD2Inn
	6ac3JSOGBV5xXlsoVNj4aURbAxh3sKzjiilYjoU+Obzezh0uziD8lf6E0g0JtgkEuBw=
X-Gm-Gg: ASbGncsH5lpmbUoBoPbOFgkmPuMxGbCf3pj8da/EUrZUXRfiJlCy+lI0I17jPCV9Qsk
	yqR4UDYLsowlgu4x+gFsqEmkogw7I5peQUPbD9VcATz6W82iKIcvnBM2hkyPDx+CC9yK9qkKlSs
	AXfTsT31/84epn5zI7fpIqucn8IF/arxG6UHDN7JiLV9JIVwW3Ak/uVVkS80BxHPuiViUYfP4J6
	hJXdeTMA3A3hAQBQsqyWeakVH+Au0HXxdwfWDTLhXRURpN8dS/gGlwQJtn6gHchx/4mhHFOEYyq
	0SF+gBDlgUsg9jPyxwNIvFYs0CZMFoFQObreoLA9aOvAYF1CXgRWFUYKqCzV5pUcMcYsV2WN+g/
	I4jG5nerA4My4JTiJ2WAu1A04vbs=
X-Google-Smtp-Source: AGHT+IHHgjaBnAo5QwMN3YDy0wbG9DnxVwT7uttl5fAV0MIC0EYWYl5on3snuz454zD1gSCLp/iWwQ==
X-Received: by 2002:a05:6000:2888:b0:3b3:bd27:f2ab with SMTP id ffacd0b85a97d-3b4964bb66fmr1281979f8f.5.1751617388607;
        Fri, 04 Jul 2025 01:23:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969f2asm49958455e9.8.2025.07.04.01.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:23:08 -0700 (PDT)
Message-ID: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Date: Fri, 4 Jul 2025 09:23:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>> I still give my RB for the series.
>>
>> To me the only question is should it be applied to sm8550 or to new SoCs
>> from now on, sa8775p, x1e and derivatives.
> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> once we do that, we will realize that it also changes the ABI for all
> SoCs that support either Venus or Iris.

I think a dts change is a non-starter as its an ABI break.

So if ABI break is out and reworking future dts to allow for a new 
device is out, then some API change is needed to allow the driver to 
stop the kernel automatically setting up the IOMMUs, create the new 
device as a platform device not dependent on DT change and have the 
probe() of the relevant drivers setup their own IOMMU extents based on - 
probably indexes we have in the driver configuration parameters.

---
bod

