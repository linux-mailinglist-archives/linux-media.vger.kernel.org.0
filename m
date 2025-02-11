Return-Path: <linux-media+bounces-26020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95652A3135E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49BA23A45B1
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716B1DF997;
	Tue, 11 Feb 2025 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkSD1Uje"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C3261599;
	Tue, 11 Feb 2025 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295922; cv=none; b=nIRKoZ63PlqQKTvsZIm5HPGvUhINAOomaBnmAzxeog1+LrgqqYCp1RalgQ9mJU8X9Jl1k8fAzKhf9K6MtPBeZukWOJbDP1ieQwOl/G4S30PXhWQBwrblEUlthi9al2i4FBIr8IzbGRWzFki185lEGm80Uy8OgNXb8t4BO6hJBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295922; c=relaxed/simple;
	bh=025NWQSnvY+LgecFbYkNP8Yv/ZISvzowgReUeSLUZdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fna0oySTz87eQhFaRhqTvcX3kEz0OFwDz9b6045HzEeVYSKCNWF45Z0zoNy/euFzfg3OWsfx0kxNC33VUNr6cwuHmdhjtJa+go6LNYUnay4IvG0w+F0hMs1Oir2VVjDFNJGGwjETnCuYP7L/+E0uCbSk5ViYVkV3UwBjsWAQBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkSD1Uje; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739295921; x=1770831921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=025NWQSnvY+LgecFbYkNP8Yv/ZISvzowgReUeSLUZdI=;
  b=gkSD1UjeBRAqojj88W0weD3fkl1T1XZKnUF+tc5afZw4lwoRBnLVeU5Q
   zJYE47O5UNq02qiXq1Xu35lnzmIYXAMBQZNGbYKl2T1Bd08aWM/jJPy0B
   v2oNmqfTnoOiiZNl0KQjrli2Tn6vBZF20c8XyLxgy4o216+wjvCoXEsO6
   Mkm/CoY++lCt6O9WxAJtvPxRqQ1YKm+8x5gB0oefVLhwr6N6g6sy7JR8O
   SKi/ifPhueEZ1KVxaK0j66ww7L4mytxJ6BtTivNXIApc28GdoVPFrvn1b
   jqVvbFA9Kemzcxuc8ku4o90sAWm3tJSnpiUg9lyrVHODUdm0ocwjq+aiS
   w==;
X-CSE-ConnectionGUID: J7rT0fp2TQuXb/TmpxQ3MA==
X-CSE-MsgGUID: +YGoSeABTUizG6vtPGJwWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51356083"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51356083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:45:19 -0800
X-CSE-ConnectionGUID: c+myg93oRNGx6TF+qdJKfg==
X-CSE-MsgGUID: 1HJzdcfdQp+SporFjwtZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112562200"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:45:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C1B6B11F7F0;
	Tue, 11 Feb 2025 19:45:14 +0200 (EET)
Date: Tue, 11 Feb 2025 17:45:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
Message-ID: <Z6uMqiB_cKzM9-iu@kekkonen.localdomain>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
 <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
 <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
 <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>
 <Z6uFGYcUXbbRMERY@kekkonen.localdomain>
 <6c05f3ad-fc2e-19d1-d583-8026afc1363f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c05f3ad-fc2e-19d1-d583-8026afc1363f@linux.intel.com>

On Tue, Feb 11, 2025 at 07:28:51PM +0200, Ilpo Järvinen wrote:
> Patches 1 & 2 are now in the review-ilpo-fixes branch.

Thank you!

-- 
Sakari Ailus

