Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED28E31E702
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 08:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhBRHhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 02:37:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:61996 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230211AbhBRHaC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 02:30:02 -0500
IronPort-SDR: Ke762VkCXF9ytOeAqK2J2X2sTKNx14u3hZTgQiMoQ5NdEgoYulfk3i+zIj7Je4HaIB1HA1I2aG
 3RMPRY6WuntA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="244882856"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="244882856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 23:27:13 -0800
IronPort-SDR: /sCPfWNKE52fh+yCaJ2IFkZ1S2LTiaA22tcHVAEgS89O3W/yKVbJa4uQ6Q22XLdKjY10vAhRse
 dGhgDJfDzvtw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="362331541"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 23:27:09 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3A9132036A;
        Thu, 18 Feb 2021 09:27:07 +0200 (EET)
Date:   Thu, 18 Feb 2021 09:27:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v9 0/4] Add %p4cc printk modifier for V4L2 and DRM fourcc
 codes
Message-ID: <20210218072707.GD3@paasikivi.fi.intel.com>
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
 <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 01:14:42PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.02.21 um 16:57 schrieb Sakari Ailus:
> > Hi all,
> > 
> > 	On merging --- it would seem everyone is happy with merging this
> > 	through the drm-misc tree. The last patch should wait until all
> > 	users are gone for sure, probably to the next kernel release.
> > 	There are no users of drm_get_format_name() in linux-next
> > 	currently after the 3rd patch.
> 
> I've merged patches 1 to 3 into drm-misc-next. Patch 4 (and maybe some final
> fix-up patch) will land when all DRM trees have catched up the changes.

Thank you!

-- 
Sakari Ailus
