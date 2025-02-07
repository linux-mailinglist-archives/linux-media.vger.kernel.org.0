Return-Path: <linux-media+bounces-25780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD9A2BDC7
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A84D3A791D
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926CD1A9B2A;
	Fri,  7 Feb 2025 08:24:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3E2417F5
	for <linux-media@vger.kernel.org>; Fri,  7 Feb 2025 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916684; cv=none; b=HzH8B0/EiMQ53ITKcibiS0kxbMO61wj3DTlnYo57PyDOlecdpMW8AoFieMzw1M/Th5NmVSbxI4/bT/wfBwzsnjXz2t7qVksvcJ33d0G2CO1d98NknB/1aWfZOqc8vNdkkiCPpB2BdWYIIOtRYrdbtUvcC1cPk8OI8VEiRTNVSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916684; c=relaxed/simple;
	bh=kI4Fyn7CvsZ6t9HvUQsul7UYVpT9ozBs0hE2VBctCOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox4Vfg4jtfbPaIQiPnBii/gVfPeyDo467H1IkBpv1mo//nyE8XerYAYj2V09ZwO67leekQ36BbIv8yTjckbNG80+hfaYhHSYPWxFls54UJ0j0PzmI0QUt9eIoJZBJt7Xlc9GSREFwm2ERDtCOWO2NbPqE+BcwqeMrkEY4DUKwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJep-0000UF-AY; Fri, 07 Feb 2025 09:24:15 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJek-003whN-2j;
	Fri, 07 Feb 2025 09:24:10 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJek-001cd8-2G;
	Fri, 07 Feb 2025 09:24:10 +0100
Date: Fri, 7 Feb 2025 09:24:10 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: robh@kernel.org, saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com,
	davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com,
	pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, chenjun102@huawei.com
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <Z6XDKi_V0BZSdCeL@pengutronix.de>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207013117.104205-2-zhangzekun11@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> There are many drivers use of_find_node_by_name() with a not-NULL
> device_node pointer, and a number of callers would require a call to
> of_node_get() before using it. There are also some drivers who forget
> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> wraper function for of_find_node_by_name(), drivers may use this function
> to call of_find_node_by_name() with the refcount already balanced.
> 
> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/

Hi Zhang Zekun,

thank you for working on this issue!

First of all, let's take a step back and analyze the initial problem.
Everything following is only my opinion...

The main issue I see is that the current API - of_find_node_by_name -
modifies the refcount of its input by calling of_node_put(from) as part
of its search. Typically, a "find" function is expected to treat its
input as read-only. That is, when you pass an object into such a
function, you expect its reference count to remain unchanged unless
ownership is explicitly transferred. In this case, lowering the refcount
on the input node is counterintuitive and already lead to unexpected
behavior and subtle bugs.

To address this, the workaround introduces a wrapper function,
of_find_node_by_name_balanced, which first increments the input’s
refcount (via of_node_get()) before calling the original function. While
this "balances" the refcount change, the naming remains problematic from
my perspective. The "_balanced" suffix isn’t part of our common naming
conventions (traditions? :)). Most drivers expect that a function
starting with "find" will not alter the reference count of its input.
The term "balanced" doesn’t clearly convey that the input's refcount is
being explicitly managed - it instead obscures the underlying behavior,
leaving many developers confused about what guarantees the API provides.

In my view, a more natural solution would be to redesign the API so that
it doesn’t modify the input object’s refcount at all. Instead, it should
solely increase the refcount of the returned node (if found) for safe
asynchronous usage. This approach would align with established
conventions where "find" implies no side effects on inputs or output,
and a "get" indicates that the output comes with an extra reference. For
example, a function named of_get_node_by_name would clearly signal that
only the returned node is subject to a refcount increase while leaving
the input intact.

Thus, while the current workaround "balances" the reference count, it
doesn't address the underlying design flaw. The naming still suggests a
"find" function that should leave the input untouched, which isn’t the
case here. A redesign of the API - with both the behavior and naming
aligned to common expectations - would be a clearer and more robust
solution.

Nevertheless, it is only my POV, and the final decision rests with the
OpenFirmware framework maintainers.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

