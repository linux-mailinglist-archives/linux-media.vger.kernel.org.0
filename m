Return-Path: <linux-media+bounces-17217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF25965A49
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7040C28D4B4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF5516C84C;
	Fri, 30 Aug 2024 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFyz2gkn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47DD49625;
	Fri, 30 Aug 2024 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006491; cv=none; b=o65BVKgA7L3sa6qmxGVMfmHZmXDKowWBlnrk2+Zl9+AtA6pmOjltffhFLt3tc+N7WqqtykBrpGopsc8jNQa6utTKGBtxmLquEQx2rXRL64lJeiAR5gWVVCgkZWZ+6QGqE4AIW8Q9+vSq7AEqp0V+79jnLcHszUIVuvhmA7jA+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006491; c=relaxed/simple;
	bh=1CayOtffUqgYgyBF6mx88/fzOGczsfgglMDZaVTevPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft56rjPgy/ZNfAnZ6GLlb4sMnTKdHphH6PKCe4XFKs6aaMoT1ZMgbivtIM6OVqOcQgecLpXU+c2Ir1emRO4hAQTqtXK2srwWTK6aT3jRFkUDinFYROTr4zYjdz2uBDCQkqreCpAybxatTSNwADFqYKLfDJD/83APwIKLT4W91KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFyz2gkn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725006490; x=1756542490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1CayOtffUqgYgyBF6mx88/fzOGczsfgglMDZaVTevPM=;
  b=GFyz2gkngDScidu5e9yu0Up8xYfln6iWTBgkyfdIIFutITCBOxWxZ4Gt
   KQK4r5T8s1rGzKAuBQ1dTZcXOfJESu+41W60ip6uu+G0eI8NTg1LLBlP2
   4Z5C2DaK0jRiqdohfd6iVvUgN8ax1Diyp44wHU//DIjrdo7hd6FYo74/N
   mgCKxUmQGvSK3cXd1PbSJh0WXa2eZbqdSHcTr7VJFj9Hy5gWaKqTbvtDJ
   pnsyTSNVk3A8Xp1O9h2jtdJ+Ml6FeSEEoL1BB2p7HIsp01tBXKuTCpe7q
   Hudn3LwqWoINndbQ4IKtr7GfdSrbbNs1xnvllkr9vEVUMkebyzCHMlfmM
   A==;
X-CSE-ConnectionGUID: 5+xr+/+zQ1OpBt0Xy6gYMA==
X-CSE-MsgGUID: kM/S5TQFSgWcWX6sQHZymQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26534879"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26534879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:28:09 -0700
X-CSE-ConnectionGUID: Ar3Gh/53QMWdDJtMHvk19A==
X-CSE-MsgGUID: j5jrXK30QUK1L1DDaznfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94662490"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:28:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97A6611F843;
	Fri, 30 Aug 2024 11:28:01 +0300 (EEST)
Date: Fri, 30 Aug 2024 08:28:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Martina Krasteva <martinax.krasteva@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] media: imx335: Fix reset-gpio handling
Message-ID: <ZtGCkQtGYndCK1Aw@kekkonen.localdomain>
References: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>

On Fri, Aug 30, 2024 at 11:41:50AM +0530, Umang Jain wrote:
> These couple of patches intends to fix the reset-gpio handling
> for imx335 driver.
> 
> Patch 1/2 mentions reset-gpio polarity in DT binding example.
> 
> Patch 2/2 fixes the logical value of reset-gpio during
> power-on/power-off sequence.
> 
> --
> Changes in v4:
> - rework 2/2 commit message
> - Explain conclusions for 2/2 patch, in the '---' section.

Thanks, Umang!

I've applied these in my tree.

-- 
Sakari Ailus

