Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70D6290367
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 15:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfHPNrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 09:47:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:29774 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727203AbfHPNrc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 09:47:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 06:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; 
   d="scan'208";a="194994660"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2019 06:47:30 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Nathaniel Russell <naterussell83@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] Linux Kernel 5.2.8 (uvc or i915?)
In-Reply-To: <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com> <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
Date:   Fri, 16 Aug 2019 16:47:29 +0300
Message-ID: <87wofddxxq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Aug 2019, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 8/15/19 6:15 PM, Nathaniel Russell wrote:
>> I would really like help with the kernel error with my uvcvideo driver.
>> 
>
> Hi again.
>
> What makes you think that the problem is related to the uvcvideo driver?
> Does some previous kernel version work correctly?  If so, what version(s)?
>
>
> Does this warning message only happen when the uvcvideo driver is being loaded?
> Can you suppress loading of the uvcvideo driver to find out?
>
> Most of the problems/errors/warnings that I see are related to the i915 driver:
>
> [   13.032341] timed out waiting for port C ready: got 0x20, expected 0xe0
> [   13.032872] WARNING: CPU: 1 PID: 239 at drivers/gpu/drm/i915/intel_display.c:1597 vlv_wait_port_ready+0x99/0xe0 [i915]
> [   13.033632] RIP: 0010:vlv_wait_port_ready+0x99/0xe0 [i915]
>
> although there are a few uvcvideo warnings:
> [   13.039305] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not initialized!
> [   13.039318] uvcvideo 1-5:1.0: Entity type for entity Extension 3 was not initialized!
> [   13.039330] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not initialized!
> [   13.039339] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
>
>
> Laurent, do you see any uvc issues here?  Any ideas/suggestions?
>
>
> @intel-gfx:  any ideas about what is going on here with the i915 driver?

Please file a bug over at [1], add drm.debug=14 module parameter, attach
dmesg to the bug, all the way from boot to reproducing the issue.


BR,
Jani.

[1] https://bugs.freedesktop.org/enter_bug.cgi?product=DRI&component=DRM/Intel




>
>
>
> Original message to lkml:
> https://lore.kernel.org/lkml/CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com/T/#u
>
> Previous message for 5.1.21 kernel:
> https://lore.kernel.org/lkml/CAONH+JkTFujY9vEyNNuem+9rJ2qBKkf-PbKk9=DBSVEp6kW=yw@mail.gmail.com/
>
>
> thanks.

-- 
Jani Nikula, Intel Open Source Graphics Center
