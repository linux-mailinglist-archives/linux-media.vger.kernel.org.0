Return-Path: <linux-media+bounces-6619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDA874CCE
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 11:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38BE2818E9
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC6126F2A;
	Thu,  7 Mar 2024 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlfhpVwt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578A5839F6
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709809060; cv=none; b=DB/DuYxXMiv1AANzhkvM74kPDkdzoTUbLP3V7aiOEEKpSwL/fyKqtowlDiip5ePGfqvKhllVyfCqLDx4ycCJG1vxP+dAWR5zErLhH+Z+VqsiUoSionTpHgHQS8rAjGA82v18ilUIQ+jc6g3hAOwkTzsL+ZnPCPXYVpMzTyVAowQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709809060; c=relaxed/simple;
	bh=4kkaTvLOfyKxtFzv27mzmlSZVwTwkruOHUJ0QgCzuQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWdmKXba6XLn5J0HyRXiIPMmpeWZFiw9/R/qmVwWWvYqUuDjoaoTdPPBglHH22fvqPU/w6Iuy/SyhxbgbxOtdvSsLNHzUfh+lxzO+/hlGzQ+QGiEw8uBSVCq1Db13oW+3r6lMwSM+3JjCYX/J1OmDEVAxkQhp29QcTnaf0uLsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlfhpVwt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709809060; x=1741345060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kkaTvLOfyKxtFzv27mzmlSZVwTwkruOHUJ0QgCzuQE=;
  b=RlfhpVwt5pY0fLmawUgfMZA/BeP4fQnovVl0SbBATubnfWMW+ZduUtZg
   /IzdDPFsZcoEGPwexWTNl/4knwKC9C+q95Zdz2oo9dvAhg6jCHSskdojP
   wnNyDd5uI3Y9BUgnqPWN10H9PXKPuavIr1Z29iB6NjX6M7LjywXaADYWF
   G190oPqkInLJnYw9HHgqIHE+YABMVpL5ScsLQzWky9pNRpNhhSm67uoDj
   E2qdcROoTrikqspwbtdWuQRqlAU5zLnUEwqmiu/gJ6VG8XlZwzCEn+nLI
   ZVWO+EGYEFHdfope/P221kHp9LQO2nV6bRJkb7Ikk97lrBm3MfnAHMzXD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="26945784"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="26945784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 02:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="10151189"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 02:57:38 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E5EAD11F819;
	Thu,  7 Mar 2024 12:57:34 +0200 (EET)
Date: Thu, 7 Mar 2024 10:57:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 00/29] Media device lifetime management
Message-ID: <ZemdnvJt0Qw_wk0D@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20240207105500.GL23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207105500.GL23702@pendragon.ideasonboard.com>

On Wed, Feb 07, 2024 at 12:55:00PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> I've just noticed that I send multiple Reviewed-by tags for this series
> using Laurent Pinchart <laurent.pinchart@ideasonboard.com> when I meant
> Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>. Could you
> replace the e-mail address when picking up the tags ?Sorry about the
> inconvenience.

No problem. I'll do it for v3.

-- 
Sakari Ailus

