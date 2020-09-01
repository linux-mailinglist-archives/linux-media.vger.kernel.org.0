Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC8E25A138
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 00:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgIAWLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 18:11:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:36963 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgIAWK7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 18:10:59 -0400
IronPort-SDR: 29tRc7fJjOVHzUd8ack7JGSPF1DmLaTcm6HKveXPKPlsNUahTKk3RJdW3PRGEYlWWWLFy2oQxA
 GQRdwxCjZzxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156538207"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="156538207"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 15:10:57 -0700
IronPort-SDR: A0T9++kTmPLrUrUOhCQijxPKPr61TzBHz3aAFIPZicnEDEUK8+VB2pUxqn4s6FP3Mq8L7OGfWa
 sMT5BY+yyxBA==
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="333879865"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 15:10:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 20D91205F7; Wed,  2 Sep 2020 01:10:53 +0300 (EEST)
Date:   Wed, 2 Sep 2020 01:10:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/3] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
Message-ID: <20200901221052.GC32646@paasikivi.fi.intel.com>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200813171337.5540-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813171337.5540-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

My apologies for the late reply.

On Thu, Aug 13, 2020 at 06:13:35PM +0100, Lad Prabhakar wrote:
> During testing this sensor on iW-RainboW-G21D-Qseven platform in 8-bit DVP
> mode with rcar-vin bridge noticed the capture worked fine for the first run
> (with yavta), but for subsequent runs the bridge driver waited for the
> frame to be captured. Debugging further noticed the data lines were
> enabled/disabled in stream on/off callback and dumping the register
> contents 0x3017/0x3018 in ov5640_set_stream_dvp() reported the correct
> values, but yet frame capturing failed.
> 
> To get around this issue the following actions are performed for
> parallel mode (DVP):
> 1: Keeps the sensor in software power down mode and is woken up only in
>    ov5640_set_stream_dvp() callback.

I'd suppose with s_power, the main driver would power the device off
when it's not streaming.

> 2: Enables data lines in s_power callback
> 3: Configures HVP lines in s_power callback instead of configuring
>    everytime in ov5640_set_stream_dvp().
> 4: Disables MIPI interface.

Could you split this into two (or even more) patches so that the first
refactors the receiver setup and another one changes how it actually works?
That way this would be quite a bit easier to review.

While some of the above seem entirely reasonable, the changes are vast and
testing should be done on different boards to make sure things won't break.
That said, this depends on others who have the hardware.

-- 
Kind regards,

Sakari Ailus
