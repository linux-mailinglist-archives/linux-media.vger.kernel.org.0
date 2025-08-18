Return-Path: <linux-media+bounces-40154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED069B2A490
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6811B63498
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAB432275C;
	Mon, 18 Aug 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICie31Kj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CA3203B7;
	Mon, 18 Aug 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522882; cv=none; b=De6hbcDHIZ5V28gFF3y7f2PtXK9opBwKjvsuX1ohfAab7OKiHhVWVPaW+oCU6br7MzU93W6MiqetwwWp//4QC71wUOy3nSuLrzTecakhnzJ5ggc7Og2BoTjNAbS40NBeEpmI9GRAFN2kF7xfVOUFISMCZUUMCdpLfNhonPDphvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522882; c=relaxed/simple;
	bh=+VSZkVl0dtO7OCLKH29UGnGUK2rUJyXMdEtKVAU26iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4oaGjuHQyxnQqiAsXUWHBGRC4TzrE4inWePpZ2sz6LoYQQgLDr/tJYNKiwNuONYbaVGlPOKJsjDLZl51Zbrc0fhnIwJ6ISj3pNxFMO//6xaEiics6GU9Xs0akKSl8O7kj9aZXGu5K/5NrEv9DQ0USIZ39Wm3DkgMIjmniZrX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICie31Kj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755522881; x=1787058881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VSZkVl0dtO7OCLKH29UGnGUK2rUJyXMdEtKVAU26iA=;
  b=ICie31KjHIAjszLsEsMhqneUCyMZ/LlFL82G/CtUc2McH3+yfwq3loLL
   uL2ZTfhGris17Jkabdxy9xqsGKDerQQYAdmqX4sIRo0YbPFXDoaX12dux
   rnhbKZUTsfgLpHAG0kzHUkmAIl+x7UyKIizW77Hv/lZUe6+bPGE47kojt
   UbAnqi44bQ/9bo/p9peMJ+IFYQ9t3oN5omuemL0mnKy+TbxMMdERlNgpq
   POFKT4oc0MQnNK7QKR/5V/vel3p2dnJW02w0HodSB7zLouXPeX6q6/+Hf
   a6DiYbzKIRW3O81GmxlnQJSLJ5Yd87BhmD2Ic294Fxj4tvT9O1wsDFyhq
   g==;
X-CSE-ConnectionGUID: WRFEK7KQSXKsettMAQ1gbg==
X-CSE-MsgGUID: j4LfidYgR1KSTfJnJKgqbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56772229"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56772229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 06:14:40 -0700
X-CSE-ConnectionGUID: 4jgT2hXWS+2lk8icnvg3Vw==
X-CSE-MsgGUID: Np4cDoUqT4KA5jrAvZf/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204733355"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 06:14:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8CFB511FC4F;
	Mon, 18 Aug 2025 16:14:35 +0300 (EEST)
Date: Mon, 18 Aug 2025 13:14:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: imx355: Use subdev active state
Message-ID: <aKMnO4UhaVW0X_v5@kekkonen.localdomain>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
 <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com>

Hi Jai,

Thanks for the set.

On Wed, Aug 13, 2025 at 12:50:36PM +0530, Jai Luthra wrote:
> Port the driver to use the subdev active state. This simplifies locking,
> and makes it easier to support different crop sizes for binned modes, by
> storing the crop rectangle inside the subdev state.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

It'd be nice to switch to {enable,disable}_streams, too. Just an idea. :-)

-- 
Sakari Ailus

