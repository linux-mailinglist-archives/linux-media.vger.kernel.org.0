Return-Path: <linux-media+bounces-3848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03369831719
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F851C225A9
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 10:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6D923779;
	Thu, 18 Jan 2024 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQxZw3em"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A222F1B
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705575197; cv=none; b=ZooZOrUPqXJYNa5Jdh11tAoYDVm5avbqplj6bzUxUrzas/2l0F9Dhe6tHRPBJewXvGNZVi3sYmK9Cr/PHTg5CynweEhDZCvmAvBxcKPDfIrZYyLTwRm90M2Lv5/PPNih9J57uf5HRbCE2dXx3W2O+7elf+y1xoNo99PxRo4ZmNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705575197; c=relaxed/simple;
	bh=RUuMXyUXZe50cvEQBKrLoePoZifVAlLSGAZ+P0BwhgM=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Cw+jS63IjjmeIdn84rNBltYZ9DlgyXfKEkLOrQqbVxLq/R+RouhmdOeJ/J04xSVtuxFUVk+H4inIoMuNY/6SAX6yQowkDtOoC7lvcO6fRx9pvEV5qnXRffjfteC1WvStnCQA4pOu6cHzpePPoLxQl5QrPvk7k+XQj1vRcxAHswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQxZw3em; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705575196; x=1737111196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUuMXyUXZe50cvEQBKrLoePoZifVAlLSGAZ+P0BwhgM=;
  b=XQxZw3emmAgnjrhEeYWo2ScX0/Lgmz7aixSy4GX97h0nkHUsBMhCmhiF
   Gy1QE20yzc/umcOnd2H5JJ0k4lyv1SU7oOmGsXfvgON1Tx/KGDg2oN7Yh
   eJBqApJnAOoJBj5c9spIpvA9nBZ/ppVCUHQNOXI7SDsFM6PN2iWa5t00C
   lMfCbD8NOpm4Rxp1jtSq0jR1uG/gTI0Dva9LzMwOB2mk+W8dLnflq2MdB
   brPV35JX1c6qOAaT42+bGpUXspdzEpq0WSGeo4RJqXm15iZs7FSuTQzqp
   SHWTCfFz/M02ffg3r5OIunsX4JnemFRevOfyltRN+6svPQspoWs/vumWd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19010671"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="19010671"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115928624"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1115928624"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:53:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 175991203A5;
	Thu, 18 Jan 2024 12:53:10 +0200 (EET)
Date: Thu, 18 Jan 2024 10:53:10 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/2] media-ctl: Re-order setting format and routes
Message-ID: <ZakDFkT5aansLaGo@kekkonen.localdomain>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
 <20240117130805.939312-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117130805.939312-2-dan.scally@ideasonboard.com>

On Wed, Jan 17, 2024 at 01:08:05PM +0000, Daniel Scally wrote:
> Currently media-ctl attempts to set formats that are passed to it
> with -V _before_ setting routes passed to it with -R. This is a
> problem, because the formats that one wants may not be valid until
> routing has been configured (for example, if the format is for a
> route that is inactive by default).
> 
> Reorder things so that setting routes comes before setting formats.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

