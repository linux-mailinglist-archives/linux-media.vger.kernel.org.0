Return-Path: <linux-media+bounces-34475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6CAD42FC
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 21:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A9301896D01
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 19:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDCC264A6E;
	Tue, 10 Jun 2025 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/gldUjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06326462B;
	Tue, 10 Jun 2025 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584382; cv=none; b=auGz4jyQGV1NfuyATQKA6mA4S0IWiZV5c23PDRnbZe6D68WKdQP8uSHbbsGrv/PTsZtaSSXrJUcRbNhUUBVNtb9Z1zYBudEPv0kMsF1ytwRaqOJxd6ScZVY6RXoOoQDLMtGoLZlhCXIUXLvkoiMLHvpsYKibu2AU6PjEO/Zitz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584382; c=relaxed/simple;
	bh=1AqxAXQNYSUTabZqEXvUlQimdfjcHSOK+y+vnNlK8HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG+Yq8kAlWcWqvm/Dtj0PZNAnFSNm2Do3UOZG3CtaQFeYp0NNsqhD20/40xlSEn+v1k8rMG+M2d60t+TjyrNKnCT0mDeJYvStJbEbEeon7m0rsfrrDoH99TB9UG2eSK00pGFvIfAobD9CSRywkCRTTrTkBrZFN51/TD6R+EQYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/gldUjI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749584382; x=1781120382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1AqxAXQNYSUTabZqEXvUlQimdfjcHSOK+y+vnNlK8HM=;
  b=T/gldUjIfd7Pr4LgWNtGUmU8cUHSOB7YRRpD3YEr8WSybit90nOCfi9q
   Z+nHsPuTrhrbuijJvaryUFTEldrYpZmdHtWsrqtUwyZ4Fx/bBZ+zF+ZFZ
   CoH2I3LCsUljMdpFnwAbqEtmDIC6zVwbPw2j+/mVP79rWoMceycu7JYvA
   JL/XdNkWom7NZOwueQfGEyCAef6Yg8yF5TIqshDe69TQbhDsj+WCxDugh
   kbD2nOc5jjtKx/8I+dRfy/2tMTqrqUZAI0/rstrm6/eaNT2BcVgQQOCzU
   89bGG/H8XhErgSciL9epaT8FQEfSPAk5gX33euqOEHXsc+Uii/vDLgd8M
   Q==;
X-CSE-ConnectionGUID: ivzkV3UMSre7yRHeZGL3mQ==
X-CSE-MsgGUID: 3OoREttrSUKvrOl0QIkoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51850306"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51850306"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:39:41 -0700
X-CSE-ConnectionGUID: HAII8C7VR2+VGHgP4EdDhQ==
X-CSE-MsgGUID: sCiWvYJeQrudIxcAfcGRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="184117312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2025 12:39:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 635BA192; Tue, 10 Jun 2025 22:39:31 +0300 (EEST)
Date: Tue, 10 Jun 2025 22:39:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"zhangzekun (A)" <zhangzekun11@huawei.com>,
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
Message-ID: <aEiJ856egeMCC6ao@black.fi.intel.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
 <20250425170732.GA21390@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425170732.GA21390@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 25, 2025 at 08:07:32PM +0300, Laurent Pinchart wrote:
> On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> > Whatever happened with this thread from Feb.
> > https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> > 
> > The issue was that people weren't expecting of_find_node_by_name() to
> > drop the reference on the of_node.  The patchset introduced a wrapper
> > which basically worked as expected except no liked the naming.  Krzysztof
> > suggested that maybe the callers should be using of_get_child_by_name()
> > instead.
> 
> My conclusion is that most of the users of of_find_node_by_name() with a
> non-NULL first argument are wrong, and should be replaced by
> of_get_child_by_name(). We need a volunteer to do that work.

Wouldn't be coccinelle a good worker for this job done?

> > I created a Smatch warning for this and here are the four issues it
> > found.  The line numbers are from linux-next.
> > 
> > drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> > drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> > drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> > drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
With Best Regards,
Andy Shevchenko



