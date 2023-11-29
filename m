Return-Path: <linux-media+bounces-1378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467F7FDBF1
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 16:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B03B6B2132E
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EFB39858;
	Wed, 29 Nov 2023 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfXeQofV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C6983
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272981; x=1732808981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=geQVgVzyS90Mpx8QqGlloWOjEaxEOxFJETrs/wpwb8c=;
  b=cfXeQofVKDOaoEYBEylr55kYJTcJFszMqKKo/W8Ikw2Ak+y+BwJooMM5
   PtKTX2+L1FwqAqpGW19cjyiGK5FEc/8mDP8RDgbPRLqElvUxG5jDsEQKY
   +HyB5FEcQus7a36ORjFflBqwxBzvbVlO9o7EOjWiTbFKDeA9e37sRpwnt
   2lF7ien7ds+JetxLSOfIFEri73XaHXc5V/4cF5o7LtW920biOhJiqYN8x
   0Jk679d9sJFwMMFgkDvrf5y76uAU635Sc1GhRaB1ceMzS+ArK/fRWwn4P
   8QwLnaSw8V3xJgJJ+ZYyfcLVyrDzZVZbg2ikx98obk998C0ztky23emaR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="172997"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="172997"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17046215"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:49:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A91111F915;
	Wed, 29 Nov 2023 17:49:31 +0200 (EET)
Date: Wed, 29 Nov 2023 15:49:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: vivid: Don't explicitly set bus_info
Message-ID: <ZWddi1pURkX4qLKz@kekkonen.localdomain>
References: <20231129141545.87461-1-sakari.ailus@linux.intel.com>
 <20231129141545.87461-2-sakari.ailus@linux.intel.com>
 <c64a2df0-929f-41ec-b24e-385f1c11a53c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c64a2df0-929f-41ec-b24e-385f1c11a53c@xs4all.nl>

Hi Hans,

Thanks for the review.

On Wed, Nov 29, 2023 at 03:26:00PM +0100, Hans Verkuil wrote:
> On 29/11/2023 15:15, Sakari Ailus wrote:
> > The bus_info field in both struct media_device and struct v4l2_capability
> > is assigned by the framework for platform devices. Do not set it in the
> > driver.
> 
> That doesn't work for vivid. The problem is that if you create multiple instances
> (e.g. modprobe vivid n_devs=2), then each instance will report "platform:vivid.0"
> as bus info, but they must give different bus_info names since that has to be unique.
> 
> It should be fine for vimc, though, since that's just a single instance.
> 
> So vivid is an exception to the rule. Rather than removing these snprintf lines,
> adding a comment might be better.

Sounds reasonable. I'll do this in v2.

> 
> For the record: I tried exactly the same thing myself some time ago, and then
> discovered that that didn't fly.

-- 
Sakari Ailus

