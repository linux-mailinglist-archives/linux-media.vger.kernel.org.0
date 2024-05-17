Return-Path: <linux-media+bounces-11582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC28C8243
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2CC28340F
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA29E1B94D;
	Fri, 17 May 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Da9yXPqd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC762260A;
	Fri, 17 May 2024 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715933026; cv=none; b=rlEd4oFUc0CtHcczv0+KCCqGOvz7kDTKN/CmCIGiqkBS3iWbKozweTEHnY/QQO6Mz16s5LeJ0vR8C6ZvYQmFhLxV5xy7eLUPiFyBtPJEVcNvOg6yz+OxPFJMGAte5IKIE5XJ7OfcKnkMuWWaEKDoV+grTvxocN2pw9MICEvfx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715933026; c=relaxed/simple;
	bh=G/srp7uTaTSo3ien65VwLzBGNovcOAUtexLcayUN5hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQys7OJfjpxwVIeA6femBr53npU8Yv8bEgvf8sWP2m7E/ibIhK2/jt2uhsUwSisglFYNFQEyu2lHMURdma9JsA7QbMtYomJbL/7z3LyMcK49FXOFrBCkTWIPjF+80kF/LAXtz4Vl6SZt7GhzwyR2HTOiovX/I0OXz14K3GrK7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Da9yXPqd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715933025; x=1747469025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G/srp7uTaTSo3ien65VwLzBGNovcOAUtexLcayUN5hk=;
  b=Da9yXPqdZ4eT2iyjt2mly5sFo+WbVFcFYxymKDkyndblIQvhGN8FJKWa
   qYBacmwxEbcfIeooYjFLQf3dBMsu+Qd6tmdGJmBxjtGhi+Y8AxbXpE1KL
   31JvHcSHe+75LQ12qbQ45mSxg0QTxizJUnHOE8mgx4GTZA4n4bhEGS2k7
   LsfECym5obaW5VaVqnEXlSSXHpGzdnSF4IfKNVg7ujW6a6YGFnwqgnI4d
   pipmf9WHwZMEccZNe8Zf6AYYY4QPhb44RNUWLLqNHOdD2wU/C8UHsrFb5
   lii6faqfcZzFB47hpze1lJg7XCTCkY/kYycPq5t2CHG+rSCSTvr6CDhtZ
   Q==;
X-CSE-ConnectionGUID: Hkqu6OQDT52vaq+sz2IBcw==
X-CSE-MsgGUID: qcjzzc8aQI6rD54JbfkV/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11936895"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="11936895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:03:44 -0700
X-CSE-ConnectionGUID: /CziZxrwSVukmBOEmE6LHw==
X-CSE-MsgGUID: lVKBLj8HRcOy9D0z8RZBcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="36149923"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:03:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0C2F11FA44;
	Fri, 17 May 2024 11:03:27 +0300 (EEST)
Date: Fri, 17 May 2024 08:03:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <ZkcPT8lBtEHETb96@kekkonen.localdomain>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
 <20240517063150.GA12245@linuxcarl2.richtek.com>
 <ZkcOoLQQRdRYYacd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkcOoLQQRdRYYacd@kekkonen.localdomain>

On Fri, May 17, 2024 at 08:00:32AM +0000, Sakari Ailus wrote:
> --------8<-------------
> In v4l2_async_create_ancillary_links(), ancillary links are created for
> lens and flash sub-devices. These are sub-device to sub-device links and if
> the async notifier is related to a V4L2 device, the source sub-device of
> the ancillary link is NULL, leading to a NULL pointer dereference. Check
> the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().
> --------8<-------------

And a slightly different subject, too: "media: v4l: async: Fix NULL pointer
dereference in adding ancillary links".

No need to send v2.

-- 
Sakari Ailus

