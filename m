Return-Path: <linux-media+bounces-39494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BEB21DE5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A1E50113F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12CA2E0909;
	Tue, 12 Aug 2025 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dydURak4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DF2DF3F8
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978666; cv=none; b=TSAK0RaJsNprWgMS62Rpl/fkOaiy5mcvYmlVg2NhD24jIE2DCIPW2SFNXrvM/K5LndLAmLNi0NBIg46LxdlJ8x9YaCDQ9MrHllgeC9AwSB505CE0v8mxEBhIUgCtOL1Kh6Ssk7B0oSKZA7lVc38sw4IUC+rcKTtnsBq/1ddFO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978666; c=relaxed/simple;
	bh=ZsFe4AzOwoPYfMJumjArWDT7EKHeGXtz6tSp/0vqINQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WW6iSMhmu1FEA/X27yktfs1hS1i+WSGWh0R8FtswSxBRz5n5I6ysWy+xAlsgystrG0Zbh9FPd8UeX6XwjFcW0QOf+z0XFJFkxC2EGIgqEAi0RwUozd5WHBqPKLOfKpxv2n+u+gepROpPm653z0tntaJc5xd6oGSkpCta+ICCMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dydURak4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754978665; x=1786514665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZsFe4AzOwoPYfMJumjArWDT7EKHeGXtz6tSp/0vqINQ=;
  b=dydURak4sMEEWi0BDTOAJzdhNZo8VgNJXCtl83ifA76dqZSu4778tjBB
   IzbjUSFaiVEN/+IL75LVNc/eXm8OE/I8SQAPsmDWCBBQtFc4RAJ7SNynF
   c3RCe8k3xYBek1fHxZ2ZXv64WiR8qymNH6nBFHEOjCBhf+FxPAjLseKBB
   ZHXqLJB1L6jna5uk4O0g4TQgDYi5E54f4DHOB0vGxzrzLVplRPNAqwWcO
   onhas7b2o8n9zLe6qFupqN8WFgXatyBB2KgppegFLiv139T+j4knZbyQj
   7JVP4ltpvu7ehWVGtr8mJC3swksOUsMYQ2582SZmD+WFaKV0NgCXFg1a7
   g==;
X-CSE-ConnectionGUID: J6MAFr4XRV6YrpcfmUERBQ==
X-CSE-MsgGUID: rG7IHei3TUmjyorCLNwgAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56454874"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56454874"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:04:24 -0700
X-CSE-ConnectionGUID: RQwCSfmMRKSPYT69TDrl5A==
X-CSE-MsgGUID: fQcZ3I+VQNaR9+LA796T/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170311398"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:04:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5925D11F831;
	Tue, 12 Aug 2025 09:04:18 +0300 (EEST)
Date: Tue, 12 Aug 2025 06:04:18 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Valentine Barshak <valentine.barshak@cogentembedded.com>,
	Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Subject: Re: [RESEND PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Message-ID: <aJrZYodhprrJ_mqk@kekkonen.localdomain>
References: <20250808202829.2115779-1-sakari.ailus@linux.intel.com>
 <c8b7c8d3-d016-4ffc-8f33-fe37fead0048@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b7c8d3-d016-4ffc-8f33-fe37fead0048@cogentembedded.com>

On Mon, Aug 11, 2025 at 07:55:06PM +0200, Nikita Yushchenko wrote:
> > Mikhail's e-mail is bouncing:
> > ...
> > Assign the driver to Laurent with "Odd Fixes" status.
> Indeed Mikhail is no longer available at Cogent.
> 
> Maybe my address could be used instead, I think I'm the most kernel oriented person at Cogent these days.

Thanks, Nikita! I'll send v2 with that.

-- 
Sakari Ailus

