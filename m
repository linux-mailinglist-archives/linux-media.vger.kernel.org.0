Return-Path: <linux-media+bounces-24569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC51A088EE
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A3F3A9214
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 07:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09552066C0;
	Fri, 10 Jan 2025 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyO+F/t4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55A14A08E
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736494401; cv=none; b=ifYJbyXO6sOr142swMugNSFgge0rbggg9Dom39XFMqam1Ch/Bd19atng55WQeAjreDiTtdtys3K9G3qA8YUTE5Wi+JE9KwEjc8UJOrjtrVSQBchAUk9djxChEwnfT/LC0mulikb69P2kEaDWwOSDo6gWJxgXmuDzBK7qlHhLuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736494401; c=relaxed/simple;
	bh=5e76k0arGkKoEQdFkzAaDNCpXC2b3FqKbrMQXo0YTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WteKEnj++phFkDVsxTiqY1OHxF/WgctKpzKOCwn2kVyx68mM2EddfWQD1UvPiYOUHyjtZwWtFiAJSTqvddlbulf9P14BhB2SxEJ/+yfihLGdKRQu129ZkjJ4qhqD69EgDiIxQVFaRdty7Xsu0dOKiV2hp4DZXojCVw0kSXCFq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyO+F/t4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736494400; x=1768030400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5e76k0arGkKoEQdFkzAaDNCpXC2b3FqKbrMQXo0YTbQ=;
  b=AyO+F/t4IaS70c40khJiRk4M6+apOAlhb9xqmz6xn8h+eMmmoRO5mND8
   5wjFoyP9erSWaV6l8yiU0LqM1I8liXjE/KiaOIVvU9VOi4NNxgBiEiyg5
   d7sYuwLCwNJyCXzVr9OVUDW8qdD9PYPiOPQ20WutrJPl/M5E5mjGdRmhf
   xylzucU2c7v9sp+wCTz+Br0dOazCA1En4HrlENA7ow9eihzlhvBYPr2zG
   fvf+QzWFbnXtLFaVO4THn1nBVgKuyQ6elX/0W3QttD8KCosF3JUwXlmZk
   4oyeJbNiwD+18Bg94S1y3U9AM1G95mmlNzdvnRvHtOQSlEy6jBt8ais5r
   A==;
X-CSE-ConnectionGUID: QzxDYY6mTjSfj8ud+gnQ/g==
X-CSE-MsgGUID: HEzrymYaRqqwcxmH4/hSgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="24385246"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="24385246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:33:18 -0800
X-CSE-ConnectionGUID: q2PurGyrRPS3tHu7PAXPoA==
X-CSE-MsgGUID: hje4whAJRaGZFcBlzFV+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140962140"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:33:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 862AD11F89A;
	Fri, 10 Jan 2025 09:33:13 +0200 (EET)
Date: Fri, 10 Jan 2025 07:33:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH v2 1/4] media: ov2740: Debug log chip ID
Message-ID: <Z4DNOQL6RDxvjN8y@kekkonen.localdomain>
References: <20241220114317.21219-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220114317.21219-1-hdegoede@redhat.com>

Hi Hans,

On Fri, Dec 20, 2024 at 12:43:14PM +0100, Hans de Goede wrote:
> Calling the identify function may get delayed till the first stream-on,
> add a dev_dbg() to it so that we know when it has run. This is useful
> to debug bring-up problems related to regulators / clks / GPIOs.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Prefix chip-id with "0x" when logging it as it is logged in hex

It seems I accidentally took v1 and that is now merged. I'll post a few
patches to bring in the fixes you wrote for v2.

-- 
Regards,

Sakari Ailus

