Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCA12E87EE
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 16:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbhABP1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 10:27:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:32922 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbhABP1U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 10:27:20 -0500
IronPort-SDR: BqKLwXeqwOp2dofxcXFp5qF1wK9iaM0SK9QUNTgs/tyqRj4qYVGEmUd9O/5glhIOfDuoikdHj4
 A525zT8pA1Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9852"; a="156614099"
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="156614099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:25:34 -0800
IronPort-SDR: jNcwQjnm+mvF60LGRs7p6OnS7O9MW3eOPDHVrKFAlkfKyE0N2U39vhQ+b4hPzKCm+o5lZUW3ZV
 8nKXWucZuS0w==
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="386100675"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:25:30 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CBF6B207BF; Sat,  2 Jan 2021 17:24:58 +0200 (EET)
Date:   Sat, 2 Jan 2021 17:24:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210102152458.GA11878@paasikivi.fi.intel.com>
References: <20201228180511.43486-1-ezequiel@collabora.com>
 <20201228183520.GB26370@paasikivi.fi.intel.com>
 <X+pN4Z3eCIV9cjNV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X+pN4Z3eCIV9cjNV@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Dec 28, 2020 at 11:28:01PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Mon, Dec 28, 2020 at 08:35:20PM +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > Thanks for the patch.
> 
> Likewise :-)
> 
> > On Mon, Dec 28, 2020 at 03:05:11PM -0300, Ezequiel Garcia wrote:
> > > There is currently little to none information available
> > > about the reasons why a v4l2-async device hasn't
> > > probed completely.
> > > 
> > > Inspired by the "devices_deferred" debugfs file,
> > > add a file to list information about the subdevices
> > > that are on waiting lists, for each notifier.
> > > 
> > > This is useful to debug v4l2-async subdevices
> > > and notifiers, for instance when doing device bring-up.
> > > 
> > > For instance, a typical output would be:
> > > 
> > > $ cat /sys/kernel/debug/video4linux/waiting_subdevices
> > > [fwnode] 1-003c
> > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi1_mux
> > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi0_mux
> > > 
> > > It's possible to provide some more information, detecting
> > > the type of fwnode and printing of-specific or acpi-specific
> > > details. For now, the implementation is kept simple.
> > 
> > The rest of the debug information we're effectively providing through
> > kernel messages on DEBUG level (pr_debug/dev_dbg). Could we do the same
> > here?
> > 
> > Would just printing the names of the pending sub-devices at notifier
> > register and async subdevice register time be sufficient? That way you'd
> > also be fine with just dmesg output if you're asking someone to provide you
> > information from another system.
> 
> I think debugfs would be better. It can show the current state of an
> async notifier in a single place, which is easier to parse than
> reconstructing it from kernel messages and implicit knowledge of the
> code. I'd expect users to have an easier time debugging probe issues
> with such centralized information.

If something goes wrong, you still need the kernel messages as the debugfs
file would only be able to tell what's waiting --- which is usually not
enough to fix it.

I don't mind adding a debugfs file for this if you think it's needed, but
it'd still be nice to have the information in the kernel messages (in terms
of which endpoints a notifier is still expecting). That could be a separate
patch, too.

-- 
Regards,

Sakari Ailus
