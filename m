Return-Path: <linux-media+bounces-41527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5EB3F742
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 200C7167511
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071252E8B62;
	Tue,  2 Sep 2025 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtYLoEvD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE42E7F01;
	Tue,  2 Sep 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799932; cv=none; b=bYp2BqOiTDzT3Zz209xHWNrKDhgMADtAfgK+zp78fAf/XrjbsSCixavdu3N6Zr9SRMajyQZ0qVGRzJ9rxfcB1khnmbCGvQxUcGKkXpjJxYfm9f8tUE3xyvfexjIGP3G+S9WE2Sk0Id/K+QHhOTrKcHJ3dr/BrPxgLYrrCqqYw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799932; c=relaxed/simple;
	bh=cbq8MF9eGEnnphMQ9wc4BMUt4Hu+h2jsqpOJa5W4udU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY4EK4EaM9NqGr0ZYTmwEKg9svAi6arpTJu1pdrudbOjtwWmvNESlex7zB2U6XS0gw9kR5sKnLfVz668etlp2JU7SQdw6IgMFBKSIFdLu+5Xy2L7yALISc2RzSlzTtxMdFTIreFipc9DQFEOgFRALHBYL2f9YMOj2U1albT+eDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtYLoEvD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756799931; x=1788335931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbq8MF9eGEnnphMQ9wc4BMUt4Hu+h2jsqpOJa5W4udU=;
  b=mtYLoEvD8LCtrJ6KWO+ADI+9owmEo0xKaYgQIB72xo+Zl4zDQJZbIcHe
   Qr72onyO8kYBjWhUe8mPVoe+s7L8SBA0NNsShiJxW5ImM00/9cpIhe6t1
   wRQYTTUUopkmMnKLf03s/oJ8IgOST1Sw5RRRa/4Qi9CBxBAG4zEeshmx/
   6jtDfbu1dvcp9tSA2pAL9Z+9QJmmHJFBTNs7lx73wYEyXp+4lds4EiCfs
   1QJHswfwnz1Ti3H50AQOgRWxdokJgIgrOlQy25toaOllCyvCjWlzqO9eg
   dZII2puqx+FrWd7J5S+HD+/ZAQbAYInZrLAjt+tlqLFTJdqa6v9ElPFsa
   A==;
X-CSE-ConnectionGUID: bEN/JYy3Qs+OSJRwjaMK7w==
X-CSE-MsgGUID: 2AEsStArTK65cp+Qq5Ap0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70489944"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70489944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 00:58:48 -0700
X-CSE-ConnectionGUID: OmTL4EdoQVyoBmeICbyc9A==
X-CSE-MsgGUID: l04QEiHiTeyRgGLknydhHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170464617"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 00:58:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C88FA121F49;
	Tue, 02 Sep 2025 10:58:36 +0300 (EEST)
Date: Tue, 2 Sep 2025 10:58:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <aLajrP6ANpCZl-0n@kekkonen.localdomain>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <aLaTRwNp_SmHc4K3@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLaTRwNp_SmHc4K3@kekkonen.localdomain>

On Tue, Sep 02, 2025 at 09:48:41AM +0300, Sakari Ailus wrote:
> Hi Bin,
> 
> On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
> > AMD isp4 capture is a v4l2 media device which implements media controller
> > interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> > be connected to a remote CSI2 TX endpoint. It supports only one physical
> > interface for now. Also add ISP4 driver related entry info into the
> > MAINTAINERS file
> > 
> > Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > Signed-off-by: Bin Du <Bin.Du@amd.com>
> 
> Could you elaborate what are the changes in this version compared to the
> previous one, please?

Ah, I missed there was a cover page in a different thread. Please ignore.

-- 
Sakari Ailus

