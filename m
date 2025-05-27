Return-Path: <linux-media+bounces-33435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21577AC4883
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7EF9179648
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 06:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FD21F8722;
	Tue, 27 May 2025 06:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9CU7B2n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7C1F4E48;
	Tue, 27 May 2025 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327845; cv=none; b=nEuhU8sf7YsifOYoUQ4QAClXD+fx4D0i7mpzhhfFhvD1KvzycnnnDxDKzPjY8xqr5qxiAcMl87X7FRb1GTC0piemPqbhmICbZ7DwzW6sKNrvhzJkBBJvbm3ysrRmD+WUo5QWDGJ6AC5q+9vWOkIpF/qBxWAZLFdQ7JeA1Gjt8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327845; c=relaxed/simple;
	bh=zbO03nqPX+0Zq5BIX2ZmgYrviPnHxi0V6Sa09FjzZWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSBhGvE5RjAvr77OdRt6o0XdSKDfinhBmi3CkY6gTcwyg9v3+6Vtzl3dCgMC+vyB/bR/kOdp/nhKOYKwLB0D3Pok5/uPB8V2FCQGoKvRE0DQBCwS+/+w6GCYoW4Ac60zstSSciZDvNWCJoT+ldwURWqgvL2CtBqGzK1wGIFH3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9CU7B2n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327844; x=1779863844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbO03nqPX+0Zq5BIX2ZmgYrviPnHxi0V6Sa09FjzZWM=;
  b=O9CU7B2nD78O7q3Nl1L4FKg/RV/5AUzKNeF/TqHXnZz4BUTcXp16yWHE
   HlLgmM4mTNSwD5jiZgXfJvLi0DmvaZ1XfM7ZzRZtK44l+MGYxuhZsz/SN
   Sf3Euztf/4e6KLIthrKV97vbIvhJy4n0fu8wiz8WQHH7hOUH9AkmWWFX7
   cdc3rW9AWqPlj8vchyTZwEcF4egD9Dxg0vqdgY/i47DUiOk+1gUBD/XOJ
   b+5tkoHZDNVwnYTlBLmGCAAtjCb82dSEqs/KQ1riw712r4cgJQ7TlkI5X
   V/Qdc1Ew8fC2QqzGLIhDCrJfsoXHhJgMYKoyp2/xUfggyGrpKkO2yHy46
   g==;
X-CSE-ConnectionGUID: vkhn9H2pTlS9Y+iKPC4GWA==
X-CSE-MsgGUID: Yu80CEUNSr+Zus2V9l9dKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61657509"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="61657509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:37:23 -0700
X-CSE-ConnectionGUID: EsycDVlcSO+rjF2tzeG6qg==
X-CSE-MsgGUID: +bvoh1g2TiC1Ol8d1apD6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143628457"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:37:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DFB411F738;
	Tue, 27 May 2025 09:37:16 +0300 (EEST)
Date: Tue, 27 May 2025 06:37:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 0/7] MT9M114 driver bugfix and improvements
Message-ID: <aDVdnInPCWiSJ_NE@kekkonen.localdomain>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250526121520.GH17743@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526121520.GH17743@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, May 26, 2025 at 02:15:20PM +0200, Laurent Pinchart wrote:
> Hi Mathis, Sakari,
> 
> On Thu, May 22, 2025 at 04:35:04PM +0200, Mathis Foerst wrote:
> > Hi,
> > 
> > this patch series contains the following bugfix and improvements
> > for the MT9M114 camera driver:
> 
> Review comments need to be addressed for patches 4/7 and 5/7, but the
> rest of the series seems ready. Sakari, could you merge the other
> patches, to reduce the size of the next version ?

I've picked patches 1--3 and 6.

-- 
Sakari Ailus

