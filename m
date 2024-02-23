Return-Path: <linux-media+bounces-5757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E854F860EEB
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 11:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DC01C218D9
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589745CDD2;
	Fri, 23 Feb 2024 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hadUZC1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BDD533
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708682976; cv=none; b=oXWcfqvu5/QesgC7dtR20sTI5lR226/prouZiFBjn935Pi2rSOj3RUEvxzUVjuxRAhw2w5jHPKnpsvTO5OmMoaxMU/S68wJWOK2OIcXiKwAo1KlYN0kl3LBaRvJLxYp5ug9/sDoK3qWyyiKvQpJk9hydNfGQ2gbkdTMQ/pkxpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708682976; c=relaxed/simple;
	bh=uyn1jMafq9iqgSvn3eisWqYZjcSHh8iFZXXePmxS7S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwenlUB1XU07T6PlHGJzgJ1T1amJPxfQ/ZHBEW8xItyrAy3RGJleOy1G/GMnwqlBZtCvRe7+W2VdmGKUFohBRPQEHd0cPUfrfJuA0/OXhe0z3nTR3t+AffQxHErHSenpbEVeauzcw4nSCnDKOQQ36gAWxAKcqhrlQ2Mt0J1Fy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hadUZC1Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708682975; x=1740218975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uyn1jMafq9iqgSvn3eisWqYZjcSHh8iFZXXePmxS7S4=;
  b=hadUZC1YuJ1yyYj69/SNaNO7D5Kucz8xKPy8qVFn4NTgocLYIrrs1OYl
   rjvVYhnNuBfkIJAmBUKyPdbkMojJdAgMrV1T0wVk0Vb9G78Ks7W6FowA2
   MXg2ny4UV+aiuu9ZG3JnJIZCdcBZSl/5ntZJidNEAzoil8JBQoBmQdk3Q
   kbOFcVevaRqz0yB7/KMx/19eRvs2sQf6ruG3xTwPnI1sPCEjrXmo1Cquy
   4Ii/22VjT0LwPD0pWd/Vefm3dezUpK6pLVeY+jkrwki8EoOMlsOP67E+P
   YB4zTpIKLDUSnfVyiSDbxzADMk+Tr0YztMJN+Mhrh1lrmbdx1hbrUkPrv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13629603"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13629603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 02:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5878628"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 02:09:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9730C11F81D;
	Fri, 23 Feb 2024 12:09:29 +0200 (EET)
Date: Fri, 23 Feb 2024 10:09:29 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: mc: mark the media devnode as registered from
 the, start
Message-ID: <Zdhu2bAswvseLYGI@kekkonen.localdomain>
References: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>
 <20240223100053.GJ31348@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223100053.GJ31348@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Feb 23, 2024 at 12:00:53PM +0200, Laurent Pinchart wrote:
> I however wonder if we couldn't get rid of the flag and delegate the
> registration test to cdev.

I'd see how this could be done after merging the lifetime management
patches.

-- 
Sakari Ailus

