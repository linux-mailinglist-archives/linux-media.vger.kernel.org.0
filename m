Return-Path: <linux-media+bounces-17141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688349645C4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE70FB2645D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3DC1A3BCF;
	Thu, 29 Aug 2024 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+yqaTmR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360413634C;
	Thu, 29 Aug 2024 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936807; cv=none; b=DNrM06L6yWqxo47HgHXSl/9xV/ip7Mmv5/1myz3I5YPLYlPOCouu+FWQ/PfXt7nIvWjUdKxJm5MMQDTktBUXDTdwji4AzSNib2duKw+v6jFS1d/Zlho0DJpqH/K/pRD+L/9pmZQcVSggGVH+AEN2sGkyRnEN86PHsN+6UV/FsO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936807; c=relaxed/simple;
	bh=xB0LBGqlJ52aBrcdBnczCdjyguxfZpNBrvU61Gt4yCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xc6EptBeeY9G+ryns/I2xD23gpR38HczN+59lNiuFktB1oc2XajiNBKCt9LHcmhEy26rqxmlFtOubzVLqtrND/ePgsDiJO518M9wEWWe1h8q7vdSVFECw0jzBwzxhad7OzmTPc8vNU7L07sm8bJ9VPzzHgppk/+1ujmYtEsgkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+yqaTmR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724936806; x=1756472806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xB0LBGqlJ52aBrcdBnczCdjyguxfZpNBrvU61Gt4yCg=;
  b=d+yqaTmRLBHEl+XvGQFiK1LLk45ykHCrV2CxoHzfsSKhl5JOD1HaPxms
   96PBS6WHjvPtl/7QKNKjBYBxPBrBpJkdkgKqrveccJkV6sSb6+ISNUL3Z
   PbjotF3m7VTi0tJ/U7R0Oki0oedvHX+OxVKJlmLQoi0g+mf+ENQnZzAil
   8IH1xr5HPUC4pipunYCdqixIObaj3A7YQUF6h1XZNOXzUTYq6kYm7JRKy
   PqjCpOflOFAraFhdUXcJRMn0dk4kbQ5Ou0NraXT8iK/+B6tQGtco3IEB7
   zLzzd5V2on4IOqK9+VE88p/y+4BJKM+xngAoYvqC/HubNxnG6xTaLY6l0
   Q==;
X-CSE-ConnectionGUID: Fp2s0bIGRCuKVnGD8zS7qA==
X-CSE-MsgGUID: EaOnhFK7THKS9S1JWxsSYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41028398"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="41028398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 06:06:45 -0700
X-CSE-ConnectionGUID: elcsTg68QYys47l41cX07Q==
X-CSE-MsgGUID: o8L8lHO7QhKysbX9+bWEsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68235663"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 06:06:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D825E11F843;
	Thu, 29 Aug 2024 16:06:40 +0300 (EEST)
Date: Thu, 29 Aug 2024 13:06:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 0/2] media: i2c: imx290: check for availability in
 probe()
Message-ID: <ZtByYFI7kVFfRdtW@kekkonen.localdomain>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>

Hi Benjamin,

On Wed, Aug 28, 2024 at 08:13:06PM +0200, Benjamin Bara wrote:
> Hi!
> 
> This series introduces i2c communication with the imx290 sensor during
> probe s.t. the v4l2 subdev is not initialized when the chip is not
> reachable.
> 
> The datasheets show that INCKSEL* registers have a different default
> value after reset on imx290[1] and imx327[2], however I am not sure if
> this is a sufficient identification option - therefore I just removed
> the current CHIP_ID register for now.

It seems your Sob line and From: do not match. Could you fix that, please?

The patches are otherwise here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel>.

-- 
Kind regards,

Sakari Ailus

