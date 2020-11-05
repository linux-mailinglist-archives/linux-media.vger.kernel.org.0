Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9A02A8386
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 17:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKEQ3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 11:29:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:19253 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgKEQ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 11:29:22 -0500
IronPort-SDR: v4CqMQQZP1PeG8ZFvbfbhgOpdtPLH2g+kSAXovnuYhIJRm1uMhKT26vhKLvGjxDB/WW1zRfJP5
 t+uqMpppbOYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="168632299"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="168632299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:29:21 -0800
IronPort-SDR: kbYD3vmXkR3od5jmlJyjmNq1OhUU6HQrhjx+Wep4g59R7+yZ5QfOVjLOiREntksOUhi6c5Rp6z
 BKnrNg+cP8bw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="363870362"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 08:29:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 99CD720901; Thu,  5 Nov 2020 18:29:18 +0200 (EET)
Date:   Thu, 5 Nov 2020 18:29:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 105/106] ccs: Add shading correction and luminance
 correction level controls
Message-ID: <20201105162918.GK26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-96-sakari.ailus@linux.intel.com>
 <20201105134243.62ef1938@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105134243.62ef1938@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the review comments.

On Thu, Nov 05, 2020 at 01:42:43PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed,  7 Oct 2020 11:45:56 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Add controls for supporting lens shading correction.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> For patches 098 to 105, we should at least have those new controls
> documented at the uAPI documents.

Agreed.

> 
> I'm not convinced yet that we shouldn't instead place them inside
> V4L2_CTRL_CLASS_CAMERA.
> 
> As those are part of a MIPI standard, I won't doubt that sooner or
> later, other drivers may need them.

They are part of a MIPI standard, but that standard defines a control
interface for camera sensors which this driver uses. I don't see a need to
implement other drivers for devices this driver already supports.

Note that while MIPI standards are originally centered around cross-chip
busses, the functionality that is being controlled here is entirely local
to the device.

Quite a few of the controls are still somehow specific to the device.

That said, the same analogue gain model is very likely present on a range
of devices even though they are not CCS (or SMIA) compatible, for
historical reasons. Perhaps these could be actually made a single array
control in the camera control class, with indices defined for the different
factors.

-- 
Kind regards,

Sakari Ailus
