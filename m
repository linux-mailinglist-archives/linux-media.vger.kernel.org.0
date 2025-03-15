Return-Path: <linux-media+bounces-28309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF0A6328E
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E381723DE
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC7C1A0BFE;
	Sat, 15 Mar 2025 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rv+UoC9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923A197A8E
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 21:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742072966; cv=none; b=rDpD6GNgFhQg09jOVi73n2ZX5bQKXH5Ijs06S52zmMqQF5+yszNbnhMo8/ZMqgJRIKvCkMMk1s4lO7l90zGqXXb3ezmnX0txRMcGZCDJjLWVgY16m2D6VNwZLHmIsYxh8SFnSTIPtgaH19ZGi+tjZ40GxK0xtqoN2L9KWHKT57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742072966; c=relaxed/simple;
	bh=VUoeCTT+JQebVICnyf0x5n6gX1p9Ab1XUd5BghU3o18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkclnudt4oypDky7kSsTl2x/X1eNOGyWOxWDEjkggBXs6DAVC+qMz7KohVf5SmJsjQAWk8cTLWtyatmoh5gIWQgKZQeHZ1MDUfQRNZc7r0H+qw/HVu13vvZJ3vxCb185I2yi6V+u2mS6lDQ9xaqOuzWubZ6kvXTghUFjUWPWi/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rv+UoC9R; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso73493566b.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742072963; x=1742677763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OJBEMoohuv03+HZ3bLpvzm0qiyx3u2TsZT4jJdBaBM=;
        b=rv+UoC9R3Pjywng0jDK6W1/TaEljoGKISdP9AIQY1F7B1+xLq8nP+h+PMMc72w+QZA
         1E8sZGrzeKrD2hC2byXQbdgUgFzf4aTw067w4spa2RRiNYOtQma+9VUuhNsDgSDbPN9Q
         UDvma8+N+k7/mmEx5S/iweJ/TYKzb0hQ1dndtj7fb/VjOTGrsI14jZh+mFTIMtcn5eDV
         14aDqmLZ6vobCbxIEzqSD07CrwmX3vZnEYHLcwVi1Cv8OPCI+Wf5/3BjEv1r/BHiy7Kd
         xwfUfxOkMtAzqSmocQi/vW+w/6sKNBpj3msuiEkNYT/LlP5QKm2gY2yu8EGXY81gIAe1
         zgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742072963; x=1742677763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OJBEMoohuv03+HZ3bLpvzm0qiyx3u2TsZT4jJdBaBM=;
        b=WBfX7temkXUCM9DVto9WH1nWpcvdfUTV4LSOm8t0BqcwoMiwsWVrvGt8IZzO/ZrvB4
         SRpeTfXIKEz5xsn04L5sl1S5Z5bX/dcyENbkwAkLqb8Iycb9iWpJkDwrjH/khFNOvqw4
         aZ7gpOQt9YORh6nUVwr5PHK0z8iPXNALkv/6xbdZWTZtx054F8+HPLnOY+tBUW9zDhNe
         eyeQ6FVS0gsvz5DNz9Q8bentjHGitkQivwFWG2b19NGgAm3vVb0DZRKyKRdxOFYMgXSo
         7yAKF4GmHan2b285x3bsMegRBCvHcdDQmHTQPEsN9fhLQxR9TbSV0pUe7u2qHPQes8OV
         b5iA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAUQIBYC2I/g+AgRblbnCJ42X5xnmW7TzndG+aYY3DTSFOOWhJp58GDSaLZTD8vpVAJUfNfxvibh0lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeeNi4WSgUz1NvM2dBemfwu+TrAAp+VLUy3aCzBoqYMJOvYrL
	QHY508Fosyiho/V+KlWeeeqHD5kHbNvFQX4beVYqbPhQ+EyTe38hpuUYnaUa24o=
X-Gm-Gg: ASbGncsTlhX4dWa/6GrT5koPup/K9CFTRGBLnIEHKm7b6wyaQXzjZfpLY9jm5pRGXMl
	5sMnNb7EjiG+LVfCU6EOwswr9B8QBixAE44kvaXmgGYw7RSgQsQFs9yEDANxWew06lwBQWQu2kA
	R9o4zOeH3kfwgjAnTNHJhzRKvfrlTWWguZBVKbg432IWqhnbCdq9jGT4McGrtR0AjH1qdPqF/IS
	tpWb05Tzwbv7PgSkaH6r8pPDancwbyljl6Aag1J6tim26GcEt3ZHWr+E84JAvkiGpN4SqCDPpNb
	Igr7dRGoqCRjpZN2YD3i6gtjf4gLK0S893kj3wp+6X/YMh45CdSsjtanieZ6FOwNwPhxZZheIZJ
	FWFTixgjkMSFGAKIdeQnNQ3mOZ46/S6fqkTRIDh0MWtQ6M6VQdcOAK+qWWOzlaRXMY/cBhQpngI
	qqA5rJk9L4BUvCvrqwdTBkkh8/k5Rvmno=
X-Google-Smtp-Source: AGHT+IHKTjJQI6KFv9XMkbOplhyul5AUCqtSxQEDXOfz2Ds2A5/4Gvj2ORydKnXcHfElrc6Nlnxa9A==
X-Received: by 2002:a17:907:2d89:b0:ac2:fa32:f3 with SMTP id a640c23a62f3a-ac330506270mr885508566b.52.1742072962863;
        Sat, 15 Mar 2025 14:09:22 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0ecdsm414455066b.73.2025.03.15.14.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 14:09:21 -0700 (PDT)
Message-ID: <c9c6858f-a250-45d1-ac0c-3aeaa56fcdc5@linaro.org>
Date: Sat, 15 Mar 2025 21:09:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
To: Hans de Goede <hdegoede@redhat.com>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-4-bryan.odonoghue@linaro.org>
 <54b4b5e6-06fe-46f8-8484-3c86aaa46cad@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <54b4b5e6-06fe-46f8-8484-3c86aaa46cad@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 21:05, Hans de Goede wrote:
> So I think for v10 I'll go with the above solution to sleep
> 2 ms in power_on() before de-asserting reset.
> 
> Bryan, any comments on that ?

Don't we go through power_on/power_off cycles if/when we add runtime PM 
though ?

So to me it makes sense to do it the same way we did it in ov08x40 for 
example.

We might as well add the sequence now would be my feeling.

---
bod

