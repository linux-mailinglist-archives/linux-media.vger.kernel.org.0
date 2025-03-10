Return-Path: <linux-media+bounces-27954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB66A593FA
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7321D1893D1B
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215CC22579E;
	Mon, 10 Mar 2025 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHneuGjy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA42A221732;
	Mon, 10 Mar 2025 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608707; cv=none; b=GRG5qp1GGwEPUAJOrixWaNDSSxTn3C0kTNdBQmi2E2t2s6mIvEX8w7qLz0dwo6Bk4s0uYA+/zystakAbNvaCdDsH+Fsb7wqqwWfaz5msNMifHHYnH9gyhq1A9HdwQfO5Bz1MkG5X2WNuDoJ0Xm4QLsDLqdI62puRhBT7NidfPkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608707; c=relaxed/simple;
	bh=jgbdzMRYXyWDracGEm3Dg8/0oJWyKDx7+oiJUHfsqSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkHRG8+xDXk8ltrbNjKkqj4vzOLoWy+RlXUUytf6Yx4tvo2kIBNYHgrIlDhm4TbhB3uxKwoimJUGDmECNYCDocUXObNXcJX1xCr94QvKBJdo7WmvpYm08408dJA+dTabYTmOCvaH2Q452UKoCgkKlFZ0La8rjJwockD+N6X+Kb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHneuGjy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741608706; x=1773144706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jgbdzMRYXyWDracGEm3Dg8/0oJWyKDx7+oiJUHfsqSk=;
  b=hHneuGjyC9sHEblU5q8y9IH4AMEXCRp/Ac1Wp/kK93wxHbjFZof27TK0
   QbnPcUccqVlZB+F+uYrm8aBqAo3yAQntlirgYXaioI2vE8eCteYfxKQfH
   UXKTfvqgvgry8tyvyxirM8Dac5EJ5jSHlT1nZ+tqfIU7LxHy8mRk//EqU
   M+eBzcroB90In7bzLKr5NqoVMaT0w7jOfGmCCUQ6XecukW0/1IFX6ZURO
   grOVKUVPS896zHBuCAUT3s3NfRyk63ubL/VwNXPiykX/AnkOl3sO3/pfM
   lRDHbqpkLZUsQnERqD4rEFr81KJBZtC7bUu/XhDRRPkdnyo+tAjKGgfAA
   A==;
X-CSE-ConnectionGUID: 2aqtG6o0TIuh0CDgwO4QYw==
X-CSE-MsgGUID: M/xh8bJDT8u4MjjBZMVbWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="41848867"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="41848867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:11:44 -0700
X-CSE-ConnectionGUID: fIgBBpRsT8SSIihjEDwwkA==
X-CSE-MsgGUID: dHMjuNwGRia9ODpBfFGY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="124982563"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.245])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:11:41 -0700
Date: Mon, 10 Mar 2025 13:11:33 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, 
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <hg2es6fl4yty3zo6gvf6xabw6kzztaz6awqslvxvumn5hhhsq5@d6xz7khblt7u>
References: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
 <Z8rd3ipjkbaE4zfc@kekkonen.localdomain>
 <Z8rfDVow6hDeuZRS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8rfDVow6hDeuZRS@kekkonen.localdomain>

Hi Sakari,

On Fri, Mar 07, 2025 at 11:57:01AM +0000, Sakari Ailus wrote:
> On Fri, Mar 07, 2025 at 11:51:58AM +0000, Sakari Ailus wrote:
> > > +	int ret;
> > > +
> > > +	clk = devm_clk_get_optional(dev, id);
> > > +	if (clk || IS_ERR(clk))
> 
> I forgot this bit earlier. The IS_ERR() check is redundant.
> 

Wouldn't you say that this helps with readability even if it is
redundant ? This will warn the users of this helper that the call
may fail and return early ?

--
Kind Regards
Mehdi Djait

