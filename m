Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272E12B85FA
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgKRUsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:48:18 -0500
Received: from mga07.intel.com ([134.134.136.100]:46880 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgKRUsS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:48:18 -0500
IronPort-SDR: 22wYbizne60gUnIWQLO5XH7ToXE5VZAYp7/hmgVb1RhoKN0ySCQ4fFypmUNIsGtxxZ5UiRTURW
 0IfINVfRVNqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="235331457"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="235331457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:48:18 -0800
IronPort-SDR: gOxYMwFTEm51El8R6t+bLq2W9Yh2DF03muqyt/FSbiDGPvki5XuVL63E16h2kNlVlTYWOG4RdB
 CV5dxdz1GybA==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="368494289"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:48:15 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 93AB520808; Wed, 18 Nov 2020 22:48:13 +0200 (EET)
Date:   Wed, 18 Nov 2020 22:48:13 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v3 29/29] media: ov5647: Remove 640x480 SBGGR8 mode
Message-ID: <20201118204813.GN3940@paasikivi.fi.intel.com>
References: <20201109164934.134919-1-jacopo@jmondi.org>
 <20201109164934.134919-30-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109164934.134919-30-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 09, 2020 at 05:49:34PM +0100, Jacopo Mondi wrote:
> Capturing in 640x480 SBGGR8_1X8 hangs the system when capturing
> with the unicam driver on RaspberryPi 4 platform.
> 
> Remove it.

Is this somehow a property of the sensor driver? Is the sensor driver in
use somewhere else where this configuration could be useful? Can other 8
bpp configurations captured with the Unicam driver?

-- 
Regards,

Sakari Ailus
