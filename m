Return-Path: <linux-media+bounces-13525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFAC90C97C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522672868CB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E336E60E;
	Tue, 18 Jun 2024 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2jHjYGu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29801459FC
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706796; cv=none; b=D4qPpZRR2q84qONknCxVH7aObUhOCLNwNvGSVduCeZOIDlTvI/GECWlO/Sv9PSDvlrxq1dt5WpWdvLNiMxYIp753om9sUMyCTCWVuJnCUlsGvUO2BPGcKr6zHKqAnUkKUbAg7R5uCufV6U8TzX8kLWkZMmCS5LcfSz07qvRQhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706796; c=relaxed/simple;
	bh=sT1IDkYjnB8lE3O4oLOCOLuw48/krek/ZcMoTxJbjQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXfPi4ga50yKvnuz35gg8G7NW0/FBSe7Lgbv60jabVpxd8PjOielMzJ5OhqjjFkKBiKDRWCbJf4wF1xcbkooxdWTe+Add+f/EGcjcXo08TLDYiwOfuiDz1dUQ76VokmTmyD7Ge8lKEYe7ypDUnFQ3Xm1ykuICODKMhsSSo8OhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2jHjYGu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718706795; x=1750242795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sT1IDkYjnB8lE3O4oLOCOLuw48/krek/ZcMoTxJbjQ4=;
  b=R2jHjYGut6SPBwV2rEE5KL/mL9sApcKIQBANeuofFG1dRrMXaePhrYp/
   ZJgPW1hs6c/I487X1iRDAdSERr1FiVPMqqbZ4YcqrPhzuAukRCXsu9bUl
   vzBwwnfwDqdmijCmDcytvz5x7CkJTclSX33aEmWKOuhD7uOCuMpSOk+tY
   hukPZjFchu1p8be0YKiabf4+E+SrXj6JlJ9rjLvc8CUguf4s5ZgAJBMjc
   V65zOqzmAQX7Of77N6JMrhBusUOjSM6376Tnz1MdDY22OBxVjNkOfISeQ
   RwTEy14B7woHJEJTahmyL2x29YDWmjAFVxuYZHtzay6AAL6q5cGHAjdQA
   A==;
X-CSE-ConnectionGUID: MipaYXeyTaKCF6SXH/pqgw==
X-CSE-MsgGUID: TPTGcexUQ2CuIKwpDTG2YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="40981235"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="40981235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:33:14 -0700
X-CSE-ConnectionGUID: d6jm8b/VQ0KduCkI0eKTsA==
X-CSE-MsgGUID: CUtTmnIgRsmPWwQRLyp4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="46412902"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:33:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B932211F7E1;
	Tue, 18 Jun 2024 13:33:09 +0300 (EEST)
Date: Tue, 18 Jun 2024 10:33:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 23/26] media: mc: Implement best effort media device
 removal safety sans refcount
Message-ID: <ZnFiZYoEs92QPnEU@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-24-sakari.ailus@linux.intel.com>
 <73be9671-ea7c-45e3-be0e-e02a7a28c949@xs4all.nl>
 <ZnCcV_a9DValbM1y@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnCcV_a9DValbM1y@kekkonen.localdomain>

Hi Hans,

On Mon, Jun 17, 2024 at 08:28:07PM +0000, Sakari Ailus wrote:
> > It also means that you do not need to keep track of open file handles, since
> > it is only used at the moment for this specific hack. I understand that it
> > is very likely needed in the future for media events, but let's add it then,
> > and not mix it up in this lifetime management series.

Beyond Media device events, Media device file handles will soon be needed
for proper handling of buffers related to requests in the core. I don't
think we should postpone adding media device file handles.

-- 
Kind regards,

Sakari Ailus

