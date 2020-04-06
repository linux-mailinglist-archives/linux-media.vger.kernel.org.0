Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6FF19F0DE
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgDFHh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:37:29 -0400
Received: from mga03.intel.com ([134.134.136.65]:65110 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgDFHh3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 03:37:29 -0400
IronPort-SDR: v8FVYcCLbmpqSPiMm0qmKh3vPR342wFb2q2ejyOwcB+I8w9NFZkH9MP4qVtb/86PJFLIizkecV
 KAdaYQ2l771A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 00:37:28 -0700
IronPort-SDR: zxLso1bL8TOm8/q9pVl5b7mn+2Qd5Yv+N4xY2VboEbl8J62xz9AZJHXFzSK6xGtOEzeuj0Y5zo
 52evW69Yzqfw==
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
   d="scan'208";a="424272165"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.38.121])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 00:37:23 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
In-Reply-To: <20200406072857.GD5835@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com> <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk> <20200406072857.GD5835@kekkonen.localdomain>
Date:   Mon, 06 Apr 2020 10:37:20 +0300
Message-ID: <87wo6tkqtr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 06 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> On Fri, Apr 03, 2020 at 02:10:53PM +0200, Rasmus Villemoes wrote:
>> What's wrong with having a
>> 
>> char *fourcc_string(char *buf, u32 x)
>> 
>> that formats x into buf and returns buf, so it can be used in a
>> 
>> char buf[8];
>> pr_debug("bla: %s\n", fourcc_string(buf, x))
>
> I guess that could be one option. But changing the implementation could
> require changing the size of all those buffers.

Not arguing one way or another, just observing that
drm_get_format_name() abstracts that by using:

struct drm_format_name_buf {
	char str[32];
};


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
