Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A128F170274
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgBZPaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:30:01 -0500
Received: from mga11.intel.com ([192.55.52.93]:1255 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728208AbgBZPaB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:30:01 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 07:30:00 -0800
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; 
   d="scan'208";a="230469503"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 07:30:00 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F3F7620884; Wed, 26 Feb 2020 17:29:57 +0200 (EET)
Date:   Wed, 26 Feb 2020 17:29:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ian Kumlien <ian.kumlien@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] Fix build failure due to missing select REGMAP_I2C
Message-ID: <20200226152957.GA5379@paasikivi.fi.intel.com>
References: <20200226143405.55303-1-ian.kumlien@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226143405.55303-1-ian.kumlien@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 03:34:05PM +0100, Ian Kumlien wrote:
> While upgrading from 5.5.2 -> 5.5.6 I was surprised by:
> ld: drivers/media/i2c/tvp5150.o: in function `tvp5150_probe':
> tvp5150.c:(.text+0x11ac): undefined reference to
> `__devm_regmap_init_i2c'
> make: *** [Makefile:1078: vmlinux] Error 1
> 
> The fix was quick enough, make VIDEO_TVP5150 select REGMAP_I2C
> And a quick grep showed that it was needed by more targets.
> 
> Signed-off-by: Ian Kumlien <ian.kumlien@gmail.com>

Thanks, Ian!

-- 
Sakari Ailus
