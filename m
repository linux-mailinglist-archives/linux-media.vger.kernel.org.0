Return-Path: <linux-media+bounces-9707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB58A9869
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 13:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 468C6B21A5E
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E8215E7EA;
	Thu, 18 Apr 2024 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W99gcOUK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0356415E5B0
	for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713439077; cv=none; b=ZAMkWIWrB1ZRk2XSomuQ0hWycWvEEpe+kMGJQhomGu3tDeLTGBd7r4UkIb+Rz6xah9MQdUWRDvP0ys7QUBlw4yXEIoq6ub6+AurCc6FN0OD22Rar5v/ODf3ObNk/efRyUj4//3Nbl6EvIDTU+OxFtWmoYm9JT28hV+bm4xwDvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713439077; c=relaxed/simple;
	bh=dadbVw0ZN8KGcZgqWT52RSFUotZfDdsINMbi0GWd0pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6rT0KWG4rGakUZ2Fh8QmCclAhjTzPNCr9pSYT8f0/GbDQw+ZYMJmB/5Xo8vLsHT/p1bH5B2/O6wJCo4SqwzUI3/y5VcV3SZ6RqH1ld8Gqsj2r/7VYp/TJ72vIbJLAodHpn4cg0scc9cO9hMK2FVOCr1DKAtziW9W2WE+BWYyOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W99gcOUK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so1082293a12.2
        for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713439073; x=1714043873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dadbVw0ZN8KGcZgqWT52RSFUotZfDdsINMbi0GWd0pk=;
        b=W99gcOUKyl2+fZdSBGJVqDttq0TutTfo/6hILA47OiK9Q5NGpLWd82kINRtwvJ0lvR
         kyatA9B4IM0952YAX0i+2pg8VMETeswm4xNnuUz9EWIlyhq9xMakmTSZ5AwqcQ8cjJ+a
         Jjdy1rSJ+S00Jp4QIy/vkmnAVLvtO4/Y+EsgYF9ZQ6lY/XoE7cnnQXZmm/IqsUdYlKrH
         zGP72ch7jLJfnopA6zORpfzvDwgsEgWmUCk3W4iqYxYHimEHHsqxyh0+bN1S2ixRP5Hc
         G7+S1tuV3fZPUQLfZKwtAnv4NswetcDsj+f/aA1Er605BpFnIxdV3Ee8DsemNttK6gi5
         +pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713439073; x=1714043873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dadbVw0ZN8KGcZgqWT52RSFUotZfDdsINMbi0GWd0pk=;
        b=dXZPAtTbCWB2MnWzO+u/ogJOmyBdZVFoTS3woGtaECG6fFuK3/3HFo1TSIy4ITkGZW
         vgsruD8UExZ60DibuEYl2fcTZl4ZFjyJjiAzs3jz+C1gC+pKTNeMsgud0iQU+40FL9r5
         x/jqDn3uVTMje8NRTyQhe2a2dCX/thv5zvSLFQJ8+352oA7csPMNYfMghkKR25jEvHTh
         44ZZawzikwhNP8Aoe7jQZnQC3AuUTG6p0ATaGEnwSMzgRvJ82ud+ziZ2mSKCOylCuwMK
         btitXOMdZsUl+kicXsfXQHy2PxboJnLXA/M3tm7yJ1uRlGHWJ9Du/QZzV9ydhPQz1rnV
         A8uA==
X-Forwarded-Encrypted: i=1; AJvYcCWyN1/mwLDJTt4yWIf4X6XD/wcymqorp2ST4LrFioSPOv40RavQrdtZ0Vx+RvIMuX17U34GMJWQ9ZI6GhUgR3cWW7x/cvWLP1ia2uY=
X-Gm-Message-State: AOJu0YzhDbEy7i6pHpjHn4OyPmCNiUG1fygw6YC2rZqqQplxignMp2cs
	mDhwnZb1I+qvE6bugnGKh321vgWIs1qou85EIewxcaeXxKxVO6ynSZ/G/3BvPsM=
X-Google-Smtp-Source: AGHT+IHmqSTkMUPGya8bnbl4tVCYR5pgohc+bRojwZq6H6mlk6lXfXDEJpU5L7fvxPN2Mb70UrGa9g==
X-Received: by 2002:a17:906:1156:b0:a55:54ec:a2fe with SMTP id i22-20020a170906115600b00a5554eca2femr1963102eja.29.1713439073194;
        Thu, 18 Apr 2024 04:17:53 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906431500b00a521e5856f6sm747685ejm.51.2024.04.18.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 04:17:52 -0700 (PDT)
Message-ID: <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
Date: Thu, 18 Apr 2024 13:17:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/24 13:00, Siddharth Vadapalli wrote:
> On 12-04-2024 21:08, Julien Panis wrote:
>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
>>
>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>
>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>
>> Besides, the page pool memory model is used to get better performance.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> Hello Julien,
>
> This series crashes Linux on AM62ax SoC which also uses the
> AM65-CPSW-NUSS driver:
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5ed0e436606001c247a7da664f75edee
>
> Regards,
> Siddharth.

Hello Siddharth.

Thanks for the log. I can read:
[    1.966094] Missing net_device from driver

Did you check that nodes exist in the device tree for the net devices ?

Julien


