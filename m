Return-Path: <linux-media+bounces-22476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 656669E089F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0026916D463
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532FC197549;
	Mon,  2 Dec 2024 16:14:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF92172BB9;
	Mon,  2 Dec 2024 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156084; cv=none; b=iD4+FvqsJL5xnMkGuGkgKVjq0bJJN3TYZrjzytYyZb+c4KYmRUt248W29BTPK69C/eM3rvRg3zczUSdO2bFdhFAV4CFP0oAyBWdKtD9QR3H731h58Ufc80SOSy+UubzZMOnc91/rI13daQophFyJeqRynXU9rCN4OaNOOQZBfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156084; c=relaxed/simple;
	bh=v1Hx6Kf34Um/vEhgVQ34LyNEJEbqTYzx6TgGdRu2Sis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIlbsRb/LtBxsH3VuVHlJYnUSzEw85t61fYaIAEdpKdt72b6+XwzAmLfzWnAnBIIY6pkueshSLj3fcI+MfWG4eCL8KmmlV/SwAi4J+0F1li31plxb7mSSwh7Yp7E0ClvE24JemlakoFK0wzAtfudgqY/I9t5R5lER+kYEwIXeA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: yJ8hWheeSQmwMfFpYlpuiA==
X-CSE-MsgGUID: ye5OnO2kSmGFSOmMaK4aZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43942115"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43942115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:14:42 -0800
X-CSE-ConnectionGUID: vjG8tfL3ShOB4efcJxu2NA==
X-CSE-MsgGUID: K3lM3hHaQ8ClrOhRcJhPSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93976735"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:14:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tI94E-00000003BnJ-1QEb;
	Mon, 02 Dec 2024 18:14:34 +0200
Date: Mon, 2 Dec 2024 18:14:33 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] media: atomisp: Use the actual value of the enum
 instead of the enum
Message-ID: <Z03c6ZHOP9rUFtP_@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 02, 2024 at 03:47:16PM +0000, Ricardo Ribalda wrote:
> hrt_isp_css_irq_sw_pin_0 has a different enum type than
> irq_sw_channel_id_t.
> 
> Replace it with the actual value of hrt_isp_css_irq_sw_pin_0 to avoid
> arithmetic operations between different enum types (and make the
> compiler happy).
> 
> It is required to build with llvm 9 without these warnings:

9?! Maybe 19?

> drivers/staging/media/atomisp/pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> drivers/staging/media/atomisp/pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
> ro

You can make the above lines shorter by dropping the obvious an duplicated (in
other places) part, i.e.  drivers/staging/media/atomisp/. I usually replace
this with "...".

.../pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
.../pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
.../pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



