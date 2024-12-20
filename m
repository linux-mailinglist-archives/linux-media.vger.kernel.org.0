Return-Path: <linux-media+bounces-23922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC79F944D
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6123F16D03B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CA321638D;
	Fri, 20 Dec 2024 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yopm+ptF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CFE8632B
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705066; cv=none; b=mp2jzzB/sGoGDPrabpyQLbDjB5+73iciZBUmub1LZSmstUXQ396Sw5ZD45EEe+b4rUzyBbTdqrYpf2rgrZnIHv74fuQ9flnymkIApu50kNmi6olf3M58nz+KngxolSAt4hKeDFcNvr75YI0UPKzbr8CAxTf0EjJsS5nSqg5/JGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705066; c=relaxed/simple;
	bh=DZA921Y7YZZ8rgkZGrRA5jmdXlrrosnHhs5aeWxsGX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC9tYg8iBo8bxHfK03NuZTf9pt8whbgEy9dotfNx5C30QckeJbbM/bS5O22VhKS09oZCmk078vFWbpFoQkzzB2LzXTiRcQpkUVGcE2UDQkXrdsb0qSLwWrxB49ax3DSTkkJ4spf8/f3sLFF+TDspcxgqHrMpiP98pGRFbAsI1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yopm+ptF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385de9f789cso1534303f8f.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705062; x=1735309862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q55mDb04SlZD0mXg1GRQBQtSVQLsX6jed0Y454jkkTA=;
        b=Yopm+ptFxj3qp4gNHPNOXx8crwk9eHjf6MmI4+yl+8TG10azB1T/Qc4sZObNd47Bh8
         f19EMKlpsMVrlT9YAfUCIQLPOGQc6zmOGvRy3uVsQNPi2BpVu9bqGjrZ/8EVwEXOtQEP
         2gAORJcOkTwUJBDKmT0vcFBKNgi1w6OGv1hLKLlti06eMmwquClPKZ63DA5JoCEPQZVg
         Qrkp82GXg5rw/VzqyYexSQ/scBN5I3sf1bBSD9cJ5sMBsXrruj6JHnLIroXBI0ogh7FA
         oqMP2auslMmXgG8NGRsE37GhFScp4+4yGPUWJNTtLk4mDhM/YIYmPo4++jlFU5JEpbHD
         wV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705062; x=1735309862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q55mDb04SlZD0mXg1GRQBQtSVQLsX6jed0Y454jkkTA=;
        b=xLYbDW3KTYSv8KMMQN1qB/nSZOFKD5W7WCaMUsPG/giJqwUqUQFbVsYj33PF8NLFfW
         X7ydb3I5aPyHJIeDyuRZuqXROzKc5wTbV7EEIo5HKKQED08QaRjwMXTb9eWNjc3ajb14
         Vv4brNg6f/61cK2UDrDwsxg/07KTXEh9UWFyJDxkc6ddYvGQPDeePnPcaxV/E4rOH8zq
         67EzJ3btpgg51paOEgBDdfp199kOj0+m9OpR8cqOccoyBxz5QE3qnVn2IuEcZYyPTNzQ
         oQB/AcSRDXzapqxARReg5Vue0FBO2/tKV6G69di8xmazTTXcIZbuldPKsPjG2GMkTUCq
         oFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqVXi0U+k2qTlZ9y2GxgBUMnH3r1ENHnGu0e5FsZbGqdzJuMZ0ErxttLQyPlJA1ftiaNHcXxApeJdFiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkzWz6X7P8rlwV4s1XzjEjiWQeKpaZn7LqbkjVnxk7zHuaRR5g
	XOMkAJGNSQATSEM70+i3qk0khUepPEYoWqm/TZFKVRE18n7J74SH+OLIVIA7qyc=
X-Gm-Gg: ASbGncvJb9u1Bg/u7p4F3amtdW5LUBZc7VT3zlpsDBPL19vD8GcMfTcWkXBtvKCTVr5
	7+92P7elX0yP2gOQLm4ErX2chaaysYec+ELb4LrsJgV4W/J0MB/AYa9Zc25oWX4bqBjtx5wU7HI
	odYv2Wb7wJEbtJYdCEaZkAID/odZVAuF1sCyPDGxvRsNQ+4aTj8LmIhTlni+N8/vou2M0JF6RgG
	+m1nkLvFhdRdOJJ+xPLZvtxCipRQq3Vcf4azkyYw8DADOnsc6GrK5WJsYlG/jYcrKyQNw==
X-Google-Smtp-Source: AGHT+IHdXaqppaFpfpp5LNa0ul8QPdKwQdAsv9dXl2Bk3ITxnmZE24AfcaSOmBRp1g1DAK4pYwXODg==
X-Received: by 2002:a05:6000:186d:b0:386:1cd3:8a08 with SMTP id ffacd0b85a97d-38a221ed256mr3554054f8f.5.1734705062007;
        Fri, 20 Dec 2024 06:31:02 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474c2sm4120708f8f.55.2024.12.20.06.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:31:01 -0800 (PST)
Message-ID: <8bdfc058-dcf3-4fe0-b5ac-79dcce6bfe79@linaro.org>
Date: Fri, 20 Dec 2024 14:31:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: ov08x40: Get clock on ACPI platforms too
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-5-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> ACPI platforms might also have a clk provider which needs to be controlled,
> always try to get a clk using clk_get_optional() and when that fails fall
> back to getting the xvclk frequency from the "clock-frequency" property.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

