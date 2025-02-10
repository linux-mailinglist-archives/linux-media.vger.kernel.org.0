Return-Path: <linux-media+bounces-25868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD2A2E450
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 07:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE2A1883A66
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 06:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E301A8419;
	Mon, 10 Feb 2025 06:47:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ABA189F20;
	Mon, 10 Feb 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170057; cv=none; b=uGMfG0ycsJR1KEprNDnC08vny8h2f0rYCGKbEA6neG/4+C67cMR3ABmw+lYVAp8U/C0mo2VK0EnNTR9gmyIF1jtgGmanWvpRUFVb3KCTrOj1ez+pd7Y6Jv75bBnrpcBk2U8OQpSstBUSlLiw6/fQRKvqM/YKvjpMYQ5yAc2HBs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170057; c=relaxed/simple;
	bh=e66W8EygnZvlrt91LMyE+AAHGIqSis3Oo8eWbRS+JTk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=f69ukjNvocauHkZKUh9DL1TjfXmxK19VufyPx80EcmMZrdSWomK9smmxKky9ASqDXnPWOZE9VTp/VQFFLPINzHz+EibGhNZ2nltdK9AtOjKSLAP8auIfqRTS/yry0edw2apslHc91B7Gbv5XDyz3TPF3b2VFFRrzCLNz1BSGbH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yrw5c0HCfz1ltZX;
	Mon, 10 Feb 2025 14:43:48 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id EED2618001B;
	Mon, 10 Feb 2025 14:47:30 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 14:47:28 +0800
Message-ID: <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
Date: Mon, 10 Feb 2025 14:47:28 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
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
In-Reply-To: <20250207153722.GA24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Hi, Laurent,

> I think we all agree that of_find_node_by_name() is miused, and that it
> shows the API isn't optimal. What we have different opinions on is how
> to make the API less error-prone. I think adding a new
> of_find_node_by_name_balanced() function works around the issue and
> doesn't improve the situation much, I would argue it makes things even
> more confusing.
> 
> We have only 20 calls to of_find_node_by_name() with a non-NULL first
> argument in v6.14-rc1:
> 
> arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
> 
> The 'root' variable here is the result of a call to
> 'of_find_node_by_path("/")', so I think we could pass a null pointer
> instead to simplify things.
> 
> arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
> 
> Here I believe of_find_node_by_name() is called to find a *child* node
> of 'master'. of_find_node_by_name() is the wrong function for that.
> 
> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
> arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
> arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
> 
> Here too the code seems to be looking for child nodes only (but I
> couldn't find a DT example or binding in-tree, so I'm not entirely
> sure).
> 
> drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
> 
> Usage here seems correct, the reference-count decrement is intended.
> 
> drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
> drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
> drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
> drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
> drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
> drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
> drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
> 
> Incorrect usage, as far as I understand all those drivers are looking
> for child nodes only.
> 
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
> drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
> 
> Here too I think only child nodes are meant to be considered.
> 
> of_find_node_by_name() is very much misused as most callers want to find
> child nodes, while of_find_node_by_name() will walk the whole DT from a
> given starting point.
> 
> I think the right fix here is to
> 
> - Replace of_find_node_by_name(root, ...) with
>    of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
>    (if my understanding of the code is correct).

For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment 
in setup_peg2():
  /* keep the reference to the root node */

It might can not be convert to of_find_node_by_name(NULL, ...), and the 
origin use of of_find_node_by_name() put the ref count which want to be 
kept.

> 
> - Replace of_find_node_by_name() with of_get_child_by_name() in callers
>    that need to search immediate children only (I expected that to be the
>    majority of the above call sites)
Since there is no enough information about these DT nodes, it would take 
time to prove if it is OK to make such convert.
> 
> - If there are other callers that need to find indirect children,
>    introduce a new of_get_child_by_name_recursive() function.
> 
> At that point, the only remaining caller of of_find_node_by_name()
> (beside its usage in the for_each_node_by_name() macro) will be
> drivers/clk/ti/clk.c, which uses the function correctly.
> 
> I'm tempted to then rename of_find_node_by_name() to
> __of_find_node_by_name() to indicate it's an internal function not meant
> to be called except in special cases. It could all be renamed to
> __of_find_next_node_by_name() to make its behaviour clearer.
>

The actual code logic of of_find_node_by_name() is more suitable to be 
used in a loop.So,rename of_find_node_by_name() to 
__of_find_next_node_by_name() seems to be a good idea.

Best regards,
Zekun



