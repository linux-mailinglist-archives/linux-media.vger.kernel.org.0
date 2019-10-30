Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D6FE98D8
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 10:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfJ3JIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 05:08:50 -0400
Received: from mga04.intel.com ([192.55.52.120]:26261 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbfJ3JIu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 05:08:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 02:08:49 -0700
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="401441344"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 02:08:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 97D7A208A0; Wed, 30 Oct 2019 11:08:43 +0200 (EET)
Date:   Wed, 30 Oct 2019 11:08:43 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        mchehab@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Message-ID: <20191030090843.GG10211@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-2-dongchun.zhu@mediatek.com>
 <20190910173743.GI2680@smile.fi.intel.com>
 <20190917120205.GO5781@paasikivi.fi.intel.com>
 <20190917144412.GA23952@bogus>
 <1572426023.21623.257.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572426023.21623.257.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Wed, Oct 30, 2019 at 05:00:23PM +0800, Dongchun Zhu wrote:
> Hi Rob,
> 
> On Tue, 2019-09-17 at 09:44 -0500, Rob Herring wrote:
> > On Tue, Sep 17, 2019 at 03:02:06PM +0300, Sakari Ailus wrote:
> > > On Tue, Sep 10, 2019 at 08:37:43PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 10, 2019 at 09:04:45PM +0800, dongchun.zhu@mediatek.com wrote:
> > > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > 
> > > > > This patch adds device tree bindings documentation for the ov8856 CMOS
> > > > > image sensor.
> > > > 
> > > > New bindings in YAML, please.
> > > 
> > > My understanding is text documents are still fine.
> > 
> > Schema are preferred, but still up to the subsystem for now.
> >  
> 
> It seems that there are no bindings in YAML under the path:
> Documentation/devicetree/bindings/media/i2c.
> So we would keep the text documents for OV8856.

That is going to change very soon with the addition of IMX296 bindings:

<URL:https://lore.kernel.org/linux-media/20191029220928.GA17996@bogus/T/#mdd27731659215b1e35049892ef82bb6b62e80b61>

-- 
Sakari Ailus
