Return-Path: <linux-media+bounces-13432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D76ED90ADBF
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 14:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C4B4288CBE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC46B190052;
	Mon, 17 Jun 2024 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ07UC55"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1A7345E
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626512; cv=none; b=YrW+dfsHjvNJkeqEqkFGBq+SVVYk3ptRMtQirn6fSWjOni4APzHSd9zhr2SXWg4DbDVXMe7ozsfOqRW/k81ip7I38Uci7YV23gedc1sqqI9QroNDvIqVY5EdMP49UK3Mvco5sdnXXYRBLH5gNA/+OilDQ6N7ipdSt7cGRrm+PMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626512; c=relaxed/simple;
	bh=UWmoXljec8lSoo7KP2L71LZ8feX+k/XSvb8J3Uy7NSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsB23vVJIGm5oPjDAE3V1zXLjEuXksoc+U0TwJyN47k8daNJ2y9G6hd9ix3SKgx2nCJqjtVnJzjNXig5TBxN3QwsYMiIhStajX/IkpebRB1xu5ZrnQST3GdtNSc8ULfGADiu1n3EHYyYnRS51vmHG++zFxQXI/zoy11yskcDA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ07UC55; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718626511; x=1750162511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWmoXljec8lSoo7KP2L71LZ8feX+k/XSvb8J3Uy7NSs=;
  b=aZ07UC55mX/MJRkqoDMCNmooKvtXfKb8QYLFb4n0JdJPpvxX5jOQiW9r
   IEk4lbcxT3oRCvbbCog4Bq2rqOQqIcjGA3g5cO8aw3O9Y5pImOBlYpn/b
   KBpmbCbLYMOoWDMRFK3JF0bYM6v+ZQpbrppzo6oy8r2bsPUXqn7KdOXM8
   HCtzhFXH4q5UcdIciO3GpwLQ2x59l+pIh2jzSRCRlRaKv2WugqbXi9xyg
   1mKS9xMVs92xHhTk4H8oBHDTiP6oVg5bmE4gPmmtjPhUsCaBxIqjIwlua
   yDPVbkhrug9ZJWi054jz5BMfTXV/SdgP9L2aSPpJgnH2HuGGA/aUbMGq2
   g==;
X-CSE-ConnectionGUID: TUhjZslPSA6wEauJCMgDXA==
X-CSE-MsgGUID: lhx1rYL3SyGqHsbzshVkVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15676806"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15676806"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 05:15:10 -0700
X-CSE-ConnectionGUID: ZWjYR8XiSlWuNqVk5g5ruQ==
X-CSE-MsgGUID: YpOuIl+kRPC60ML6rQXJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46105561"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 05:15:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BBB6C11F7E1;
	Mon, 17 Jun 2024 15:15:06 +0300 (EEST)
Date: Mon, 17 Jun 2024 12:15:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 08/26] media: mc: Do not call cdev_device_del() if
 cdev_device_add() fails
Message-ID: <ZnAoykfQJFSTNEOd@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-9-sakari.ailus@linux.intel.com>
 <f60178f3-2cc0-4f3a-b1ed-0e90d0d7ef60@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f60178f3-2cc0-4f3a-b1ed-0e90d0d7ef60@xs4all.nl>


Hi Hans,
On Mon, Jun 17, 2024 at 11:13:57AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > cdev_device_del() is the right function to remove a device when
> > cdev_device_add() succeeds. If it does not, however, put_device() needs to
> > be used instead. Fix this.
> 
> Hmm, this too is due to a revert patch (03/26) removing something that needs
> to be reinstated.
> 
> Wouldn't it be better to fold this into 04/26, with a comment in the commit
> log of that commit?

I agree, I'll fold it there.

> 
> The problem with this commit log is that it suggests that it fixes a bug,
> when really it just corrects something introduced by a revert.

-- 
Kind regards,

Sakari Ailus

