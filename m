Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C9B481158
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 10:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhL2Jli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 04:41:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:55906 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235116AbhL2Jli (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 04:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640770898; x=1672306898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEPAqoUgs5OkQCUo1w+fD0i8H6uPE0TFP7VswzUBmTU=;
  b=gSd0YorQaM8jyIiv42HtpZGv+0T6LEtVwYG0/jBgkhMUJAEZgfgu5SMh
   3tKl+ZTrJVR/08Tz4+38judhnvetYF3XU3pngZefT+bujkd5Iy79zU7Fl
   0e7Y/YmyGv4SbcnpGo6mUjaiac/mMzjndKrIMMGQxdmzG8WkPOxu4v4Os
   MFi6/VWb+SnoGMhU7jYRQZMGTV3Q16DboxzS4wYXeokTJHNEGSWCBVtdZ
   t78bOGLMRpQ0034f4FfZW59uYqDjLMu/MSg4AkC6QeWwHe185UkagqmCs
   c/yKcl9rGE+PTBpNveHQEbd7Io1beeaZ7aLaX43/rOA7l7ibDEgZ3/o9Z
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="302247599"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="302247599"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 01:41:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="510465622"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 01:41:35 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B08682012E;
        Wed, 29 Dec 2021 11:41:33 +0200 (EET)
Date:   Wed, 29 Dec 2021 11:41:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, shawnx.tu@intel.com,
        senozhatsky@chromium.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com, andy.yeh@intel.com
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
Message-ID: <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
> MWB gain register are used to set gain for each mwb channel mannually.
> However, it will involve some artifacts at low light environment as gain
> cannot be applied to each channel synchronously. Update the driver to use
> group write for digital gain to make the sure RGB digital gain be applied
> together at frame boundary.

How about the analogue gain and exposure time?

Shouldn't they be applied similarly as well? Adding two more writes
increases the probability of missing a frame there.

This is of course a trick since the control framework doesn't really
support this, but I think this support should be added.

-- 
Regards,

Sakari Ailus
