Return-Path: <linux-media+bounces-35645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB1AE4466
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC57A4423D5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290E8257422;
	Mon, 23 Jun 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpfz+fRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D83925393A;
	Mon, 23 Jun 2025 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685521; cv=none; b=kuK1/o8ixZh8iV787Sb3HWpm+BWuQXHWyiPMnPS2B4ByNkJPmN1e9YCPbG2ILcAxf3BYCLk7BkYl3qmP2pjMPgEobHLOqCK5PXVugq9qomtQufYBP3efV5ZJrn5TC4c8OjSa8opbXBN1xBjf6GqeLJvwtAyLe8VJN0ajwaQF4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685521; c=relaxed/simple;
	bh=OTnBnRfvA9YFheHvg2VT8lT1Zhu821LsyfQTuGpDSgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAeQuW5BPp4OUI1bf3wqAT24gF1f4zxS/VsPeVnWf1HNHgQb4HqruShDExyWnwhTFj0hVNUrHWEMAPApgvuVA7aL3zbE4TW9JbR5422aH5d+z0MCa8QZ1a6WwuhwjyfhP/eR2Q/IAFaxMzrcd5j7rdzi0CBXTd6EDgQRLs+jiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpfz+fRo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750685520; x=1782221520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTnBnRfvA9YFheHvg2VT8lT1Zhu821LsyfQTuGpDSgs=;
  b=kpfz+fRoLexCZKArQpsrUCUTqfaX2ikbHMJ8niUz8mKJktLH6+DKopYj
   xh+s2ApG0BWXDSi9PPH5h+guM38PV7LnEskFWZzzGZJ3zTRZvLRmhSXAl
   3Webtu2g3fMNgBFtScy/OF5pXQT82i8RfwIv++Lau8faLOzmUEHQo4SAW
   7eUZdtePO68sOxQg8hnNfK555vQQdmBkRf0B1cze5P43yKEjtYWxlGFKp
   8BRNgRCqqFYIREihkwvWxiAbY9/DUKhaV3e6YeEwweH2QR0vjFvwMUbMQ
   gv2A+ZJBPcqfHOeuRDAom50jujwM2ArfvcN8j/2+xs8uKaL8dq55v4STA
   g==;
X-CSE-ConnectionGUID: Zjwvd3/YSn+7c1lzscSC2w==
X-CSE-MsgGUID: xbNGX5wVSF2SBHxi/fNQdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40503819"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="40503819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:31:59 -0700
X-CSE-ConnectionGUID: eo0ZoeyATq2FXX/0aMBD4A==
X-CSE-MsgGUID: POqUqg24QhaxzzLGjd/Sag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175212707"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:31:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B2DC211FC36;
	Mon, 23 Jun 2025 16:31:54 +0300 (EEST)
Date: Mon, 23 Jun 2025 13:31:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform/x86: int3472: Add board data for Dell
 7212
Message-ID: <aFlXSrZH1f4BbB3M@kekkonen.localdomain>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
 <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com>

On Tue, May 20, 2025 at 02:17:45PM +0100, Daniel Scally wrote:
> The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
> Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
> need some board data to describe how to configure the GPIOs and
> regulators to run the sensor.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

I earlier missed this wasn't for the media tree...

Hans: can I pick this (with your ack) or can you? I the latter case, you
can add:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

