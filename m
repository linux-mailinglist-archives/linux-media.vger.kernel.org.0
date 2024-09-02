Return-Path: <linux-media+bounces-17339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D537B9685BD
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C3B285D1D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EA01D2F79;
	Mon,  2 Sep 2024 11:06:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC0185B5B
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725275172; cv=none; b=ftTmuBbcg35CKK3629WQdvMvd3qvz6WgGhjaH54ljZ8ueZWdtB6i86w3YxO1KQ8bOxyOABp1ysSZsbIxo0STH9TsaiQ32nmk/curcIVecZOVS900Bg9MNU3bE9eUHYUWHpwhxddkGh2wazRi0XGu2M2OP7JqPQUd1lnkBQLPjQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725275172; c=relaxed/simple;
	bh=OqxNejW0+NDbK1dTS0ZIo/Yfvqpav+sVZBMeJ1w/FDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLiP6QrA2/Xao5AvPg0b2k+LxZvLm9vzGLKVATqzmEPD1nMb+WW4nN4NVsZ1QFIL3JiVzwCFqdw41JUW5L0g8pwItyI0EKysMTOLMyD+As8euh5vtc4fcXgS/VPvsBYRTEmoQ0GT5T7FVbzDTXkEqxSkImKZh2ivxFFxBZjQtqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: AGxHd+wIRYK0Oj/ooyYSqg==
X-CSE-MsgGUID: QfMIw3lnRg2C+Rzavh2KHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23983588"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23983588"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:06:12 -0700
X-CSE-ConnectionGUID: sp9GlmQ5Srm2DGLVnQpieA==
X-CSE-MsgGUID: bjFI1V1+QPyH2wKyADT/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64548078"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:06:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl4sn-00000004KqQ-3CXM;
	Mon, 02 Sep 2024 14:06:05 +0300
Date: Mon, 2 Sep 2024 14:06:05 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: atomisp: csi2-bridge: Add DMI quirk for t4ka3
 on Xiaomi Mipad2
Message-ID: <ZtWcHQSfpRMNo6TV@smile.fi.intel.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902095229.59059-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 11:52:27AM +0200, Hans de Goede wrote:
> The t4ka3 sensor on the Xiaomi Mipad2 is used as a back facing sensor,
> it uses 4 CSI lanes, but the _DSM has CsiLanes set to 2. Extend
> the existing Xiaomi Mipad2 DMI quirk to override the wrong _DSM setting.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



