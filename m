Return-Path: <linux-media+bounces-31074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943BA9CF1E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 19:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49CD4C486C
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BA41E833C;
	Fri, 25 Apr 2025 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kCLYVafc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E201E32D9;
	Fri, 25 Apr 2025 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600863; cv=none; b=mhwhr9Mqejy+KG7L7jwaj9apXqOoryr9mzVkgCLyIOuBNpe2vNjw59+9iAsUYuchdL4Te15AyU2SBR0kCeqgFb/YAMcc/lj9A2RaTWz9dL2aI4cByc2JVeqQ41CLGSzWVVyp7Fx0zo/OSIidIXF2hjD9K7vD2kd9ppjdZCNZfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600863; c=relaxed/simple;
	bh=fHOSkVvCS0e3YcFWO5XU4zHBCn1ZyGlikcXhosdxBlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2TRUFuC/VwgLCXgIOTX1nya7sLxjcj1p1Olh/n0x1ALyfr6LM4UyG9vBxqwrVLlNN3fTE85cqAMfNT/bfTno2vjN3DNhqLAaKEzUex+ZCZOMWL+0vddSC9P7FhVcliXmqa1887r9nzkfHZ4iORjBgdZ/0/Mqmzcy3s8f2igcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kCLYVafc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97499250;
	Fri, 25 Apr 2025 19:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745600854;
	bh=fHOSkVvCS0e3YcFWO5XU4zHBCn1ZyGlikcXhosdxBlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCLYVafcorPJlG/fHXm4USpf3DTn8tEKNyjJotnlxAmdkehyKovEoloLTRfWJi/09
	 aOg3xajkx1N/UwjLceV/Ao3fSd7aRk+VNE8sQk0Umz773BJkgCALLzqZCRBn+qZb8S
	 vBdb+BPkJh0/ODbo6Zp99xfca39KAPD96NEw/V3s=
Date: Fri, 25 Apr 2025 20:07:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
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
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <20250425170732.GA21390@pendragon.ideasonboard.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAuqgiSxrh24-L-D@stanley.mountain>

On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> Whatever happened with this thread from Feb.
> https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> 
> The issue was that people weren't expecting of_find_node_by_name() to
> drop the reference on the of_node.  The patchset introduced a wrapper
> which basically worked as expected except no liked the naming.  Krzysztof
> suggested that maybe the callers should be using of_get_child_by_name()
> instead.

My conclusion is that most of the users of of_find_node_by_name() with a
non-NULL first argument are wrong, and should be replaced by
of_get_child_by_name(). We need a volunteer to do that work.

> I created a Smatch warning for this and here are the four issues it
> found.  The line numbers are from linux-next.
> 
> drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
Regards,

Laurent Pinchart

