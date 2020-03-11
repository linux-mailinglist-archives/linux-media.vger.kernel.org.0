Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35D9B181308
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbgCKIeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:34:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:33320 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728146AbgCKIeA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:34:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:34:00 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="242614654"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:33:57 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E90572096B; Wed, 11 Mar 2020 10:33:54 +0200 (EET)
Date:   Wed, 11 Mar 2020 10:33:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 00/19] TVP5150 Features and Fixes
Message-ID: <20200311083354.GG5379@paasikivi.fi.intel.com>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Mar 09, 2020 at 11:14:09AM +0100, Marco Felsch wrote:
> Hi all,
> 
> here is the new and _hopefully_ last version :) This version contains
> the discussion results with Sakari and some minor fixes from the v11.
> 
> Each patch has a dedicate log, so I avoid the details here and give only
> an overview.
> 
> Patch 1-2:
> Those where previously one patch.
> 
> Patch 3-6:
> Prepare and implement the common v4l2-fwnode parsing code. I changed the
> code from a single parse_and_add_links/free to parse/add_links/free. I
> did the split to allow adding multiple links from different devices to a
> _maybe_ coming global connector device. 
> 
> Patch 8:
> I converted the parsing code to the new v4l2-fwnode-connector parsing
> behaviour and fixed a two bugs during remove()
> 
> Patch 13:
> This one is new due to the switch from the s_power() to the pm_runtime
> as Sakari suggested.
> 
> Patch 14:
> Also a new patch.
> 
> Patch 15:
> New patch..
> 
> I've tested the series on a custom imx6-based board which uses the chip
> directly (no-usb). I would appreciate if someone with a usb device can
> test this too.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

That assumes the comments (nothing major there) will be addressed later on.

-- 
Regards,

Sakari Ailus
