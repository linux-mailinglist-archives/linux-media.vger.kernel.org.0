Return-Path: <linux-media+bounces-4710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6E849D6F
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454D01C224DE
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9C72C684;
	Mon,  5 Feb 2024 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7WGG+9Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBACC2C1AF
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144868; cv=none; b=HqIHlPKRjf+UheKvfjK2TnFZBgUR6spKN6X10mV9WgM+4cQmPQ7J7S8FE8g+mtHcxWJl4XI1unSbXGdK6ir/KgRjVe7jRdm81XKW+21pjCrVI8TAQMtxvPDIq+b9oyUMXYInwCpbj6ho9bPLoj/KgSb5tmuz/Vprf+b5uJT8Hy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144868; c=relaxed/simple;
	bh=qKyXNNPPbwrzAOCrEKd4284T0HqPCUowkiBaonsY500=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCzryKDca69roI9hmSAMoyTR75v1LKpyxDYmrpgCdhCkvnNYf+OC59FJXVkdeKs1cJL3uUqsD0UbTV8Bn8buOdo3uizUyJs3uLmGCr1znht80xzBcUSHn5NR1qUtKt0ZK7DjjwRniuefiETsE3WJiMva6FE8HAI2BEOjkSOAtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7WGG+9Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707144867; x=1738680867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKyXNNPPbwrzAOCrEKd4284T0HqPCUowkiBaonsY500=;
  b=M7WGG+9QQ1WZPn1regkccDg+VlImkndo0LHvTJ7xRNOacnx0TWtdJxo/
   Z7MDWdMVAVVD8/+/q31nz4liihgR5JfqWkSWKZx3/Zu7KZcqvGYUPeuyw
   W+CSAfOQdDZ+p/1Xn1zGRpKaE4MWXY+5bzvRt+TL86Wcq/uO5XmSyEVqQ
   ahYYz8v/1Mq6wlpd5Zfx6Lu+bYogVQ5u9+cUX3VWoOgrVvnRxygvzgho+
   8EIvvpumQv2MFtwgm3xEjoZGjX/UMkBMymFPqxP2vkop9nzkquhtCHSaV
   gj4smjF06kncLTd26B5nvYN2AiG5M52c2Ioq6AlQKKSfFpwcD7nT12ZNe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11182385"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11182385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 06:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933172658"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="933172658"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 06:54:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66E4211F89A;
	Mon,  5 Feb 2024 12:08:01 +0200 (EET)
Date: Mon, 5 Feb 2024 10:08:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/2] media: dt-bindings: Revert changes to
 video-interfaces.yaml
Message-ID: <ZcCzgbmyGo5TlyLD@kekkonen.localdomain>
References: <20240204210642.693958-1-sakari.ailus@linux.intel.com>
 <ffce7362-f3ee-492d-92b7-a8cee846b692@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffce7362-f3ee-492d-92b7-a8cee846b692@kernel.org>

Hi Krzysztof,

On Mon, Feb 05, 2024 at 09:35:02AM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2024 22:06, Sakari Ailus wrote:
> > Commit feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
> > introduced an unintentional change to
> > Documentation/devicetree/bindings/media/video-interfaces.yaml. Revert this
> > change now.
> > 
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Fixes: feb8831be9d4 ("media: ov08x40: Reduce start streaming time")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Even if it is simple, it still should be tested...
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.

We decided to revert the original patch in its entirety. Note that merging
this (or the full revert of the original patch) reverts the changes
that were previously merged unintentionally. Not doing so will break
video-interfaces.yaml and omap3-n9.dts.

I didn't cc the devicetree list or DT maintainers as I viewed addressing
this problem internal to the media tree.

-- 
Kind regards,

Sakari Ailus

