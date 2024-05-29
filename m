Return-Path: <linux-media+bounces-12140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 193118D2DB6
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C35AF1F26ED2
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 06:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB67A1607A7;
	Wed, 29 May 2024 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPlctSQ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C16273DC
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965922; cv=none; b=mWUrKeeMYLT3jJ/aM/BXoWwJYuFoHR79c3waC8sBOKRF+mvK1l7H2QkB29YUrojufwAkGu8lukUaxpA2sweKw3zefKISyh8A2/jlJ3UH1jdv+NRV954xqhx5us2aueEqYHk13reYNX6wHPQ1Wm0XNoiQO03aWZY3WIVkulzpik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965922; c=relaxed/simple;
	bh=+bdBRpib0LrOw7ZYF1X5V7PKMNn9O6exJ0HIfDoI41M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSad1lX/KhDq1SP6nTUgEGEDeFfwyBOI1EllPt8ZA6LpUmLKcLIX5sn1/hFJirtaOqcktHO6kQqoB2NXC9tWbcg5StyZ0NVsWmu6wdVvscKHRJwyGhhg+xKSrXFoxCofqgmF/ND6Q+99NR9XfgZH5qCeKr4JePg1QoTH6/W9Hoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPlctSQ7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716965920; x=1748501920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bdBRpib0LrOw7ZYF1X5V7PKMNn9O6exJ0HIfDoI41M=;
  b=IPlctSQ7qo9iriMGYlSrb3LlODuostihqSLzcAj4Q0HCzbydIXfUSE8S
   zc5AAyG31LEN0UKQjFd8ECH5FQCIYZCikOe33GVqyyRtfQkZZlQ34MooF
   qBgP+K/+iSSWCD6ZEk82Euo+NxQEOBngQ//0e7pqy+enWRQSsyEleYqRL
   bZBn/JydEhE3bkKec2NmIoWVSAAIWCRMUPPdKtsJoW5Cq8KDoQZvV6v91
   2ogX1m2QOKnYP9iRWgJf0ISqvTin+PeUErdC8+q2OPDDRtucWw5yv7xwg
   cq7kUEoKuCPiFTB20FrNXGwZP0Nvnl+n2bb+2AfFRzrKekuSoxyn3mel1
   g==;
X-CSE-ConnectionGUID: DbEvIB6IQgCzE8DBOUeVYA==
X-CSE-MsgGUID: 1zyV5pM2TCe5H7u4K9g+Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13535979"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13535979"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:58:39 -0700
X-CSE-ConnectionGUID: p0fgFjowTCi8F/uqwZO8cQ==
X-CSE-MsgGUID: 6x/And7HTMy9SXLnL/ydyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35873104"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:58:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 833D311FA4A;
	Wed, 29 May 2024 09:58:35 +0300 (EEST)
Date: Wed, 29 May 2024 06:58:35 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com
Subject: Re: [PATCH v2] media: intel/ipu6: add csi2 port sanity check in
 notifier bound
Message-ID: <ZlbSG4hv825PnyEW@kekkonen.localdomain>
References: <20240529064321.687415-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529064321.687415-1-bingbu.cao@intel.com>

On Wed, May 29, 2024 at 02:43:21PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Invalid csi2 port will break the isys notifier bound ops as it is
> trying to access an invalid csi2 sub-device instance based on the
> port. It will trigger a mc warning, and it will cause the sensor
> driver to unbound an inexistent isys csi2 and crash. Adding a
> csi2 port sanity check, return error to avoid such case.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks, Bingbu!

Both applied, this one got:

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")

-- 
Sakari Ailus

