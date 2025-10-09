Return-Path: <linux-media+bounces-44048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5BBC7845
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 08:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD3A24F2E86
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 06:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5199D293C44;
	Thu,  9 Oct 2025 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmBqaInC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB8291C3F
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990492; cv=none; b=B3AuyffZvhpWYKeifGC4MYRBT9TZqjwAaxH6uiFeAO/W7LrxWRGV/ceiO1IwYdfqiaW1tt3agyB4o0+xfwu6ywVLidYLu8tcMnoqKEfETcekyz/4D0TqcWAjycAjTpxxXNrsb0mJhDol21ZBaezViJsz6T7yzTL2NFgHime0CEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990492; c=relaxed/simple;
	bh=OCSs77QdhGViQON7PhGJ/7AMXNfFBODXybDNQ020l88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfFjFFoXqCUBYXiu0z0qZ8xsZOjhMw9MxIYkKkjo9pK9Yl7CsXoXETiXBOQ8lbuuU17kQQnESaBNGIfZh+kKZr9b4DdEhGxGM1zIZ49ri7fCJn/uPK7uGyqsjhTd3sSnyl21tRIvkpejgKxsUONCjkRvMvq0pNibBh33cl+LR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmBqaInC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759990491; x=1791526491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCSs77QdhGViQON7PhGJ/7AMXNfFBODXybDNQ020l88=;
  b=jmBqaInCSscZvlj9yCC8U/LCe4yU1xrXHXNFIyTBJTpGJrgiKDKyB3Vn
   3bWeJlP2DqyFAN0bdNYQfBj2XtSeiiBwKyKPFBygxAXt967JiQYJvFmnB
   jpY6PpriHbfYjyxfDZ/Y4yv/GDsI/QoxKV0XGCC1bgN5IQIb9Wqb3hetU
   uP99QN7kJSoN3jwObiK5eSKziazVtcp3WuipVkvjsJn18Ehd42QKqWfJ3
   6/A5Zd105RnIaJXAyQG8vpVSvQWhC6OygEvcXCl5VYP45lbpJNIfakcFX
   ZnuVHzZSWuULCgRYIcPCR4/RQSxc27wEcQXmcOF2ESm2s4a7tSFtmgbbY
   g==;
X-CSE-ConnectionGUID: qepdLUtxRVaDRQJdLLDJ2Q==
X-CSE-MsgGUID: R97OEfGvQeOFMDkroeNJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73620900"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="73620900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 23:14:51 -0700
X-CSE-ConnectionGUID: 3GlstiwcTOeYAoYsZekvkw==
X-CSE-MsgGUID: IvjgqFL7SIe88wUBNJBJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="180570951"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.217])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 23:14:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7BCCA11F8B0;
	Thu, 09 Oct 2025 09:14:45 +0300 (EEST)
Date: Thu, 9 Oct 2025 09:14:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: IPU6 "Transfer FIFO overflow" errors when CPU is idle
Message-ID: <aOdS1V0E-fzqZPIp@kekkonen.localdomain>
References: <8afc906b-eb00-49aa-9f04-6debe67b148e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afc906b-eb00-49aa-9f04-6debe67b148e@kernel.org>

Hi Hans,

On Wed, Oct 08, 2025 at 02:50:42PM +0200, Hans de Goede wrote:
> Hi,
> 
> While testing raw image capture for sensor calibratino on a Dell
> XPS 9320 (Raptor Lake, ov01a10, LJCA, IVSC) 
> 
> I noticed pretty bad flickering of the images coming from the camera
> with the bottom part of the image flickering from the actual image to
> fully white. This gets combined with errors like these in dmesg
> pointing at an isys/CSI2 receiver problem:
> 
> [  144.764888] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Transfer FIFO overflow
> [  144.764902] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
> [  144.809886] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame short packet
> [  144.809910] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
> [  144.834517] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Transfer FIFO overflow
> [  144.834541] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
> [  144.876643] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame short packet
> [  144.876665] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
> ...
> 
> To reproduce this apply the following diff to libcamera:
> 
> diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
> index c816cffc..ef336721 100644
> --- a/src/libcamera/pipeline/simple/simple.cpp
> +++ b/src/libcamera/pipeline/simple/simple.cpp
> @@ -253,7 +253,7 @@ namespace {
>  static const SimplePipelineInfo supportedDevices[] = {
>  	{ "dcmipp", {}, false },
>  	{ "imx7-csi", { { "pxp", 1 } }, false },
> -	{ "intel-ipu6", {}, true },
> +	{ "intel-ipu6", {}, false },
>  	{ "intel-ipu7", {}, true },
>  	{ "j721e-csi2rx", {}, true },
>  	{ "mtk-seninf", { { "mtk-mdp", 3 } }, false },
> 
> Build it and then run:
> 
> ./redhat-linux-build/src/apps/qcam/qcam -r gles
> 
> This will disable the softwareISP and instead has qcam using
> a shader to debayer/demosaic the image.
> 
> The same flickering does not happen when using the softwareISP.
> 
> After trying some other things I had a hunch I and thought
> maybe the problem is that doing things this way leaves
> the CPU mostly idle.
> 
> So I ran:
> 
> md5sum /dev/zero&
> 
> from the terminal to put 1 CPU core at 100% load and then
> rerun qcam in raw + shader debayer mode:
> 
> ./redhat-linux-build/src/apps/qcam/qcam -r gles
> 
> And the problem is gone. So I believe that the problem is
> that when the CPU is not significantly loaded some other
> resource, maybe the ring-bus, maybe the DDR4 RAM speed
> is clocked down causing problems for the CSI2 receiver...

The driver is supposed to account for this somehow, using
cpu_latency_qos_*(). ISYS_PM_QOS_VALUE is set to 300 today. Probably a
smaller value (but how much?) could help; also tuning the watermark setting
could address this (with likely a lesser effect on power consumption).

As a matter of fact, I've also seen this on Thinkpads occasionally but I
thought it was a sensor issue.

-- 
Kind regards,

Sakari Ailus

