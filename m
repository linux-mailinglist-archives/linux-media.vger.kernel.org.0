Return-Path: <linux-media+bounces-30237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19006A89D9A
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6983B7EA0
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2402951C3;
	Tue, 15 Apr 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsPSyAST"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1F28469B;
	Tue, 15 Apr 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719414; cv=none; b=coCtgb4Z7Y1QFQ2SuPRBS2yktPjiq5xHe8sUZ8SeGf89ap3WwpAYhqpW9126ftZBG2Ge1JdoX7SS7hYf0iPRbebBV5GdWRXcOD2Cpo8sMHbiyPDl+uXbSgVmrrtsRngNJ+jUvYEHIz7hmv480hnEHj16WlyyFAdPo+HkxKu/U3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719414; c=relaxed/simple;
	bh=DO+hGIhUqjaFZs0MO2REFIuPzswmairinYPi2NAv6Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7ks6WCP/UyChwWSqoaJzQnf4djJcwNlfM0F6F/z/QQHJAgDFgEjmDnOb4gSE6+MXfmYchjLsxXbEqeeMxk+kPhA0gcHZX1SqzNrGRmXdB7ov0BFTWygm8Twp78Jo7Uw9R1qTVQmzueGH9ouriYqjER2ufS2SZzI4jxaSxgxTPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsPSyAST; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744719413; x=1776255413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DO+hGIhUqjaFZs0MO2REFIuPzswmairinYPi2NAv6Is=;
  b=VsPSyASTl6QnU5QZE8/CDYaKKIMQsLci5n562YyJ23y6o5x+dIaKOpa7
   c15++W9FTbxzG3YjjKpD0NSBbNfzdgnxd5HAZeaAF2317J9VL3hKGNK3y
   x9HG8yRAjHKkqybaRMuDcPYXQCtLvi+aMLiMq+/0UznWNM1nDRpED4mq4
   1PPsUHJy95HnFnitGKsSa7p2cVYv4iQtwytIdny7hr1SVeq5WbdgwjjwA
   cTogr+IA/jPWQSAaT4jC+hMeGhumjfB40nkpfYLLBPxjIimgpA/fRgzLL
   JXsBne4/lDjW9sgbObbKq99+CBY4bX/i8cM17N9kO9mm6hYd1LmZFtVKa
   Q==;
X-CSE-ConnectionGUID: N0AfAZLHQySKhptOH1OAVA==
X-CSE-MsgGUID: Kww5XlcSRdC0j3+MeMF63g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46388492"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46388492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:16:52 -0700
X-CSE-ConnectionGUID: lWsnU8KbQFeb5bXK7nr3kQ==
X-CSE-MsgGUID: cXkil7H0SFqTq1tl+y4hcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135290315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:16:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EABCC11F7E7;
	Tue, 15 Apr 2025 15:16:44 +0300 (EEST)
Date: Tue, 15 Apr 2025 12:16:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
Message-ID: <Z_5OLCUQEAYVBgHn@kekkonen.localdomain>
References: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-0-211e3e6fae90@linaro.org>
 <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-2-211e3e6fae90@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-b4-media-comitters-next-25-03-13-ov02e10-v4-2-211e3e6fae90@linaro.org>

Hi Bryan,

On Mon, Apr 07, 2025 at 10:13:08AM +0100, Bryan O'Donoghue wrote:
> From: Jingjing Xiong <jingjing.xiong@intel.com>
> 
> Add in the ov02e10 driver from the Intel IPU6 repository.

This commit message is just too much for adding a driver. I've just dropped
what's below.

-- 
Sakari Ailus

