Return-Path: <linux-media+bounces-34333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5CAD1AD9
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE41188D041
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FD825228E;
	Mon,  9 Jun 2025 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCfykK5S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3442505AF;
	Mon,  9 Jun 2025 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462178; cv=none; b=S0ZRd1bNPnPswY5xbvr7lOu4szARKyKUvvjnu08OUYk1DdR0JuxPe9lkraio1VhXqF0fMzrctY6n9M7lH51qY2p4gLhXCF+b3HRPhF5rtueXPGDQlNFYBQasulZbtJ3NyJtjmb6LHAUhkdje+0LgYYpDGLq7VTPFEH+h0Cv0tLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462178; c=relaxed/simple;
	bh=ySRPtb8R9TF5f8eJsbPNdOwas6ksBf1A56TkU/8cVVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvVem4CrGxSg5D1vga6xKkExJx1UrYXMu63Q65xnGzjobg4S7YSWQiNLQRhioktvyR5pwT24yK5TU48K3ESsX6wdXDy5vGlZspLFttxMrb6KK7cv4VCcyWPHJ2l12oQpv3idXwnqGxwSRnP1Ne/b8PZ5HZ43l0WAkwFJ/EDASag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCfykK5S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749462177; x=1780998177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ySRPtb8R9TF5f8eJsbPNdOwas6ksBf1A56TkU/8cVVw=;
  b=lCfykK5Swyhzjeyk2/Uw3PwQxzVSmcGZhlPkIIr1gFuuDzh93JPuMnZR
   XetzndIuJr6c073jJgs1mlYw5A7G++dEq8hsFo8j5RCbefSvxOHiG2bVW
   oJziidrnteYiKRLtc3XZYaWZ1fwXlZdHXwLnbCBXDtf0WdnWptV/pFP6E
   mWba1AHgkb0P7w/hE/CuLFXaUb/ZDaD75H2n6KWreBxPL+MqSiJ2sVVUq
   suHWB4k5y2/vocSnNvFf2gyYakBoNRD4w8yBQ1wF17XM0DElqTMXh3ntm
   lc6Fzrh8c20WZ9gVBVqUrEkV84BsFJ/p3LT4UfA1cUAQwk7DVyLJIDJ04
   g==;
X-CSE-ConnectionGUID: qn6Cp6KiRxONdKutk2xQhw==
X-CSE-MsgGUID: uuFvBBSLS5Webh3q6YY1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="76928219"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="76928219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:42:56 -0700
X-CSE-ConnectionGUID: QnzO4A5ISYmRZ0zlw6R7RQ==
X-CSE-MsgGUID: 6nY5V3ToRDm+64bSkkZUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146457300"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:42:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3A31B11FC22;
	Mon,  9 Jun 2025 12:42:49 +0300 (EEST)
Date: Mon, 9 Jun 2025 09:42:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
Message-ID: <aEasmfi3VBkuFU3g@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
 <aEFoCvPe4zE48UG7@kekkonen.localdomain>
 <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>

Hi,

On Thu, Jun 05, 2025 at 08:41:45AM -0400, Nicolas Dufresne wrote:
> Hi Hans, Sakari,
> 
> Le jeudi 05 juin 2025 à 09:48 +0000, Sakari Ailus a écrit :
> > > It's not user-triggerable, if this happens, then it is a driver bug.
> > 
> > If there is a driver bug, it could well be user-triggerable, wouldn't it?
> > Testing may not uncover all such cases.
> 
> You are both right, if the driver is not used, the warning will never
> trigger. I was worried of the hit of a thread safe ONCE implementation,
> but WARN_ONCE is simply not, it can warn few time before it stops if
> called from multiple CPUs at the same time. In that specific function,
> I can move all the checks inside the lock to make it truly once.
> 
> Now its up to you, I don't have strong preference. These are driver errors,
> and usually quite critical. They are not bug_on simply because we have a
> crash free resolution, but its probably not functional anymore.

I'd prefer _ONCE variants, I wonder what Hans thinks.

-- 
Regards,

Sakari Ailus

