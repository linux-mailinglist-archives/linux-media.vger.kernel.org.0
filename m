Return-Path: <linux-media+bounces-45297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35275BFD791
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92446567039
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9CC23BCE7;
	Wed, 22 Oct 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2ISos2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3235B150;
	Wed, 22 Oct 2025 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152254; cv=none; b=sAqUJMtoBj6ziyQ2fImbRAJaRku+tJC+mDONvqR7JVDVhRqT4HhqW/ZJdAqwazMAakfn+wDUw1kL7olAs9SKay01kwxpUo21eiqARQ2ZJ4aoW15E55om0Uy63oZNqqNOt1+/I/cprfPfIOOA1azUkxQbORQPQxSuc2Qe/Cfwkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152254; c=relaxed/simple;
	bh=+nKmViPGEd5HHAvlkpd7KM0ge3MtmJeo7sJQU8Dwq/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryL+VjYtS1QsuKBry3cBJ1tjTfx49pyKpGCDZiTKbti6tqnpvnERpx6Sb/Y4vaGg4JHxehW+RSXdicc0tgTydVK6yiLtH4Q9FP6A/l5hGMDpJjUT2jc8qvf/HKZ370KMlzS32nhtqhVXAiuHeJhftMzFPOv4k0xyzFrvtHyKHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2ISos2F; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761152253; x=1792688253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+nKmViPGEd5HHAvlkpd7KM0ge3MtmJeo7sJQU8Dwq/A=;
  b=D2ISos2Fbgtt73fo9bOaFM+PW2cqhgQL0hXB43YkCcAuG/eo8ZN5ksRa
   p5gS2ANHMw6bdjByvgLO1ErRr0rkvlspNnvOoRDBkDPgvWueSyL+gI7N2
   o3bqIYibrwnwjZYWb8DKP7UC60bdgDKoSYaHmbF+IDNYV9wt+NoOz40ok
   6wUDo8/4gEUWVAlnaF8v8NGRBuDFtfTc/Ptf4Uq/XtHUSSJoCnm5Q5E8z
   qg9j3rUR8TPFYa7Te7SG8ptSamiguL19syzRRK34NJar2PSCYboQXkR5Q
   4j5etDzvda88RJyB7xqT/WRPqtv6HNFjAsSOTpg4HYDeehFgRWK5h9ZLI
   Q==;
X-CSE-ConnectionGUID: jFCCKOlQSMCWzFoAa+0jkw==
X-CSE-MsgGUID: 9tAdhZ3wSqe2eXBlsGn9Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80746286"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80746286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:57:32 -0700
X-CSE-ConnectionGUID: KRwIK/DMT6WLjNYvUcxYAw==
X-CSE-MsgGUID: gXpch7GKQ5y08FYg4WRk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184700187"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:57:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B128121E5B;
	Wed, 22 Oct 2025 19:57:23 +0300 (EEST)
Date: Wed, 22 Oct 2025 19:57:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v13 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>

Hi Michael,

> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.

I can't recall whether you already did but -- can you provide a
v4l2-compliance -m report on this version, please?

-- 
Kind regards,

Sakari Ailus

