Return-Path: <linux-media+bounces-25793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B673DA2C063
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35733AA87E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 10:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681171CEAC2;
	Fri,  7 Feb 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAqICNa4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46723194094;
	Fri,  7 Feb 2025 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923515; cv=none; b=VS/az7s76x5pgPpTsIbNrdl6lgiZF7aGQa3DLyh7c1GNw9GBa273zW8btZH2Yk00cVvtqe8ztJmHvxsaqF6laTZH9AB2deFR1MIjoef12KKqloSwrh/uorDqxeW/3YYxzLx/ghoCUyJSPyBho73s/4P+xiLiU3zlwE0rsBH3fyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923515; c=relaxed/simple;
	bh=P3qLJwpRwqti53PlkJQBfQmkD1LGbQ2Ft7S7UCGX/Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZT2H2ovJwPbCf0S1ExuJEeL+OGK992abZP3x7TsSUSdLbh67io21cAOH1IkNfuJSpMl/5ZuxkgjpaUy0lFVAwfZpOe72X+peEaWWaG/CQRxJcZXvOvlo9tg6fwmIFFowPMTo7HGkdlXLoajjyVUqCiI/rkHJ62eWwL2eQ8+Wd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAqICNa4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738923514; x=1770459514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P3qLJwpRwqti53PlkJQBfQmkD1LGbQ2Ft7S7UCGX/Gk=;
  b=UAqICNa4IsDEm+p6DchtJH4k2E9eTN5Sy/tApH6wxUmk4y1kroyKkcIy
   MnZWhz3pf+Db6i3e/y96PWwvRa082j9RfluAY+eeBjuPDYdcSufsKOI2E
   EXytc6lIT9WLZsZY+pnNue0FJdW0np2qV4isYTNlaO5EN9Lw0SQ3zNG4y
   yTKIgPEeekyB1l/zy5+N52J/HZjkH1Xm/nOY5KspVNqhLZOSt0ZFB/T4A
   WarsZaCkGpLkNnkfE2Mo2zNBiLq7FpsWiLFATwQGCctMBnUqIjj+GHWpP
   XDuSu4JH8C4R0j1gN18AqjjUAdouCAvdt9hZNc8jvBG9xXzzZ+qxUSNMW
   Q==;
X-CSE-ConnectionGUID: /sBr5c5TTfS2tpEUrpnvrw==
X-CSE-MsgGUID: L6p4GcVPTmy8FyfRbThjlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39674999"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39674999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:18:33 -0800
X-CSE-ConnectionGUID: yIExHDWWQEqxbxahe5RcHQ==
X-CSE-MsgGUID: yYx/QUxzTru9gA2ovmQ02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116686154"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:18:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8D18011F9C3;
	Fri,  7 Feb 2025 12:18:28 +0200 (EET)
Date: Fri, 7 Feb 2025 10:18:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: switch CSID to defined MIPI CSI data
 type IDs
Message-ID: <Z6Xd9JPuzmzzl08o@kekkonen.localdomain>
References: <20241225205748.1515251-1-vladimir.zapolskiy@linaro.org>
 <e789ff43-78cb-4ecd-8949-1d0f8beb1194@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e789ff43-78cb-4ecd-8949-1d0f8beb1194@linaro.org>

Hi Vladimir,

On Thu, Feb 06, 2025 at 07:13:43PM +0200, Vladimir Zapolskiy wrote:
> On 12/25/24 22:57, Vladimir Zapolskiy wrote:
> > Remove redefined image data type IDs taken directly from the MIPI CSI-2
> > specification. Non-functional change.
> > 
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> I would appreciate, if the change is reviewed and/or it enters
> media/devel eventually.

It's in my tree now.

Thanks.

-- 
Kind regards,

Sakari Ailus

