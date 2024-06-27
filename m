Return-Path: <linux-media+bounces-14228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B268A91A013
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 09:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D88D28377D
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 07:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F10947A6A;
	Thu, 27 Jun 2024 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/fsvD3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F114317C
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 07:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472321; cv=none; b=jFMIUuT5LYeb2tor7RrxOP2Jgd7Y4KFBTiHmbqeLZ4Q2DS2K7K8nR/3DLJwn6Yqa4JXuKqoHkSi1V+fMbgmY+hPed4DQA3psv7JJNRKoTicVFEnin+fQD4RNo2nZJze1pG7781rElvpmVEEvPcMx/E0VG8d8nVTk1FmNRJNeTXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472321; c=relaxed/simple;
	bh=WiS4uXdiERAOkHjtzIqr+A5KZApyjMu70L+rhfl3ygE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBxJ7xsyxknMLRU/q67btIlxrZ75723p0m6lVxWBbMF7fcoRftlYzeLRu4ka5pIJmOzh91UlL82vJefDhlvsp/b85K89LMXaPPdxGRYNBI7id6i+5Jk4TsO9wuZ1UK8yBizWGKo6bWtX5/ATu7yIcLafOQeeDGyKe+dEFYtQiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/fsvD3Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719472320; x=1751008320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WiS4uXdiERAOkHjtzIqr+A5KZApyjMu70L+rhfl3ygE=;
  b=F/fsvD3Q2cXeiHeOw5rSDJDYYmvW9oRuQUlSpvdm3N0q8eAlyI81TOvx
   wCEyFc0Lr9+wjU+C6y7s6DS36P8IA4rQ5T7P4T7hJspbgUE03cgzWyB1z
   Gk7oik3QmgAvyIwRIcNPfzZjYOmUcUTKhu9CRRXLs57qcJFJityUdAXXC
   zz8YRNoRhFEOhnf4tQrt2f5AXBPyQ0CxouM3pEEy8/nAJGzxCQMnXqV+5
   cJFB08Xddy2BpNqJh/OIDNYEVUBYsGyN2WaMzkzoxnv4I8eCOifyhoFul
   wQJek44ts3TyWyA9eqn0JaFSIgrPEwcTtcHds/q9PL4Ja8SrNiN+xT2cx
   w==;
X-CSE-ConnectionGUID: t+FsRy9sRFycBMp8+oBKsA==
X-CSE-MsgGUID: IWSLXnreQNSyg5aWZTvJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16726437"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16726437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:11:59 -0700
X-CSE-ConnectionGUID: W/Gfa0zVStW7+NVk8/ZLFg==
X-CSE-MsgGUID: wQRdF1G1Swa00S1nhkfkbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44699801"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:10:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 85EB811F965;
	Thu, 27 Jun 2024 10:10:49 +0300 (EEST)
Date: Thu, 27 Jun 2024 07:10:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 10/26] media: mc: Clear minor number reservation at
 unregistration time
Message-ID: <Zn0QeZ_qNqx9uFnD@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-11-sakari.ailus@linux.intel.com>
 <32455d69-1bb0-4318-a2b6-92335ed0b7cc@xs4all.nl>
 <Zn0NezVBinBib84r@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn0NezVBinBib84r@kekkonen.localdomain>

On Thu, Jun 27, 2024 at 06:58:03AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jun 27, 2024 at 08:43:47AM +0200, Hans Verkuil wrote:
> > On 10/06/2024 12:05, Sakari Ailus wrote:
> > > Clear the media device's minor number reservation at unregister time as
> > > there's no need to keep it reserved for longer. This makes it possible to
> > > reserve the same minor right after unregistration.
> > 
> > Have you tested this?
> 
> By unbinding and re-binding a device while file handles to the old Media
> device one are still around.

Also in MC we don't have an array indexed by minor numbers of Media
devices, as we have for V4L2 device nodes.

How is it for CEC?

-- 
Sakari Ailus

