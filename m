Return-Path: <linux-media+bounces-27035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F95AA45FF5
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B96174EB2
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C6821B9CA;
	Wed, 26 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXJduQeG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88313BAE4;
	Wed, 26 Feb 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574872; cv=none; b=IPjIu7gUXd1agHD61UoUC5a9C97+CYverJkoHlFKub4UbYW/+qjKTgWvDRdsldbdPUZLQPCjYdefCkfc4WKwbP5mqNMzJZb00MxXvpC76nNsOUrGTfgIoIR5gA3BZuuhBYj2JSDiVpRPrecHdSUNyqhrG8nxrA5ENQhO02pSD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574872; c=relaxed/simple;
	bh=A8QKChVlUKsBmVYbUeoNA+VyGNYEQSe0FDjm2a4c2W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw3P0yx1eYULQtg5Ixt0HH/1Rx3w6ZEroBDZ08uQpZU3uIkpCB9v88cIuq/Jh2NKyxukuY6RxwThBF2CftA1L0U4u2BQ8Kc0RInJpZZFcs7ms6396pHT5urPk4DWhj6ybhUJ4AdL0Vb98i4AzE8Fl/FXRpiypUHPjyNSfnDqBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXJduQeG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740574870; x=1772110870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A8QKChVlUKsBmVYbUeoNA+VyGNYEQSe0FDjm2a4c2W4=;
  b=kXJduQeGez3jrOnQEr6kOfSE/5GVsvd1aBjyUurZiFcjYEi5ltAd/sTB
   uas54K74+a/sS+2cZJgv/iDiSlPiRvZB1rkLYfYjZ/wT62m1J+Cpk2dge
   mTDK70zJ/YZ6/rjWQllsC+deI5jT4LsmIRa1vUcf97Ilt1bDtMZDAJSJt
   Dihquxy1wSv+zs3v3FZ0EcjtyQ//7jOp1cv2KGEPxb0DjqqcfxtqqN3Vo
   E5kN2LY5drO//81b0E1I5jP96Uc+65K+JDCxc34aNngbxvi4UehS6j9na
   M5Qc8ykMjSq0mpwhLLGReIoBnu4hHoO1nWCKxL8wpivZqXAUxXZMuo5ak
   g==;
X-CSE-ConnectionGUID: l8IxWQ/pSomJPLB0iXIXuA==
X-CSE-MsgGUID: PJAUGhU7Tjy1Mzh4Vkmbpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52050650"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="52050650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:01:10 -0800
X-CSE-ConnectionGUID: 0ZO+v/QpRxWHq/ccWnfWhQ==
X-CSE-MsgGUID: BfU+kwl/R6esYFOaoReFUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121945785"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:01:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97F7211F944;
	Wed, 26 Feb 2025 15:01:05 +0200 (EET)
Date: Wed, 26 Feb 2025 13:01:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Message-ID: <Z78QkUcv8-CBbvBS@kekkonen.localdomain>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
 <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
 <ljhusn3jkbq64rn2ureul5kurenjwrtu7ppv5jjx5i542goe65@h4oltlieomfp>
 <CAPY8ntD3k48cPfOQK2iEveLHahhFMV9JMwfq3sV-SvnrsZkxng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD3k48cPfOQK2iEveLHahhFMV9JMwfq3sV-SvnrsZkxng@mail.gmail.com>

Hi Dave, Richard,

On Wed, Feb 26, 2025 at 12:52:46PM +0000, Dave Stevenson wrote:
> > So please feel free to ignore this patch. Should I send a new series
> > with just the two minor patches of this series? Or should I include them
> > in the next series for the ov9282 driver?
> 
> Up to Sakari.
> The other two patches have my R-b responses, so taking those two and
> ignoring this one should be fairly simple, but it just depends upon
> workflows.

I can pick the two first patches of the set now.

-- 
Regards,

Sakari Ailus

