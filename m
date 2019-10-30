Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3975AE9CC3
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfJ3N4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:56:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:29612 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfJ3N4E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:56:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:56:03 -0700
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="193975489"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:55:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BEC0E208A0; Wed, 30 Oct 2019 15:55:27 +0200 (EET)
Date:   Wed, 30 Oct 2019 15:55:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Message-ID: <20191030135527.GH10211@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
 <20190910174450.GJ2680@smile.fi.intel.com>
 <1572440653.21623.272.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572440653.21623.272.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 30, 2019 at 09:04:13PM +0800, Dongchun Zhu wrote:
> > > +	ov8856->is_1B_revision = (val == OV8856_1B_MODULE) ? 1 : 0;
> > 
> > !! will give same result without using ternary operator.
> > 
> 
> Fixed in next release.

But casting to bool will have the same effect. Integers are also not
needed. I.e. this can be written as:

	ov8856->is_1B_revision = val == OV8856_1B_MODULE;

-- 
Sakari Ailus
