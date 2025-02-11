Return-Path: <linux-media+bounces-26001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B959A309E5
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 12:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90450188AE58
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52741F8BBF;
	Tue, 11 Feb 2025 11:26:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740061EB9E3;
	Tue, 11 Feb 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273207; cv=none; b=mtoTppJwRq34Iapzx+5xL6KVjMHGSBEqvaAbuVkUtv4C2iy8hp4ShnaZYa3fWQwNXGMZD/WWDhtpNoBa/IC00W4bwS45IuODuQ0aRp0djYekMkOuN+1NfdYkzaj/X4Uxfz2RK9LXuERQK/WWKioJIRE/QPvuei45yVmrfLkayWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273207; c=relaxed/simple;
	bh=hpErxqO9TrxWw2avAFGoKg5qOxOy24OPO1tA0p/6pPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=grOUXWGcOsU6s4rklnGoN4bFZKJ/BrFeLgi2x98P6uR8UFBCPJSDaxq2zLhsZnOBOGL+r6c4xPbcqBNHHGTVN7OlQnwfIv5G70z8mZ1/kgs1i6ja7tCLBAo1jS3MwyALQlnnabyC6dm8WuFTFVVfUIkMmoXBRYG42n+XkyLVIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YsfHs1XDJz1JJnb;
	Tue, 11 Feb 2025 19:25:13 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 4143C180069;
	Tue, 11 Feb 2025 19:26:35 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Feb 2025 19:26:33 +0800
Message-ID: <664185f4-b87a-4635-9ee9-2f0e7494195a@huawei.com>
Date: Tue, 11 Feb 2025 19:26:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>, <robh@kernel.org>,
	<saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<kory.maincent@bootlin.com>, <jacopo+renesas@jmondi.org>,
	<kieran.bingham+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
 <20250210100307.GA2966@pendragon.ideasonboard.com>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <20250210100307.GA2966@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2025/2/10 18:03, Laurent Pinchart 写道:
> Hi Zekun,
> 
> On Mon, Feb 10, 2025 at 02:47:28PM +0800, zhangzekun (A) wrote:
>>> I think we all agree that of_find_node_by_name() is miused, and that it
>>> shows the API isn't optimal. What we have different opinions on is how
>>> to make the API less error-prone. I think adding a new
>>> of_find_node_by_name_balanced() function works around the issue and
>>> doesn't improve the situation much, I would argue it makes things even
>>> more confusing.
>>>
>>> We have only 20 calls to of_find_node_by_name() with a non-NULL first
>>> argument in v6.14-rc1:
>>>
>>> arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
>>>
>>> The 'root' variable here is the result of a call to
>>> 'of_find_node_by_path("/")', so I think we could pass a null pointer
>>> instead to simplify things.
>>>
>>> arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
>>>
>>> Here I believe of_find_node_by_name() is called to find a *child* node
>>> of 'master'. of_find_node_by_name() is the wrong function for that.
>>>
>>> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
>>> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
>>> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
>>> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
>>>
>>> Here too the code seems to be looking for child nodes only (but I
>>> couldn't find a DT example or binding in-tree, so I'm not entirely
>>> sure).
>>>
>>> drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
>>>
>>> Usage here seems correct, the reference-count decrement is intended.
>>>
>>> drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>>> drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
>>> drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
>>> drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
>>> drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
>>> drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
>>> drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
>>> drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
>>> drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
>>>
>>> Incorrect usage, as far as I understand all those drivers are looking
>>> for child nodes only.
>>>
>>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
>>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
>>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
>>> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
>>>
>>> Here too I think only child nodes are meant to be considered.
>>>
>>> of_find_node_by_name() is very much misused as most callers want to find
>>> child nodes, while of_find_node_by_name() will walk the whole DT from a
>>> given starting point.
>>>
>>> I think the right fix here is to
>>>
>>> - Replace of_find_node_by_name(root, ...) with
>>>     of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
>>>     (if my understanding of the code is correct).
>>
>> For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment
>> in setup_peg2():
>>    /* keep the reference to the root node */
>>
>> It might can not be convert to of_find_node_by_name(NULL, ...), and the
>> origin use of of_find_node_by_name() put the ref count which want to be
>> kept.
> 
> But the reference is dropped by of_find_node_by_name(). Unless I'm
> missing something, dropping the lien
> 
> 	struct device_node *root = of_find_node_by_path("/");
> 
> and changing
> 
> 	rtas = of_find_node_by_name (root, "rtas");
> 
> to
> 
> 	rtas = of_find_node_by_name (NULL, "rtas");
> 
> will not change the behaviour of the code.
> 

Hi, Laurent,

I think that the original code try to keep the refcount get by 
of_find_node_by_path(), but leak it accidently by 
of_find_node_by_name(). I am not sure that what driver really wants to 
do and if it has a bug here.

Beset Regards,
Zekun

