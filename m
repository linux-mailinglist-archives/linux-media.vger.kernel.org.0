Return-Path: <linux-media+bounces-23360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D89F072C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE8F616A56D
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA691A8F85;
	Fri, 13 Dec 2024 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFX6HoRv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631E18E377
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080709; cv=none; b=fX5ppNDK83FZTCWUOvFiKP6th2fdIwIRrKf4/rPlt8VNxwH4W+XLP/ltGzK9ZyFCMkTSERH391JRDeyqea9W4ME8/fBf5BshOCsrlgPQaiPHRouYDginrdEOnKUFg3uccKJMg4F4SUXQWChV7roN/vJLiT+B+1fgkpKDX3pM1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080709; c=relaxed/simple;
	bh=jwzfGVhGMIG5qapQ+p39+0d9KW99YHmspoMLxs0qfLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKap+HRsHv7hzJAAawfAmZUecpD24f5m4fSVt5Ecaf7OiR/wcV+efdwwo5GQ2ZeeHMZJpv8VHtw2W0TFHTBvZrFphzlRdJ5nk1jF9Scdkx9jIPsX+nzBJO9VsIbxqt280fdNK/PRkTjqbifm6TTPXBNokjRm4IPVGewAolT1bLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFX6HoRv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734080708; x=1765616708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jwzfGVhGMIG5qapQ+p39+0d9KW99YHmspoMLxs0qfLk=;
  b=gFX6HoRvmJnRZPl4nbya2pw00/RdgG47NYc1qC8D8S2EG/VK9sFceWcb
   RjoDwsFUDuowyzuutXVa2qCpkFHyqnHFnHn9C5WWsj6FgA+exgb9LQmdA
   +QEa38L2aH+3zdbJDdqcVFlYwMDqID4nYBPbOmXn9ULzSHgKV6WeMI5P0
   9R+NSzgmdlof/leyQoIf9I441Ju7jPSLpFENtsSOpR4LY3cjiswWbD3/H
   qr3HypCtkfq1BK8faSN5V1/inMDnV96tt2YTLmYutAupO8LXnIIljAgat
   BGm6IduO+OEimMLDkt4lFimPZ6muuKTT07mskXrpmE4WLN3dCKW+Xh+OY
   w==;
X-CSE-ConnectionGUID: QFJgUWeYQ3WpdywH3cN7lw==
X-CSE-MsgGUID: fLXMSk/iSTCTXLLGDlhfFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38463890"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38463890"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 01:05:07 -0800
X-CSE-ConnectionGUID: oRcQCf3DRlm0g1mQiQ0LAA==
X-CSE-MsgGUID: cLDXjCLyQ2m7KYoLqbkQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100644046"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 01:05:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 21D2512034A;
	Fri, 13 Dec 2024 11:05:03 +0200 (EET)
Date: Fri, 13 Dec 2024 09:05:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ov2740: Add regulator support
Message-ID: <Z1v4vzkPrjjaKqqN@kekkonen.localdomain>
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-5-hdegoede@redhat.com>
 <CAPybu_2zcucNaMkE=mbSbf1R_BVDxz6V7Rmz4Q_hOKiviKu43g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_2zcucNaMkE=mbSbf1R_BVDxz6V7Rmz4Q_hOKiviKu43g@mail.gmail.com>

Hi Ricardo,

On Thu, Nov 28, 2024 at 05:50:33PM +0100, Ricardo Ribalda Delgado wrote:
> On Thu, Nov 28, 2024 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > On some designs the regulators for the AVDD / DOVDD / DVDD power rails
> > are controlled by Linux.
> >
> > Add support to the driver for getting regulators for these 3 rails and
> > for enabling these regulators when necessary.
> >
> > The datasheet specifies a delay of 0ns between enabling the regulators,
> > IOW they can all 3 be enabled at the same time. This allows using the bulk
> > regulator API.
> >
> > The regulator core will provide dummy regulators for the 3 power-rails
> > when necessary.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Do we need to update the device tree with this change? (honest
> question :), I have no idea)

This driver seems to be ACPI-only.

-- 
Kind regards,

Sakari Ailus

