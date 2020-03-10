Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271A6180026
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 15:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgCJOaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 10:30:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:59907 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgCJOaR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 10:30:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 07:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; 
   d="scan'208";a="443182666"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2020 07:30:13 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jBfte-008U3F-Qf; Tue, 10 Mar 2020 16:30:14 +0200
Date:   Tue, 10 Mar 2020 16:30:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [v1 3/3] media: ov8856: Implement sensor module revision
 identification
Message-ID: <20200310143014.GL1922688@smile.fi.intel.com>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200310134603.30260-4-robert.foss@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 10, 2020 at 02:46:03PM +0100, Robert Foss wrote:
> Query the sensor for its module revision, and compare it
> to known revisions.
> Currently only the '1B' revision has been added.

Are you sure you send latest version?

I have a déjà vu that I have seen this already and this one doesn't address any
comment given.

...

> +	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
> +		val,

> +		val == OV8856_1B_MODULE ? "1B" : "unknown revision",

This is weird. Can you add a bit more general way of showing revision?

> +		client->addr);

-- 
With Best Regards,
Andy Shevchenko


