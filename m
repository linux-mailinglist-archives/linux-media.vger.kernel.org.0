Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F263A3F03
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 11:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhFKJ1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 05:27:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:28291 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231447AbhFKJ1U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 05:27:20 -0400
IronPort-SDR: bTlDg8PfKNeW/Z9QPiw0qrwz419U867ryObzUIjkqzzvAl2p/MtFm5iuCoYoFzPk8qPvbjQIEu
 azuBrYR0ZlQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192805545"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192805545"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:25:22 -0700
IronPort-SDR: EBfadmRwfYNO/wjmn5hoOHtYRfIHdCTzvx10C2DOxaa9XJbOZNb8o/NXWFd/Gr4/MaZSi3e7YU
 /BB7XGFaL+gA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="636074567"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:25:19 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3A9F1200C8;
        Fri, 11 Jun 2021 12:25:16 +0300 (EEST)
Date:   Fri, 11 Jun 2021 12:25:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Krasteva, Martina" <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v2 0/6] Camera Sensor Drivers
Message-ID: <20210611092516.GN3@paasikivi.fi.intel.com>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
 <20210610212751.GJ3@paasikivi.fi.intel.com>
 <747a5d78-2575-4d1e-f4c2-ae803a02a654@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747a5d78-2575-4d1e-f4c2-ae803a02a654@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Fri, Jun 11, 2021 at 10:06:00AM +0100, Krasteva, Martina wrote:
> Hi Sakari,
> 
> Thanks for the review
> 
> On 6/10/2021 10:27 PM, Sakari Ailus wrote:
> > Hi Martina,
> > 
> > On Thu, May 27, 2021 at 03:21:39PM +0100, Martina Krasteva wrote:
> > > From: Martina Krasteva <martinax.krasteva@intel.com>
> > > 
> > > Patch series contains Sony IMX335, Sony IMX412 and OmniVision OV9282
> > > camera sensor drivers and respective binding documentation.
> > > 
> > > v1->v2:
> > > - define maxItems for reset-gpios in dt binding document
> > > - make sure the device is powered off on remove
> > > - use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
> > > 
> > > v1: https://patchwork.kernel.org/project/linux-media/list/?series=458115
> > Thanks for the update.
> > 
> > The patches seem fine, but I noticed one problem: the analogue gain is only
> > updated when exposure is set. This is a bug.
> > 
> > Most drivers do not try to synchronise setting analogue gain and exposure
> > to the same frame. Do you need that? Alternatively the control framework
> > would probably need to be amended a little --- something that would have
> > other benefits, too.
> 
> Analog gain and exposure are "clustered". If I understand correctly, when
> several controls are in a cluster and one/several of them are set/get from
> userspace only the first control ops is called - V4L2_CID_EXPOSURE in my
> case.
> 
> Analog gain can be set explicitly, exposure control ops will be called with
> analog gain new value and current exp. value.
> Then I could have checked the is_new flag, so I can write the reg value just
> to the updated control, not to both.
> 
> In my case the userspace provides gain and exposure settings in sync so
> cluster is used to mirror that behavior.

I missed that, indeed that's fine then.

-- 
Regards,

Sakari Ailus
