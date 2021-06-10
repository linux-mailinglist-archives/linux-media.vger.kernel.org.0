Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633AB3A35D6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 23:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFJV3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 17:29:54 -0400
Received: from mga18.intel.com ([134.134.136.126]:8326 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhFJV3x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 17:29:53 -0400
IronPort-SDR: 9Uhhbae9NbrksonUDep+wCz+O1v1JnTPZbo793fkUOYqrSEn9wVhjOf/KrDIquoW2kvOVV8D9K
 iBkHA3j8pzjA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192722742"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; 
   d="scan'208";a="192722742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 14:27:56 -0700
IronPort-SDR: ofXaOKfwEBrxBrOp9ajNsJR236ZnmE4Sc7VRbaGLTWI8B2WGBj7S4FeIE3cdfyaTnUz+pSnk/5
 wEG+aA/6UT7Q==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; 
   d="scan'208";a="441364532"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 14:27:53 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6231D2036A;
        Fri, 11 Jun 2021 00:27:51 +0300 (EEST)
Date:   Fri, 11 Jun 2021 00:27:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v2 0/6] Camera Sensor Drivers
Message-ID: <20210610212751.GJ3@paasikivi.fi.intel.com>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Thu, May 27, 2021 at 03:21:39PM +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> Patch series contains Sony IMX335, Sony IMX412 and OmniVision OV9282
> camera sensor drivers and respective binding documentation.
> 
> v1->v2:
> - define maxItems for reset-gpios in dt binding document
> - make sure the device is powered off on remove
> - use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
> 
> v1: https://patchwork.kernel.org/project/linux-media/list/?series=458115

Thanks for the update.

The patches seem fine, but I noticed one problem: the analogue gain is only
updated when exposure is set. This is a bug.

Most drivers do not try to synchronise setting analogue gain and exposure
to the same frame. Do you need that? Alternatively the control framework
would probably need to be amended a little --- something that would have
other benefits, too.

I don't think that blocks merging the drivers though. But this needs to be
addressed.

-- 
Kind regards,

Sakari Ailus
