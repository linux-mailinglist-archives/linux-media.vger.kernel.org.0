Return-Path: <linux-media+bounces-44575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B0BDE4FE
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5149D3AEEA5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA99322778;
	Wed, 15 Oct 2025 11:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXP72WUb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B32FFFB0;
	Wed, 15 Oct 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528560; cv=none; b=bpHvYfn0r5BF1WIOCHlU73iy68ArUmFbwGVlaYASQRiwOXLjNTr+CzwVfzilQ+eG28PoMH23sQLvC9PtwsK5ocqt94W9T8tD8kbCurW+vfGm0zEUaXVCHGHlc9KpUc7+xuvUaHGnX7bUKybPgNzWm4FYOG/pd/21MxuRNYjH3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528560; c=relaxed/simple;
	bh=pFu+OWGmKrNiW7IbMpvyiGL3vcu2W3CPoANkyq6Cw98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKTSU4X5+huYe/4iVaVtmGfpB9L7p3cRpN2ve24PHgQ51jlk3LRl9VvZGA9ebqqAi3dxpK/51A1YvJ3Lc5Ayy21terNfjNU8mnW30Hk/VXThX9z/PfO1Fh+iQvrjDDceURfxxizbE4mJhLvHfLgLGRg8EYGoy4UWroeRqnrL7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXP72WUb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528559; x=1792064559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pFu+OWGmKrNiW7IbMpvyiGL3vcu2W3CPoANkyq6Cw98=;
  b=cXP72WUbXrn0JhAzeUdYamEHfLbHOYxUlydlViLqmbM1Ue7rFBaG5zvg
   Z3iKHnq0pEQwQpW6y5zbJkHO/uWjLBYOr1jM6qDoJKtXiHbN+o7d86blv
   SJvaz3HwpeGtOn5iKQ4SVVVp7uFmRvVz8x0nCwH5Ow3AdqgTN5Npzupx5
   XHTTrI3zrHUn6KlVwsriNZMNC33+T8WFbG3euU84sO0ILFC/wxiSqejUN
   EHiMhxr6zkyjjbG4PwkfPJHPf577v0yhxgj9/zSDkELzQbAXXMsoztbWj
   uW5sTMW5XsL4dVNcVTKsRwBR3jfG+TDxk3+Y7ID9eGG//u+7PhpGD7vbL
   g==;
X-CSE-ConnectionGUID: UVh8i3TiT+65nGL7R8UXQQ==
X-CSE-MsgGUID: ewP9+BwfSNO0/keHFjYy+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80137276"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="80137276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:42:39 -0700
X-CSE-ConnectionGUID: T4LwNRi7SEO7sg7l4pkAgQ==
X-CSE-MsgGUID: x0PJqqQaSTaobOzVqfIv7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="186568667"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:42:32 -0700
Date: Wed, 15 Oct 2025 13:42:24 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v12 11/18] media: rockchip: rkcif: add support for rk3568
 vicap dvp capture
Message-ID: <ny6fwo7jk7wnporyrqn4cqgrmf5m7repdg3shfflr2wnv5yn5a@k5sxpmvlwxk5>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-11-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-11-c6dbece6bb98@collabora.com>

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:57PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a Digital Video Port
> (DVP). Add support for it.
> 
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
 

