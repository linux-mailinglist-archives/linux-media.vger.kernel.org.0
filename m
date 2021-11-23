Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF6E45A09F
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 11:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhKWKu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 05:50:57 -0500
Received: from mga17.intel.com ([192.55.52.151]:9287 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233234AbhKWKu4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 05:50:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="215709007"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="215709007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 02:47:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="457013260"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 02:47:37 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D658220762;
        Tue, 23 Nov 2021 12:47:34 +0200 (EET)
Date:   Tue, 23 Nov 2021 12:47:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: Re: [PATCH v5 00/17] Extensions to ov8865 driver
Message-ID: <YZzGxhSv7sBMJXBO@paasikivi.fi.intel.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 23, 2021 at 12:00:00AM +0000, Daniel Scally wrote:
> Hello all
> 
> This series extends the ov8865 driver with:
> 
> * Support for binding to ACPI enumerated devices.
> * Support for a 19.2MHz clock in addition to existing 24MHz clock support
> * Another v4l2_subdev_pad_ops callback
> * 4 more V4L2 controls
> * makes the driver supported by the cio2-bridge
> 
> There's also a little bit of tidying that I did along the way.
> 
> The series is tested on an MS Surface Go 2.

Nice patches.

Thanks, Daniel!

-- 
Sakari Ailus
