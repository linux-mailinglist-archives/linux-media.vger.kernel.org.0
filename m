Return-Path: <linux-media+bounces-47141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62AC5E351
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D812635FBD5
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ABD32D42F;
	Fri, 14 Nov 2025 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkjbqH06"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1BD32D7F4;
	Fri, 14 Nov 2025 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134109; cv=none; b=seiJb/Zt9V1ZSGahdLcJ25Sn30yVtrSkOkadnhaVJ2W4fH23Y7TyL7BEsBsvg6f25opQZ9RGCPVvbHjHN6rHN9Ti7VBai5JoJ2pVWLhq8VN9+N+QzZG/rWMf4FkAZ5F6JzxQrWmvOm8aZiYKtRQU0IbjbjJyi96sNffbiPwmPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134109; c=relaxed/simple;
	bh=z8lCr3fSbWR0YaeRJvRwXvQNpYW9CE1zd/Fm1bcIsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6cQTe+uiXpEMSkHRusag5G6cBvW5w6tqV+YjlmcbYc0KkZYhviZarRl/m91AJrhLG445SO0XqFoE4dE382mtJo/Pw+nK7BcoGXTNVpBI+i5hs1ceCIeWz2NwzXST9trVdnMrZ87ZldSJ+gQCbgzP4tlY3WjWHu0D9duekY/ncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkjbqH06; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763134108; x=1794670108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8lCr3fSbWR0YaeRJvRwXvQNpYW9CE1zd/Fm1bcIsCE=;
  b=LkjbqH063u0pq5dYjXDf++VVJnwUmyFcHaX/9V4RECDnUMJL9FNB/Bv2
   Mcz8jDM5RW+xp69OHg/NpzShe51fercrdgPMfcU+5TwgWwdQ//36XnYv7
   AxeYPFMMouHhCbWcQcusPIfFXpKhbKrJI3ld4/Ol+azuxaxZObwlDYcGI
   QaFV73UfBzX3OIi5SAgKv1JOqxsVHOt4i0e76BTh2hpaZCae3CVtQ9hKJ
   OYtgpruwqQKxyIubZRf9e7ho6+cdFVfJBJ8TCdwvvjpUtCXJ1Py/xbCSP
   DJL3PDb9+F1yjoi9eFXr/9E0aoFcPKHfUq46HfqBmLGRh/F7hlAFRXq1e
   Q==;
X-CSE-ConnectionGUID: d3Cr80r0R4+qvXxfKnozeg==
X-CSE-MsgGUID: Q5eqjIEsRuWhdUHDqlg9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75909789"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="75909789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:28:27 -0800
X-CSE-ConnectionGUID: 82XteTvSQDqJSy/t7iUKSw==
X-CSE-MsgGUID: Ypb8ALdmRFS6MgEOugSKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189450717"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:28:24 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 606D5121DDE;
	Fri, 14 Nov 2025 17:28:23 +0200 (EET)
Date: Fri, 14 Nov 2025 17:28:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <aRdKlwosRv-80_KN@kekkonen.localdomain>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
 <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
 <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>

Hi Jacopo,

On Fri, Nov 14, 2025 at 03:57:21PM +0100, Jacopo Mondi wrote:
> Hi Sakari,
>    can't say timing is what we excel the most at.
> 
> Afaik Hans has applied the PR, and as all comments here are on ...
> comments, they will be addressed with patches on top

This is just sample code, changing it later on will be fine.

Thanks.

-- 
Kind regards,

Sakari Ailus

