Return-Path: <linux-media+bounces-20913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 766809BCB78
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE7F1F23B48
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5218D1D417C;
	Tue,  5 Nov 2024 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hps6wRi0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54016D30B;
	Tue,  5 Nov 2024 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805527; cv=none; b=JUp3G6x43NiQVEVvIYRMYu4K0oGAssnb8UXfZpLa1JzFsMSPrmAH2OkTTHxIhv4YvXqdsTLJnZ550go6y3bEHA1RzrHxoJJfSu+iLN+48FEMaAgNFCIKucP/9Gu0TN6KDqY8mk+0hdGANHpeqU+v758vx9WWowxIwY43s0C/O5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805527; c=relaxed/simple;
	bh=j0gSxqxoY4ag37/FRmNTVk3+yghvUrtFBRDaHwSzUYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB8sGzYKeghizysRhnU1JAF5F6x4ZW2hm2legUBUOFNJ90lvPLCsDGMddXR1ipKdzO/r8HeijCzrkVCE551KOxSFpipzY1dxh7bFkue+wVW6wze+E/sBl9Y0EMPmotZLqrf2MyaZzV/aqs7DdNLPf/9QeduXTRSCBVOpewMi9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hps6wRi0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730805525; x=1762341525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j0gSxqxoY4ag37/FRmNTVk3+yghvUrtFBRDaHwSzUYo=;
  b=hps6wRi0xosGR8HCwj2Ec3Zp782lgzIoQsP0Ae8il/T/cnfY1/YzCpgA
   /EYuRtJmxon6XRt/4++waX51DD0sdVoHXHkJgsqnQ7132UvaRqmKNHqBW
   cu4mpZRdB34AR/kydoR3E+JxmmMhZYXLti+9AVwM+5EqlAnpLtOt8t5tx
   yc1+Rir/Uj0VQYgT+PKuimzw6awfeIp9sBPPhXXDGuO+zAT5BVufOBxnQ
   0hZLJOAx+C9oWPOIZcrrWPOdPukTHyMNAoT1NHvN/OiFN4Bt+x+jeqX6R
   LvUTJwjw2LL2kaM9XPT55uW0UrKcnjUEU3e+au7Qy5x/0L66zis/H04SX
   Q==;
X-CSE-ConnectionGUID: yTFo401jRoysGoJwTKguWQ==
X-CSE-MsgGUID: rhUEpINNR++85ItmKfylFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30709852"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30709852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:18:44 -0800
X-CSE-ConnectionGUID: /TDQ85/pQeCk1uNK4JPjaQ==
X-CSE-MsgGUID: Gsw0IGQMQKOkvrEqJSxN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84372743"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:18:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2BE1311F9C3;
	Tue,  5 Nov 2024 13:18:32 +0200 (EET)
Date: Tue, 5 Nov 2024 11:18:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
Message-ID: <Zyn_CHKpENoIoDVs@kekkonen.localdomain>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Fri, Oct 18, 2024 at 04:32:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to add the below features,
> - Support subdev active state
> - Support for streams
> - Support for virtual channel
> - Code cleanup

Thanks for these!

I've taken patches 2--8, 1st is redundant with recent framework improvement
and the last two need the metadata patches (and agreeing on the sensor
interface). I've marked the two last as "changes requested", please repost
once we have the new API agreed on.

-- 
Kind regards,

Sakari Ailus

