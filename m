Return-Path: <linux-media+bounces-11658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B98C9E06
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 15:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80844B23079
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 13:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73141136647;
	Mon, 20 May 2024 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5DwRzne"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2EC1CD18;
	Mon, 20 May 2024 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211189; cv=none; b=QuPbXys9GI0GJWJ+NmQVl0P4h0PI6H8wvi6bdmBOG6H+o9O3p/pGz2+vE5bYCDzsyxOdD29HmqNi02UAvpKSQJNTOxtd6XgeAwknI60C8WYQLBJkGyKqzzEJdS0UQJzv13KaUfvXTlxGczX8ZJymmIMu/XYkgj4a7WO0N9UnZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211189; c=relaxed/simple;
	bh=NuEonSsy9BHcGw03XtsY8/+H2cm/AtrmCekQjk+olEY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNKU34ZUy1BVnwW3TnzMyA4p8qz5AKiYgllUXW4hKCChgXvCcQWbYWvuCBEU/Gvne7/7WatL5A85icjqljNPBVvg1mrXmwl/S/icCYKTAepvLKwgX16PlG1CjC6f7/+sHZoyHqiPs42NkXgrkLIA81mzmn1nJ68Fgzad73iZvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5DwRzne; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716211188; x=1747747188;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=NuEonSsy9BHcGw03XtsY8/+H2cm/AtrmCekQjk+olEY=;
  b=D5DwRzne7fetmP2UI6rmdbUsG+9+K1jB5fmJz9DcWqT/lP8biKzVN/QN
   p8SfYO79z4NcIDK+17eKNmvHJGbt5MuhxbajRMCLUvjBtJgtSL1vAxUyO
   545dlcZnRVC/EA/NX7+Lf3lU9Q/eLCl/FsdLNPPi8pJgkwPd/9zB06m+Q
   aPBQGHoBsE58/DhKRBtwII0/h3uYD0XoyziKMR8Zfd184Gn2YVNRSNNAX
   rLpOLwo6udwhDNgiqdR2cAGVfTRXxRehPXhRK0M2/p1lmK/D4Y0ihTebT
   sTRuFSXBQ1iwjLDaaJFQir9upTSTpfzAf+bfBqxK2UTh8F5ahEg72VWZo
   Q==;
X-CSE-ConnectionGUID: KJtdniVvTfONm0krfltTZA==
X-CSE-MsgGUID: kJiaBLkhTuGIdhy/OwDfGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15285546"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="15285546"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 06:19:47 -0700
X-CSE-ConnectionGUID: 6tFvXyVtRRKL8lxX7jfCRQ==
X-CSE-MsgGUID: H2tDu6cjS8i01DNr1Lex/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32519214"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 06:19:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6A0811F855;
	Mon, 20 May 2024 16:19:40 +0300 (EEST)
Date: Mon, 20 May 2024 13:19:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, git@luigi311.com,
	linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
Message-ID: <ZktN7EcXiqupI9Qd@kekkonen.localdomain>
References: <20240501152442.1072627-1-git@luigi311.com>
 <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain>
 <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>

Hi Ondřej,

On Mon, May 20, 2024 at 02:55:26PM +0200, Ondřej Jirman wrote:
> On Fri, May 17, 2024 at 08:31:35AM GMT, Sakari Ailus wrote:
> > Hi Luis,
> > 
> > On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> > > From: Ondrej Jirman <megi@xff.cz>
> > > 
> > > Add powerdown-gpio binding as it is required for some boards.
> > 
> > I thought the conclusion was that this wasn't a property of the sensor? If
> > it needs to be controlled, then this should take place somewhere else than
> > in the sensor driver.
> 
> It's a property of the sensor modules. It's just optional on
> some, eg. (pin 8):
> 
>   https://assets-global.website-files.com/63b65bd4974577341e1fe194/654290d4d0fb173e87f754ed_IMX_258_FF_drawing.png
> 
> Where else should it be so that the module is described properly in the 
> DT and the powerdown signal can be used as part of powerup/down sequence
> of the sensor?

That's an interesting case. The document does suggest the PWDN pin isn't
connected though.

Is this pin used for something? If so, what is it? The sensor doesn't have
it and generally the module in this respect just contains wiring.

Someone earlier suggested this could have been related to the VCM.

-- 
Regards,

Sakari Ailus

