Return-Path: <linux-media+bounces-26467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28DA3DC22
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 415673A42A1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3221BC4E;
	Thu, 20 Feb 2025 14:06:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768301A8F94;
	Thu, 20 Feb 2025 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060402; cv=none; b=AJ5p0cht/UUBlvM90L1xY+SkG1igSyTf5K12Jez/HxLfxmlZwqy8TycK1onFNn+z32ikUQSrNYCzcjRHnMDTayRIsnZXeo57sT6iX0kmhNx6hC9Xzb50y1/TFjmF1kSxvw1xNZMSlaJLS8bI1Oy68dM6XOLDwCLCPJIcfDGp1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060402; c=relaxed/simple;
	bh=7kI8X8PJQUUK2FQVEaw0nElDhA7s4dKU1X75v9IkjKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPLTTgNUW1g8hdnkt3LELU4flKRb83FqAJDPSfp01WjDJdh2csSp+qV+BSLNOY71W+TxWAFWxvJ1wFD9XKJcgeIXHqzmprkZM2zX+UoJkGvF7qOSlWYas9BbAzjS0hwR1N7LcZl0xyzziUgOMyiNFWRzH3oY/I2pM1+MUgmGjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: vCvqLwNQSgOsex+q2H0U1w==
X-CSE-MsgGUID: UGnAVz+QR8aiv4vDXERz0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44488637"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44488637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:06:39 -0800
X-CSE-ConnectionGUID: 6degz7rJS+W0Ozne9fsEcg==
X-CSE-MsgGUID: cwOP4iibQH6/Nq+7aviA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115028702"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:06:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tl7CC-0000000DM0r-06C1;
	Thu, 20 Feb 2025 16:06:32 +0200
Date: Thu, 20 Feb 2025 16:06:31 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <Z7c252IKhXdysjAi@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:

...

> ORing enums is really not a good idea: you would normally never do that, and

I think you missed a keyword "different", so "ORing different enums ..."
which I totally agree on, but the same enum values are fine.

> the compiler warning is IMHO appropriate.

-- 
With Best Regards,
Andy Shevchenko



