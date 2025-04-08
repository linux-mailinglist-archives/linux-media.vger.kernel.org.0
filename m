Return-Path: <linux-media+bounces-29610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE22A7FE9C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37D9446D43
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1615A268C43;
	Tue,  8 Apr 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgQF5R3s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6D214205;
	Tue,  8 Apr 2025 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110498; cv=none; b=KljfibOGtTHgyXsvoce1S0/5t4a3sNYdK+JUhySJbv2CFmnDbUi5L9HknIRVT5+3voP5U7cAQrxOm+xIpu/iJWYgF55m48wu9lN7kx6wkkctC6CoyEXix0j2pddAooptRliUVMyF8Xyl5jWrKWTiHexb7br94WHHQWo2JAp0s/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110498; c=relaxed/simple;
	bh=mSQLKP1X62EWrHB6bZ0kNDYn1S45Uo/rPXebk8MY2Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+7mxIj54Wj6NCJl/jPYv+WQi8cOoDQ+JOni56oXi25wS9WXjyD9mvI5SV+5DA4gwkkANA0zhpy51trOxNBNcs2gCbSklo/IyJ/hGHOCErCdgpumrkR/dGoHRYA5A84/9D2cCqpXQf0FcJx8y2P1KSX0XKbRBsLkfSQr+MaQH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgQF5R3s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744110496; x=1775646496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mSQLKP1X62EWrHB6bZ0kNDYn1S45Uo/rPXebk8MY2Mg=;
  b=mgQF5R3sUCUPZAPuluPWmE66gYndZatvhC/LSHfwebbKzGa9XxmrQlTk
   +Sd5UjvoRQA1Awb/4zI3KW99Oh+kYgbxZgVyZX9TCDA8RYV0NisVsqK8X
   ftjQ3DgMu4GokegmMFEceL5X/FOIcnzNrnA3Ppz5ZQK3WOz+O4HpaOkOZ
   BS/cvQZQAreZGadcn5epPdwiowIgN5ULotfDlvHatD0Yyxdqh8kl0Zqtu
   9abp6Xa1sRPHIy7BdZusT/+Kz9hbB+ajLZb/f0Yasod2i/HZYs4wAhrNw
   woglLjzKub+T2zdwBCgpnnjzjjAjecJUjqewDesfAlG/n/Ogmlz2VHuyq
   A==;
X-CSE-ConnectionGUID: 33fecSYERVKD8hEyKTx0XA==
X-CSE-MsgGUID: UfId/PwHRzGZ4uo0JI1RvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48245733"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="48245733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:08:15 -0700
X-CSE-ConnectionGUID: +gMO8yxmQOq3fd+F07fIvg==
X-CSE-MsgGUID: NghQh4RRTrWz5MH0Rf5Y7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128217319"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:08:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C1DB11F7F2;
	Tue,  8 Apr 2025 14:08:10 +0300 (EEST)
Date: Tue, 8 Apr 2025 11:08:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <Z_UDmqZoPtybJr95@kekkonen.localdomain>
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
 <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
 <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
 <6f6a0ade-09fd-49eb-a8ae-ac8849b8ce92@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f6a0ade-09fd-49eb-a8ae-ac8849b8ce92@gmail.com>

Moi,

On Tue, Apr 08, 2025 at 01:42:12PM +0300, Matti Vaittinen wrote:
> On 08/04/2025 13:36, Sakari Ailus wrote:
> > Hei Laurent, Matti,
> > 
> > On Tue, Apr 08, 2025 at 01:26:42PM +0300, Matti Vaittinen wrote:
> > > On 08/04/2025 13:12, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > > 
> > > > On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
> > > > > On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
> > > > > > On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> > > > > > > When fwnode_for_each_available_child_node() is used on the device-tree
> > > > > > > backed systems, it renders to same operation as the
> > > > > > > fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> > > > > > > does only iterate through those device-tree nodes which are available.
> > > > > > 
> > > > > > This makes me wonder why the OF backend implements
> > > > > > fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
> > > > > > Is that on purpose, or is it a bug ?
> > > > > 
> > > > > I discussed this with Rafael and he didn't recall why the original
> > > > > implementation was like that. The general direction later on has been not
> > > > > to present unavailable nodes over the fwnode interface.
> > > > > 
> > > > > So I'd say:
> > > > > 
> > > > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > 
> > > > > We should also change the documentation of the fwnode API accordingly.
> > > > 
> > > > Does that also mean that the fwnode_for_each_available_child_node()
> > > > function will be dropped ? It's used by few drivers (5 in addition to
> > > > the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
> > > > patch series to drop it should be easy.
> > > > 
> > > 
> > > I assume the fwnode_for_each_available_child_node() still makes sense for
> > > ACPI backed users, no?
> > 
> > Not really (see my earlier explanation in
> > <Z9mQPJwnKAkPHriT@kekkonen.localdomain>).
> 
> I capture that the _named_ available nodes don't have value as ACPI names
> aren't really what is expected by the _named_ callers. What I didn't pick is
> that the fwnode_for_each_available_child_node() - which should iterate all
> available child nodes ignoring the name - wouldn't be useful.

Fair enough. I don't think we need to support enumerating unavailable ACPI
device nodes in this API. I'd indeed change the behaviour so that only
available nodes are enumerated. I can post a patch for that.

> 
> > I think all the *available* stuff
> > should be removed from include/linux/property.h, apart from
> > fwnode_device_is_availble(), which should be turned to work on struct
> > device to signal its availability for device nodes only.
> 
> I am not saying I have any understanding of the uses of the 'unavailable'
> nodes. As such I am not arguing over what you say here :)

-- 
Kind regards,

Sakari Ailus

