Return-Path: <linux-media+bounces-40722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E68B310A7
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BE2E604015
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646A12E92A2;
	Fri, 22 Aug 2025 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EisSpCke"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332A2853EE;
	Fri, 22 Aug 2025 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848541; cv=none; b=BSJOrabJp5NQnGZqhcufaeog3qghSZsimN+x1xcrMYdktYR0sxV/MivPNYZ6M7uuiEi20kGc/kU3BRPc5FEGfSmKNaFcoQC+61/zupDQsEgVAXXjAVw7kFpQNsoG1PLs1pFbA6IODQseObfp+BYis5idowb/7rUMhCxrSQdO0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848541; c=relaxed/simple;
	bh=Y4Ju8Ubc+V678E//72dW9Gb7LL72XIy9O0AWP8HbfuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRBlXS+3hYn9Vh63ljhuJfziUt+9a4/VeOhV9qWnnC+CbW86cPVKdRd6fGOKebTzyQUo1byA1ZrFOzXSRl8uOfBeYMMTJ6p1mmRlypXXMyceVNDoHdnaRi3mF9rNoSGdROtjUvd/Nf81CpdCTX9ZTYQNH02cRRY0GsXRIBQcZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EisSpCke; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755848540; x=1787384540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4Ju8Ubc+V678E//72dW9Gb7LL72XIy9O0AWP8HbfuI=;
  b=EisSpCkeE2QnIaiUg93sEmGM6zer5NXr8chbHFnGROUoQ+NbQOwj36rT
   MVWMsxsE6A738V3Gux4l2wkBVKNjRCSZY/tOX7Ob8t6U6yXehnrI5fxIU
   5MnJSK2UReJIjxoh2s53FZmoJSMmOc7IPEcKYBHTDQb4u0mkOty6C5PpG
   MEsTX8OxzzsSSRf41GXaDxNvQgZ0sfsxW3z1cOizOSyyRwCJu2hbZ5Jlr
   VvJC7qVB/nWsSPw6Zxw1GitJj+xgjjofmwQAnPEcOw+zbei+15Gf3smYa
   yJPu+dR97hU5B49ZVzTme1nFb5zhIjyT79GxB5kCDYuhKf3+fpsMJqoBQ
   Q==;
X-CSE-ConnectionGUID: 1LaR906GSBeNPalA+tovzQ==
X-CSE-MsgGUID: yEKcv9abSeWe7vwtxlNrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69524331"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69524331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 00:42:20 -0700
X-CSE-ConnectionGUID: B2tTkImKSMCALA9i2pukwg==
X-CSE-MsgGUID: MJ+xkVLBRmmCGp8LNMXqhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173060037"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.97])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 00:42:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 16336121F7B;
	Fri, 22 Aug 2025 10:42:14 +0300 (EEST)
Date: Fri, 22 Aug 2025 10:42:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <aKgfVrbGGRuWS24i@kekkonen.localdomain>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
 <20250819-extensible-parameters-validation-v3-5-9dc008348b30@ideasonboard.com>
 <aKT4vz-XeTgSo125@kekkonen.localdomain>
 <bl4xncjiy3b777xdni7kb22hwxgm5sqrpd2jrctmdi2valtrec@zr2bfen5drx5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bl4xncjiy3b777xdni7kb22hwxgm5sqrpd2jrctmdi2valtrec@zr2bfen5drx5>

Hi Jacopo,

On Wed, Aug 20, 2025 at 09:11:06AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Aug 20, 2025 at 01:20:47AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > In the subject:
> >
> > s/common/params/
> 
> I actually meant "media: v4l2-core:"

We've usually referred to the more specific part under
drivers/media/v4l2-core if a patch is touching just one of them, e.g.
v4l2-fwnode or v4l2-common.

-- 
Regards,

Sakari Ailus

