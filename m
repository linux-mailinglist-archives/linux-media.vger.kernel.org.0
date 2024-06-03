Return-Path: <linux-media+bounces-12489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B288D8A5D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 21:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D565C1F22FDC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 19:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34037137C48;
	Mon,  3 Jun 2024 19:38:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08283838F
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717443523; cv=none; b=SNhe3lityvXp1L6Ch3vX5leiaOiZWM8ZeFvYtQPEffbQGKv9g5nrBONGkJhdNxmoM/t4mV0qToYRtfgjFz5mxu4M5DFBYuU5gBfoAcwpzJsUr6Q9Qj8KJQvpuMy8o2dNZFaEri8y1i2lDaI1OT/nmeSey8GiGDSwu/5gcUblbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717443523; c=relaxed/simple;
	bh=xTKlI+qzcScHF5vANirflYBNc0FczqWJr1AmzPTugVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiWuLwrM3uPl48EKMhVphIvGh/o9SZzQenQCTEQ99GRhUHxguy+rAY7UPObgAYqc89J+jtr/OEPb0rgPeQKjoKcQ+HjXXw5BXIkN9OO06cO76dSpOZ8BYLMTp9X8saaEsXrl1165mw4SSODFdSXYZlyqHoVJiibTua/PCU5R9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: eSdmU9MYR2+34iQjx5nW8A==
X-CSE-MsgGUID: Kfg9k4NaSW+s3e4GQQA+XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14142224"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="14142224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 12:38:42 -0700
X-CSE-ConnectionGUID: PhLRWI0ESWWH3SFK5droOw==
X-CSE-MsgGUID: P819EeCsTcSpRKlehzNwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="60159669"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 12:38:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1sEDVq-0000000DN7w-0DV4;
	Mon, 03 Jun 2024 22:38:34 +0300
Date: Mon, 3 Jun 2024 22:38:33 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] media: atomisp: Remove unused mipicsi_flag module
 parameter
Message-ID: <Zl4buULQdXlDzRku@smile.fi.intel.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603132057.255917-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 03, 2024 at 03:20:53PM +0200, Hans de Goede wrote:
> The mipicsi_flag int is completely unused, remove it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

(One nit in patch 3, though. I think it's worth to address)

-- 
With Best Regards,
Andy Shevchenko



