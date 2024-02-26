Return-Path: <linux-media+bounces-5987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5FA867F36
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 18:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 871F028BC00
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 17:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E122212EBF3;
	Mon, 26 Feb 2024 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ogzxs2hN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39612D75F
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708969712; cv=none; b=eGaG3FQKjQUzFmeVX8249O1oi3JTP2SM5s0S3RQB971BO/CofgHxY7d0cWy4W7YlsPxq5qV1IyggFGRMBhrpYB6iPnaMRc+I7qbjZSUcaskrk6kLKUY8+R38w2D5vE+a4DkL6/NN8L9MeqTcqcfdtAeRMK9P0+tGeX/aE7965rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708969712; c=relaxed/simple;
	bh=9CNH6eBrpG7Y4RPdoxYMylKkon4YJXsFwRrwUsvdA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFTYL+9DcH3BOdiuB6Sf3ipi1crd8Mn5eCC2f+JUw7w4MeOLtjDS3ILUP4MnrjspHMkhW0MxoioRI8lNZ7ABn46YIWti9Brnl5ulRINvXEaQgKsIcAurVdEQNtrCAb5rupOcRfr3zI3iIRXq4WopJr6BTIRcho+OR2n/rE5YPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ogzxs2hN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ddebaf810so455872f8f.2
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708969707; x=1709574507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojp2zJXBZwpD/60KKk/OWh1F7+E9xMLGoW5yyn8MP1Q=;
        b=Ogzxs2hNvY31TJ8yEzCuEKgsyRflf1CIFLDUPoz3SPZhcI5XpfjFcBVylwMo2p7Rw6
         YbnFWpNlssFvAjMN+5lDgvZuhx+kbJDeg79CgyfDsAFlttNl6jzn8Xu+YDdpUtV1XxK4
         2kFCv38UIhiXiAYapi0uTO1+IpyA6P6oKB37zh6Bs51kWNKmi8yzY3OUTxIbXVu7iC2N
         OSEIQAI/BsNsHjYxhP3pi2tBpZB/0hPbJf75zySUVZ5OelkBFnqYyNTYq6UZFbzkBcp0
         mr1SM79onmmHXQvdRU9vNc0Rlr6vw8VM3nvYZI0nY/i3ZPZ6Yn6B47U4CLZOklMc6Eoe
         l2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969707; x=1709574507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojp2zJXBZwpD/60KKk/OWh1F7+E9xMLGoW5yyn8MP1Q=;
        b=tHsArerVYpQY13MiJ9wMj+CQ+rmSDxulvsE9t3UnrrtOjalL8Zhyavhb0zJOx69ET9
         dknU9L0ZQi+vyQs9NN0/6fQ/14IkKflsSnAjpcLoMX4bJ7YOxdZGf0blx1EeKJ9GgcKG
         VnNvZKrG+yQ+2jrlnHYfFbj8xxg2S8phEhK3rWs/0jH87EE6GbY5r8Z2pgg/T0eM/DOG
         Qq3CdpzKAOGOTz/caThRngwF8B3nZRPIvejKMwn399kJRwrO8p2KIpU/4EM8DO1L4Q7E
         05U1/rpHqrZpw6Z//WOtyPtquxlCPNy+Bxpqz54SEqTmDZESxe665ojm6UAYB14zSJ+T
         9voA==
X-Forwarded-Encrypted: i=1; AJvYcCVfInAtouXw/5efZl5c4qzOdkhNeY1rJmdK8GwlOND38I6Cxs7tcsDcuY8275jYZj5cU/k4c0GcMpj+P7UxzUKTSFHkT4ZhnnPAVuc=
X-Gm-Message-State: AOJu0YyU6QQePr6LGPU3tApUiWehdG8saT/y0UGitfzuFFad6HEqSuAZ
	0joLoP5nV5V14dgSecxCfxGIHZksrybOT/ehw9tJ6vPcpElCAUvgu4xMwD37OU0=
X-Google-Smtp-Source: AGHT+IFeR4xk7Fwu0u7VFlJ0xMPB7f8Wl3ldtiQ7PBzLuOaNIEmCyOPdZa82wTMgFMPSlFRnwQydCw==
X-Received: by 2002:a05:6000:4ed:b0:33d:6be8:bb61 with SMTP id cr13-20020a05600004ed00b0033d6be8bb61mr5836632wrb.35.1708969707330;
        Mon, 26 Feb 2024 09:48:27 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id c3-20020adfe703000000b0033d6fe3f6absm8903931wrm.62.2024.02.26.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:48:26 -0800 (PST)
Message-ID: <1c2fe59a-daf6-4486-84ca-5880222d24bd@baylibre.com>
Date: Mon, 26 Feb 2024 18:48:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
 <20240226172533.GG13129@kernel.org>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240226172533.GG13129@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Simon,

Thank you for the review.

On 2/26/24 18:25, Simon Horman wrote:
> On Fri, Feb 23, 2024 at 12:01:37PM +0100, Julien Panis wrote:
>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>> Ethernet driver. The following features are implemented:
>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ...
>
>> @@ -440,6 +476,27 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
>>   	dev_kfree_skb_any(skb);
>>   }
>>   
>> +static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
>> +{
>> +	struct page *page;
>> +	struct sk_buff *skb;
> nit: please arrange local variables in reverse xmas tree order,
>       from longest line to shortest in new code.
>
>       This tool can be useful: https://github.com/ecree-solarflare/xmastree

You mean, for the new functions introduced in this patch only ?

>
>> +
>> +	page = dev_alloc_pages(0);
> nit: Maybe dev_alloc_page() is appropriate here?

Absolutely.

>
>> +	if (unlikely(!page))
>> +		return NULL;
>> +
>> +	len += AM65_CPSW_HEADROOM;
>> +
>> +	skb = build_skb(page_address(page), len);
>> +	if (unlikely(!skb))
> Does page need to be freed here?

Of course it does ! This will be fixed in the next version.

>
>> +		return NULL;
>> +
>> +	skb_reserve(skb, AM65_CPSW_HEADROOM + NET_IP_ALIGN);
>> +	skb->dev = ndev;
>> +
>> +	return skb;
>> +}
> ...


