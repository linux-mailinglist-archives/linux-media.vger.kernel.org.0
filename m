Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90205314C8E
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 11:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhBIKJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 05:09:14 -0500
Received: from mga11.intel.com ([192.55.52.93]:42487 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230380AbhBIKDs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 05:03:48 -0500
IronPort-SDR: DhoDtesRw3tsUc+we5MZ3EGR2F2ds7Jb+0XI4OnZ8T7ULahT4sWs86LEesfYsOfydXcqGIxuzo
 0d95hWXXnsVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="178346526"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="178346526"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 02:01:57 -0800
IronPort-SDR: rnhFjJZUyagX9l6NkVSwVAXDoAYjA0WCGcS4e8PMLA+skaUN9neEPOnOysaFZHrDDu8mqtWyRN
 FM7iNXXX6yxQ==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="509823432"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 02:01:54 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l9PqA-003BrA-CZ; Tue, 09 Feb 2021 12:01:50 +0200
Date:   Tue, 9 Feb 2021 12:01:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCJdjv+NjfTn/KsQ@smile.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 10:58:55PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:

...

> __le32 val;
> 
> val = cpu_to_le32(*fourcc & ~BIT(31));
> 
> p += string_escape_mem(&val, sizeof(*fourcc), output, sizeof(output), ESCAPE_NP | ESCAPE_HEX, NULL);

sizeof(val) and as we are discussing in parallel emails something like
skip_trailing_spaces() to be applied after above.

The rationale of the above, that we reuse existing code and existing standard
for the escaping non-printable characters.

-- 
With Best Regards,
Andy Shevchenko


