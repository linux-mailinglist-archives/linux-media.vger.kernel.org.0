Return-Path: <linux-media+bounces-17421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E796909E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 02:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634E11C22820
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 00:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B591C14;
	Tue,  3 Sep 2024 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEJT7PPn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3CEA32
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 00:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725322799; cv=none; b=P/hJCHlERVxYahc4nXtUv70CaJIYzvqc4mniR4BQwZsBZbH1HtGDUpo4EhYfEKMnUlQJhlI7azwGKH0ONphkx21YvGIdgyDhTaiQ7DK23Yvx8jMtcvKKTEdlS26VJZXth6rClNPHXJVYUoa66O65cTAUlkRNyJhPdZU5wuwma3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725322799; c=relaxed/simple;
	bh=2fDlkDE6UjeUw6TM4ma9CmI4VeneZ/IHhbyY82NPnbU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qHW5eF6hrLEX7O06XWguOxdc5yM7ZmpiiLJgxVfzSgW7ncDeeZu8U3FCBZRDJ9uerkpd46010d4tckLhu1tUVZZCBILs5+jzZiyAipfkFR7SOOcCxl1OUqQG+jFm6D9Cre68Cg6r4GmgVqF+9VMEIbR6qNCVjFC6mGhsD5SVwMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEJT7PPn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725322798; x=1756858798;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2fDlkDE6UjeUw6TM4ma9CmI4VeneZ/IHhbyY82NPnbU=;
  b=gEJT7PPnKKTa2N9bClYH774hH/G4EDnERMao86g7ZfIb+EZtAr/R+BNp
   ozpi+ClQCpTpCdqsUiVEjQ6hpcQipm6+E2QkAeW+EaDjkXfJaBrZLFUop
   rzAiAQSjhMI7ofLqS3hx7pPEe/JpWa40cRlmX3tvupTyN6rdK+oC2XGJx
   IWcUrFeDNe5ytAnqcr9emwV6PTkxNBCEk40LloQ5dCnnnqkkg/gcS4cgK
   pj3CYtymPdSaSjCWuruhdcF1lweYK8J+VmZWyClhyxB3UmxS+Cnofetrz
   zwJuN3ZRAnP4BcF/egbsdcfoI7V+sxzRqqxu4F3AKG98BsDRtsJdPQyc2
   g==;
X-CSE-ConnectionGUID: 7uPooVhKRS2vrepvQorbjg==
X-CSE-MsgGUID: //2lLLfNTL2x0C6zEcuUvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41398387"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41398387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 17:19:57 -0700
X-CSE-ConnectionGUID: CrM1+eC/S2KBKsKFifTngA==
X-CSE-MsgGUID: zYXVHC5DQX+q+ZlaBmbWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="95451019"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2024 17:19:55 -0700
Subject: Re: [PATCH -next] media: intel/ipu6: make use of dev_err_cast_probe()
To: Hongbo Li <lihongbo22@huawei.com>, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, lihongbo22@huawe.com
References: <20240902131553.3088122-1-lihongbo22@huawei.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <08217997-6454-e4d7-b2f2-a81cad70572e@linux.intel.com>
Date: Tue, 3 Sep 2024 08:21:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240902131553.3088122-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hongbo,

Why do you send same patch repeatly? I have some comments before.
BTW, a typo is in your cc list.

On 9/2/24 9:15 PM, Hongbo Li wrote:
> Using dev_err_cast_probe() to simplify the code.
> No functional changes.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 

-- 
Best regards,
Bingbu Cao

