Return-Path: <linux-media+bounces-3859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5E831897
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158EB1C22DC2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68771241F7;
	Thu, 18 Jan 2024 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICmSm9aV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6B208BB
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705578241; cv=none; b=cdhjXlTW6KyWc/op1atvBJCwXuR3D8XmxAOvIMJbphK7hVSRCRcgmSN0h/Qcm/C07MyzZw12GvEtzrCJ1yu3mopVhj+6uWqWPJtgde1x0uhMwcDCG5y/yUkXuE7rEZohWytK5JTS1U7haLHgyuJi6x2If++0jeF70/p5mwF8b8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705578241; c=relaxed/simple;
	bh=H2gYtpvzYDBF/VQiKdQoUq+5/Rze59WL/oRY7zvczAk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=E1osvq/D/KgFTuhWvihf0hiQ/g4StdVn0hX+jHTlvNj7H0eVpcd+IjiGbVHLVPxyUHn/VWgJxfrzzFQ0+UHT/vlVEZEhcQpNa6HkZF9Ww0T9Ijvt3CNU20zW7wWx+AZghvc/o9GrxqYujegcWkWlB+QYRX4ZFWhO2hvlCGIaJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICmSm9aV; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705578240; x=1737114240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2gYtpvzYDBF/VQiKdQoUq+5/Rze59WL/oRY7zvczAk=;
  b=ICmSm9aV0382BvU3GlkrvRuNlo6bk6MTKIoaKk7nQf83whbEin4Uvlet
   64pydf0ikPT/dwOyRiQ7Fbs0l//zMcjf6AmZMmtNwWWBBxfex0XmZeOaf
   OsC/h2jukqHg/q1qlAofdw2pAOfREpjnzbdHuy2SmrkW3fzOUqrKhO9LY
   68dILK27lC12jOhGRRQKB279bY7iIUByxRvixdoB6799AuRoPwjXksRfZ
   OAhQ47wb5GAzSgGBykBjmrGgJuVAszoCKaHfVkeoi/2Cnm4og1TQsCce3
   RvWhQ4YMNiUhp+RZ9+V4D0uctqh8jyitUtGHG9O2n41B01EJILWiu6Cqe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="466802528"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="466802528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031640220"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1031640220"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:43:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD527121109;
	Thu, 18 Jan 2024 13:37:32 +0200 (EET)
Date: Thu, 18 Jan 2024 11:37:32 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Message-ID: <ZakNfBw2E4b80EO5@kekkonen.localdomain>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117130805.939312-1-dan.scally@ideasonboard.com>

On Wed, Jan 17, 2024 at 01:08:04PM +0000, Daniel Scally wrote:
> v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
> V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
> means it's currently impossible to list mbus codes for pads that are
> only part of inactive routes as the --set-routing option sets ACTIVE
> routing rather than TRY.
> 
> Add a --try-routing option that has identical functionality to the
> existing --set-routing but which uses the TRY format instead.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

