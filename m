Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2128D1A2747
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgDHQe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:34:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:64601 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728789AbgDHQez (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 12:34:55 -0400
IronPort-SDR: 1z5WKU1i8PA1wCz00rSehvj9v/pIjlJ7fAcVwomONCq2ro2FFFO51rPt1q1guMLDD4YvVROQT4
 lNqvIM17oprQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 09:34:54 -0700
IronPort-SDR: Tj0esvZQXAM9Yq184jUz+nd//ij61LzjJkaVIYkuBLRed76dq/sKDvbMJwGR/mCXPPvqkFrNZ4
 XPnKIv2mbIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="452870041"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2020 09:34:52 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMDfC-00Gk7n-DL; Wed, 08 Apr 2020 19:34:54 +0300
Date:   Wed, 8 Apr 2020 19:34:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200408163454.GG3676135@smile.fi.intel.com>
References: <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
 <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
 <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
 <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
 <20200407172035.GM6127@valkosipuli.retiisi.org.uk>
 <20200408122127.i27hrmjh3pbjeulk@gilmour.lan>
 <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
 <20200408134315.a7cemmto6bi26arg@gilmour.lan>
 <20200408152857.GO6127@valkosipuli.retiisi.org.uk>
 <20200408153051.GP6127@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408153051.GP6127@valkosipuli.retiisi.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 08, 2020 at 06:30:51PM +0300, Sakari Ailus wrote:
> On Wed, Apr 08, 2020 at 06:28:57PM +0300, Sakari Ailus wrote:
> > On Wed, Apr 08, 2020 at 03:43:15PM +0200, Maxime Ripard wrote:

...

> > No sensor driver I've seen has used clk_set_rate_exclusive() but I guess
> > they should. The absence of practical problems has been probably because of
> > two factors; firstly, these are typically clocks dedicated to the sensors
> > and secondly, good luck.

As I heard in another thread clk_*_exclusive() is quite a big hammer with a lot
of side effects and if it can be avoided, it must be avoided.

-- 
With Best Regards,
Andy Shevchenko


