Return-Path: <linux-media+bounces-28343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACFEA6467A
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 10:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492121893DB2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 09:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928F921D5A7;
	Mon, 17 Mar 2025 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POeT3M3O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726012E3373
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202169; cv=none; b=Mgw0Y42Y3vrC4Yr/FIcQxTtJmhH9GzbUlDldiLeaMB+RX0AAOoWRuY8O5yJJu2GEsSaGWIbQO9VfhQb9MEUMWHqDk9nzE8weLLVXoHU3OkW/K3vWPMeryt2Zs7cSSv1nZm4+ZOtSWPVhf4UKxX2pJt1hg1B87g4n/juIRlEMH/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202169; c=relaxed/simple;
	bh=OzaSM6jQzBxdb7Hoyqy0LYeXzdu5k+CuH1y9tMge+fI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7KH5SNjx2UnJaboi8iL0O+w8Qf7BxhBT8rdUtAfp48AKiHkWKz6MdkQh8xB5Am/wmQAWXBuSieanQE8MssAmz24uswP0HKyUKRO14zZ9vbCwVYbNZBMNWulBZoNTxxJTURU+DQj8FXLjQgwMqZQjIXun74fjH+R4wQVxmP+cIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POeT3M3O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742202166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3aF0/wtB/JcnykItpAzIP7wArEVKeMtYR91x3yct1f4=;
	b=POeT3M3O+Fwvn7KieGxaWCmYu+AEXBVzfDkaILJ7rh0C/qhZ4XWrJJujzyOOI8045aS3Em
	Wq5uW/ooId/hCPcOrS8Lc1a175iKUpAqqr3O4rnsEZAzFas5OUPBwZACb7hAFFBxQEmYGS
	bAc8ccWuQO3LNkEF8ESU/LvsJSCXQzU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-q8chhB6XMZKM1LGPwe_IdA-1; Mon, 17 Mar 2025 05:02:44 -0400
X-MC-Unique: q8chhB6XMZKM1LGPwe_IdA-1
X-Mimecast-MFC-AGG-ID: q8chhB6XMZKM1LGPwe_IdA_1742202164
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac384a889easo9755966b.0
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 02:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202163; x=1742806963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aF0/wtB/JcnykItpAzIP7wArEVKeMtYR91x3yct1f4=;
        b=o/G1iiswGjVXww12AI87cVD61jTQZUgQEhb3lwBS7C5zdyFshhTA26d6ZeSjt+TbKC
         HFVOmJORDfG0MtdRf4VbBa0lyqTTI45LzjLd8V5DvWdGTFtjXEe166jL6/gbfzn9OrOm
         wqeQLgmEpkFm8Rd1TBFxTQm4kvyG8oDsha2ROVJp8dNwdxJC8SpK6FgK3tH0Qoz9Fxxs
         qoPu6pwFXS5LgIIii2zN8OMzEqqQZ8aqWhD31kb2gZi2D3M0qqlT3407icHggrsowEd6
         1T3Cu/D5q74jaonamuYpw0oyLFSfzWYhCJIWZBhz8myzUq7VpAKkak7oGiiH/djnQkSw
         ZDPw==
X-Forwarded-Encrypted: i=1; AJvYcCVuyKqjIXcGvR+DecjkQfDFws08lnr+lHNzyd2W4SwN+jPs67dI7JjcL1aHyRUq5ipfcuI4s9V6tpphtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Meywe6P4rVWn/1R0PKbaAZMkWEjsfdobLLihP2Rx88HC0Bxp
	yPbzW4BHBGdgJ/TjQtjx+EFHxvDeFoM3Pw1xj3uVZ3sP35LfV1IiQOqm+qTYLCoV+yFAmRAtbOY
	ryOuiO250RhoIWtwxpiWmZd7y4CkUPxoyYWMV8BVJiuZNk69xaLAfNqJ2wCVe
X-Gm-Gg: ASbGnctHxmHH9Rv594urNykKkxACIW2SXL4SACg0dzFEDp3di36EL9s11WnvnoYP94r
	q1Fw+r4vzZ7e9OM1+RLO/4mAPaxPHNbwTgtNS+PpyvdQcDGJaifFV4rVql7uLcUufUi3l15wCYB
	qsD3RMioqGF0dDzgbKU6ZQTu6gXtu09TYZxSeBtER49cArARZ6FwTzMocOAjJUAOwdKz+oM/W7L
	gaK420Xxj+jK/lwCywBYXUrEtC03BXATBbJuFRUH0M6rTTgf8H7bh89TLzQ7XCyqVzqCRLTgzeQ
	WTJP82DHd0TX2kE9BnI=
X-Received: by 2002:a17:907:a08a:b0:ac2:e2bf:d42e with SMTP id a640c23a62f3a-ac331304cf9mr1189503566b.11.1742202163587;
        Mon, 17 Mar 2025 02:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgYs1475G5su3BApYOdMm5Ae9l+JRwpVfpRWugRdsS8Zx6uub2tSHnC1/TK3rsgpKWSlD3ww==
X-Received: by 2002:a17:907:a08a:b0:ac2:e2bf:d42e with SMTP id a640c23a62f3a-ac331304cf9mr1189499466b.11.1742202163124;
        Mon, 17 Mar 2025 02:02:43 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbbesm632071866b.100.2025.03.17.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:02:42 -0700 (PDT)
Message-ID: <89af0891-3bbe-4964-8d19-205cdab79497@redhat.com>
Date: Mon, 17 Mar 2025 10:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] RFT/RFC: Import IPU6 ov02e10 sensor driver and enable
 OF usage of it
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>,
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan, Alan,

On 17-Mar-25 01:39, Bryan O'Donoghue wrote:
> Similar to Hans' progressive series on ov02c10 I've picked up via Hans the
> IPU6 driver with some additional fixes from Alan Stern.
> 
> https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com
> 
> I've made a number of initial changes to this driver sufficient to get it
> working on the Dell Inspiron 14 Plus 7441 with the Qualcomm X Elite
> x1e80100 SoC and its CAMSS stack.
> 
> link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-inspirion14-slim7x-camss?ref_type=heads
> 
> This is a first pass which adds in the minimum to get the sensor going on
> the Qualcomm platform. What would be nice would be someone on the IPU6 side
> giving it a test.
> 
> A big TBD here is the YAML for this file but, I'd like to make sure nothing
> has broken for IPU6/IPU7 with the modifications before diving into
> Documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Bryan, thank you for your work on this.

Alan, can you give this version of the driver a test run on your laptop?

Note you need to skip patch 3/8 for now until I've implemented the
solution for handshake handling in the INT3472 driver. Also you need
keep the sleep of at least 25 ms after setting the handshake GPIO.

Regards,

Hans





> ---
> Bryan O'Donoghue (7):
>       media: i2c: ov02e10: Fix initial indentation and spacing
>       media: i2c: ov02e10: Drop IPU6 FPGA specific handshake GPIO
>       media: i2c: ov02e10: Convert to regulator_bulk API
>       media: i2c: ov02e10: Rework MCLK clock get logic to facilitate OF
>       media: i2c: ov02e10: Implement specification t3 and t5 delays on power-up
>       media: i2c: ov02e10: Remove redundant dev_dbg() and some extra dev_err()
>       media: i2c: ov02e10: Add OF probe support
> 
> Jingjing Xiong (1):
>       media: i2c: add OV02E10 image sensor driver
> 
>  drivers/media/i2c/Kconfig   |  10 +
>  drivers/media/i2c/Makefile  |   1 +
>  drivers/media/i2c/ov02e10.c | 978 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 989 insertions(+)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589
> 
> Best regards,


