Return-Path: <linux-media+bounces-17469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5957969C5A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 13:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A9F285EB0
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FC91B9859;
	Tue,  3 Sep 2024 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB6kpLf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099681AD26D;
	Tue,  3 Sep 2024 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364052; cv=none; b=g6e1fL56Uk87AKWZkOuzEhTafHVMHLAJnRRT10kwWxF1BDcu5wML6bsQjmAqRpNtjDlU8ablbcrUL6hsFjCHH/dqVHhY6Oqj7Xd+TIM3FYO8IcszlZHYWfLua+KalLP+yGr1hy3+E8aZE2S2S4DsR4ebFU7NOmwo4hDBPATNXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364052; c=relaxed/simple;
	bh=YYgWD1VI6DZ3NbL1immAGtviyYDW9n/ERbBnomCvrc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laqvghRjL1MxP1Lh2fDM0+K10S0Qf0MtZ7XEeR1n5jYtaeOdi5/UZtvgnKEdvyZ17bwYpYXFCjeGBGWXC4d0oOYyrhCP+YBHftYEdTmvrWGszqB0EeTd4D4ozRyhrUdi6ly/5qnzO1tvOlC+IEehLcUsps0inEYECwa5ipCZl14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB6kpLf7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725364050; x=1756900050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YYgWD1VI6DZ3NbL1immAGtviyYDW9n/ERbBnomCvrc4=;
  b=SB6kpLf7ObixYBh/pqVxSZBgvgdAgjOzqsg37z5IPxFsnEMsAuNv28U6
   j4LdFE1XN7wfNAVtnEEzCvT0WXZbK+H7fZchx66gCXJCQuw9/PKn18qYK
   fc+uM/6cprBQrAP9idq2tjWKMAalJz1+ojQRXZXWhmQseFPno/Bf+3ISl
   9uSDarCdHQKIvfTf7zl+qSd+CDkLRk4++m/rpyLiY3UOirLLupARqtuIm
   ZmtAXE7kGSRmXoWrT0ykmW/rawvgjmY4ke/GMGRqJvPAAW3TAHfXGQZH6
   DgIMQ8edRlG/pUZbb4LM0WGlq8y3hs5r71BHdFb351nsTpG6D5e9USZIR
   w==;
X-CSE-ConnectionGUID: J25iPCghSymx630SM1MwAQ==
X-CSE-MsgGUID: a6/rcLZ/TkGphFJAYDF+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23523525"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="23523525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:47:29 -0700
X-CSE-ConnectionGUID: VuvlqDbHT1WV6I9W1vXu3w==
X-CSE-MsgGUID: jdcUK3v/Q0S5Oqmk1kPErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64703242"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:47:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A725411F817;
	Tue,  3 Sep 2024 14:47:24 +0300 (EEST)
Date: Tue, 3 Sep 2024 11:47:24 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liao Chen <liaochen4@huawei.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, jacopo@jmondi.org, mchehab@kernel.org,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH -next 1/2] media: i2c: mt9v111: Enable module autoloading
Message-ID: <Ztb3TAAkxhd_lIlA@kekkonen.localdomain>
References: <20240829125203.539977-1-liaochen4@huawei.com>
 <20240829125203.539977-2-liaochen4@huawei.com>
 <20240829134708.GF12951@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829134708.GF12951@pendragon.ideasonboard.com>

On Thu, Aug 29, 2024 at 04:47:08PM +0300, Laurent Pinchart wrote:
> Hi Liao,
> 
> Thank you for the patch.
> 
> On Thu, Aug 29, 2024 at 12:52:02PM +0000, Liao Chen wrote:
> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> > on the alias from of_device_id table.
> > 
> > Signed-off-by: Liao Chen <liaochen4@huawei.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sakari, I expect you will merge this series through your tree.

Yes, they were in my previous PR to Hans and in media stage tree now.

-- 
Sakari Ailus

