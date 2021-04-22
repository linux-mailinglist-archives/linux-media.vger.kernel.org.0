Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66856367AF8
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 09:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhDVHW2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 22 Apr 2021 03:22:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:24677 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhDVHW2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 03:22:28 -0400
IronPort-SDR: pozYPY4Yy+FWOQhakmierreDlXRZ8SdMoKTOqadwu/cz4rxyF1Tlx49pAoOvuJI/4MaMyAQrzd
 Qp9vyrkDqo5w==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195397753"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; 
   d="scan'208";a="195397753"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 00:21:53 -0700
IronPort-SDR: AzRdwDoFV0eDNpLdFAPhqJA8oiDLHy8qq74aLmTKv4Y5LT67Olj/l94E6/L9kTi5Jsdu7zr9e7
 6jwxaNe5+6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; 
   d="scan'208";a="386000807"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga006.jf.intel.com with ESMTP; 22 Apr 2021 00:21:52 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 00:21:51 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 15:21:41 +0800
Received: from shsmsx603.ccr.corp.intel.com ([10.109.6.143]) by
 SHSMSX603.ccr.corp.intel.com ([10.109.6.143]) with mapi id 15.01.2106.013;
 Thu, 22 Apr 2021 15:21:41 +0800
From:   "Tu, ShawnX" <shawnx.tu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "Yeh, Andy" <andy.yeh@intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "sylwester.nawrocki@gmail.com" <sylwester.nawrocki@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "Lai, Jim" <jim.lai@intel.com>,
        "grundler@chromium.org" <grundler@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "Chen, Ping-chung" <ping-chung.chen@intel.com>
Subject: RE: [PATCH v5] media: imx208: Add imx208 camera sensor driver
Thread-Topic: [PATCH v5] media: imx208: Add imx208 camera sensor driver
Thread-Index: AQHULuaX7zHgaEJ09UKQgHN9gOd3/aT4mnOAgADKlYCAAARfAIAAC9qAgAEXixCAAAjywIAF6byAgAAOoACAAMK3gIAATBWAgACByQCAANo8IIAARN6AgAvUTgCFtxxrsA==
Date:   Thu, 22 Apr 2021 07:21:41 +0000
Message-ID: <8f286e13b5fd461996448f92b2205bbb@intel.com>
References: <1961986.b6erRuqaPp@avalon>
 <CAPybu_2pCy4EJnih+1pmr43gdh5J0BS_Z0Owb5qpJVkYcDHtyQ@mail.gmail.com>
 <5E40A82D0551C84FA2888225EDABBE093FACCF63@PGSMSX105.gar.corp.intel.com>
 <20180925092527.4apdggynxleigvbv@paasikivi.fi.intel.com>
 <5E40A82D0551C84FA2888225EDABBE093FACD5E5@PGSMSX105.gar.corp.intel.com>
 <20180925215442.dugem7hcywaopl6s@kekkonen.localdomain>
 <5E40A82D0551C84FA2888225EDABBE093FACD6AF@PGSMSX105.gar.corp.intel.com>
 <20180926101132.iydcsn6o3qbi32u4@kekkonen.localdomain>
 <8E0971CCB6EA9D41AF58191A2D3978B61D7A567A@PGSMSX111.gar.corp.intel.com>
 <5E40A82D0551C84FA2888225EDABBE093FACDA2D@PGSMSX105.gar.corp.intel.com>
 <20181004155748.n2mppg5nnbzrkhx7@kekkonen.localdomain>
In-Reply-To: <20181004155748.n2mppg5nnbzrkhx7@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

In patch v6, it added the code for DG v4l2 control with integer menu type.

IMX208 only has 5 steps (1x, 2x, 4x, 8x, 16x) of discrete digital gain.
The imx208 driver includes the menu with 5 steps of DG and needs to notify
HAL to select a suitable digital gain value from the menu by 3A result.

Share the chromium link for reference.
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1297101

Thanks,
Shawn
-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com> 
Sent: Thursday, October 4, 2018 11:58 PM
To: Chen, Ping-chung <ping-chung.chen@intel.com>
Cc: Yeh, Andy <andy.yeh@intel.com>; Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Sakari Ailus <sakari.ailus@iki.fi>; tfiga@chromium.org; sylwester.nawrocki@gmail.com; linux-media <linux-media@vger.kernel.org>; Lai, Jim <jim.lai@intel.com>; grundler@chromium.org; Mani, Rajmohan <rajmohan.mani@intel.com>
Subject: Re: [PATCH v5] media: imx208: Add imx208 camera sensor driver

Hi Ping-chung,

On Thu, Sep 27, 2018 at 03:19:07AM +0000, Chen, Ping-chung wrote:
> Hi,
> 
> >-----Original Message-----
> >From: Yeh, Andy
> >Sent: Wednesday, September 26, 2018 11:19 PM
> >To: Sakari Ailus <sakari.ailus@linux.intel.com>; Chen, Ping-chung 
> ><ping-chung.chen@intel.com>
> 
> >Hi Sakari, PC,
> 
> >sensors that do need >digital gain applied, too --- assuming it'd be 
> >combined with the TRY_EXT_CTRLS rounding flags.
> >>
> >> There might be many kinds of discrete DG formats. For imx208, 
> >> DG=2^n, but for other sensors, DG could be 2*n, 5*n, or other 
> >> styles. If HAL needs to
> >
> >I guess the most common is multiplication and a bit shift (by e.g. 8), e.g.
> >multiplying the value by a 16-bit number with a 8-bit fractional part. 
> >The
> >imx208 apparently lacks the multiplication and only has the bit shift.
> >
> >Usually there's some sort of technical reason for the choice of the 
> >digital gain implementation and therefore I expect at least the vast 
> >majority of the implementations to be either of the two.
> 
> >We shall ensure the expansibility of this architecture to include other kind of styles in the future. Is this API design architecture-wise ok?
> 
> Indeed. Seems it is hard to cover all rules and HAL needs complex flow 
> to judge the DG value. Hi Sakari, could you provide an example that 
> how HAL uses the modified interface to set available digital gain?

It'll require more user space code no matter how you'd implement this.

Thinking this again, I don't think you'd be doing harm by resorting to an integer menu here. It'll take some more time to get a decent API to provide information on the units etc. to the user space.

> >> cover all cases, kernel will have to update more information to 
> >> this control. Another problem is should HAL take over the SMIA calculation?
> >> If so, kernel will also need to update SMIA parameters to user 
> >> space (or create an addition filed for SMIA in the configuration XML file).
> >
> >The parameters for the analogue gain model should come from the driver, yes.
> >We do not have controls for that purpose but they can (and should) be added.
> >
> 
> >How about still follow PC's proposal to implement in XML? It was in IQ tuning file before which is in userspace. Even I proposed to PC to study with ICG SW team whether this info could be retrieved from 3A algorithm.
> 
> Hi Andy, because we has to use total gain instead of AG in 3A for the WA, our tuning data of imx208 will not include SMIA of AG anymore. 
> So HAL has no way to retrieve correct SMIA parameters of AG from 3A.

Ideally the driver would be able to provide enough information here to the user space to work with it. This needs improvement going forward, but in a way that is generic enough.

--
Kind regards.

Sakari Ailus
sakari.ailus@linux.intel.com

