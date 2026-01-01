Return-Path: <linux-media+bounces-49832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A2CED520
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 21:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A61BB30012E4
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 20:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652152F49F6;
	Thu,  1 Jan 2026 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IK9c8aa4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB526187346;
	Thu,  1 Jan 2026 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767297925; cv=none; b=p5I3EUGTK7GvTPVXqoRGB4REsxnMlMgFRFp6CkxOXOh1pSmrhjNhMvYzQiLQ8VJQ2LGDG/FxkTN4p1/LRFIapv5qNa5LjLVj3ItnJhIck6S5Yrd2v6i9XqKZwv+/X9rZFFZ4wU3wTGymhhNPI471ztdVQ8J7eiPpvz0h8SgoouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767297925; c=relaxed/simple;
	bh=vdDv9HA8R9igJbDmUe3gTGabgP9f8/50BOxgIAY2eCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMewlvrcUmj440G6GPa8vXPs4c+OiCtisSnWSRi3Ud46qdoDqRUALupgDFipHnZse21J36yU6BHjliTvnYnwto7J3iJdaAGiqWikfYhv2hNq7I9VA/I9E5t6Nw0n2U+5oTwUIcGKm+gSiizY8Or/JO/LhOca2Oet1eIZq8YvkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IK9c8aa4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767297924; x=1798833924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vdDv9HA8R9igJbDmUe3gTGabgP9f8/50BOxgIAY2eCM=;
  b=IK9c8aa40oSSnnHc4d4UiIqnvbAmELRLkFjWZ0I5/rKV7ruIBV16c1Ok
   TPTUpfBdKp6OSpyMgKnA3l2gt1Kv+2TCqzAWQ17ZkH0cMqGOi5+3zoH4m
   OaXeTa0RfKbisMH6Ky+aMhs9NWH2nHEJSRdlEjAJfND/+bCwzgIHYbCRu
   iDHniBCBZkBU9KQFJ70uyyVClfsry90qDypuj+zW7OazvIuXYkz0xEEL1
   k0OBjgLfFUGWC4a5CiM06n1waE+LSYAKGsTSjRSTykCNl3iqs7y+sH6J5
   VI0ysyHwFCHjwnAj+u+14jSIzXCZ2Z5o3i4zMSOy0BCDuCh4ms/S9yDOx
   Q==;
X-CSE-ConnectionGUID: Z2qNllsiSEmjmrpPj+PtUw==
X-CSE-MsgGUID: clCP8G2aQEuRB+HJNc5KnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80192783"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="80192783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 12:05:23 -0800
X-CSE-ConnectionGUID: uRDRV/EzSgqsP/9eyhU8Qg==
X-CSE-MsgGUID: eUtytS4wQhaouEHawNgetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="206736945"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.249])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 12:05:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 87A3411F87B;
	Thu, 01 Jan 2026 22:05:28 +0200 (EET)
Date: Thu, 1 Jan 2026 22:05:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <aVbTiM35Z_64mwFA@kekkonen.localdomain>
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
 <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
 <8838a2f3-4eec-42ee-88ee-55a71f789037@linaro.org>
 <PN0P287MB2019969BACCD6EF1325BE3069ABAA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0P287MB2019969BACCD6EF1325BE3069ABAA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>

Hi Himanshu,

On Thu, Jan 01, 2026 at 06:19:02AM +0000, Himanshu Bhavani wrote:
> >> +#define OS05B10_PIXEL_RATE           (480 * HZ_PER_MHZ)
> >
> >Here pixel rate should not be hardcoded, it'd be computed in runtime
> >as 600MHz * 2 * 4 lanes / 10 bpp = 480MHz.
> >
> >The sensor may be wired over 2 lanes or (presumably) it can stream 8 bpp data.
> 
> We are not supporting 2 lanes right now, driver supports only for 4 lanes and 
> 10 bpp data. So technically OS05B10_PIXEL_RATE will never change.
> For reference I will add OS05B10_PIXEL_RATE calculation in comments.
> I would prefer the hardcoded at the moment. Other than this comment 
> I will resolve and send new version.

The pixel rate on the pixel array may be disconnected from the link
frequency (and throughput) -- it may be more (with e.g. binning) or less,
depending on the sensor of course. Calculating it, if possible, is always
better than using a fixed value; experience has shown these are often
simply incorrect and sometimes not updated when other changes are made (and
same goes for the link frequency).

-- 
Kind regards,

Sakari Ailus

