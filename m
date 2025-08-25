Return-Path: <linux-media+bounces-41002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2BB33CE1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFBCC189A605
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5978B2D12EB;
	Mon, 25 Aug 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epdFf+gR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9743ABC
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756118188; cv=none; b=fgpN3NgGMlkSjAPVh+/fic4ZCmZg67A5RZ2l0mRjuojY3q3Z7+VWR0McYXHMDEJfxISFMiIuDHG+WcLE42Xg0OjVbJyptY/IQ2Ubrnnxjj0aimSjh3sMp7Jwv+Zs5opNFCRE/6XVQA/Xchz7BHWw8mrPHfiabOkWA4W0cSK2030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756118188; c=relaxed/simple;
	bh=tPV8emKO54WfdRV7rXvn90sSh9KG+074fwqXuhOJdwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+kD11VAbLt3H9W5jmsArbgnYB39gJnIaBG1BV5mzRrT2CPoj7qA0FFVEgKLUrbVr+XfXjfp2gHTkya60tWShznqk/TqC4VT1cRB6ANyHOED3TSJWk7WdkXjwMAlaPduyOKx98WyP8B4VKdG89LaOY5oaSYLwwXdwnip4BbbIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epdFf+gR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756118186; x=1787654186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tPV8emKO54WfdRV7rXvn90sSh9KG+074fwqXuhOJdwY=;
  b=epdFf+gRp8paUVaam2ZFmdW+6heDSrck05fdrIzxGXRkBwVJfK5DtKah
   iUMnXrI0nMBhBrltXyHwcijMZuy/wvBApBHIfxTgZqUmk9K6a8j0PD3/X
   YgY1yYeP1TY9ms4myrjbpttpTQQtE+s5OcsaCUDL1sQQleEDFGhak8Wbk
   m8hPp98n+dsCnZF1Bd1kQAIi/j3GzGK4X3OYlE3+Y5e03DuWHLN7UXXIa
   sV1FKiBLUqhZn/7LMdNSVqBdmZWj+WF2Xte6XejnY4ndfpUf/z+Dmzqrp
   z+w1lk+rn/qfKPZOqAVXlUWltO3tR+AeI2DiaoFofA8QU/2ron3MAP96j
   w==;
X-CSE-ConnectionGUID: 2vV3zy0tShmQqPgLPMQarw==
X-CSE-MsgGUID: gTWXuM3qTXm/tdGu1SqQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="60957214"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60957214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 03:36:25 -0700
X-CSE-ConnectionGUID: 7L7O9Q3OSxeOP2l83cT/OQ==
X-CSE-MsgGUID: Cqtelp5gRwmimpv8yMrhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169456697"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 03:36:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 964121203CE;
	Mon, 25 Aug 2025 13:36:20 +0300 (EEST)
Date: Mon, 25 Aug 2025 13:36:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: mchehab@kernel.org, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] media: ipu3: Use string choices helpers
Message-ID: <aKw8pBNOJ7-4bAHR@kekkonen.localdomain>
References: <20250825102104.961139-1-chelsyratnawat2001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825102104.961139-1-chelsyratnawat2001@gmail.com>

Hi Chelsy,

On Mon, Aug 25, 2025 at 03:21:04AM -0700, Chelsy Ratnawat wrote:
> Use string_choices.h helpers instead of hard-coded strings
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Thanks for the patch.

The patch is fine but a similar patch
(<20250804-ipu3-string-choices-v1-1-506834a013b5@gmail.com>) has been
already submitted by Nai-Chen Cheng and that is merged.

-- 
Kind regards,

Sakari Ailus

