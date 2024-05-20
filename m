Return-Path: <linux-media+bounces-11656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F728C9DAD
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CCDD1C22DE8
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3767C134404;
	Mon, 20 May 2024 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvmb8sGu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BF51005;
	Mon, 20 May 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716209427; cv=none; b=AIv/XHOmghYwZHug1FuI5fnUOxKObkmYHUpBqVdpInYoyea2dt3ylUKDrQV6YWOlmlQSLnvEHqYbaN8mA5Pqf42+LtCRajiTVXDJhjJ1Vekf/ba+YXO/0D43GYYqGDcbyQEVAZB3XNVRPpfXwwxyE9BvK61vf1BWsQ7InUw7LU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716209427; c=relaxed/simple;
	bh=09r44g0dLFLCn3HIOUabAtGornPeuQTWckmaYZEOAZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpybGep+e8N0AfLtFeA09Tr1VrAFgJfatXDJeoBbjJkbnMnx5dlgMgh/K6HKkm8rwvLaIc2VPIP4cZYc5u1WVwbW27t3NZA4sBS7TimVxZLDpMhnJHWACjtVtgHMIAXVnW5G6JINBJLvb2UbS66cgtMErERY7+luwC1EBomeChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvmb8sGu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716209426; x=1747745426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=09r44g0dLFLCn3HIOUabAtGornPeuQTWckmaYZEOAZY=;
  b=Qvmb8sGugLtQ4vW76uottZDZZGBDhHONjY8MdyPCj/l2y7wq0rt+85qM
   VZAWJQJURj3K0N/LbHWhJ1FNLT7XAafO4ZQnvLzvlOcfm0wfJN9Yo9jhA
   XEgWZErTtjYmUYWWiC4sJiOVJQqKshd87jiKTdDojlcr5dpqm8tR++/5+
   W57oqepeeKlVlqBlH+AhVw/qOaEzf16YA6rDM6QYlLeFrTc2lePfkL8yW
   DvW2lRAbco/Wo34DtPO7REyLBYIaTR/P0iTrm32toYl60f13Lse05ahZM
   uW9B+I09FWrvF7s25tYg07ht0HryPWqOKuUzG+UgRlxxd2DOrRjWieIBC
   Q==;
X-CSE-ConnectionGUID: 7gudUnPKSMeW7yyEf9MbnA==
X-CSE-MsgGUID: CwTinAMRRiaAiMEHW5eOlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12177337"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12177337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:50:25 -0700
X-CSE-ConnectionGUID: TwOdcVZdQvelBTTXEsLsrg==
X-CSE-MsgGUID: CSDPXRkpR0+VC9MmrQqCZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="37118760"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:50:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C074411F830;
	Mon, 20 May 2024 15:50:18 +0300 (EEST)
Date: Mon, 20 May 2024 12:50:18 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@luigi311.com
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
Message-ID: <ZktHCpsW8SaVdTBk@kekkonen.localdomain>
References: <20240501152442.1072627-1-git@luigi311.com>
 <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkcV5xWZz2jCszxA@kekkonen.localdomain>

On Fri, May 17, 2024 at 08:31:35AM +0000, Sakari Ailus wrote:
> Hi Luis,
> 
> On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Add powerdown-gpio binding as it is required for some boards.
> 
> I thought the conclusion was that this wasn't a property of the sensor? If
> it needs to be controlled, then this should take place somewhere else than
> in the sensor driver.

I'll take patches up to the previous and then 24 and 25 from this version.
The rest will need some rework.

-- 
Sakari Ailus

