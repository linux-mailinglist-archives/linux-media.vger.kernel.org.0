Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4BC2C204D
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 09:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbgKXIns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 03:43:48 -0500
Received: from mga17.intel.com ([192.55.52.151]:15611 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730492AbgKXIns (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 03:43:48 -0500
IronPort-SDR: V/EU4lDHnWahsvyPR0H0weK+DDJFq4ffq7VenD1VH8R/uCUEfriRn2Z19PVqSThfcuQhx+z67R
 IjkN7fQevLLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="151753019"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="151753019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 00:43:48 -0800
IronPort-SDR: 1j9zIiz75GIryTsdL/biK5K/G1r8KgHWpcRiZ46wjCIThr8WVk1V8hdaQVcapbctpn4qkhuZxs
 Hry9mfRMBKcg==
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="358746299"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 00:43:45 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E9A9D20461; Tue, 24 Nov 2020 10:43:43 +0200 (EET)
Date:   Tue, 24 Nov 2020 10:43:43 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Robert Foss <robert.foss@linaro.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Kao <ben.kao@intel.com>, tfiga@google.com,
        shengnan.wang@mediatek.com
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
Message-ID: <20201124084343.GD3940@paasikivi.fi.intel.com>
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <1606203651.4733.134.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606203651.4733.134.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, Nov 24, 2020 at 03:40:51PM +0800, Dongchun Zhu wrote:
> >  static const struct ov8856_mode supported_modes[] = {
> > -	{
> > -		.width = 3280,
> > -		.height = 2464,
> > -		.hts = 1928,
> > -		.vts_def = 2488,
> > -		.vts_min = 2488,
> > -		.reg_list = {
> > -			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> > -			.regs = mode_3280x2464_regs,
> > -		},
> > -		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
> > -	},
> 
> If 3280x2464 resolution is removed, bayer order needs to be updated in
> the meantime. From OV8856's datasheet, bayer order turns to be BGGR if
> sensor adopts full mode (3264x2448) or binning mode (1632x1224).

How is this related to the patch?

The next largest size is 16 by 16 less, so the Bayer order is the same. If
it's wrong currently (as it would appear to), it should be a separate
patch.

-- 
Sakari Ailus
