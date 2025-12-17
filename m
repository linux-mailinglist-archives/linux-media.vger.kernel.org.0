Return-Path: <linux-media+bounces-48979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281BCC738D
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09CD63034D5B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18893451BF;
	Wed, 17 Dec 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AosbJETf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F8344040;
	Wed, 17 Dec 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969457; cv=none; b=MnQhwaEnTxj5KhNVc8CxA5DpPJlrLiSjHbfnOdOpjibHOf5mT7jMdsyyVR0DqiQ+e3yZUNWPeTFAe+Vxu9ZHh7FTeILhbTJOhM/XPtxyJTNdswjNzxYnRQR/w7OZtOVgO1mkgLZ+ZQv/hsthwLOi74dO7TdeUW84RdK0zx5okCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969457; c=relaxed/simple;
	bh=lvzCPlnDUKTFUoynBRjMhCEwlDk5pBjP11EI31u5avU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2q4Xm+1Y7zwNHs8SyBWmtI7XIAQKhnqWqlcYDZzxHnLKEYdHM0lTwJNdOayZDz0QrQCQSilcaKWY71CTVcDlil7FRMxHYfA9SKGVSlIb1H2TfMGY5Bni3F+UvIU3/xZdPiVr99p1Fak2Znr5KkqY8qibc91MJJ4RlhVM4xhVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AosbJETf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969455; x=1797505455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lvzCPlnDUKTFUoynBRjMhCEwlDk5pBjP11EI31u5avU=;
  b=AosbJETfMzzbKGQqs62HJ3g3c+ytM1mDBcGd7TqbkJUEEA8t4iE7xz+u
   WdRwT675req/k6mYPl1pI2X2WyDr7Oy5F/2DWaEeRbPDbBkoiKY6IH+Is
   SYdQrYQl8OwwE/ZIwoRj7LQLGO1ML+7MFw0vfJGZtGk+czBfD/z5R6F+6
   NlETQ1p6U/z3ItYF/DsmdF16Iruu4eEeJpNf82idMi7aTkkZZZlvCRixV
   PBn3iDdVrgXqbAzGv2I8zK/UC7LbcHjv54201sLlOLv1eufQXji5oIAk/
   zPAGSifpofU7Yu7DTQ5d9zt4wTzw6vT7IQMoZDmywoO2m1TxQn2agGx+q
   w==;
X-CSE-ConnectionGUID: f+VOLdKzQHyoaSQp4U9iYg==
X-CSE-MsgGUID: DkxdUk6nTVaN0V8WDHeVZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78616661"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78616661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:14 -0800
X-CSE-ConnectionGUID: jeY5Zs6DSqurXJFQAucFqg==
X-CSE-MsgGUID: ysasuF4BTc6+TBepk5yUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="221658707"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.140])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C8DFF11FC37;
	Wed, 17 Dec 2025 13:04:07 +0200 (EET)
Date: Wed, 17 Dec 2025 13:04:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
Message-ID: <aUKOJ7quTrLEBS19@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <3ceb88e2-48d4-46aa-826d-be372ee0acb5@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ceb88e2-48d4-46aa-826d-be372ee0acb5@amd.com>

Hi Bin,

On Wed, Dec 17, 2025 at 06:29:18PM +0800, Du, Bin wrote:
> Hi Laurent and Sakari,
> 
> Apologies for the gentle reminder, especially during the holiday season. If
> you have a moment, could you please take a look at version 7? It’s been
> significantly optimized and improved, and I’d appreciate any feedback.

Thanks for the ping. I'll try to take a look this Friday.

-- 
Regards,

Sakari Ailus

