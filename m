Return-Path: <linux-media+bounces-18065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695D973209
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 12:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82B3BB239B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9B419FA8A;
	Tue, 10 Sep 2024 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XHwC8iIn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61251192D82;
	Tue, 10 Sep 2024 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963134; cv=none; b=BlTBaThKV6vgmX+7F6SmLr3WdjMCUNa+ejr4d+thle9RSaMv+VCKvMWz4O+gpFQT3ifkFLn2VaI8gxgCpcMu0eY4U9T5kH4BZmfyV79PQaT+uzHrKb2GK60eFOoIzbiuCmVKrppVimU55oFyB5qV/y7TOUrPN19t7bZnEGmOCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963134; c=relaxed/simple;
	bh=jHkdQsU3ps+hikIKdb68XuvJ/yFL2ruqKEOCQTmU4+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm7vKUfhXbTVl9SXQXm+YlF0Tu3wrw8bMElg26Ql8b8k9bRL+R4zIBw/D0maY8BzgzitBeN0Ns0QhWzS4U/l1xEKYhw83Zr3gqQWO9fbRUBMlk/LTu09HsjBHXW9XySvA+YnmoPLFAvuuiNqeokmrYqzG3NZkkenE4jbPRflWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XHwC8iIn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE023EA;
	Tue, 10 Sep 2024 12:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725963054;
	bh=jHkdQsU3ps+hikIKdb68XuvJ/yFL2ruqKEOCQTmU4+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHwC8iIn9ZU8OrxR9AMtSFmU2IG/v4n73gF2U4p2VU7sjWnl7UcvS6bI9OUe9BT6i
	 K7ehaZ+YSdJV6gJuEc16gfkiqNEtqEhpcSuw0MtwDK2ve/zVNU9DTABlyLH/Yne7S7
	 fgLrX6v3JjwYc2YUC3f9zfdEN5UuhAQNgqzcz3qM=
Date: Tue, 10 Sep 2024 13:11:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20240910101137.GD6996@pendragon.ideasonboard.com>
References: <20240905111120.GK16183@pendragon.ideasonboard.com>
 <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
 <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
 <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
 <d5188c0a-4a52-4378-89b1-48f606e448cc@ideasonboard.com>
 <ggtlreq5gyhzfdv6yzeuia46y7fxpuyvg236prig52t43xsl2a@crlqks2nhfpe>
 <20240909134516.GA9448@pendragon.ideasonboard.com>
 <Zt8ZysTT5DIZr-J7@kekkonen.localdomain>
 <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>
 <49e375a3-d8e4-4b58-9456-1e6395b02a07@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49e375a3-d8e4-4b58-9456-1e6395b02a07@ideasonboard.com>

On Tue, Sep 10, 2024 at 12:56:38PM +0300, Tomi Valkeinen wrote:
> On 10/09/2024 12:19, Jacopo Mondi wrote:
> 
> > However, I think this current patch is correct (assuming the above
> > reasoning on i2c sensor drivers is correct) and doesn't require
> > CONFIG_PM, so I would be tempted to keep this version.
> 
> I think the existence of this discussion alone proves my point that we 
> should only support PM-case, unless !PM is a requirement =).

For me it proves there's a dire need to document the runtime PM API in a
way that a human could understand :-)

> But if you do want to keep !PM:
> 
> Is there a reason why not mark the device as active with 
> pm_runtime_set_active() after calling pispbe_runtime_resume and before 
> accessing the device? That feels like the most logical way to use the 
> function, and it would be right regardless whether the core will enable 
> the parents before probe() or not.

Does pm_runtime_set_active() resume the parent ?

> And not related to the BE or CFE drivers, but it strikes me odd that to 
> support PM and !PM we need to play with these tricks. I think the core 
> should just do the right thing if the driver does pm_runtime_get_sync() 
> even with !PM (although maybe the time has passed to be able to do that).

The runtime PM concepts are nice, but the API is wrong in my opinion.
Instead of being designed to expose the internals of runtime PM, it
should focus on usability from a driver point of view first.

-- 
Regards,

Laurent Pinchart

