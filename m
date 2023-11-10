Return-Path: <linux-media+bounces-74-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 521027E84FF
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9CA1F20F08
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789C3C687;
	Fri, 10 Nov 2023 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro5BL+6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FD93B2A3
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:15:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3749093
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 13:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699650957; x=1731186957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+nX+cApHvr+6DEkbE0AQJYQIjjEnYvv1oQk6s3lB4ls=;
  b=Ro5BL+6ZcmPrnzQiGVd+4gbdqOfxScXufA9HY9J2VKhoBS49N7HmwBAA
   iCWCqv0b2ct735FDWsS9jUh8v7vJFHWoJgXhsCn8KLpMF8NO83Mo06JAi
   JF3jNTUmjcuOzINXdxfLa3KcvXZmUpUb5iIWnUk6GaT/pXOsmENsPxhM0
   YyETL3LP13eZH1klqkg1p0FKkrVY+9zgimidr90An1S0Rt0RU5nNpU6R7
   q7mIiyibq/Iq5lAq5qtdUrbT6D16UnMtLZrHDKQujhf2ho6W+Tip5f0RX
   Z8ElxKU/oxHuvvc/7Wv6orL+fqlcdbMRyIKQ5TK5O1kHrxaP8lqXOjf8r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380622302"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="380622302"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11566423"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:15:56 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB6C011F894;
	Fri, 10 Nov 2023 23:15:52 +0200 (EET)
Date: Fri, 10 Nov 2023 21:15:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state
 access functions
Message-ID: <ZU6diJrv-iKvcE9B@kekkonen.localdomain>
References: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
 <20231110153940.GA7466@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110153940.GA7466@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Nov 10, 2023 at 05:39:40PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Nov 10, 2023 at 12:10:49PM +0200, Sakari Ailus wrote:
> > Compile sub-device state information access functions
> > v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> > now also used by plain V4L2 drivers.
> 
> What do you mean by "plain" V4L2 drivers here ?

Those that do not need MC: if you now disable MC in kernel configuration,
these functions won't be available.

-- 
Sakari Ailus

