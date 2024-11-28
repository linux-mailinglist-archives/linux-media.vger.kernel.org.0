Return-Path: <linux-media+bounces-22277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B700B9DBDA2
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BE3B22396
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417651C9B66;
	Thu, 28 Nov 2024 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="WBw7x/8M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F71C57B2
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732833114; cv=none; b=ALQiEauh7nnbGFH9JEEkyaOX7dIvEpTUNUWclJl0qc7c3V7fFDKm9W9pP2r1Mhpuae05eW182EAJy03MG5vP0mvE1l6FF2TBGVSXpmtuL7IbMTsmh0QnOox/CfVjhPhmNl5XU+XPOmEZk0sh/7Jo9wZLWKZbsP9RC/FniXtfqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732833114; c=relaxed/simple;
	bh=vSBgqREdabS/n09oBGSsyVKJgzrWW8gMM+XuvFh8jGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqTfqh62x7grmVrLFNEynL026ZDxi68BG4WmHmU1sQkfU2nwn39hPb4mVZafgo5eNAI5zJtEIWBAZzNSi5kxoaku6q7EdDjm4DtZ8hf+y1deg7dcs8mnKsxE2wJuoHGLbfaqBw0vZW9UyOU11MXPYX+D/3psqmAnC04RmfJG3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=WBw7x/8M; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so1349709a12.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1732833109; x=1733437909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhEu1O8tP+5SOvMxJ5NzUYLjAfFINMkgnefleOw9LAo=;
        b=WBw7x/8MyxeOYA35C1drkYvwbmGeO4FR5l2nNU6fJHvRM1qoyCHGsAv+XHBcX7CSgS
         kZzVQ4seYlS/9DDpIZfWfLa1hPRbBWoxFL69gT7gxVvc7OdVA5Nb2/SAVdTYk/+tt1JY
         fKHnC1WJsTNWaddqounV/z7vb1KtRS94MGLv+CzVZp/9SZzPqfb+k3tZOw56C6jV5lwD
         p9ZZEy41vl386is+dJELTtcCJTV5jtvrV+0X1be2iJ0HdLMKgnkavT8cQ8wJw70lU4R2
         ZR0r+wQ0AzQ9HMKOG+3k5KfalhYadA6xN+RMlK6fpiWH54YC40aXrohS6YbbGs3OKEbX
         7XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732833109; x=1733437909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhEu1O8tP+5SOvMxJ5NzUYLjAfFINMkgnefleOw9LAo=;
        b=I0BPZKLG3+uOzBE3TmfViymyrtRDm5/drJvnFxEYtuWbqiw80nmiiVUxauht2piqmq
         v0B9KnsE7TMHe9jT/mCWqLrBOjtexbBb9WenUyiqVLdwkVmL7MZyOceE29VJlQGZM7HQ
         mRVCDjQsIdNgjUyTW9kU0Ow0ERFDJQDx/0yizV3LZEyB3NWcZgqFkUeNNoMUMTzkJruP
         wyw7IjS0hgUZth0r2PfdHIy3g5FsUYa8ypG0d19c51/AxH5gZSUK1RCC4YZySShT6Or8
         KT18yFWR6r/qq3crjZrTLybZuENLJmmSJTtCh1YqiLzNRcviv3zb5Eb4u8KaUdLX0tIh
         rYDw==
X-Forwarded-Encrypted: i=1; AJvYcCU+wu/YTHOBCpfeU7rSeH+FpTcOrzP/R8Wqh/j6KThLrWQfvjAyYWV466vUrlkOrCj2Qs9vQukF3zUxWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+QyoVkL7ymMkNaKZZyQ3JAMjCTRSmtwHtRTbIjPFOe8YOiw04
	3sunx088xJ5p1N/MltTNhGmO3labNBGYoGiQ9/l3Jp/mf5ym4eHQcN/4CGGHqHvfERJ15P+3LRN
	j
X-Gm-Gg: ASbGncv+imLGDISGayBavBI9My+8dR3sXZQkF3DR1B+Ve5OrfdUoZ3G51vAVQ7N8MPs
	YGXtdYLsiqGSkIUqaFW+cj0PsZBHYQA8Rtwg+9Bi7gQOp7psbr557gRPmtbhPv8kUX8/IZIDWO0
	0tRQyWWIo9tSvViN47i+lJwjiiGLoRhFFvHc3li47QS7/5LhUhpXzC4BOSKz2ts8/OiFoPhzu+q
	hKTxSYQCkZg6SEqUc4XoutrqncJ1ttUasVFnOc/nEhlvVBG/VA+4v6KZ/9/J13qsg==
X-Google-Smtp-Source: AGHT+IF9dnpn+7M0c6EI2JeDjVFOmRxhuBpL/4iDLEvFEuP8URE+Rh0/zEacF8TcZBK3JG2szgyFfw==
X-Received: by 2002:a05:6402:3546:b0:5cf:de89:9364 with SMTP id 4fb4d7f45d1cf-5d080bb2f99mr8554599a12.10.1732833109274;
        Thu, 28 Nov 2024 14:31:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8db19sm1133180a12.61.2024.11.28.14.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 14:31:48 -0800 (PST)
Message-ID: <73fffc4f-f8a8-4011-8d69-cab4c29223c3@nexus-software.ie>
Date: Thu, 28 Nov 2024 22:31:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: document csiphy_lanes_cfg structure
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241128200142.602264-1-david@ixit.cz>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241128200142.602264-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2024 20:01, David Heidelberg wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git ./drivers/media/platform/qcom/camss/camss-csiphy.h ./drivers/media/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..e3b9e8f12806 100644
> --- ./drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ ./drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -26,6 +26,12 @@ struct csiphy_lane {
>   	u8 pol;
>   };
>   
> +/**
> + * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @num_data: number of data lanes
> + * @data:     data lanes configuration
> + * @clk:      clock lane configuration (only for D-PHY)
> + */
>   struct csiphy_lanes_cfg {
>   	int num_data;
>   	struct csiphy_lane *data;

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

