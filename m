Return-Path: <linux-media+bounces-30163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62253A880DA
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5B81898C85
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0F12BD5B6;
	Mon, 14 Apr 2025 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXLcRBab"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A881B4159
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635156; cv=none; b=Q4tyWcd+txwmQahGXBSoUokDoOJZDPw5LfIYOcamPhrmEe6Aeb6arZAymu5tjm0jDhVJqj/Q4+5PeQtMASq1BsbomFAkoxz6bH+/NkPy74im1fgOCVv/+GQ0F6D45KP9jyYlbzk7GbOSgeK7Fm7uYPkaMqS5Lp14l2ge0M7q35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635156; c=relaxed/simple;
	bh=SRzMVlNbPKq903nI9tWOf/JWp1j0U7u6e0L3uEsUF/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHS7CNHFeXrQwZSAeo2UkrMKRwkIHI99Nq+mOmXBV5Yye/rdFkRVDuK13H6Yao+p1yPXFhqzbP6Kj32eKG3iVTF+Pgu5+jR7OS4sc9yljEaIdpnAKJ5TXqBcx2JJLS7/1Lr7WhDSPTtyFrWLiSfUWjeTmWVBmtaGfeazmCJ+wwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXLcRBab; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744635155; x=1776171155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SRzMVlNbPKq903nI9tWOf/JWp1j0U7u6e0L3uEsUF/I=;
  b=RXLcRBabDbQ01fOKBZShAAzLpaXBQD5NiEkYuXi1roCU5MJoV6OCwOx1
   eauGrpNCnzcIhXLO6lTqW9uD/B1M/8cL73l6DzXoyE3zF72xWluH+s2CL
   GCefwB/AtJquCAayrZoNEMOY7sZs5F/+DNX6RPgUh5N5mCFwBaxCYODiI
   Cre0UZS/LIlCyO00s9SDX0SxrCs8hfK1/NFg7a2zp8LomsoiImya7wYIl
   lB2psMp/8VZDVjhqfeGT6oMbGvklDZxFfhO+tJzepWsH5ESbyjGrEZqNi
   AHZCaEM6TWPzuLBLMb0P2l87xgw4ly9aIlK2UazJOtlkayTvKLqmz60ZG
   g==;
X-CSE-ConnectionGUID: JUIMqRKQRzy5F2B19UFP4Q==
X-CSE-MsgGUID: v8dfMA5ET/qp7rhPSBYy4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45983109"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45983109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:52:34 -0700
X-CSE-ConnectionGUID: 5/ZNbR9+R9CcdaUwUR0pKg==
X-CSE-MsgGUID: jvUkKxsCQ0OBm8MAwgSAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130786824"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:52:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CA7211F871;
	Mon, 14 Apr 2025 15:52:30 +0300 (EEST)
Date: Mon, 14 Apr 2025 12:52:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 0/7] media: intel/ipu6: continue on ipu7 code sharing
 preparation
Message-ID: <Z_0FDdWUhACmBGMj@kekkonen.localdomain>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
 <Z_fk_ofTOzsvbRwZ@kekkonen.localdomain>
 <Z/zfbpSmzCDOW9mo@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/zfbpSmzCDOW9mo@linux.intel.com>

On Mon, Apr 14, 2025 at 12:11:58PM +0200, Stanislaw Gruszka wrote:
> On Thu, Apr 10, 2025 at 03:34:22PM +0000, Sakari Ailus wrote:
> > Hi Stanislaw,
> > 
> > On Mon, Apr 07, 2025 at 03:40:30PM +0200, Stanislaw Gruszka wrote:
> > > Move and rename more structures to isys.h. Add accessors to make 
> > > further transformation easier.
> > > 
> > > This is on top of:
> > > https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
> > > plus:
> > > https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
> > > https://lore.kernel.org/linux-media/20250401090953.473339-1-stanislaw.gruszka@linux.intel.com/
> > > 
> > > Stanislaw Gruszka (7):
> > >   media: intel/ipu6: Use isd name in isys.h
> > >   media: intel/ipu6: Remove line_align
> > >   media: intel/ipu6: Move common structures definitions to isys.h
> > >   media: intel/ipu6: Rename common structures
> > >   media: intel/ipu6: Remove deprecated lock comment
> > >   media: intel/ipu6: Introduce isys and dev accessors macros
> > >   media: intel/ipu6: Start using accessors to get dev pointer
> > 
> > My main comment to the set is naming. Can we do so that we keep the current
> > scheme (ipu or ipu-isys prefix, with or without IPU generation number) and
> > then reconsider this question when the result (hopefully including IPU 7
> > ISYS support) is in upstream?
> 
> Ok, I'll use ipu_isys_ prefix for functions, structures and some macros.
> However for some macros I think it would make sense to skip ipu prefix to
> make the names shorter.

I'd keep it also in macro names, but not necessarily twice as in some cases
currently.

-- 
Sakari Ailus

