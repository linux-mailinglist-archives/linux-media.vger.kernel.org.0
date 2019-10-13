Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EA9D5793
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 21:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbfJMTJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 15:09:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:60017 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbfJMTJF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 15:09:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Oct 2019 12:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,293,1566889200"; 
   d="scan'208";a="396281304"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2019 12:09:01 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iJjEj-000BTC-3u; Mon, 14 Oct 2019 03:09:01 +0800
Date:   Mon, 14 Oct 2019 03:08:22 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RESEND PATCH v2 3/4] media: rockchip: Add the rkvdec driver
Message-ID: <201910140242.ys3UylA0%lkp@intel.com>
References: <20191011093342.3471-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011093342.3471-4-boris.brezillon@collabora.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[cannot apply to v5.4-rc2 next-20191011]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Boris-Brezillon/media-rockchip-Add-the-rkvdec-driver/20191013-235029
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-43-g0ccb3b4-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/media/rockchip/vdec/rkvdec.c:498:22: sparse: sparse: symbol 'rkvdec_queue_ops' was not declared. Should it be static?
--
>> drivers/staging/media/rockchip/vdec/rkvdec-h264.c:698:19: sparse: sparse: symbol 'get_ref_buf' was not declared. Should it be static?
>> drivers/staging/media/rockchip/vdec/rkvdec.h:112:36: sparse: sparse: shift too big (32) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:115:21: sparse: sparse: shift too big (32) for type unsigned int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967268) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967276) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967277) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967282) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967285) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967286) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967295) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967269) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967270) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967288) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967289) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967291) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:112:36: sparse: sparse: shift too big (32) for type int
>> drivers/staging/media/rockchip/vdec/rkvdec.h:115:21: sparse: sparse: shift too big (32) for type unsigned int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967272) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967277) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967278) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967284) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967289) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967290) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967292) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967273) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967278) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967279) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967280) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967281) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967282) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967287) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:116:39: sparse: sparse: shift too big (4294967288) for type int
   drivers/staging/media/rockchip/vdec/rkvdec.h:119:36: sparse: sparse: shift too big (32) for type int

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
