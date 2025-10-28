Return-Path: <linux-media+bounces-45875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726BC1696E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFD81C23713
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38B2348473;
	Tue, 28 Oct 2025 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrtdfV/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFE1AC44D
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679201; cv=none; b=H71GK4KMPnjhXy/aIter94Rjzej2fJHJNiK6K00speDzoMkH7k8Bo9dhMyWLBSvSHVJ3j6HdwmFAWL0j3/r3nE8y3azECApTYwDfFN0Zn/NdowVomglALwQZb+CM4B/ZWLthAss6lp1mU9z4hFmjTtk7lm6EqsKNbv5jzbSjVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679201; c=relaxed/simple;
	bh=9aVeWS9YvjgKYRq35IlRpaDLGEG78KEtwk0OBgx6Y7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcKIussmuhoL7gsl7j1JvwELWsDPZ1wsUys0nuoSnCjwNJObN6cDNRuTdBBaBxnVo8B/F+Ff1yp13cp3e7xqYBkrv/VWEIqA0pPoQUIMjV0DS+6JDtCYnhsAlyM8gKTTEaMdWQxVQk4msn7aMMKAJEKeih/xT9ZHdwnjq5VqvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrtdfV/L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761679198; x=1793215198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9aVeWS9YvjgKYRq35IlRpaDLGEG78KEtwk0OBgx6Y7Y=;
  b=lrtdfV/L3jf3pVM/Y4MX5rWZFsn4Hx0DkaE3r6mYm0lp1GhFyFy9Lvun
   nTONGupcbzXzd00cT+s2yjjMLiR3i/eU1dTZ5tiNSDKSZMjSmjE5V1MC+
   P99dMzYlS6+EM1Z2XVvAmrHqkgf//mkhVAkv/XfGwWBRbDSnlkgRKfYXx
   Ab8NjQYrVuu2JXbldabxz4JhH+g/MEH/KR0fPYLhppj+/VK44u4URUe6C
   H03UO1ldipV18/TDLuJ3tueT8vsMS3gRLcPCJhR/Hv0ufkH6LgMzIXYS3
   HNvTg4olK6YslhcqTM3wxS+Q6ZVbW0kTfbIuHWNiwD1e1U/5UuVekwg+Y
   g==;
X-CSE-ConnectionGUID: F/dKE/o+QIycrFASJfaBPA==
X-CSE-MsgGUID: IIaO7pdlRK2c7GDqXWV3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75135279"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="75135279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:19:57 -0700
X-CSE-ConnectionGUID: CCO1r0JFSpu4Ozh33fnVnw==
X-CSE-MsgGUID: Jq7P1IpOSue3ROd1gb7+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185134041"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:19:57 -0700
Date: Tue, 28 Oct 2025 20:19:50 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 18/25] media: i2c: ov01a10: Replace exposure->min/step
 with direct define use
Message-ID: <ii24shneakom7xmn2ck3r5j2444po6hp5howwjg6d7g5rmbsld@ah4vdmgpxxan>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-19-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-19-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:26PM +0200, Hans de Goede wrote:
> The exposure minimum and step are constant use the defines for this
> instead of retrieving these from the exposure-control.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Hans de Goede <hansg@kernel.org>

