Return-Path: <linux-media+bounces-12152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F038D34AC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 12:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16BCF1F24FA6
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEB217B4E5;
	Wed, 29 May 2024 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp9sNQ4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FD16A38C
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716979105; cv=none; b=k77yq2hSyHpwxNvuY/CO6FH14UkkT4Vh68CFLo3V5YpkeuSvaz0ShXwIVVv2PCXiuXlx9umPVBIs+y1A0hnoPL55yLbQ2uKtzuf7sGxm36D70U/x6PXnirAOx2P1BdXio0GCo37fBgPlwyoXdBkcOQgA7XHzf9Q0mS3UPsjIZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716979105; c=relaxed/simple;
	bh=cLzGLezx4OcVFC1h6nQACrdR8UdhITeiXu3SgRIMgLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcjTtk6B6jHp2WhzhS2K7gl3/jPl5fRATT2TJni8pHYTlk3waSHhlnUWuykofoahDq6WvM5zX7O5CuXBaatktU89riezk3adfETjTPWe4cvGER8LuMcRV5kptgeMWNhlUK4zHc+MJk9Bgmkgm9C/ktS6jEvI72rM8XEJHsRog/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp9sNQ4r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716979103; x=1748515103;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cLzGLezx4OcVFC1h6nQACrdR8UdhITeiXu3SgRIMgLk=;
  b=dp9sNQ4r8tOLN009r7pLWEuIJTXsnvqZtf2uQNP16vBQnuwW144J2El/
   q02L3YI8TbWtdO52Zx06Pfa3nbx/j4NwmdJFZ+B58ygqVHB1zrTsJgFD4
   adERhSNOm+XFjdRQ0BMB9wfsd84rwbY33/T0oRtOc2DIHdpPYgIbI+LvN
   kFUl+76e4uuHEucpdRjNmhUm6tGuEpLbbZ8F4KzOs4a6K7IjWpItHcbZY
   8MW+u/vajGlsWomjmiiHR06qaU/vL+MlC7NxtBhy0PKEoBNdnh2I1lygc
   biyGH1/U3ChSKNhSWfQEIIl+g+aGAoV/z+lc0Sd9TcQFJ9y/tckQ+nXZA
   Q==;
X-CSE-ConnectionGUID: BaA96tNGTc29oIx2LbmZSg==
X-CSE-MsgGUID: DCIZ8nWpSnaQprpATDsrLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13146012"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13146012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 03:38:22 -0700
X-CSE-ConnectionGUID: sSXEnsC8TeWRCvQdC4vaHQ==
X-CSE-MsgGUID: gHuBiv2OS0m8/eBp7N5yKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="39911241"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.45]) ([10.245.245.45])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 03:38:20 -0700
Message-ID: <17a8f75e-9ddf-47ba-8cf1-036befa31f30@intel.com>
Date: Wed, 29 May 2024 11:38:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add a warning when drv try to reserve 0 fence
 slots
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: sumit.semwal@linaro.org
References: <20240529084322.2284-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240529084322.2284-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2024 09:43, Christian König wrote:
> When dma_resv_reserve_fences() is called with num_fences=0 it usually
> means that a driver or other component messed up its calculation how
> many fences are needed. Warn in that situation.
> 
> When no fence are needed the function shouldn't be called in the first
> place.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


