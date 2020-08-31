Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6680258017
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 20:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgHaSCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 14:02:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:38826 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgHaSCZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 14:02:25 -0400
IronPort-SDR: rzlPnvnlq7jGtrPHCA6BOM8SxxxwU3MYkR1ZzxDdDadConURZblh/WJiSIayoQmOyZ6AHuq4Du
 FfuUAXcrh0Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175078414"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="175078414"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 11:02:23 -0700
IronPort-SDR: asqsnI5DoYu89u4oqVfxs5wCJTx/nIRMKCyUJqY9oQH0nMt/1lZp5dZIMLja8wDB9r796Vf3NA
 q5ImjB9kQZPg==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="330777988"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 11:02:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5DB5E20623; Mon, 31 Aug 2020 21:02:11 +0300 (EEST)
Date:   Mon, 31 Aug 2020 21:02:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Xingyu Wu <wuxy@bitland.com.cn>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, davem@davemloft.net,
        shawnx.tu@intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, manivannan.sadhasivam@linaro.org,
        bingbu.cao@intel.com, tfiga@chromium.org, drinkcat@chromium.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dongchun.zhu@mediatek.com,
        sj.huang@mediatek.com, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        hao.he@bitland.com.cn
Subject: Re: [PATCH V3] Add GalaxyCore image sensor driver
Message-ID: <20200831180211.GQ31019@paasikivi.fi.intel.com>
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xingyu,

On Fri, Aug 14, 2020 at 12:44:51PM +0800, Xingyu Wu wrote:
> This patch series add GalaxyCore GC5035 image sensor driver.
> 
> Change in v3:
> 1.Optimize gc5035 driver.
> 2.Redescibe reset-gpio in documentation.

It seems the e-mails you're sending do not end up to LMML nor kernel.org
Patchwork.

I'm not sure why, but that needs to be fixed.

-- 
Kind regards,

Sakari Ailus
