Return-Path: <linux-media+bounces-2281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437280F803
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 21:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08ED01F217B3
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 20:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5A964133;
	Tue, 12 Dec 2023 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vx5xe6FO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1857CD
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 12:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702413600; x=1733949600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=89nCA9al8z8ZwVpol+WkV26BQHHdGXN/l49oF/lim+Y=;
  b=Vx5xe6FOXcWbrk9HcgdqgKI6Z9J9uOTiWEsj4GWY7xrFfPu6k8N+4p6s
   +Q7+GVx1dLQaotxInwK5PxaxWi4ZG2Kyy35wMa42+uOiWZUul67zkXLf9
   xmcZQKq7F3Ofigpfi/Sg7o6RZZqWEQFwsaRCF8OGSr+SsyFvaYFrOZ+1M
   2lIpoKynFcQMoZJyhgMv6uF9iuQgGDBhPmtIG2vc6Nh4YUMmfOycxeBqd
   Dul1asFdKaqvW4ltvas8aVtlgXpy08OHaYJ/T8YcAKj62vBi5mC4rzUBG
   utXVZxmLF3oco8pvWJ58/oA9uiIZ/MYXDOd6mEzxKezsNem+ixXP84TWz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="393739728"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="393739728"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 12:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="807905759"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="807905759"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 12:39:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59AF611F816;
	Tue, 12 Dec 2023 22:32:15 +0200 (EET)
Date: Tue, 12 Dec 2023 20:32:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH v7 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <ZXjDTyitj5APSv6s@kekkonen.localdomain>
References: <20231212191117.133868-1-jacopo.mondi@ideasonboard.com>
 <20231212191117.133868-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212191117.133868-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Tue, Dec 12, 2023 at 08:11:17PM +0100, Jacopo Mondi wrote:
> +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> +	.init_cfg = ov64a40_init_cfg,

The init_cfg pad op is gone --- it has been replaced by init_state internal
op.

-- 
Sakari Ailus

