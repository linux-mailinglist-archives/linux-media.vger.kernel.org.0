Return-Path: <linux-media+bounces-19023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534098EBBF
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51CB72839FA
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2327013CFB8;
	Thu,  3 Oct 2024 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFoqQpwc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8813B280;
	Thu,  3 Oct 2024 08:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944633; cv=none; b=deJqmtQGWJAuDg+nY7I+GaXauvE52U6rVSHwVIOWm8eo3sVJFBg0ZIqCCem6DU13cxJfDmOao5zF1RIWE6B19tlJhJdSZBFwkjvmb0Qos+pxcjeUEzVJaIdqRe2c60b03xNn9k5NDOOGX4vU/l4Mm22VbCVTlYq6huZVt0Ik21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944633; c=relaxed/simple;
	bh=/J1Mq3LUjuws8ZS8jbgSSX0fkiVGHMXLXkitxD54E9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4VgFNtSjlZUFZszgfgknvnBHrn1yyhToeYcL0iZCcRBbgeg8XlBqpfY0tjolHs8aoA1MdUPiTyyo7hVrTs9ceYzHYsgXHAQrnm+Ws74mxmnvBSKE0xuCcc0cBAHx8VRRLx8bVxjU3xGZX2kchuxh/dBtqlo6qVhuHhOI69W9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFoqQpwc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727944631; x=1759480631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/J1Mq3LUjuws8ZS8jbgSSX0fkiVGHMXLXkitxD54E9E=;
  b=WFoqQpwcWZMDGlyzXtxzCwZXhkQB5btPBTVby9Bj32ynCzqo63iZ0Gzg
   mPmXbJV72ZHjFKO8CmsDr+Wv8Qk/YpCwNlEwfwwgRnJ7MmUcx2kaT1TOx
   McOePYjvWanF4p4/+0f5icaW8CEeuOvNoJBlGy7D6IsjgCNlU5/NObdjo
   5fVmpKXW024IRYHIamaJY3zMsN6vRMXr33XOL5pKiTnTa8k1XK+Hq8jaP
   0NzeNYdrYQpDmdUAksZWWpi3EX2Fou0d3f0DCUYOZ0zg8vSkfhmAeBqb7
   trhhtIt3yEXy+p3JwgqIBmTHDyTpoE3cqpOh1ePd6HXlZB8DPUBKAfGR5
   g==;
X-CSE-ConnectionGUID: cY01qer1TmGavdyeU+10Yw==
X-CSE-MsgGUID: zalWWt5/Q/yTx42/GdX9ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44656914"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="44656914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 01:37:10 -0700
X-CSE-ConnectionGUID: p3hrlGxKRUqxgl9a8avMSQ==
X-CSE-MsgGUID: gwEo7SiZTui3zH9FbnOqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73865629"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 01:37:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A97FB11F83B;
	Thu,  3 Oct 2024 11:37:04 +0300 (EEST)
Date: Thu, 3 Oct 2024 08:37:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hridesh MG <hridesh699@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: fix spelling mistakes
Message-ID: <Zv5XsJd965xdNI3j@kekkonen.localdomain>
References: <20241002152231.8828-1-hridesh699@gmail.com>
 <2163bf83-dd55-4f79-b0ea-834fa7b1f561@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2163bf83-dd55-4f79-b0ea-834fa7b1f561@xs4all.nl>

On Thu, Oct 03, 2024 at 08:52:02AM +0200, Hans Verkuil wrote:
> On 02/10/2024 17:22, Hridesh MG wrote:
> > Fix three minor spelling/grammar issues:
> > 	chunck -> chunk
> > 	procotol -> protocol
> > 	follow -> following
> > 
> > Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> 
> Please always include the driver name in the Subject:
> 
> staging: media: ipu3:
> 
> That way the ipu3 maintainer will notice the patch.

Well I was cc'd. ;)

I can fix that while applying, no need for v3...

Hridesh: it's a good idea to check which subject prefix is used for a
driver in the commit log, too.

-- 
Sakari Ailus

