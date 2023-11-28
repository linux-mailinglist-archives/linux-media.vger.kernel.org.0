Return-Path: <linux-media+bounces-1210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C707FB6B9
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0E1282915
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504B64D11F;
	Tue, 28 Nov 2023 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJDl4ZEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E880BF
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701165999; x=1732701999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BMYQJRXWnxkDLd78kI/QmxvWaeoD+RJoupD+8uMcz4I=;
  b=ZJDl4ZEy7c839En9ORTbcg5GWeND1mXmAZyspOeXYH2Gthpef1RAd6HY
   SOVvsHldYkSANMXc+CVDbVbrIpZBckgyayOORYr6e0Y+/4jRgATxWJe/2
   WQA1P70HYtQNGazp08Axl32io7/rrzh07cERKIdUh3JwxLAwExGy74uB7
   Gr58DAcubOBus/yfGl+Z92C2khbbHGxt9qjgWmGAV20TwqPa0Kkc7Ewfq
   wX0ZG5xxi1+npC7f1xAuNooXGJuVZitYW7HiGyvt+6mZEhNlD3uyFvvGV
   TkZu5fDkE4K9TVffVhQzGz2x6PL7KcJg5LDdz1uaZ4jUSg0wyEHMDFWTB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="479091621"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="479091621"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 02:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718334288"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="718334288"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 02:06:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B25BF11F915;
	Tue, 28 Nov 2023 12:06:33 +0200 (EET)
Date: Tue, 28 Nov 2023 10:06:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: ov2740: reset GPIO, clk and 180 MHz
 link-frequency support
Message-ID: <ZWW7qZjl4JVqaTsm@kekkonen.localdomain>
References: <20231128100047.17529-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128100047.17529-1-hdegoede@redhat.com>

Hi Hans,

On Tue, Nov 28, 2023 at 11:00:38AM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is v3 of my patch series to allow the mainline ov2740 driver to be
> used on various Lenovo ThinkPad models using the IPU6 + ov2740 for their
> camera. This series has been tested on a Lenovo ThinkPad X1 yoga gen 8
> with both:
> 
> 1. The out of tree IPU6 driver with Intel's proprietary userspace stack
> 2. The pending mainline IPU6 CSI2 receiver patches using raw bayer capture
>    in combination with the WIP libcamera SoftISP code
> 
> Changes in v3:
> - Add missing fwnode_handle_put() in error-exit-paths in patch 3/9
> 
> Changes in v2:
> - Add patches 3-9 which add 180 MHz link-frequency support
> - Fix code in patch 2/9 to stay in 80 chars limit

I tried to apply these but it seems that these no longer apply with the API
changes in my tree. Could you still rebase these, please?
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>

-- 
Regards,

Sakari Ailus

