Return-Path: <linux-media+bounces-34477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC1AD4399
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 22:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA86189CD80
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 20:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D21264F99;
	Tue, 10 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/D/fk6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9919A2A3;
	Tue, 10 Jun 2025 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586643; cv=none; b=gGCAhKNTCo1aw4ZYQiR+/74TtxiLrA7xXDUnk28rzVK3hAMXw58Efxw0mFikle6tPenFNDw+//4VmstXGgleG7CBf3I+67OPIx0J19AX5Pf1nopgoio5oc/vvhzTFwX+16+csQh3tyJZpVzuWkUMKjVgtwcVTFbxFqEDjQeEt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586643; c=relaxed/simple;
	bh=KkMPpLWarAObIGFdc/4Gj8U/zmuf7yOK4LH5HnaJns8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDbBTu/IDxzQiH1ZcTGCmlpLnvlwiL38iavDMIxx1cqvtL74wecCZ58Ozu7wzex4ciMTx6tOc1eGye4jorjOMSzcNfQiRAPEuN2O7xqw2JjzrGVFD4o+T21b+W7Ha9RPkSs/5Z++77jcVhU8mIZx7w4eQTWqlIr+D0lZWuuCo6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/D/fk6n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749586642; x=1781122642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkMPpLWarAObIGFdc/4Gj8U/zmuf7yOK4LH5HnaJns8=;
  b=U/D/fk6nw+LSXzVxNPDemOLSzMl++rdBvPsfxn91Dp++J9WdjLhj+e3w
   Jvp2zFIchcn/v9iliWliqcT+z243NcmvV8W+5fKz6O8jXkblkLmnUm5lK
   F0bd4bToZsXyb8GeMK1O+UH6uQr59t/PEO0Z8a7Sc2iN5exIyI1Gd3HSM
   QPZnWUQy1MAKddDq9SZDa4Ch5iKDc/6cnw7CcEWSaQMBB/BmJufQyGPt+
   wA4jQsC5no3cLiquV/YoLXQx3ZK2N0uusb94zffY84HWeye5FqPVul19s
   Ht8Efk6AQn7zuSPc9pYGYSAPjq2yk63lq0TeOjLpDnfARBZNvuZCwV+kX
   A==;
X-CSE-ConnectionGUID: gvIU2YZyTv2/q6Ods3v4IQ==
X-CSE-MsgGUID: U1HGsKehRRiewPzxaINxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51811055"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51811055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:17:21 -0700
X-CSE-ConnectionGUID: mULnA7/tT0Sddi3uk+PAJQ==
X-CSE-MsgGUID: +G96++PuQdm5BLTlEDt8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146864596"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:17:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uP5PC-00000005RU8-34rs;
	Tue, 10 Jun 2025 23:17:10 +0300
Date: Tue, 10 Jun 2025 23:17:10 +0300
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
Message-ID: <aEiSxq6lNNJq5DJM@smile.fi.intel.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
 <aAuqgiSxrh24-L-D@stanley.mountain>
 <20250425170732.GA21390@pendragon.ideasonboard.com>
 <aEiJ856egeMCC6ao@black.fi.intel.com>
 <20250610200339.GA1233@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610200339.GA1233@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 11:03:39PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 10, 2025 at 10:39:31PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 25, 2025 at 08:07:32PM +0300, Laurent Pinchart wrote:
> > > On Fri, Apr 25, 2025 at 06:30:10PM +0300, Dan Carpenter wrote:
> > > > Whatever happened with this thread from Feb.
> > > > https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/
> > > > 
> > > > The issue was that people weren't expecting of_find_node_by_name() to
> > > > drop the reference on the of_node.  The patchset introduced a wrapper
> > > > which basically worked as expected except no liked the naming.  Krzysztof
> > > > suggested that maybe the callers should be using of_get_child_by_name()
> > > > instead.
> > > 
> > > My conclusion is that most of the users of of_find_node_by_name() with a
> > > non-NULL first argument are wrong, and should be replaced by
> > > of_get_child_by_name(). We need a volunteer to do that work.
> > 
> > Wouldn't be coccinelle a good worker for this job done?
> 
> It's not mechanical work, every single user need to be audited manually.

Sure, but at least it can do some job that can be done automatically.

> Finding the call sites is the easy part, and we have them already.

> > > > I created a Smatch warning for this and here are the four issues it
> > > > found.  The line numbers are from linux-next.
> > > > 
> > > > drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
> > > > drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
> > > > drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
> > > > drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

-- 
With Best Regards,
Andy Shevchenko



