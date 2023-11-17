Return-Path: <linux-media+bounces-471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 313247EEDB9
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 09:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7BA1C209FB
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 08:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F984A12;
	Fri, 17 Nov 2023 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RNfFtqCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22198196;
	Fri, 17 Nov 2023 00:46:51 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DCCC6607386;
	Fri, 17 Nov 2023 08:46:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700210809;
	bh=5caSPJBGYhsQEF1EZDAOJRHFGV6votwg14qOswGuAnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RNfFtqCQlAxG520Rpz0DzWapTBIvMSYJVEMLa9P+3imrUbG5T6IEgTh0c7WR+yVlT
	 jMmDJwR430lCXjdUf7xwPdpZsn1DGBNoCbWAvAs6eOHLe8pAMgRNiALxUNreMKrhyO
	 lkftocCUlYCYLZxOkPExx4mBIJ4cB0T0YpeEBN/wq9tIhBhnlyEkFzmlr1trxHyssP
	 DZS7cBco4JPxjucmgukDQX/XiuTZlnN28bMPPv7X1xUf6Ds9mtE+MdkYo8/FZEezh9
	 yZtGW3RL6QQm54nLDK3b5WAQCCzAOXWKDIqcDZpxuAulhWG4P2jZTlG3LAeCYxBrnV
	 IVFyutX4/BCBw==
Message-ID: <aea36e0b-216a-44a1-ac64-ca45b0ce0f85@collabora.com>
Date: Fri, 17 Nov 2023 09:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/6] media: verisilicon: Update H1 register definitions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, kernel@collabora.com
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-5-andrzej.p@collabora.com>
 <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

W dniu 17.11.2023 o 07:56, Chen-Yu Tsai pisze:
> On Thu, Nov 16, 2023 at 11:48 PM Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
>>
>> Add definition of register at offset 0x00c.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/media/platform/verisilicon/hantro_h1_regs.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
>> index c1c66c934a24..efb46da23eab 100644
>> --- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
>> +++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
>> @@ -23,6 +23,15 @@
>>   #define     H1_REG_AXI_CTRL_INPUT_SWAP32               BIT(2)
>>   #define     H1_REG_AXI_CTRL_OUTPUT_SWAP8               BIT(1)
>>   #define     H1_REG_AXI_CTRL_INPUT_SWAP8                        BIT(0)
>> +#define H1_REG_DEVICE_CTRL                             0x00c
>> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP8      BIT(27)
>> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP16     BIT(26)
>> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP32     BIT(25)
>> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP8         BIT(24)
>> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP16                BIT(23)
>> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP32                BIT(22)
>> +#define     H1_REG_DEVICE_CTRL_INPUT_READ_1MB          BIT(21)
>> +#define     H1_REG_DEVICE_CTRL_AXI_DUAL_CHANNEL                BIT(20)
> 
> According to the i.MX8M Mini reference manual, this bit is a "disable"
> control, i.e. setting this bit disables dual channel AXI. I think the
> macro should explicitly state this in the naming, so something like
> H1_REG_DEVICE_CTRL_DISABLE_AXI_DUAL_CH(ANNEL).

Good point, thanks.

Andrzej

> 
> Other bits matches the reference manual.
> 
>>   #define H1_REG_ADDR_OUTPUT_STREAM                      0x014
>>   #define H1_REG_ADDR_OUTPUT_CTRL                                0x018
>>   #define H1_REG_ADDR_REF_LUMA                           0x01c
>> --
>> 2.25.1
>>
>>
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com


