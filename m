Return-Path: <linux-media+bounces-12526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31D8FB0AF
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 453C9B21AC3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73335144D23;
	Tue,  4 Jun 2024 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc9Jaivy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073D144D03
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498908; cv=none; b=eFA8eQXMbP4wAAAN3LGTlkqsjKKStbLg+3r6PAPk6rErErKyPI8NbdebzHTttdigrbtucs7jZoRy+C3x2wvncL8RsAfWPRsV3uFRR2fqSDjPTh+w2M2L2pccGyuNweVgCqhSRgOCROM3rZ3Q7ixsBdIhOGIgEkhd/7HCQ+glDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498908; c=relaxed/simple;
	bh=v1lqw6uIRtdTtc+uSSTTHdmLs9cN06DhIbNRp7q6yr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ta+IkrkrEcbqxVLyW7ZtvlQ2/kfkQzD7qlAKkuhjUtSCP9ie64xnaH4LLcyK5MEJZLQHdr562YYjLntl5RGgXEaUi3HelWfx9R69bJQ5JptWihXF+/8jKlDLssTSgF9Y7eUAobU8fVP6zEabkUITTdFuyd74A+x849YGEQP0FSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc9Jaivy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717498908; x=1749034908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v1lqw6uIRtdTtc+uSSTTHdmLs9cN06DhIbNRp7q6yr8=;
  b=mc9Jaivy7D3EiNVSKsFCpNwtsBsPCHfp7c1RK2eBVbF6S+M0GoSqlgQr
   AgL1nS942L5r5gyT/RE6wfaBKx5Z40KDsiCpR7MU9r5A+toPLpXx1tEG/
   7D7fWFy6hYAbB2q/EE0WBSBFBxdWqh7fDUNlIZryJUmuOOLT+tFL+czjN
   PJl7ZRTCs81tilCPfw1Qqp7GcBbjfYRkJRHIa/3xLl0x+l38cKw7BIRVP
   W8HLMDtexu4f5qH4PiyKegEZfERMZ5NF9CnhrYXlsrO4MdcqpWuh7iC7v
   +5FzSNp/DBa7Zo9HUp913473Xzn/Q0cA21oC8WjAJFecto+I6XSHpwQ7L
   g==;
X-CSE-ConnectionGUID: +pRLzUmcT1WxATOjSHTFhA==
X-CSE-MsgGUID: YnEr2k2PRy6ircErRWZDnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14152548"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14152548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:01:47 -0700
X-CSE-ConnectionGUID: 5BgzIRNqR1u1S1zf2qVJjw==
X-CSE-MsgGUID: 1YoSJMZzS6aUZ/mvH3F3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37257064"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:01:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5DDB111FA4A;
	Tue,  4 Jun 2024 14:01:43 +0300 (EEST)
Date: Tue, 4 Jun 2024 11:01:43 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 18/29] media: mc: Postpone graph object removal until
 free
Message-ID: <Zl70F7tQTYhjXtRx@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-19-sakari.ailus@linux.intel.com>
 <20240207141820.GP23702@pendragon.ideasonboard.com>
 <Zl7zpctzVHO1BGL5@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl7zpctzVHO1BGL5@kekkonen.localdomain>

On Tue, Jun 04, 2024 at 10:59:49AM +0000, Sakari Ailus wrote:
> > > @@ -787,42 +812,14 @@ EXPORT_SYMBOL_GPL(__media_device_register);
> > >  
> > >  void media_device_unregister(struct media_device *mdev)
> > >  {
> > > -	struct media_entity *entity;
> > > -	struct media_entity *next;
> > > -	struct media_interface *intf, *tmp_intf;
> > > -	struct media_entity_notify *notify, *nextp;
> > > -
> > >  	if (mdev == NULL)
> > >  		return;
> > >  
> > >  	mutex_lock(&mdev->graph_mutex);
> > > -
> > > -	/* Check if mdev was ever registered at all */
> > >  	if (!media_devnode_is_registered(&mdev->devnode)) {
> > >  		mutex_unlock(&mdev->graph_mutex);
> > 
> > Unless I'm mistaken we don't need to lock the graph mutext to test this,
> > so I think you can drop locking completely here.
> 
> There may be IOCTL calls in progress while unregister takes place. The test
> seems to be fine outside the lock but the section below still needs the
> lock.
> 
> I'll change this for v4.

Indeed the mutex can go, all of the work with the lists was removed by this
patch.

-- 
Sakari Ailus

