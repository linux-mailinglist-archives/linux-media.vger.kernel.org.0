Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D9919D048
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 08:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387709AbgDCGhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 02:37:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:26051 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730759AbgDCGhX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 02:37:23 -0400
IronPort-SDR: RZnlD4dae2bMNWDjZOMQ8NYusJLdcxRnpOegY0qosItqQq/vDQB/zAiUPvpbtshvilDxkSB8PZ
 4MMV7MzH4L/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 23:37:22 -0700
IronPort-SDR: uVq+TP60UB0gu+tUe0oDJi+pXCzxXRnZFGpBougHPq3mDYA7uvPNFHvnTQPtYzbVHIepve5iX1
 U0ugja7fX5rg==
X-IronPort-AV: E=Sophos;i="5.72,338,1580803200"; 
   d="scan'208";a="423425676"
Received: from ellenfax-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.38.213])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 23:37:17 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Joe Perches <joe@perches.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>
Cc:     mchehab@kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
In-Reply-To: <04bb934e551f43540d1daacd2759beacc0b3116a.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200401140522.966-1-sakari.ailus@linux.intel.com> <87eet6mgk7.fsf@intel.com> <04bb934e551f43540d1daacd2759beacc0b3116a.camel@perches.com>
Date:   Fri, 03 Apr 2020 09:37:14 +0300
Message-ID: <87zhbtkrc5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 02 Apr 2020, Joe Perches <joe@perches.com> wrote:
> On Thu, 2020-04-02 at 11:34 +0300, Jani Nikula wrote:
>> Or could we conceive of a way to make this locally extensible yet safe,
>> letting callers use something like %{foo}, as well as providing a
>> locally relevant function to do the conversion?
>
> No.  printf validation would be broken.

I tossed the idea on a whim, and thinking further I could probably come
up with a number of challenges, but care to elaborate on what you see as
the problem in validation?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
