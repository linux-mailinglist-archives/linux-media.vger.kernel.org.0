Return-Path: <linux-media+bounces-15419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9493EF47
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0F4B222DA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6C13A250;
	Mon, 29 Jul 2024 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sz1JTHTF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C0137776;
	Mon, 29 Jul 2024 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240021; cv=none; b=K0N2UxI0aqODoQFsPCJ5WiC8drMqJqjhV9M/3jLxcWKnuhb0nhrLTPocf/kmPMJpvR3qfADW2kaAhIuJTMcygzQ7AVo0rz8Hv+DuEXtBalDxWu8VL5uBDal8s5rfcnxAUy9+TDXdolnGVSBamoIpBBxUaxtDiH7eCht1FZ78fRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240021; c=relaxed/simple;
	bh=78JEo1y1sjqXoPCUWMtPtI3QB4TbSPba7yxBCFrSoQI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CHVCFWsPD4DiD7k6IJWbiulfqalKxHNEeiQJCESQsqoAC3utkPs8pGauOEGVioNUmOu6ZEHFs0IdcPQ4nbSfTKJ7W76ruC5UKTg6XDdzO9yPDkSnIPTU7Gq/svpmnVrh9dPRUf2AcISE9Gefw5WqJ1GcYXLK4runPe8xTzucZ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sz1JTHTF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722240020; x=1753776020;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=78JEo1y1sjqXoPCUWMtPtI3QB4TbSPba7yxBCFrSoQI=;
  b=Sz1JTHTFtydpFVAeUIoa1jY16w4pesYeh4v9iOCDm59C9EQ1lfkPFxMG
   HFE/ULKJhClqI1409rQ8ao6USibxJvY8rLnPwjzrEgi2RUJH/r7DO40Xi
   pxaDOmfW/EhhHdwOGLd0knfah0m7aKVbh1AZztd1lh+p+SdPj7D/oSQJE
   TlxIs64JW62Zk5BiwR8wXH73595YSIgHmZInT779Jz+iMGPsCvprEohnq
   79XAe9uOGN7ZVcwuT9oepNts+crN4dcwcmZcBdq2BjasgidpYKENT6anj
   OxVNCCMc8Ah3i2dpX3pkmca02/ich58MOIjp1bCdbgk5PiXcYGIdinfUr
   Q==;
X-CSE-ConnectionGUID: eZfx85uLQtCNLu0xj88nBQ==
X-CSE-MsgGUID: oYxPcfutQd6snzcFvNrFcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20107991"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="20107991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 01:00:01 -0700
X-CSE-ConnectionGUID: 5abMnopsTMiPUSdP0my5BA==
X-CSE-MsgGUID: fuQFj9CETG+cWh8vyC8Leg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="77141195"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2024 00:59:59 -0700
Subject: Re: [PATCH 1/1] media: ipu6: Depend on AUXILIARY_BUS
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andreas Helbech Kleist <andreaskleist@gmail.com>
References: <202407161833.7BEFXejx-lkp@intel.com>
 <20240729071026.3775341-1-sakari.ailus@linux.intel.com>
 <2da2103f-1f54-c70e-d8c4-ddcf3e4037d1@linux.intel.com>
 <ZqdJ4c5NICbLZIQF@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <1d80228f-eb13-49fc-45aa-b6897a97b5d3@linux.intel.com>
Date: Mon, 29 Jul 2024 16:01:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZqdJ4c5NICbLZIQF@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/29/24 3:50 PM, Sakari Ailus wrote:
> On Mon, Jul 29, 2024 at 03:37:03PM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> I also submitted one before :).
>> https://patchwork.kernel.org/project/linux-media/patch/20240717074050.4067898-1-bingbu.cao@intel.com/
> 
> Oh well... I seem to have even read it earlier. I blame the holidays. ;)
;)

> 
> I'll pick yours as it was there first.

Thanks.
> 

-- 
Best regards,
Bingbu Cao

