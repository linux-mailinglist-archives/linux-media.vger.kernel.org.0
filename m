Return-Path: <linux-media+bounces-18454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D197E77F
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EFB281BBA
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC6193437;
	Mon, 23 Sep 2024 08:27:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE517BA9;
	Mon, 23 Sep 2024 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080026; cv=none; b=t+EdHH3CBkOYhJZzYMjkzTC2OckcwyS5/XHe3wtVFKtKx362fZx3yc0UWPqwaG/rXP1ZgxM3noRBjUYjqZQLEug+TnvPdOtE9Z7cGpZkASR6UQ/UUQHPDcFVS8Agq05HtCzzYhR8OZJNVY0im8WSA7b9jC6sc2zl+2B1n+45xXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080026; c=relaxed/simple;
	bh=PSSjJyi1dWOYPMiVPEpsZiDxI9jTrJz9mBMSIBkprxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK2hUThTs/Qv9il/eFzNEBvitpck2wkr7AFvRVMFOA4YfyyL7RHO3VER4J4tfepGsXj9qMguJw13l3PuLhIR0sDfbeNWUzz19/zATscRKu45Y/EKUO4o3iD9fCUjHFzx2HoTxO74zCIZZnMYrUImPo+5CIt3JdwwvnAiM65x7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: zIA8nre8Ty67P7aXdWl91w==
X-CSE-MsgGUID: xnfEa4YBTA2dY3riCnZ7iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26170325"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26170325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:27:04 -0700
X-CSE-ConnectionGUID: pssH7/+FQ2yDXagiP4CQ4w==
X-CSE-MsgGUID: Hp6F8YziRwGo+KczY5dHsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70577136"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:27:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1ssePJ-0000000BtNK-3QYE;
	Mon, 23 Sep 2024 11:26:57 +0300
Date: Mon, 23 Sep 2024 11:26:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Yu Jiaoliang <yujiaoliang@vivo.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
Message-ID: <ZvEmUWD75Huv7vwy@smile.fi.intel.com>
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
 <84c96000-e198-4502-b37d-0ca15c311968@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84c96000-e198-4502-b37d-0ca15c311968@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 07:57:00AM +0200, Philipp Hortmann wrote:
> On 9/23/24 5:30 AM, Yu Jiaoliang wrote:

...

> I cannot apply your patch:

>   Fetch URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

You used the wrong branch.
AtomISP has it's own tree/branch for development:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

-- 
With Best Regards,
Andy Shevchenko



