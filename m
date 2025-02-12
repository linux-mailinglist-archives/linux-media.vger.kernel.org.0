Return-Path: <linux-media+bounces-26037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB5A31F76
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 07:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E709716138A
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 06:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C068A1FECA2;
	Wed, 12 Feb 2025 06:50:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F66146A68;
	Wed, 12 Feb 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739343039; cv=none; b=BLTIePKgum8SaIHNTvD017X/P0oXkvopKPSsPheEjROTX9cWAUrFRUfcDRr6zaPNRMhBLPbghPlOjJ5Ox+TxN8xGHQT+IKx//lI7IoskSw2oTvJrFc19f8gAjzEWP75Jatrm77ad1v4YitX2H8XOditV2kfH1bvEAWazViVFyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739343039; c=relaxed/simple;
	bh=OYFD1CLK77YRggUvsZMjIdLkeplSGOfH+CdXCLb/46M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L1SgmZ4I1C4QeeGjph8qzlwO0bESGQ6OCLCeKgTafBU0HAtQPAdEBR3Y3pAGPEwDWLsQBmNz22R/NCF+WhC6XDGzRBWKtm4XCdtg7v9ethd7a7t5y7QXoP6fiZTJtDSf6RuBrHCLy2tW6rQbsmipn9Gw/jM2PNHbt4el9K6esxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Yt8522FTjzRmXD;
	Wed, 12 Feb 2025 14:47:34 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 27CF1140258;
	Wed, 12 Feb 2025 14:50:27 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Feb 2025 14:50:25 +0800
Message-ID: <0b195b8c-6c0c-4cf4-bcc4-ed9a5bd9c0ae@huawei.com>
Date: Wed, 12 Feb 2025 14:50:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] net: bcmasp: Add missing of_node_get() before
 of_find_node_by_name()
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>, <robh@kernel.org>,
	<saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-3-zhangzekun11@huawei.com>
 <cb2db0c4-6f3a-4d44-90e5-b37cbe5e66fb@kernel.org>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <cb2db0c4-6f3a-4d44-90e5-b37cbe5e66fb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2025/2/12 13:52, Krzysztof Kozlowski 写道:
> On 07/02/2025 02:31, Zhang Zekun wrote:
>> of_find_node_by_name() will decrease the refcount of the device_node.
>> So, get the device_node before passing to it.
>>
>> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
>> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
>> ---
>>   drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> index a68fab1b05f0..093c8ea72af9 100644
>> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> @@ -1367,7 +1367,7 @@ static int bcmasp_probe(struct platform_device *pdev)
>>   	bcmasp_core_init(priv);
>>   	bcmasp_core_init_filters(priv);
>>   
>> -	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
>> +	ports_node = of_find_node_by_name_balanced(dev->of_node, "ethernet-ports");
> 
> Why this cannot be of_get_child_by_name()?
> 
> Best regards,
> Krzysztof

Thanks for point out. After looking into 
Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml, it should be 
of_get_child_by_name().

Best regards,
Zekun

