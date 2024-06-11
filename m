Return-Path: <linux-media+bounces-12951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A8903CCA
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5664F283EA2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0905517C9E6;
	Tue, 11 Jun 2024 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtrGVFNO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD9178CCF;
	Tue, 11 Jun 2024 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111485; cv=none; b=nT6+A2GjkFLxyMZ3aZJ21LtpOTAgfJtoYR8ZZyLEzCog21SIQmKO4dxzdufpQ7h0nAjWUJg3ZXWYaom9XZwVhoIZ7CKg9sHibRe7BbFFAFTv8CHua5GRLXiDaUVSWWuVOXbPC6tjFG1vzVmlZbax+F7nTUYWTZLxu0bq9GqSg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111485; c=relaxed/simple;
	bh=AJ+FVeoX597QSQeGv0zyxdp+YRSUUfAPTtc7B1soBNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0rXbegkVJwkExdaCNIA7OFgrKZlMQvzHKkxL/GFNzzY1HYbjcCnOvf44eMI47HRHqEt8eprQ3EwjXlRhm1pKRWVPqOhPcxX7dlNnXRcVImZqXsnAae/lp4av6vlDAi+5MYURFC0tyikzgi3qcJvKnHrD4E3+lzmdxqgEdbGqQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtrGVFNO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718111484; x=1749647484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AJ+FVeoX597QSQeGv0zyxdp+YRSUUfAPTtc7B1soBNc=;
  b=EtrGVFNO3ZXlFWfvxWCD6fyKw6ImR5JF2bAThfuzQ0n4XYMjpaPYAlFP
   ouW/iFBfkxTRNPGgVoLHv4udeULWbO06Ma+feDldkvph4A29A42KzxYAT
   pCRsZsJ/akgIMfq1ZDmX29wLp5ZQM8VANb1N09OA5KrLYbCZTEkbtxO/i
   wk2uO60ckdWVhSmkH48vBH+qHwnEJyAUySOi6DpozO6bMBvsFRnd1UZXv
   hvCohJcynlmlVAPiQthDsV/3LdkVFURC7uSpzBwhIrD+/3GbDNivj/9fb
   zOWowlcOLn9+Lnz4lX5oZ2SRGD9VyFRRZJ6XF1IJBSs6xHMN57niXOWuc
   g==;
X-CSE-ConnectionGUID: Zct+zZL0QGapf65AYDxqSQ==
X-CSE-MsgGUID: /XYFdoFUQKq5aUM3hhN/qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26221684"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="26221684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 06:11:23 -0700
X-CSE-ConnectionGUID: 1hHzB3iSSUGYXeCyYB2n9g==
X-CSE-MsgGUID: xF1Yj6jeR0+Gl5QSM3jLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="62592569"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 06:11:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5ADA011FA94;
	Tue, 11 Jun 2024 16:11:18 +0300 (EEST)
Date: Tue, 11 Jun 2024 13:11:18 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vgxy61: Add MODULE_ALIAS()
Message-ID: <ZmhM9mAcQqMGKnzw@kekkonen.localdomain>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-4-benjamin.mugnier@foss.st.com>
 <ZmgI8nET4sdhdwQx@kekkonen.localdomain>
 <76fd2e25-3a9c-49fa-994f-6a392e42a6bb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76fd2e25-3a9c-49fa-994f-6a392e42a6bb@foss.st.com>

Hi Benjamin,

On Tue, Jun 11, 2024 at 01:57:24PM +0200, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> On 6/11/24 10:21, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Mon, Jun 10, 2024 at 05:08:15PM +0200, Benjamin Mugnier wrote:
> >> Preserve user space retro compatibility after the device rename.
> >>
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  drivers/media/i2c/vgxy61.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> >> index ca3b43608dad..c85f356946ca 100644
> >> --- a/drivers/media/i2c/vgxy61.c
> >> +++ b/drivers/media/i2c/vgxy61.c
> >> @@ -1898,3 +1898,4 @@ MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
> >>  MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
> >>  MODULE_DESCRIPTION("VGXY61 camera subdev driver");
> >>  MODULE_LICENSE("GPL");
> >> +MODULE_ALIAS("platform:st-vgxy61");
> > 
> > Perhaps just "st-vgxy61" so that the module still loads if someone loads it
> > explicitly? That's what you'd want, right, as the old compatible string
> > will remain?
> > 
> 
> Yes it is for explicit loading. I'll remove the "platform" prefix.
> 
> But maybe I'm overthinking and I could just remove the MODULE_ALIAS()
> completely from this series. What do you think ?

Most of the time the modules are loaded based on devices found, so this
would likely not change things much.

Up to you.

-- 
Kind regards,

Sakari Ailus

