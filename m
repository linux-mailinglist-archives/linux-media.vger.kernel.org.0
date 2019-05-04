Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6666E139BE
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 14:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfEDMZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 08:25:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:32405 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfEDMZh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 May 2019 08:25:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 May 2019 05:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,429,1549958400"; 
   d="scan'208";a="321404141"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2019 05:25:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMtjS-000CFd-Jk; Sat, 04 May 2019 20:25:34 +0800
Date:   Sat, 4 May 2019 20:25:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org,
        dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v5 5/5] [media] allegro: add SPS/PPS nal unit writer
Message-ID: <201905042054.cJaeaTEE%lkp@intel.com>
References: <20190503122010.16663-6-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.1-rc7 next-20190503]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/Add-ZynqMP-VCU-Allegro-DVT-H-264-encoder-driver/20190504-161958
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/platform/allegro-dvt/nal-h264.c:433:6: sparse: sparse: symbol 'nal_h264_write_start_code_prefix' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/nal-h264.c:451:6: sparse: sparse: symbol 'nal_h264_read_start_code_prefix' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/nal-h264.c:469:6: sparse: sparse: symbol 'nal_h264_write_filler_data' was not declared. Should it be static?
>> drivers/media/platform/allegro-dvt/nal-h264.c:480:6: sparse: sparse: symbol 'nal_h264_read_filler_data' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
