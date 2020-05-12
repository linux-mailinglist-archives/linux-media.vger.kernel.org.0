Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EA31CFE6F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 21:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbgELTgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 15:36:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:50368 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELTgg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 15:36:36 -0400
IronPort-SDR: DJEQO43y8PgWG4nzq0uRG3fhGGSnD9P74Cg2WYk5A+bRcjnp1sv2LAcKXvddzgi/XpMbnRmc3X
 3NLrAwnGU2Sw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 12:36:31 -0700
IronPort-SDR: 40b3KvgkS9aSfwRCgpfLB4gaMBu95CKV3Stjz1bYcKsh385+GCLANaLSVBNa9TnjMSRSs1ldeo
 Rz4DqPcnq4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="286765976"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2020 12:36:26 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYahW-000D61-2b; Wed, 13 May 2020 03:36:26 +0800
Date:   Wed, 13 May 2020 03:36:16 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <monstr@monstr.eu>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     kbuild-all@lists.01.org, Hyun Kwon <hyun.kwon@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: Re: [PATCH v13 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Message-ID: <202005130315.tuxScSNE%lkp@intel.com>
References: <20200512151947.120348-3-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512151947.120348-3-vishal.sagar@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.7-rc5 next-20200512]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Vishal-Sagar/Add-support-for-Xilinx-CSI2-Receiver-Subsystem/20200512-232348
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/platform/xilinx/xilinx-csi2rxss.c:816:5: sparse: sparse: symbol 'xcsi2rxss_enum_mbus_code' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
