Return-Path: <linux-media+bounces-13476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4190B8DF
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2201C23D4D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDE6198A2C;
	Mon, 17 Jun 2024 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPap/inV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB5A19409A
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647188; cv=none; b=Vbij/BYmk9fzaf7bl2xQxCB0jxB8g65fDeLexVxLN8IgHASYsvgxnxN4U2/J8EBSq1YcEgD1q37ADrixUYsOpcKcdtLfTxWvhN9nZCV0at2BvozlPiw7VBvWfK2TNASb4lCIgoushzIwykrBnDMb4o+CllZDSj7IBaGDySM9ZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647188; c=relaxed/simple;
	bh=fEdhIw05VbDcyWHh/X6xJ6bXP0sJXRz3jcGtJkxDW4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNjwaRO2nMsktppmOF2uD3mMaKQUzxt2Bk+f6E1VS2Kp7mVGBPwJWsrexetLXyWsdYcmAve/2VBq+gvvNna9O8JQzO0lbGyK9M5OlEbjEmDYR1fES3RawCRwFSOufJkguqWJICrp3qkKDwAebX83z6BD/N1HnYGpUIr/T2Jxepg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPap/inV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718647186; x=1750183186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fEdhIw05VbDcyWHh/X6xJ6bXP0sJXRz3jcGtJkxDW4I=;
  b=RPap/inVwjZ6tTkSxogksNF8qAZSmj9uf8YFZ40tIwgrfW8P4lwBwlSF
   m3Bm68BZcomDa1uHaHbYU+fNPJuWsmt8rbHC1BdZDw936K69uzk+2BU5c
   IJQ8CL+5rgNKz+Ykj+jt3smfcol/OdhnQRMg8+Y/Zzg+7Gy3NSrwxu9U8
   lc2ZRaew6mNa0ZAM9hrmtbOv4M6kLo9yeZ0JpzbLzIuImutFZa+cSe5Ow
   9Tv5dQSuNADr/nXhdgONvW1fdd02XGZvpEvkPU5HTbmUh/WaJW4P2oVf6
   Uzxk6mpoC5LmscoO5ISazF/dAK+ltSHA8tlmYgRVuJFr80irEL+4N8FRI
   Q==;
X-CSE-ConnectionGUID: sPfZPSXHS3iOhVNwotDTwA==
X-CSE-MsgGUID: yyxsegncQj6+OU9TLdL/Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19343107"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="19343107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:59:45 -0700
X-CSE-ConnectionGUID: 7Mlf/XmAQ8WyPP6GxC4q4g==
X-CSE-MsgGUID: HIbs2hUaTAmBamH0BA7M8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45707530"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:59:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1022811F9DB;
	Mon, 17 Jun 2024 20:59:42 +0300 (EEST)
Date: Mon, 17 Jun 2024 17:59:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 12/26] media: mc: Shuffle functions around
Message-ID: <ZnB5jtl11MrAod2R@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-13-sakari.ailus@linux.intel.com>
 <32a7845d-47ec-4af6-9255-8aa375ded3ba@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a7845d-47ec-4af6-9255-8aa375ded3ba@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 11:41:10AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > As the call paths of the functions in question will change, move them
> > around in anticipation of that. No other changes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> 
> That should be:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

To be addressed for v5, the same for 16th patch.

-- 
Sakari Ailus

