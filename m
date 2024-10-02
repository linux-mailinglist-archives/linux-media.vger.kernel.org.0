Return-Path: <linux-media+bounces-18991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C598D176
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 12:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4121C20F6F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C7D1E7655;
	Wed,  2 Oct 2024 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVLgQqZK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8451E500C;
	Wed,  2 Oct 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865718; cv=none; b=AlFtpFdLdU9YP95Uj5vO7gBLJkWoyTQoZZ/X/zG5KDvA4RZtn2wdBM/xd9C0Q14gTVXu8heev3MaAVxoT+YpvESZ+JrVLvxOFgPBF4iEOw/HWJ78XuKcDUAegACDauVnZWQdzdgiOLg6lWzQ7WYt3C1ujzuU/8cjMGk2jD60D2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865718; c=relaxed/simple;
	bh=0M4hzFNAI5PkYldwN+ROoV3co0gANIadwZX+5yLYlwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWcRtRCwamyWHb4EvoNezbruSJNAPrARNEaQ+La0X3JSlVXpqMwc9/GO6tyG3qoM79XkPlQ8eFJIZh+fmkgmbNSOz7l5OGzGXuSW94B9nbOaMVlWejsrWN33f+RphBT7vp4Zk43lwHln4aZmjuz1SAxssxtOw91o4EmxFXWiNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVLgQqZK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727865717; x=1759401717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0M4hzFNAI5PkYldwN+ROoV3co0gANIadwZX+5yLYlwc=;
  b=JVLgQqZK3YOE+MDI9EIuxQ+yjICX3NThDKPhL0hIS6I2buHJQC+ZDBgY
   a0FFz8/36SAuR/JCUobxznMmY6o1ceuaOKkpkDeu8wz+IqoxjoNbFUL34
   dR0ShCR49SMz9ONaHCPzKAqw1u5MYM3nWM4NZtbvoGM49EML/DPEfNQxI
   PkuVAU9rhXGrUnm53shvSFyEwjGq7vDItXU6+6sBZqXeGdQI95EhQEfUv
   YuvAy2uvr6DLELOQe4U6McT0hvf0/ofQPs0ld3BWCNNnUzIlWqryL0ETF
   9iAilzJu/7oDvNarZikOxgyvr2Leh+/k/RBPADABxqkUPM1V/mUvGvqYW
   Q==;
X-CSE-ConnectionGUID: 5U/Nusk4QkC3eih/w0xtbg==
X-CSE-MsgGUID: Ap5dtv1TRoeYn7Bom3LjYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27179069"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27179069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:41:56 -0700
X-CSE-ConnectionGUID: 7p/ipJgfQHWnR+Kz9HM0lQ==
X-CSE-MsgGUID: 4XJz04EUSQOMQ9THDZCGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="104770355"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:41:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1630011F802;
	Wed,  2 Oct 2024 13:41:51 +0300 (EEST)
Date: Wed, 2 Oct 2024 10:41:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] staging: media: fix spelling mistakes
Message-ID: <Zv0jb4i_4wDxKJUn@kekkonen.localdomain>
References: <20241002101106.56658-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002101106.56658-1-hridesh699@gmail.com>

Hi Hridesh,

On Wed, Oct 02, 2024 at 03:41:04PM +0530, Hridesh MG wrote:
> fix two minor spelling/grammar issues

Sentences begin with a capital letter and end in a period (.).

Looks fine otherwise. So please pay attention to the commit message.

-- 
Kind regards,

Sakari Ailus

