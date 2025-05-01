Return-Path: <linux-media+bounces-31543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB28AA65E1
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 23:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA4A189621B
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3802620F1;
	Thu,  1 May 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VT4Z2RLL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149501A38E1;
	Thu,  1 May 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746136647; cv=none; b=V2Fu9q/MFdfDrITCGHgiZbyEzvobvlEHg1cRc1k3AOkYlPDO6zYNnSxcuHJzPcj5ySV7kwGKavqBj2rC6f/mBtkxnQ5roo6MoHkNWL9482lB+Hbo4dskcZBrEKBjX1/DLvhQbB6mnOcAn4okv5le6wp5YsE3nKN3Blz7xT/ldF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746136647; c=relaxed/simple;
	bh=zWcnDLE5VTMy5WKRBj0IgzuPoGG7eGMUv76ZlXgPRDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHHLuyIssttHS6U0QTTWhTT16umnAPHo0LYQBBtT6FoLPyfG1GrAY+9hUGcqKyvp+lm6kuVMg390di5ptEAJuIYBYooEx77i1gLmnBAg8LZOyf+kStutY/Vl/b4UfeSVZC6T2KMuJL+oHyrw8MsWezkdF5wQrH8Y5bdVmajlYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VT4Z2RLL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746136646; x=1777672646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zWcnDLE5VTMy5WKRBj0IgzuPoGG7eGMUv76ZlXgPRDg=;
  b=VT4Z2RLLK2YhqWVO3Gqb5JkJBeOp9ncK+QA5yf9qAzPaBBZuwnO29NSw
   kewp2vYLi4vNpglEjuGFAMF71jigKBNv+zbN4frICW0B9vnwvYAvU8LfP
   eJTVteTDBlqOo2v6OwbP7+BlKdPItzG7AEBy5Vb+/RQLS4fOeix/tPaSO
   HWC8AyeC2qTexBSPyYwyMkLNM9+ORpRhMGjIyTGYOMjLcYoCfNjYhpxk8
   uZOOQodj/WScmuRwHuzDGvH61Z33UuOQWXLRw5OU0PS/KFT3k7eIsHPTV
   k2hK2qCmGEwc3YP1Uc0H1XGbH8CPG7kNGkr0UASW1DXoerwfHD5viVFwH
   w==;
X-CSE-ConnectionGUID: 15y3JYBqQAqvikXV3IK/5Q==
X-CSE-MsgGUID: jzzUTjqeQfiS804S3Agt4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47536266"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47536266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:57:25 -0700
X-CSE-ConnectionGUID: gQXAToqySNCoS87O/jrCWA==
X-CSE-MsgGUID: uoquiMHcSzC+zHBill9Nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="135015910"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:57:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 49E991201E4;
	Fri,  2 May 2025 00:57:16 +0300 (EEST)
Date: Thu, 1 May 2025 21:57:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 07/13] media: rockchip: rkcif: add driver for mipi
 csi-2 receiver
Message-ID: <aBPuPGM-YBZo5AbI@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-7-d2f5fbee1551@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-7-d2f5fbee1551@collabora.com>

Hi Michael,

On Wed, Apr 30, 2025 at 11:15:56AM +0200, Michael Riesch via B4 Relay wrote:
> +	link_freq = v4l2_get_link_freq(csi_dev->source_sd->ctrl_handler, 0, 0);

Use the source pad for this, the control handler is there just for
compatibility and will be removed soon.

-- 
Sakari Ailus

