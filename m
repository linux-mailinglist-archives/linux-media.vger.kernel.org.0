Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BB213999
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 13:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfEDL6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 07:58:53 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:5557 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727626AbfEDL6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 May 2019 07:58:53 -0400
X-IronPort-AV: E=Sophos;i="5.60,429,1549926000"; 
   d="scan'208";a="381635811"
Received: from abo-60-75-68.mrs.modulonet.fr (HELO hadrien) ([85.68.75.60])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 May 2019 13:58:50 +0200
Date:   Sat, 4 May 2019 13:58:50 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Michael Tretter <m.tretter@pengutronix.de>
cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        kbuild-all@01.org
Subject: Re: [PATCH v5 5/5] [media] allegro: add SPS/PPS nal unit writer
 (fwd)
Message-ID: <alpine.DEB.2.21.1905041357470.5589@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On line 259, bit it unsigned, so it can't be less than 0.

julia

---------- Forwarded message ----------
Date: Sat, 4 May 2019 19:44:30 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v5 5/5] [media] allegro: add SPS/PPS nal unit writer

CC: kbuild-all@01.org
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
References: <20190503122010.16663-6-m.tretter@pengutronix.de>
TO: Michael Tretter <m.tretter@pengutronix.de>
CC: linux-media@vger.kernel.org, devicetree@vger.kernel.org
CC: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl, Michael Tretter <m.tretter@pengutronix.de>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.1-rc7 next-20190503]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/Add-ZynqMP-VCU-Allegro-DVT-H-264-encoder-driver/20190504-161958
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/media/platform/allegro-dvt/nal-h264.c:259:6-9: WARNING: Unsigned expression compared with zero: bit < 0

# https://github.com/0day-ci/linux/commit/eba69588199f08008a1fb4ad24e1f3e66d0080e3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout eba69588199f08008a1fb4ad24e1f3e66d0080e3
vim +259 drivers/media/platform/allegro-dvt/nal-h264.c

eba69588 Michael Tretter 2019-05-03  247
eba69588 Michael Tretter 2019-05-03  248  static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
eba69588 Michael Tretter 2019-05-03  249  {
eba69588 Michael Tretter 2019-05-03  250  	int i;
eba69588 Michael Tretter 2019-05-03  251  	unsigned int bit;
eba69588 Michael Tretter 2019-05-03  252  	unsigned int tmp = 0;
eba69588 Michael Tretter 2019-05-03  253
eba69588 Michael Tretter 2019-05-03  254  	if (n > 8 * sizeof(*value))
eba69588 Michael Tretter 2019-05-03  255  		return -EINVAL;
eba69588 Michael Tretter 2019-05-03  256
eba69588 Michael Tretter 2019-05-03  257  	for (i = n; i > 0; i--) {
eba69588 Michael Tretter 2019-05-03  258  		bit = rbsp_read_bit(rbsp);
eba69588 Michael Tretter 2019-05-03 @259  		if (bit < 0)
eba69588 Michael Tretter 2019-05-03  260  			return bit;
eba69588 Michael Tretter 2019-05-03  261  		tmp |= bit << (i - 1);
eba69588 Michael Tretter 2019-05-03  262  	}
eba69588 Michael Tretter 2019-05-03  263
eba69588 Michael Tretter 2019-05-03  264  	if (value)
eba69588 Michael Tretter 2019-05-03  265  		*value = tmp;
eba69588 Michael Tretter 2019-05-03  266
eba69588 Michael Tretter 2019-05-03  267  	return 0;
eba69588 Michael Tretter 2019-05-03  268  }
eba69588 Michael Tretter 2019-05-03  269

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
