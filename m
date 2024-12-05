Return-Path: <linux-media+bounces-22711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B549E5679
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 14:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E825281823
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D57D218E85;
	Thu,  5 Dec 2024 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrdEa7QB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD823217F36
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404839; cv=none; b=eHTS0OGLYYliCfkQces9sEQpQb08wGOGfj0uxQnv2opKursl5gA7lLg5EBRcSR1URVsMaSWaA4k2DZBBSkzKm0mso15/57pqSTAYKvZSqszCUxc8LrCQztIKQbFduWMggdRejP6VNGaluxssmQ7POB1J1y5kqUU/48M2KUUHCIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404839; c=relaxed/simple;
	bh=MfMc4COjKLP6gP/dCy1YOujaYlfiGn2Phdwdm6+xjUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FsWCIJy9TCgXtWgu0HNZ6A+gE2EgKG2xOpuQ3njYYSQ2QdwTNenHhcCQ8WsOD5VbIWmusM671FIyGe7YZjBDvBAPa01E/u3f48P+wXL10i+erJihXQrxWyaylDqMwjENKGETh1AtDFyZaQY8K8LE5pKIHHVhsliBqlTRRTLfvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrdEa7QB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733404838; x=1764940838;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=MfMc4COjKLP6gP/dCy1YOujaYlfiGn2Phdwdm6+xjUI=;
  b=YrdEa7QBMQoJ4EHzYvAPl/5bAHikYzxh3mvksaplHZfU6NloYgpkWnTw
   Mw6XUUbw+fd8OxxjmxT6OdPq1w+gt77yXceLzE+t6ps83QX3YmanLB5RT
   zIlSqp6q/KnYYPooeqryn3t+vj6v317MJRAlebZYTJpHDvW6BGaUojEMX
   pWCjycVdCKnlSoi5klJfMDpy2Z62XFgegv/EaSABiYBBRSFJTdvIKWPZg
   ljoroUMFjFgwrTRezm16bVUz/saTkkiop2J5OnDchvzaAkvjpmI/2+Kcj
   qj7t7bbUQpQJCLH7LoooesVJQ6L11dSM+dQFXDmouZjdbnBLpwEMD82Nb
   g==;
X-CSE-ConnectionGUID: vFS8C0+sTdW1MV3P3m8WdQ==
X-CSE-MsgGUID: 7QSPdNbJQG2EEzV/r3dTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51255995"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="51255995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 05:20:37 -0800
X-CSE-ConnectionGUID: rQp2+6VrTBu6wVUgLDnGzQ==
X-CSE-MsgGUID: vR7gffMRQwapHCVdU/6K5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="99057971"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 05:20:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241127095308.3149411-1-jani.nikula@intel.com>
 <87plme78hm.fsf@intel.com>
 <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Date: Thu, 05 Dec 2024 15:20:33 +0200
Message-ID: <87h67i1d26.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 29 Nov 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 29/11/2024 09:24, Jani Nikula wrote:
>> On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> That email no longer exists. Just use hverkuil@xs4all.nl or
> hansverk@cisco.com, either works, but I prefer my private email.

Sure. It's just that hverkuil-cisco@xs4all.nl is still all over the
place in MAINTAINERS in Linus' master.

BR,
Jani.


-- 
Jani Nikula, Intel

