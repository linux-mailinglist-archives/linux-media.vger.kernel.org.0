Return-Path: <linux-media+bounces-18865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A844898A48A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5429D1F24D25
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CD219148A;
	Mon, 30 Sep 2024 13:15:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA0618E360;
	Mon, 30 Sep 2024 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702147; cv=none; b=Txli+YXuUUQ4t3ZWqDKajjBUoJR3xtnR7ZWDrBW6onpGPvjb2NJNHbaFhG024GEvqepOrSsnOOKEkxQe3zI4Jootp/OJ0j6UtYKN1pqxxkkfSzCuhmN8fyq5ph3CQiGRJSpobLACfVNByuBGq6L6gmJH4JOeSXSwqf6ZiKPxVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702147; c=relaxed/simple;
	bh=G2NE2HYYrjkDsJLQfz80M0XbUQwgh0IvoD9nSKhNNGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYsbu9OCj66p7zX9wbTIa700k/DlyAzoC0M5VQTxASrdl0d/PAD1RMMggS1EYR9GN/Mz6YOEYT4kP6Iww/y/d630TnBGzcc5ULGO27otVZkASroJBDF9pchujWnYeH34xwMQINgAbx3BsnmxxololoxfeQ50BFvL5FotjmGc79A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: sQHka4oMSb2XntFouHrcGA==
X-CSE-MsgGUID: I6Jtd5XfTTG0LwmtHXxsVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52202790"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="52202790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:15:46 -0700
X-CSE-ConnectionGUID: UZNB2qooRre/2fG6cg7wnw==
X-CSE-MsgGUID: K96ZQ2I3QO2pspBlbPEKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73165858"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:15:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1svGFX-0000000Efaa-46VY;
	Mon, 30 Sep 2024 16:15:39 +0300
Date: Mon, 30 Sep 2024 16:15:39 +0300
From: Andy Shevchenko <andy@kernel.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	kieran.bingham+renesas@ideasonboard.com,
	benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Fix spelling errors reported by codespell
Message-ID: <Zvqke6eFoQqnHDZt@smile.fi.intel.com>
References: <20240926222351.7116-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926222351.7116-1-everestkc@everestkc.com.np>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 04:23:37PM -0600, Everest K.C. wrote:
> Fixed spelling errors as follows:
> 	unkonwn ==> unknown
> 	Stablization ==> Stabilization
> 	previouly ==> previously
> 	acknowlede ==> acknowledge

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



