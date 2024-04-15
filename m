Return-Path: <linux-media+bounces-9405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7728A55A8
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439CE1F21DAC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294BF74E25;
	Mon, 15 Apr 2024 14:55:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B774BE4
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192914; cv=none; b=jABu9Y/E4chgqEU9BVID/Dwnb6pUBySEMSoB5RdJt5eAkaR7BC7jR5QuEjqwqRe4BCLpJUtGiGwLR4e8kcQFucAp1mOw1kvA2eH/vbvk7v64seQyDqQJCU5Zz5uUuas0mcRjcOP5OM2HRv3NQnFbNvSX0YnT5JiNX2VzD9790TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192914; c=relaxed/simple;
	bh=JISkIqiTw9XLM1iN4NJL9F8/uCtfkTAdwuGO5KhQj+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsHpsyAlnGpJo0pRosdq31kXowj2egTlLAyf3FAFx2ACBkNUPbmc8JiOmY3cnL11oUk4KW/ePifW+c9C8sOZntAQ0Ql7qqbmjpxuCvhl92DkzVTUQ0vziPJyYoEvwhjQ8fzwVZvAe4XBbl74p4zYXoNMf/L/leVV1jDuEsxh2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Pbei5ZixRweEbUtdchKkTg==
X-CSE-MsgGUID: P6WYu888ScqFAISv4hgvEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12381365"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12381365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:55:13 -0700
X-CSE-ConnectionGUID: GF1cXNXXQTq08fbp/9jftw==
X-CSE-MsgGUID: qt563BTIRzmjt3rMm7MNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="21939110"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:55:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNjg-00000004REX-0221;
	Mon, 15 Apr 2024 17:55:08 +0300
Date: Mon, 15 Apr 2024 17:55:07 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 16/23] media: atomisp: Drop intel_v4l2_subdev_type
Message-ID: <Zh0_y5O9j313B8fo@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-17-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415120220.219480-17-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:02:13PM +0200, Hans de Goede wrote:
> intel_v4l2_subdev_type / atomisp_input_subdev.type now always is
> RAW_CAMERA, drop it.

...

> -	for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
> +	for (subdevs = pdata->subdevs; subdevs->subdev; ++subdevs) {

While at it, use postincrement.

-- 
With Best Regards,
Andy Shevchenko



