Return-Path: <linux-media+bounces-22289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373039DC073
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E814716478B
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189F515E5C2;
	Fri, 29 Nov 2024 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0nIIVYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F715B0EC
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732868687; cv=none; b=VPn1nQHw4TY1Q0h82s7iaPActkIOOfjFGm5ils4hPrmBk/CCieV5POQCW5XwTZAdQBvDYC2Jvv0C0TMvR65MimlC1LtetheAyJHx/Wg+tRvDIcbTLGHXsxw1e+HRo5PTA4fpWBWbcFSNNNFPceslBBty3F1MiYITgIwCCnoLUxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732868687; c=relaxed/simple;
	bh=ywnHbtv0bBYcFlDghJLER0X3vgXttyRYB75Rs0azQcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T37fJ98v0ZlpjlLzpugCJ8MdvCGREeXY/wuYWZ31yczkWKzPvYnG70yu+fek1IDzgty25VngD9tB9X7UqNwSPWyORj0CEc1nEKG8EqQBh6PwxQCPBr95yQ+kh05fJQJ54DvfNRbWJh+rtHyumx2WHFVYJsJjG6SXEQChd6HWAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0nIIVYF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732868685; x=1764404685;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ywnHbtv0bBYcFlDghJLER0X3vgXttyRYB75Rs0azQcY=;
  b=e0nIIVYFdhG1hXozzphwOxVioYibxvTMM6V6eslnRO0SXdgtizUG5I+L
   Dw4WDGET4syOeG8MyY701HxDuIOxqOVu9YtqxDL40aTVYK0R0ZtITjIsj
   o7tpK+RDr+E8lM2XmEYmK4/AZm0or78zdy9hUCc08hkMpJZglqtEdGR5o
   B+jmmHazy9Fv5lSojwAyJCgqQ+w0IFUlOD7uARVcJ1APnSQiG6S3OCByp
   stJ3Xp+JJSG+j+bfneMGVz9SJGq2ChWFCLYzKJxrv9kHBnQ11hG7oyAaJ
   xanFy7rYC5CmC1mHJthDGMnIna4mM+ijXJ1kiPiRdQR/ak1kq9EJmzYQY
   w==;
X-CSE-ConnectionGUID: moDGqCahRQKccmcOvqSH5g==
X-CSE-MsgGUID: J/MV0yYkR7+dEBgXpZVkhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36884408"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36884408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 00:24:45 -0800
X-CSE-ConnectionGUID: NsfbDU4eTwu1Jf9oMckKDQ==
X-CSE-MsgGUID: aw3Fab1aR8CHmerVVpcnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92336155"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.227])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 00:24:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <20241127095308.3149411-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241127095308.3149411-1-jani.nikula@intel.com>
Date: Fri, 29 Nov 2024 10:24:37 +0200
Message-ID: <87plme78hm.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Having cec.h include linux/debugfs.h leads to all users of all cec
> headers include and depend on debugfs.h and its dependencies for no
> reason. Drop the include from cec.h, and include debugfs.h and
> seq_file.h where needed.
>
> Sort all the modified include lists while at it.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Depends on commit ae19ba915eb7 ("drm/i915/display: include
> media/cec-notifier.h and linux/debugfs.h where needed")

I'll resend after -rc1 and some backmerges.

BR,
Jani.

-- 
Jani Nikula, Intel

