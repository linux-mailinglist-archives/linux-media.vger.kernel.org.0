Return-Path: <linux-media+bounces-25815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F67A2C75B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F822188519E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 15:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E2D23ED54;
	Fri,  7 Feb 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bt5U4Jar"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6195238D26;
	Fri,  7 Feb 2025 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942654; cv=none; b=e8eQyi16Z22P67D1xHDoYCdJ9UgWIlM+Uo94zVH7gOz+TjXMF04GEGobun+KaLb4ELITGjhPwQl0QtUsvFB9jd/JzsWk61qOvnPoQOucFWCVGmxuWOlyWvx5WMcyBuXgR8wCF5SwTBCW1htDssP7Rr6KHsPFAISW+E5ulScKmro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942654; c=relaxed/simple;
	bh=WyyQXcsQ8Po4tWbhAYVSE247YXhK6Kned9eNBhzhzPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt2ym8E/UwawjT4G0j7fjmqHWqooAGnuYuXBaaOH/YtTvDB6yRwa/YLFI5E3g7BKrLJ+DaCb8V+N72JEeWkx08sW8KS+RETZ0ctHJOAJ3paeSfgy1lsGJg5Xkc0iYtwyh1FDfaZN7WKlpxNz66NbDTaEjuGVEuMNWpHywt0KxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bt5U4Jar; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93016520;
	Fri,  7 Feb 2025 16:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738942574;
	bh=WyyQXcsQ8Po4tWbhAYVSE247YXhK6Kned9eNBhzhzPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt5U4JarIqKJyUwK2lAgVMJLXqYYKXj1Dw5/YsU1N4r3TntKj6kZW9mlo8RTZVoOk
	 HsMtRJIpAm58oDln8u37ZxGV1C5oXj+Dis76hEhzLnKOkatB1yf5Fp+NDBHBHx1SiX
	 jpUl8R3kXNRlrn4KPKKErhcLiG3ojoeQ0dJS89/4=
Date: Fri, 7 Feb 2025 17:37:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <20250207153722.GA24886@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>

Hi Zekun,

On Fri, Feb 07, 2025 at 07:28:23PM +0800, zhangzekun (A) wrote:
> 在 2025/2/7 16:24, Oleksij Rempel 写道:
> > On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> >> There are many drivers use of_find_node_by_name() with a not-NULL
> >> device_node pointer, and a number of callers would require a call to
> >> of_node_get() before using it. There are also some drivers who forget
> >> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> >> wraper function for of_find_node_by_name(), drivers may use this function
> >> to call of_find_node_by_name() with the refcount already balanced.
> >>
> >> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> > 
> > Hi Zhang Zekun,
> > 
> > thank you for working on this issue!
> > 
> > First of all, let's take a step back and analyze the initial problem.
> > Everything following is only my opinion...
> > 
> > The main issue I see is that the current API - of_find_node_by_name -
> > modifies the refcount of its input by calling of_node_put(from) as part
> > of its search. Typically, a "find" function is expected to treat its
> > input as read-only. That is, when you pass an object into such a
> > function, you expect its reference count to remain unchanged unless
> > ownership is explicitly transferred. In this case, lowering the refcount
> > on the input node is counterintuitive and already lead to unexpected
> > behavior and subtle bugs.
> > 
> > To address this, the workaround introduces a wrapper function,
> > of_find_node_by_name_balanced, which first increments the input’s
> > refcount (via of_node_get()) before calling the original function. While
> > this "balances" the refcount change, the naming remains problematic from
> > my perspective. The "_balanced" suffix isn’t part of our common naming
> > conventions (traditions? :)). Most drivers expect that a function
> > starting with "find" will not alter the reference count of its input.
> > The term "balanced" doesn’t clearly convey that the input's refcount is
> > being explicitly managed - it instead obscures the underlying behavior,
> > leaving many developers confused about what guarantees the API provides.
> > 
> > In my view, a more natural solution would be to redesign the API so that
> > it doesn’t modify the input object’s refcount at all. Instead, it should
> > solely increase the refcount of the returned node (if found) for safe
> > asynchronous usage. This approach would align with established
> > conventions where "find" implies no side effects on inputs or output,
> > and a "get" indicates that the output comes with an extra reference. For
> > example, a function named of_get_node_by_name would clearly signal that
> > only the returned node is subject to a refcount increase while leaving
> > the input intact.
> > 
> > Thus, while the current workaround "balances" the reference count, it
> > doesn't address the underlying design flaw. The naming still suggests a
> > "find" function that should leave the input untouched, which isn’t the
> > case here. A redesign of the API - with both the behavior and naming
> > aligned to common expectations - would be a clearer and more robust
> > solution.
> > 
> > Nevertheless, it is only my POV, and the final decision rests with the
> > OpenFirmware framework maintainers.
> > 
> > Best Regards,
> > Oleksij
> 
> Hi, Oleksij,
> 
> Thanks for your review. I think redesign the API would be a fundamental 
> way to fix this issue, but it would cause impact for current users who 
> knows the exact functionality of of_find_node_by_name(), which need to 
> put the "from" before calling it (I can't make the assumption that all 
> of drivers calling of_find_node_by_name() with a not-NULL "from" 
> pointer, but not calling of_node_get() before is misuse). The basic idea 
> for adding a new function is try not to impact current users. For users 
> who are confused about the "_balanced" suffix,the comments of 
> of_find_node_by_name() explains why this interface exists.

I think we all agree that of_find_node_by_name() is miused, and that it
shows the API isn't optimal. What we have different opinions on is how
to make the API less error-prone. I think adding a new
of_find_node_by_name_balanced() function works around the issue and
doesn't improve the situation much, I would argue it makes things even
more confusing.

We have only 20 calls to of_find_node_by_name() with a non-NULL first
argument in v6.14-rc1:

arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");

The 'root' variable here is the result of a call to
'of_find_node_by_path("/")', so I think we could pass a null pointer
instead to simplify things.

arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");

Here I believe of_find_node_by_name() is called to find a *child* node
of 'master'. of_find_node_by_name() is the wrong function for that.

arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");

Here too the code seems to be looking for child nodes only (but I
couldn't find a DT example or binding in-tree, so I'm not entirely
sure).

drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);

Usage here seems correct, the reference-count decrement is intended.

drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);

Incorrect usage, as far as I understand all those drivers are looking
for child nodes only.

drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");

Here too I think only child nodes are meant to be considered.

of_find_node_by_name() is very much misused as most callers want to find
child nodes, while of_find_node_by_name() will walk the whole DT from a
given starting point.

I think the right fix here is to

- Replace of_find_node_by_name(root, ...) with
  of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
  (if my understanding of the code is correct).

- Replace of_find_node_by_name() with of_get_child_by_name() in callers
  that need to search immediate children only (I expected that to be the
  majority of the above call sites).

- If there are other callers that need to find indirect children,
  introduce a new of_get_child_by_name_recursive() function.

At that point, the only remaining caller of of_find_node_by_name()
(beside its usage in the for_each_node_by_name() macro) will be
drivers/clk/ti/clk.c, which uses the function correctly.

I'm tempted to then rename of_find_node_by_name() to
__of_find_node_by_name() to indicate it's an internal function not meant
to be called except in special cases. It could all be renamed to
__of_find_next_node_by_name() to make its behaviour clearer.

-- 
Regards,

Laurent Pinchart

