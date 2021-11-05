Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E54460E6
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 09:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbhKEIxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 04:53:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:52299 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231133AbhKEIxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 04:53:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="318068272"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="scan'208";a="318068272"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 01:50:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; 
   d="scan'208";a="532535941"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 01:50:48 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C5288200F5;
        Fri,  5 Nov 2021 10:50:46 +0200 (EET)
Date:   Fri, 5 Nov 2021 10:50:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v3 0/2] media: hi846: minor build fixes
Message-ID: <YYTwZsebbyhWbGGM@paasikivi.fi.intel.com>
References: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
 <YXASUAHcvQlWefwp@paasikivi.fi.intel.com>
 <209f26d7e2b156818e55eac357c434f599e2ecda.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <209f26d7e2b156818e55eac357c434f599e2ecda.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Thu, Nov 04, 2021 at 11:53:08AM +0100, Martin Kepplinger wrote:
> Am Mittwoch, dem 20.10.2021 um 15:57 +0300 schrieb Sakari Ailus:
> > On Tue, Oct 19, 2021 at 05:55:07PM +0200, Martin Kepplinger wrote:
> > > Similar to many other drivers this basically should fix the build
> > > warning
> > > where the const struct of_device_id we define can be unused.
> > > Reported
> > > here:
> > > https://lore.kernel.org/linux-media/202110170632.b6umsB8m-lkp@intel.com/
> > 
> > Thanks, Martin!> 
> > 
> 
> since the Intel test robot just reminded me that the issue still
> remains: are these patches queued somewhere already?

Not yet. And thanks for the ping. I had forgotten about these fixes and
wrote a fix for the same issue, so I'm taking these two instead.

-- 
Sakari Ailus
