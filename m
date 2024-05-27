Return-Path: <linux-media+bounces-12017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A18D0E6D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E1DDB213EB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D15224D1;
	Mon, 27 May 2024 19:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8MvD/na"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1611BC59;
	Mon, 27 May 2024 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839835; cv=none; b=BoV/KYCjgPzmfiAqVhQikvvdR88ogaBZTa2I2ZyFM1HhlWMDa4DRX5qn6XbeoY/k9NMyglhRthCJdkG792pgROTjZ9aF5DN19yhNAoxvCwZlOKJVyJrkkQMewTX9wVB/vfl0m/jvZwI6VkWHMqP9ZIUYFvPOuKaVCuBXWb8d5CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839835; c=relaxed/simple;
	bh=z3pBLhTXeWyJ4ntRf/6D2WXOYB/+fMCypeJjEMjWUwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzK815AcG8miJCguOxyk89QiORgUoX6fnZQisEbMBiiKZ7y+UgPkgb+LiKnLxL5OkrHZQ3hqYj2OGf/YPPybBfmUtTkChbUh0AM1bC1dblCKkWJElZB+5FCchTX/yk4vODs8W3nOUUrcnthwqrKAmHpttzer2JLKCFSAvSYNL7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8MvD/na; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839833; x=1748375833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z3pBLhTXeWyJ4ntRf/6D2WXOYB/+fMCypeJjEMjWUwM=;
  b=F8MvD/naFh/W3HXVBO2gqqB1hA4f/0vfaSgXWPL51rcC3jb0R7mwuHgV
   Qx0kaZ6XLI7OKP4SL8Y37uAW7YnJFscsIzyKsg/Fax7cvQyuO+v7RSwhM
   1Vlu6LYHft9iS1G8g9pPLvyRbqSn11ejIJ+4XF1tY9/tqoIGxyQ1xTDqB
   LRlBbfuOfnFT4iOdN64RtPmo9npO5LEzQpmMRxxsSgvcpqnI60vIdtyBz
   BRI+jAIy5SjJaob5tE64lIjHdAM5kxAUEtyYPwhxzM7Z/j8lzk10I8SEy
   +Rlkz/tqA72ioMrgX/LvNBiUbp9X9Sbcl0c4Eqt5ufJiB8BzY0J4Kp9u8
   w==;
X-CSE-ConnectionGUID: +n8pOiTFQxCyHSRWopzvbg==
X-CSE-MsgGUID: h5FwC0cWStSIQMauN6+0cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38551442"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="38551442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:57:13 -0700
X-CSE-ConnectionGUID: TzUF9euaQ2qTdrrbu1VfsA==
X-CSE-MsgGUID: zRS0ZPKLRUeibPAtWsvaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39388351"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:57:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 041F111F965;
	Mon, 27 May 2024 22:57:09 +0300 (EEST)
Date: Mon, 27 May 2024 19:57:08 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
	wentong.wu@intel.com, linux-media@vger.kernel.org
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
Message-ID: <ZlTllJeZBiGapHwZ@kekkonen.localdomain>
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>

Hi,

Thanks for reporting this.

On Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:
> 
> First happened in 6.10-rc1 (6.9.2 stable is fine)  

Do you happen to have .config available? A full dmesg would also be
helpful.

Does the system crash after the warning or not?

-- 
Regards,

Sakari Ailus

