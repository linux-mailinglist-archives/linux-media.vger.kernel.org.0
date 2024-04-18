Return-Path: <linux-media+bounces-9710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 532978A9C2A
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 16:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C601F2446B
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A45F165FD7;
	Thu, 18 Apr 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VltlHbXc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F19165FAB
	for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449005; cv=none; b=jv3ncOah45DjkXwTeI59MoOeP8HPyiCDue0dQv6sirrES6odM2Py5+0XmAxsxwPuyH8w6PHGDqnMQyAZ8K+keHzQeR8NNMOjSCQPPMtbn5d/bPqYs9vHZAQX6VW7W4nrasJCJKgdCxZQu0/4KnNmtv5U4W+/liGiR7MTLnY1Wkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449005; c=relaxed/simple;
	bh=29NSP3ckhchgCk/BenPgTMkiEk28YJODiPFZQnpe0GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zij6cK0TkLTJEMwuTDJQFrPyj5ds3aR79DSseMT58IAS8hZSJvCAn9U3RN+ny1JTukYT/Z1fG+qPf5f5q2VUc++ktXZcE40Ifa1ce9Um3E7L/G0Wq7nK3fdQ57m5UcPbDcMPuOMVEkozx9fWOq1PIRkkcDg92Sy4+mrHwnfaQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VltlHbXc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518e2283bd3so1302043e87.1
        for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449001; x=1714053801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29NSP3ckhchgCk/BenPgTMkiEk28YJODiPFZQnpe0GQ=;
        b=VltlHbXcY/hXnGG2jz+w5zDZZ/tsvF06fpogDT2sVlKafCF0s0QMQ6AJpIRz7osL47
         p0+BXPM4xu0D6iHC+6CUnEx4qbRQTFszzCFQoHGG9cWF50ZHK8DPXkmn5TBbOaM+LMWM
         gCVw8TgQN20h8i7z+RPjpWmm0e/SprTcERH0LhR65IPIQiaqPCG1zQMcXmQ+j7C2g7wu
         eS0ZdMCy1y7OWt82gzWzxUTZcXGxrzCdN+tm2LaDNI8KgSBnyV9wwmo9orq/pSkQKAmp
         jhWYNSbkOedth9j/E5AwGkdUlcuHxyE6motV7suJlp91pi1FwqO4pbgKAJ2GhWRUAl/g
         Bo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449001; x=1714053801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29NSP3ckhchgCk/BenPgTMkiEk28YJODiPFZQnpe0GQ=;
        b=D7JI4J+hpAapWRPeM+GQw9DKa5C8SUYf7KUeKkjcvdbS8ml/9UqsPdcv+sADlu4sPr
         rvPT2jjG76cm/4YceddlSN4FYcJWxuw2aCsEQpcfbwfP3lB0mc6RY4IEWzj0wFy7Ym0D
         w7QNtkG3QktsPmYd7ycbJ1XDszkoMWagVmXVO5APNpxEtLVzu3MIk2Rqo5YYWZU9MJsJ
         Muf6IMs8f9iQY0+STDxitN4X/atmhQP7R+xymi+aIBrro7dafwuU8Yubatorr7LfBCHU
         UxrZ3gimZxjiqMpqgT+5fugCNSFpIYR686LrgdbWwjUnreCxRbihT6H7nmYGQlHM+m9A
         BglA==
X-Forwarded-Encrypted: i=1; AJvYcCWpbFFJDwANlbL3S8B5rBHBbG3AFZ/cKujYMERUFgRKswj7c0TBfbjZoD0MVVp1O0u/M0HxheHL4ptAi3JHy7vNHmFKH74vIVliA/w=
X-Gm-Message-State: AOJu0YxA/IB7PmgTrx49KydycDPkRDNj69BOtJ+Qp7446Bo26sDvU2fA
	nbeq0muz97DjqyjiDFM9e9RlKW4E/rSWHfTRQY+hREFqhZj76JQk4S9KdMMYP14=
X-Google-Smtp-Source: AGHT+IEEaAqAaRn0OgbuNYh5fB4s3wbKRYCkPSN2nyv1oCLgvcIRJoVOQEt5V3SOR++8k+CwHg+lTQ==
X-Received: by 2002:ac2:5b5b:0:b0:518:d5c4:d9b7 with SMTP id i27-20020ac25b5b000000b00518d5c4d9b7mr1966338lfp.16.1713449000512;
        Thu, 18 Apr 2024 07:03:20 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
        by smtp.gmail.com with ESMTPSA id w25-20020a17090633d900b00a51cdde5d9bsm931130eja.225.2024.04.18.07.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:03:19 -0700 (PDT)
Message-ID: <7f7fb71a-6d15-46f1-b63c-b569a2e230b7@baylibre.com>
Date: Thu, 18 Apr 2024 16:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
 <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
 <1da48c7e-ba87-4f7a-b6d1-d35961005ab0@ti.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <1da48c7e-ba87-4f7a-b6d1-d35961005ab0@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/18/24 13:25, Siddharth Vadapalli wrote:
> On Thu, Apr 18, 2024 at 01:17:47PM +0200, Julien Panis wrote:
>> On 4/18/24 13:00, Siddharth Vadapalli wrote:
>>> On 12-04-2024 21:08, Julien Panis wrote:
>>>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
>>>>
>>>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>>>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>>>
>>>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>>>
>>>> Besides, the page pool memory model is used to get better performance.
>>>>
>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>> Hello Julien,
>>>
>>> This series crashes Linux on AM62ax SoC which also uses the
>>> AM65-CPSW-NUSS driver:
>>> https://gist.github.com/Siddharth-Vadapalli-at-TI/5ed0e436606001c247a7da664f75edee
>>>
>>> Regards,
>>> Siddharth.
>> Hello Siddharth.
>>
>> Thanks for the log. I can read:
>> [    1.966094] Missing net_device from driver
>>
>> Did you check that nodes exist in the device tree for the net devices ?
> Yes it exists. The device-tree used was also built with linux-next
> tagged next-20240417. The node corresponding to eth0 is cpsw_port1 which
> is present and enabled in the device-tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=next-20240417#n644
>
> Regards,
> Siddharth.

I could reproduce the bug by disabling 'cpsw_port2' in my device tree,
which is 'k3-am625-sk.dts' for the board I use.

A condition is missing in am65_cpsw_create_xdp_rxqs() and
am65_cpsw_destroy_xdp_rxqs() functions.

For these 2 functions, the code which is in the for loop should be
run only when port ethX is enabled. That's why it crashes with
your device tree (cpsw_port2 is disabled, which is not the case by
default for the board I developed with).

I'll send a patch to fix the issue. Thanks for reporting it.

Julien

