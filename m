Return-Path: <linux-media+bounces-49417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA1CD9769
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0FA2301C95F
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38A2340D9E;
	Tue, 23 Dec 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWDpIHVr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7D2E1C6B
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497141; cv=none; b=P7OJFex8z0BFJSa5YTqXlngShTMdVzp3T8wf2leRzxRQg5ljH1B9vHUisNzAo2awlHsHyF+oPIc8BpVaFrD+Pjw4FA3tvljiZjLgIfkkYjVe2scqGlmlTVz9tkwSXjyrt57E/SU0phKxQLaDLyZj8t6288ulyI7xI4WWzmbuRUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497141; c=relaxed/simple;
	bh=P9ilwsmpYfSnO51V/7dXlKNw9aucFO/GMQYYHq2serY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPEyHFsnKYM75ysRZwwptfJPDB+YeNFSG2rogeRSysnxBJ4OhGG/qG7LHeor5k1ZUUn0GsHFiX4VthSn2l8qmyboW2W5Fj+DmYp/VxrZnF355zr94rPbWWtN283TAAGaV4xmSZi7PwFe0AT4WCqNNunHck7G0vKOacrOkH6c+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWDpIHVr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766497139; x=1798033139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P9ilwsmpYfSnO51V/7dXlKNw9aucFO/GMQYYHq2serY=;
  b=fWDpIHVr7WwGEylFmQ4jn0LnJ7Ejj5LyFro4eFj5CNRCe+u4QSBrR0+y
   hcvPnCngrPiNKt3kAJAn+UuSklbHMLagc6zlXBFq7npK5whcgpIu91EVb
   kZAPQ/lRhD4Wl7Yg6WSg3zxb4slPRaBrCgFXv/8jSLXiHHfpAlPtYxmEI
   thZwaVVfhwB8ajFu8rA1/hECc8MHETxmKKg+APiCRoMIFqkKLGoLcahVA
   7sI0PLCHiBYKV4F0jpmzVPskRfQQRENT4wpI6LXg9LIchRCsFiCdpIesk
   kWrH5xkkkgoXbZoS8RTf74m5nDcNBrIokkBtRmWJuMpzj8cIU3P76EKs4
   g==;
X-CSE-ConnectionGUID: +ffqq77iTwikFtqVzc6tFw==
X-CSE-MsgGUID: E6rdjXv2RsiwOwGszlreiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68389085"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68389085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:38:58 -0800
X-CSE-ConnectionGUID: T0y9713fTriLuEVdj3Zh2g==
X-CSE-MsgGUID: 7qixYMcfRGeObbDFtWw3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199764705"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.87])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:38:55 -0800
Date: Tue, 23 Dec 2025 14:38:48 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 07/13] media: ipu6: Close firmware streams on streaming
 enable failure
Message-ID: <3xhbxe6luzjcs73qg67mpbkxidphjmpi4unhsnsf4zex5e3gl6@xlkh765yubmj>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch!

On Fri, Dec 19, 2025 at 11:58:23AM +0200, Sakari Ailus wrote:
> When enabling streaming fails, the stream is stopped in firmware but not
> closed. Do this to release resources on firmware side.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index dec8f5ffcfa5..919b77107cef 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  
>  out_media_entity_stop_streaming_firmware:
>  	stop_streaming_firmware(av);
> +	close_streaming_firmware(av);

while at it, the logic of this function is nearly 100% duplicated in the error
handling of the start_stream_firmware() function.

--
Kind Regards
Mehdi Djait

