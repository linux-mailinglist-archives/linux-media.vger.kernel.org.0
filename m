Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75AC4ACA5B
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2019 04:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfIHCbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 22:31:52 -0400
Received: from mga12.intel.com ([192.55.52.136]:40752 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbfIHCbw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Sep 2019 22:31:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Sep 2019 19:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,479,1559545200"; 
   d="scan'208";a="199803862"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2019 19:31:48 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1i6mzT-0001OB-RR; Sun, 08 Sep 2019 10:31:47 +0800
Date:   Sun, 8 Sep 2019 10:31:01 +0800
From:   kbuild test robot <lkp@intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     kbuild-all@01.org, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com,
        dongchun.zhu@mediatek.com
Subject: Re: [V4, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Message-ID: <201909081044.8HNNwh3K%lkp@intel.com>
References: <20190907092728.23897-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190907092728.23897-3-dongchun.zhu@mediatek.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[cannot apply to v5.3-rc7 next-20190904]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/dongchun-zhu-mediatek-com/media-i2c-Add-support-for-OV02A10-sensor/20190908-065643
base:   git://linuxtv.org/media_tree.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/i2c/ov02a10.c:695:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
