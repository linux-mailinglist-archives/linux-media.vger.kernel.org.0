Return-Path: <linux-media+bounces-25205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A703A1A525
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 14:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1483AACE1
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 13:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B4720F997;
	Thu, 23 Jan 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRo0yHBy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DBF320B;
	Thu, 23 Jan 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639448; cv=none; b=tlPuTfw+BLpOyzg3WZX9sgypJZXyQS3FxyKUTWuVxM0+PiZz+iGV5YPTAN8/hSMWbu9hX+ZBymDhd3MMQOFErf/qgTF58hMRMvgw3P18jt9WZ4+FBSzGIk0W84PfbfISUMLHasMmkgSXLTotwitmMNX5ZufLENxswHzXvpiPsZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639448; c=relaxed/simple;
	bh=/8E+k6WiXG3U0ah0y48GfNRtRiS5f7GjN7DqVhDeLDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqhKd5qfdU2eW+3DQemOtREjZQNq/3A0MVrbG4tCs+q4dcHVd9lY3QwdVI5BFvzYMn4Ayk6WXFxsfIamBBdyXLbFqAB6ADEbArA79iEoHRg/u+lPFPEUS6yGCMd0iKvtQdOT8A55t6+7Pc9IDBrvdQeLSQEPoCxHq3itK1wJ/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRo0yHBy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737639446; x=1769175446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/8E+k6WiXG3U0ah0y48GfNRtRiS5f7GjN7DqVhDeLDk=;
  b=cRo0yHByROg6Fd7T2IaupyAqhA5A2SHRZVv8o4N6uo4qJR5/b5ZfaK1O
   Nnz6U0BRYSOpBDrQLLJxKA1x+h+P3c4TpDUWUi/vorCYNedOpebitZ8Hu
   38ikSDWiwRfeiStzbG/4+L69u5IW9lrV+QnRBnAYrdNjSp0fm8jlPt8V0
   noelO8FojsTLL+7X6+TSQss4MVJ36HQ5hjKHQAV+Sx0YttlXEi5SATbbm
   UErXxQoFYSfKNUi6zPsf2sXtQf8LfehjZF9yJOl2J2lYtHdiH6Us0dAOO
   y7Mz+mcTTsa1uLgIIXzEdZ3IjDrfbfVS3aK7uEFWVHMbLUR/77v0ZQg8c
   Q==;
X-CSE-ConnectionGUID: fPw8rPSsSIqTs0QXpkQ9oA==
X-CSE-MsgGUID: FTbZXY0qTcuUcV44u7mehg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55551344"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55551344"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:37:26 -0800
X-CSE-ConnectionGUID: kzqa6K/yT1W5LDRcO/s27A==
X-CSE-MsgGUID: cj4pRzrJT2mez2eEcGErvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107888401"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:37:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1taxOb-00000004Puh-2WhQ;
	Thu, 23 Jan 2025 15:37:21 +0200
Date: Thu, 23 Jan 2025 15:37:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5JGEUqfzcGh7Wp2@smile.fi.intel.com>
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com>
 <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
 <279b9682-ac78-bfa0-6e2f-08a22f76d867@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279b9682-ac78-bfa0-6e2f-08a22f76d867@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 23, 2025 at 12:47:34PM +0200, Ilpo Järvinen wrote:
> On Thu, 23 Jan 2025, Sakari Ailus wrote:

...

> I'm like 'What?' ...I don't know why you guys are arguing about breaking the
> 80 chars limit. :-D

Sakari is too pedantic about this, and I'm the opposite.
It's our main disagreement on the kernel code during the reviews.

-- 
With Best Regards,
Andy Shevchenko



