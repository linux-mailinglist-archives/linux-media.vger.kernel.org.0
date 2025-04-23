Return-Path: <linux-media+bounces-30793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A1A98922
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C7D07AB923
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD24214813;
	Wed, 23 Apr 2025 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE8wPpJz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28521F0987
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409866; cv=none; b=K7ngnmfs5iq2z93pjhkobTcU7uQeJhW/wzEX6h8ImafIu2KtsV5Tp+bplFv3CsXr5lCx4v8PaoQIxgTrUs7aWfnYtP2H5R+k5X6Bu34x/5nVtioz0kS7i3yUQMHJ60o1xzXTS/E4VpQdVeS29ML+qifWryibkZu///n17zuMx3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409866; c=relaxed/simple;
	bh=byCQ03vsiIGvSgQiCvVnbCTkkz4F6l7gmbuAio4HxOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZzmjPCnhOJQOAxaTo+yPBWx4niIxtdLPr2H0CvqsFeUoPer3h7QY2DAKv1wjlPv4AxlyE2tAWsrmd/TJHQfSQhEASYwtdVC92Em+c56knOWyJA5woqLrRqBc0SnZ3Whq0uLa1+jHa2yyna3DjQstcBCwHl0xsOPI2fKtSC5nww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lE8wPpJz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745409865; x=1776945865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=byCQ03vsiIGvSgQiCvVnbCTkkz4F6l7gmbuAio4HxOQ=;
  b=lE8wPpJzXsf9cvndKFbNI55X4fA/NVCJFcV4X657SsY669KMgoMW2a1m
   v4NmYDgE06uaog+cCKLLup6w/n9CA2ncriL0n2J+tRB42rkXcLqBZ2aqy
   XmP/v9XT6uES2WEEktXztqU7IPr0doCz2Y9RWLloKYaxIZ+9mLI342JB/
   YqeejwstDlg0gljhP/snZQi8r9Ia8G/wCihf9VOzBc1pOIXyy2UDUWCH5
   db/1o/fmMEMDzjswIkYbP+p5201sktUgWOX5QPMYhup79fjgNLirYx7Sl
   mZEokV61EeJtiqB+YCn4yBf2wtQIrSRoiI1tQ43It32JW/XiZuz/Bs+ML
   w==;
X-CSE-ConnectionGUID: j6mu5A1pR/e6e0Iq87FH9w==
X-CSE-MsgGUID: 0Qiw9vz1SLCBn9CSSTS+mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46877767"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46877767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:04:24 -0700
X-CSE-ConnectionGUID: cU78U+lTQdiykAoPqZh3ug==
X-CSE-MsgGUID: A3fvvzoKS+qgcohx+bZXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136373235"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:04:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C138911F9FE;
	Wed, 23 Apr 2025 15:04:20 +0300 (EEST)
Date: Wed, 23 Apr 2025 12:04:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 06/11] media: ccs-pll: Drop LINK_DECOUPLED flag
Message-ID: <aAjXRGKmIByRd25l@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-7-sakari.ailus@linux.intel.com>
 <20250421200331.GG17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421200331.GG17813@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 21, 2025 at 11:03:31PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 17, 2025 at 09:53:49AM +0300, Sakari Ailus wrote:
> > The LINK_DECOUPLED flag wasn't used by the PLL calculator other than
> 
> s/wasn't/isn't/

To be fixed for v3:

I presume:

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

as there were no other comments. Please let me know if that's not correct.

-- 
Sakari Ailus

