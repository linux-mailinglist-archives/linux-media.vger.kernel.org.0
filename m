Return-Path: <linux-media+bounces-6468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75A8722DF
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B071C21F92
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 15:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9409127B54;
	Tue,  5 Mar 2024 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RPHDQCFA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D01272D4
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709652788; cv=none; b=dgLtrcGUURyG1aNtKP5JIerZ8RnEqnwCQDLt85z/dkiyggQixIWL3XrHnLx5CkDh5XOHmSVgEnk+4A7M05Vt9sESJSnBfjUqJ19JKgsaFNHuoMn8A9WYnzGukavMsdmZgnpBGtIkciRdJyWeczbBBotU25P0938oVbrMUsjQfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709652788; c=relaxed/simple;
	bh=dyLpAemXt5pVNnHmghn6IPXPVYR1xCgqubCzLUx41cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJlb/icvvJqVsH28dQGDeYmHCWV/rWTB3fhh4Vw9jbj6O2DFqteRYnBZrAKeGjVTsSnfIuEuJv2J0pyBPsrOOtFKmmRsW5ELcBU5nqY8UH9z8ucXwfYFey7XbEHyekhYiY0XZeXdztyswlIWx3MNw4KzhLSmLfFkcMrZbs3jdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RPHDQCFA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412eb6e15ceso7214545e9.0
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 07:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709652784; x=1710257584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8r7IHy7kVKfRTqD23CgO2t0WRZctdWLP4DagcY/UzEU=;
        b=RPHDQCFALmXiKAcFUgFxO5MndwZjJr5DgxKMSQdsUAJ/xKAo/xkEHyjXOFVrW3ljy7
         gsDFoxDXnc69kZUZE04fnDG3OVRB/Rpp/7D9Doa7aiDoJHLs9KfJsFmE3tW24D4l7IeU
         gtdt32MHgSF8Fi/bKkvd1h30GUkH2N3WjP2/AxNy1pyQxy9n9V5k0QZhD4pATMBTJpjV
         Nz6Uf2GNl7HSSg9NgGedMD+aTIx3pN03j5Cv00t1sovm9AKNnEOmkwDMHCiBUMzLp7Qq
         0mwFv/TQrNSSeQ2RvbOmigcZc7MPVbMmQ49Ypj2XcoKYJb7+mYYbPaM7HVczW9WPwqFk
         3Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709652784; x=1710257584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8r7IHy7kVKfRTqD23CgO2t0WRZctdWLP4DagcY/UzEU=;
        b=QGHS5sezV6NEz4z7tYNwram8WoY/HuX0rWCQLH4RizQWive0aciVU5xZReX2uzTdxU
         fImtmXHLYVF8EkUixxcKa3Bsz/F2se3Lctmh1PQZJV0InJkawKfgYA7snQ1hFWRvA7r2
         uOJ0p3/cn5GA+bvNKCrIyeRPyPtDXBj3K4pp00g0wkg2cVlxVGOeUHVGdNll9+QF6mXh
         WeiY2g+QF4TXkNDlHOwnVvBSCsHfpBGjIDzAoq1I0eKE5VRgPHdW5zIkAmRR51YdPecq
         4ggAzG9j1+239GMHcOjASsirs6fM0ET5zMV3V25LxhDayiq5M2g+WaO2wlS+4t25M3CI
         UaQA==
X-Forwarded-Encrypted: i=1; AJvYcCWn5rpFNdIXZHjBbrkZrzf8AkL8huwOFa0G5rocLzN95IU62zV5P1TJIwc4roDVrolSy38m5K/QwDBt3EzieDit8IzRFAq0mxTRWq4=
X-Gm-Message-State: AOJu0YwnZQC6dJEnd+xauBQ6cEX1kdsutcXitAefoAWR5CZ87tGz/xGM
	EE4uxRNTJqiBpD6C6ryj0TG402Oy0LzAVouiPdm3YjEJetQCJO0zrs8SYLz2Gfk=
X-Google-Smtp-Source: AGHT+IEVNqjI7TrOIyxyC0zXS0GjDY1acqoeUroBUXxj1W59e4andupDbOlOfQsujmcheNGf/bEuNg==
X-Received: by 2002:adf:b209:0:b0:33e:4797:5fa7 with SMTP id u9-20020adfb209000000b0033e47975fa7mr1964612wra.42.1709652784359;
        Tue, 05 Mar 2024 07:33:04 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id y10-20020adff14a000000b0033e1be7f3d8sm12894093wro.70.2024.03.05.07.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 07:33:03 -0800 (PST)
Message-ID: <f0a9524a-08cd-4ec2-89f8-4dff9dd3e09e@baylibre.com>
Date: Tue, 5 Mar 2024 16:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: ethernet: ti: am65-cpsw: Add minimal XDP
 support
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v2-2-01c6caacabb6@baylibre.com>
 <356f4dd4-eb0e-49fa-a9eb-4dffbe5c7e7c@lunn.ch>
 <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
 <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/5/24 14:28, Andrew Lunn wrote:
> On Tue, Mar 05, 2024 at 11:46:00AM +0100, Julien Panis wrote:
>> On 3/1/24 17:38, Andrew Lunn wrote:
>>> On Fri, Mar 01, 2024 at 04:02:53PM +0100, Julien Panis wrote:
>>>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>>>> Ethernet driver. The following features are implemented:
>>>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>>>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>>>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>>>
>>>> The page pool memory model is used to get better performance.
>>> Do you have any benchmark numbers? It should help with none XDP
>>> traffic as well. So maybe iperf numbers before and after?
>>>
>>> 	Andrew
>> Argh...Houston, we have a problem. I checked my v3, which is ready for
>> submission, with iperf3:
>> 1) Before = without page pool -> 500 MBits/sec
>> 2) After = with page pool -> 442 MBits/sec
>> -> ~ 10% worse with page pool here.
>>
>> Unless the difference is not due to page pool. Maybe there's something else
>> which is not good in my patch. I'm going to send the v3 which uses page pool,
>> hopefully someone will find out something suspicious. Meanwhile, I'll carry on
>> investigating: I'll check the results with my patch, by removing only the using of
>> page pool.
> You can also go the other way. First add page pool support. For the
> FEC, that improved its performance. Then add XDP, which i think
> decreased the performance a little. It is extra processing in the hot
> path, so a little loss is not unsurprising.
>
> What tends to be expensive with ARM is cache invalidation and
> flush. So make sure you have the lengths correct. You don't want to
> operate on more memory than necessary. No point flushing the full MTU
> for a 64 byte TCP ACK, etc.
>
>        Andrew

I changed back code step by step and could find what makes a significant
difference. Here are the main tests achieved (results in Mbits/sec):

1) Page pool without XDP code -> res = 442
Conclusion: No difference with or without XDP code.

2) From 1), page pool removed and replaced by previous memory model
based on dev_alloc_page() function -> res =418
Conclusion: Your advice was good, that's better with page pool. :)

3) From 2), am65_cpsw_alloc_skb() function removed and replaced by
netdev_alloc_skb_ip_align(), as used by the driver before -> res = 506
Conclusion: Here is where the loss comes from.
IOW, My am65_cpsw_alloc_skb() function is not good.

Initially, I mainly created this 'custom' am65_cpsw_alloc_skb() function
because I thought that none of XDP memory models could be used along
with netdev_alloc_skb_ip_align() function. Was I wrong ?
By creating this custom am65_cpsw_alloc_skb(), I also wanted to handle
the way headroom is reserved differently.

Julien


