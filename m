Return-Path: <linux-media+bounces-25890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58AA2E893
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D774163582
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5331CC89D;
	Mon, 10 Feb 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e9JIjGIb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A111C4A0A;
	Mon, 10 Feb 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181802; cv=none; b=cNlSlXZbQg6FHLPWgwrvNKIR23yprqntOg9uYSrOozADiwY9fAnOxIcbFnwDieX6CwjJqAyzI4Fi/ZOxKlKUrN88o2KNjJtcCozOAtC37amkk0XMs1/qALWPWFxKrWD/wwYzjgXgdVtxMHB0ElnnuSh3jvaJ9ORsO19zs4fmxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181802; c=relaxed/simple;
	bh=DYI8FPWv2nrFA0bms9nZRqfoHZqOqiWHzVO7WBrXD7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ht47ZUb1sd7wRmzBeFXmgumD5a4lsN8wCmS/e4MrLlwuE3+J+46rBtgFxx71if4bMazGrDj5cOcGmKDewY9U9r8qiRP6e2BpULVDC3ymEr2Xd4+Qz4CpvedaKkrLs5GvbWJ1sRaD7roGSU72rp+XRwFa4y8I5/1vGRZC3A0lNAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e9JIjGIb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE35322E;
	Mon, 10 Feb 2025 11:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739181720;
	bh=DYI8FPWv2nrFA0bms9nZRqfoHZqOqiWHzVO7WBrXD7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9JIjGIbxAbHFBZNoHhzMtWVU3aQ9YxlVTuCOKgJi2aq03Ua4rQA6/NKopcvO1WuG
	 cHjfxeUHiqkeHdDEuwFrBPi5JqWzg2Kq/4BvNV1sd9vHfM8lVjcq46bd0u3vXU42pb
	 vq62ObCJEh+arMeDvr5kTxRVUI5tnOOcDdKA4qGI=
Date: Mon, 10 Feb 2025 12:03:07 +0200
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
Message-ID: <20250210100307.GA2966@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c48952c7-716c-4302-949c-2c66ea102a3e@huawei.com>

Hi Zekun,

On Mon, Feb 10, 2025 at 02:47:28PM +0800, zhangzekun (A) wrote:
> > I think we all agree that of_find_node_by_name() is miused, and that it
> > shows the API isn't optimal. What we have different opinions on is how
> > to make the API less error-prone. I think adding a new
> > of_find_node_by_name_balanced() function works around the issue and
> > doesn't improve the situation much, I would argue it makes things even
> > more confusing.
> > 
> > We have only 20 calls to of_find_node_by_name() with a non-NULL first
> > argument in v6.14-rc1:
> > 
> > arch/powerpc/platforms/chrp/pci.c:      rtas = of_find_node_by_name (root, "rtas");
> > 
> > The 'root' variable here is the result of a call to
> > 'of_find_node_by_path("/")', so I think we could pass a null pointer
> > instead to simplify things.
> > 
> > arch/powerpc/platforms/powermac/pic.c:          slave = of_find_node_by_name(master, "mac-io");
> > 
> > Here I believe of_find_node_by_name() is called to find a *child* node
> > of 'master'. of_find_node_by_name() is the wrong function for that.
> > 
> > arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(rootnp, "GAISLER_IRQMP");
> > arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(rootnp, "01_00d");
> > arch/sparc/kernel/leon_kernel.c:        np = of_find_node_by_name(nnp, "GAISLER_GPTIMER");
> > arch/sparc/kernel/leon_kernel.c:                np = of_find_node_by_name(nnp, "01_011");
> > 
> > Here too the code seems to be looking for child nodes only (but I
> > couldn't find a DT example or binding in-tree, so I'm not entirely
> > sure).
> > 
> > drivers/clk/ti/clk.c:   return of_find_node_by_name(from, tmp);
> > 
> > Usage here seems correct, the reference-count decrement is intended.
> > 
> > drivers/media/i2c/max9286.c:    i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> > drivers/media/platform/qcom/venus/core.c:       enp = of_find_node_by_name(dev->of_node, node_name);
> > drivers/net/dsa/bcm_sf2.c:      ports = of_find_node_by_name(dn, "ports");
> > drivers/net/dsa/hirschmann/hellcreek_ptp.c:     leds = of_find_node_by_name(hellcreek->dev->of_node, "leds");
> > drivers/net/ethernet/broadcom/asp2/bcmasp.c:    ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> > drivers/net/ethernet/marvell/prestera/prestera_main.c:  ports = of_find_node_by_name(sw->np, "ports");
> > drivers/net/pse-pd/tps23881.c:  channels_node = of_find_node_by_name(priv->np, "channels");
> > drivers/regulator/scmi-regulator.c:     np = of_find_node_by_name(handle->dev->of_node, "regulators");
> > drivers/regulator/tps6594-regulator.c:          np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
> > 
> > Incorrect usage, as far as I understand all those drivers are looking
> > for child nodes only.
> > 
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest16");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest17");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest18");
> > drivers/of/unittest.c:          found = of_find_node_by_name(nd->overlay, "test-unittest19");
> > 
> > Here too I think only child nodes are meant to be considered.
> > 
> > of_find_node_by_name() is very much misused as most callers want to find
> > child nodes, while of_find_node_by_name() will walk the whole DT from a
> > given starting point.
> > 
> > I think the right fix here is to
> > 
> > - Replace of_find_node_by_name(root, ...) with
> >    of_find_node_by_name(NULL, ...) in arch/powerpc/platforms/chrp/pci.c
> >    (if my understanding of the code is correct).
> 
> For arch/powerpc/platforms/chrp/pci.c, noticing that there is a comment 
> in setup_peg2():
>   /* keep the reference to the root node */
> 
> It might can not be convert to of_find_node_by_name(NULL, ...), and the 
> origin use of of_find_node_by_name() put the ref count which want to be 
> kept.

But the reference is dropped by of_find_node_by_name(). Unless I'm
missing something, dropping the lien

	struct device_node *root = of_find_node_by_path("/");

and changing

	rtas = of_find_node_by_name (root, "rtas");

to

	rtas = of_find_node_by_name (NULL, "rtas");

will not change the behaviour of the code.

> > 
> > - Replace of_find_node_by_name() with of_get_child_by_name() in callers
> >    that need to search immediate children only (I expected that to be the
> >    majority of the above call sites)
>
> Since there is no enough information about these DT nodes, it would take 
> time to prove if it is OK to make such convert.

It will take a bit of time, yes. I'm afraid time is needed to improve
things :-) In most cases, as DT bindings are available, it shouldn't be
very difficult.

> > 
> > - If there are other callers that need to find indirect children,
> >    introduce a new of_get_child_by_name_recursive() function.
> > 
> > At that point, the only remaining caller of of_find_node_by_name()
> > (beside its usage in the for_each_node_by_name() macro) will be
> > drivers/clk/ti/clk.c, which uses the function correctly.
> > 
> > I'm tempted to then rename of_find_node_by_name() to
> > __of_find_node_by_name() to indicate it's an internal function not meant
> > to be called except in special cases. It could all be renamed to
> > __of_find_next_node_by_name() to make its behaviour clearer.
> >
> 
> The actual code logic of of_find_node_by_name() is more suitable to be 
> used in a loop.So,rename of_find_node_by_name() to 
> __of_find_next_node_by_name() seems to be a good idea.

-- 
Regards,

Laurent Pinchart

