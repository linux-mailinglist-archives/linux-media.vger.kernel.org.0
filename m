Return-Path: <linux-media+bounces-41510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EDB3F5E5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95D807A2026
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 06:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73F42E54DE;
	Tue,  2 Sep 2025 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ/A/rQO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F32DF142;
	Tue,  2 Sep 2025 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795731; cv=none; b=DbodCAGzbc3b7r8CBZnVA1y34gwscDYxsPWLaE61KWucTe22qCB8xIr6KrPDniM58geAVZvb90dVjFenc+PDDmeJnhQDUxQ4qMRJIPfYYda0Vm9Tf58reNocmaGwsPonZpkdjL2egjDrsFYYjxH+eAYMR5FUjty0TCDiLSYFw/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795731; c=relaxed/simple;
	bh=gdaIKOfI6xS1DIiwWFLMusguzggTW/wGXGBNNbKEfJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8ZsdE4pqxipVl1UC/XUbuBE/2iZ45etkSQbtIkhqJx/nJI5fAromz8FAeOhOma9rJwXrCslNm+y92+pu7+NQxHBg3pqOb1TaZ69xw0i9nWKtoKtilKjf4yAoReBwCNNA4VsHV2gil6BPPRhqc8ZlN7KF5lZfz8VbeYL8SypejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ/A/rQO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756795729; x=1788331729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdaIKOfI6xS1DIiwWFLMusguzggTW/wGXGBNNbKEfJo=;
  b=NZ/A/rQOQB+lAl+m3nB87lEHr4FaHRGQbmE2/ifWV0gCu9hMP9BTF0Li
   K8kg1L016LWgKJgJ/dU+w2/U82PRdbdD9i//gIqLr0T3NqyZ0g6tfcLqK
   EM1EzyzKaJp2+EX/G+bAQm26Jdy659MTATynA5Prb1N2wcFIVquxuSXw2
   wCwYRJYezTtce4ZUrlmqSqdDOVeh4WMg0rIe1guq/PlcsSp1L5h7R7BFr
   PTVxl7oUCYT7qZ/VSGvJQrU0t13eqzT6Hng93Yn9OOsFNsNGrBHg/Ugvv
   rCdrvj3HpFh/plS7PXPfE5nDY0yrS68LdiXAluEjfOJJDvJFugALfmXxu
   g==;
X-CSE-ConnectionGUID: w7CODmSrSgqSs5lo3i3ydg==
X-CSE-MsgGUID: 6uF39HC6RPmfDtCdIDIH/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69759778"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="69759778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:48:48 -0700
X-CSE-ConnectionGUID: tbJziMy0S96S8x80tXL3GQ==
X-CSE-MsgGUID: tBvgJYVQRBWTtKJVxT8+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170749430"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:48:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E6AD7121F49;
	Tue, 02 Sep 2025 09:48:39 +0300 (EEST)
Date: Tue, 2 Sep 2025 09:48:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <aLaTRwNp_SmHc4K3@kekkonen.localdomain>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>

Hi Bin,

On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>

Could you elaborate what are the changes in this version compared to the
previous one, please?

-- 
Regards,

Sakari Ailus

