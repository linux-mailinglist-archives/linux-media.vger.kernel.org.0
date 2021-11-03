Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5814144433F
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 15:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhKCOUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 10:20:03 -0400
Received: from mga01.intel.com ([192.55.52.88]:15465 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230472AbhKCOUD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Nov 2021 10:20:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="255129912"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="255129912"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 07:17:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="667537457"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 07:17:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9659C2047C;
        Wed,  3 Nov 2021 16:17:21 +0200 (EET)
Date:   Wed, 3 Nov 2021 16:17:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen.Hristev@microchip.com
Cc:     akinobu.mita@gmail.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, jacopo@jmondi.org
Subject: Re: [PATCH] media: i2c: ov7740: implement get_mbus_config
Message-ID: <YYKZ8emK6JrE4pyr@paasikivi.fi.intel.com>
References: <20211102153008.1349895-1-eugen.hristev@microchip.com>
 <YYJDcIiBXo/XlKCX@paasikivi.fi.intel.com>
 <84ff4389-3458-0811-b43f-ded957c01f88@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ff4389-3458-0811-b43f-ded957c01f88@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 03, 2021 at 12:39:52PM +0000, Eugen.Hristev@microchip.com wrote:
> On 11/3/21 10:08 AM, Sakari Ailus wrote:
> > Hi Eugen,
> > 
> > Thanks for the patch.
> > 
> > On Tue, Nov 02, 2021 at 05:30:08PM +0200, Eugen Hristev wrote:
> >> Implement the get_mbus_config callback.
> >> ov7740 is a parallel sensor, and according to datasheet, the register
> >> REG12 controls the CCIR656 mode. This register is written to 0 in yuyv mode.
> >> According to REG12[5] , CCIR656 mode, the behavior is:
> >> CCIR656: disabled
> >> REG28 controls the polarity of the signals. This register is unused.
> >> The default behavior is then:
> >> HSYNC polarity : positive
> >> VSYNC polarity : positive
> >> HREF polarity: positive
> >>
> > 
> > Doesn't the receiver driver get this information from DT?
> > 
> 
> Hi Sakari,
> 
> This patch comes as a result of my discussions with Jacopo, he advised 
> to get mbus configuration via the get_mbus_config . I agree that this 
> information can be taken from DT as you said.
> In the end , my understanding is that get_mbus_config should be used 
> only for runtime configuration which can change.
> Thus, if all this information is static, then, I will proceed with 
> obtaining it from DT, and you can disregard this patch, as it is not useful.

Yes, please.

Getting this from DT is preferred if no dynamic configuration is needed.

-- 
Sakari Ailus
