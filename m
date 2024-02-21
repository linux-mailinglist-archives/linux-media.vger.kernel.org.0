Return-Path: <linux-media+bounces-5542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64F85D60E
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A90B1C21ADB
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A15D3BB34;
	Wed, 21 Feb 2024 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxcHwdxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3B3E499
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512672; cv=none; b=XqZK5G1mtbi7iQL3RRe5wm6M8V2cvh20w7p1jASdgzjHrnYQxpoANO9EARzmoSWAoyXdmNpDI/QWKpiYWZZwPgTyNIADvM3NSQBRt6GgnL1vyjrRMHc+CU89uzaMdqn8QrhbghA1A+EXscUY3yoYbbW3plfc2orhq/PBUakfXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512672; c=relaxed/simple;
	bh=hAg/SJQWgvfr8MiWS0o32P0P77UnX3zEEUWWxzxPLkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPFqM8gna+WUtUqYqbRu4lzhHZUe+FB0K8wh953xVg80hOwWz+sdU66E3U2RNe/UjBpxHyIPQxL1SD/ZrWQcHIbdSIvGiuUg7e9tkaVZRfIBeTvPHpVD2CDgTiWrc6j2t2LjPohvXDEkDv0gaUok3pdF8sSTCN0jMmd8SfNrQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxcHwdxG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708512671; x=1740048671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAg/SJQWgvfr8MiWS0o32P0P77UnX3zEEUWWxzxPLkM=;
  b=UxcHwdxGv9pX9w3MEYGXhlBunnrI4Qi0roj159/1AXrA4UDN9bQcKxvS
   WGErzHdl7oEoIv1cSxO87NFK3UvvNrcvoFjICtljpCa99vu3oyZcb6hSg
   XZ6CXMABPJCWgDYmwFGH72dDSWPjWbaUWXmY3Dgv05lsUUqUImo39yMzT
   lv8uyXnBu/hiEjejXkz6fmgvw4qGvcHBLem0icKdXtehaKeOObpp1ZeAZ
   CsUlkUUeyS9ikxeYOcyFsPgZqR3xzsLAZNQSSoWGMBXH2Ljr1xILtCdFP
   XiuYOA/8knUD573ttloUJ0lGBeS5WUBaZYrt9mlWBK8a9Bwj77kZ4ZpQO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2802823"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2802823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5395692"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:51:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F13511F855;
	Wed, 21 Feb 2024 12:51:05 +0200 (EET)
Date: Wed, 21 Feb 2024 10:51:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 21/29] media: ipu3-cio2: Request IRQ earlier
Message-ID: <ZdXVmWC3MqexPk6j@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-22-sakari.ailus@linux.intel.com>
 <3a6fe3d1-8b1d-411e-83c9-9611ce4aea67@xs4all.nl>
 <20240207143418.GS23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207143418.GS23702@pendragon.ideasonboard.com>

Hi Laurent, Hans,

On Wed, Feb 07, 2024 at 04:34:18PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 05, 2024 at 03:58:45PM +0100, Hans Verkuil wrote:
> > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > Call devm_request_irq() before registering the async notifier, as otherwise
> > > it would be possible to use the device before the interrupts could be
> > > deliveted to the driver.
> > 
> > deliveted -> delivered
> > 
> > Isn't this a regular fix? Ditto for the previous patch (20/29).
> > 
> > I'd just queue this up in the next PR.

Yeah, I wrote it as part of the set but missed there are no further
dependencies. I'll post a new version of this separately.

> 
> Fixes: tags would then be nice.

It was in the patch adding the driver. I'll add Fixes: line.

-- 
Regards,

Sakari Ailus

