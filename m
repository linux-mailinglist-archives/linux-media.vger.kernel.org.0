Return-Path: <linux-media+bounces-33651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AEAC8C9D
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B193C1BA53D2
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5B42248AC;
	Fri, 30 May 2025 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKEQMIAe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3F1D47B4
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603354; cv=none; b=KaGlfGPN/8O31eWidZAiapwbS8kVjnxAT3nddpH2SazQn6OzhLRoOefWwnFCUnip9WX+OKS4u0/XgsXq18+fU6qzW+ckaIXn6OcBXui8jYBu6fY9adllSEQ1DQs+HgS4xM7CDaF0Qc2HOeJBQ4ZddzGzIaUpoJ4f2eWUMHk296A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603354; c=relaxed/simple;
	bh=35l9XPVSJXhj5GMtwiWCEqAEdQ/AGTsTrs3qVF3Ck2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jobDE7jW1748QdNbH9uDlVywrBBqC1d+nmYbaKmzY+sMg0Djh8NRvfgbsikLxs3QBeOhRNiytpoGID1qKA+Ab1aqtXsItyk0C2DEhRMoVyJ8MGGSQkMQL8j48gQBMBSO5MT1+sXtKA5z0P5i5VxHnEVaQ2TF5ArmWnt9tOiE6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKEQMIAe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748603353; x=1780139353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=35l9XPVSJXhj5GMtwiWCEqAEdQ/AGTsTrs3qVF3Ck2c=;
  b=aKEQMIAeCM+laUBtFkxmGGW/ZVZEoQyvU/aY3mqj/cDgNyn6hq8yQSAr
   yVFUMPhakYi++bHN9iU+LpWOQ9zpgX8k3uFN4ELIutB8SvPrNsArurJrq
   hCv1upZq1lsu+Hbj6PvE/evcWpI/0Ei+1WvXHTe97cFAjIaa0ZLWHkEiZ
   wXdhpAG/uwVSQ0D6rg4jKXyN4ASMuuXHNxB3Des1BLnUFEHaFueVAEYCh
   WQusC4juiXhqFTzrHZZ7/u+eDPmD7xJH3RbqhSJrRfPfIXmlrMCAnffZD
   QjHT5TyHw9SB0zvnVNX4NqInWP6Aj6RwOU7QeO955jqeF4XF2CZ5EFUHb
   g==;
X-CSE-ConnectionGUID: tupDcdtUQkeNpDW1hqfImQ==
X-CSE-MsgGUID: A4IKnv9cTZOy67TLZK7QAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49934099"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="49934099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 04:09:12 -0700
X-CSE-ConnectionGUID: GD1dpHR0SXqMYDsPU/rMTQ==
X-CSE-MsgGUID: IOiDXgHkSim4IIzbXaYVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148990344"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 04:09:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A3DC811FBA7;
	Fri, 30 May 2025 14:09:07 +0300 (EEST)
Date: Fri, 30 May 2025 11:09:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
	laurent.pinchart@ideasonboard.com, jerry.w.hu@intel.com,
	hao.yao@intel.com, tian.shu.qiu@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v3 0/7] Intel IPU7 PCI and input system device drivers
Message-ID: <aDmR04fbmHTdOa1_@kekkonen.localdomain>
References: <20250529041323.3026998-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529041323.3026998-1-bingbu.cao@intel.com>

Hi Bingbu,

On Thu, May 29, 2025 at 12:13:16PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU7 input system.
> IPU7 is the seventh generation of Imaging Processing Unit, it is a
> PCI device which can be found in some Intel Client Platforms such as
> Intel Lunar Lake and Panther Lake, etc.
> User can use IPU7 to capture images from MIPI camera sensors, support
> both MIPI CSI DPHY and CPHY.
> 
> Sakari suggest during RFC patch review it is better to separate
> the common code between IPU6 and IPU7 into a standalone module.
> So it is expected to move this driver out of staging tree in future
> once the common code separation complete for IPU6.
> 
> Changes since v2:
> - Remove IPU7 PCI table from UAPI header
> 
> Changes since v1:
> - Some coding style fix
> - Update firmware ABI header and remove some unused code
> - Remove unnecessary need_reset logic
> - Remove some 'U' suffixes

I did a bit more research on this topic and I actully think it's fine to
use the U (plus the rest) suffixes albeit they seem to be uncommon in the
kernel. Up to you.

For decimal numbers that are unsigned, U suffix should be used.

I also think the register definitions are indeed in need for a cleanup.
This should go to the TODO file as well. Could you post a patch on top of
this set, touching just the TODO file, instead of reposting the entire set,
if there are no other changes?

-- 
Regards,

Sakari Ailus

