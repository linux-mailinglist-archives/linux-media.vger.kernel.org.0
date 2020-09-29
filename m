Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EA527C327
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgI2LDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 07:03:36 -0400
Received: from mga03.intel.com ([134.134.136.65]:40715 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728457AbgI2LDg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 07:03:36 -0400
IronPort-SDR: 9pwh1BwZPSD0umFl9H0ZHCwV4Ry8S+Km6f3665yL/hj2sduUZPAgMj9ztvhlMUlvo4CPF9TR7K
 jRQVz8uGax8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="162227716"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="162227716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 04:03:34 -0700
IronPort-SDR: F5GRZHNrwiYQXg9GJJHuz8S5BvF6Q11Ux77Gwd3Ch9bHSOnpdMJepkxsQYc1YI62JOJC+AU+qU
 Z+c2ngkzxJpg==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="351082160"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 04:03:27 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4612A204FD; Tue, 29 Sep 2020 14:02:55 +0300 (EEST)
Date:   Tue, 29 Sep 2020 14:02:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20200929110255.GJ26842@paasikivi.fi.intel.com>
References: <20200923152129.21736-1-krzk@kernel.org>
 <20200929091512.GF26842@paasikivi.fi.intel.com>
 <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
 <20200929094046.GH26842@paasikivi.fi.intel.com>
 <20200929094636.GA11333@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929094636.GA11333@kozik-lap>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 11:46:36AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2020 at 12:40:46PM +0300, Sakari Ailus wrote:
> > On Tue, Sep 29, 2020 at 11:18:46AM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, 29 Sep 2020 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Krzysztof,
> > > >
> > > > On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> > > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > > >
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes since v3:
> > > > > 1. Document also two lane setup.
> > > > >
> > > > > Changes since v2:
> > > > > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> > > >
> > > > Oops. I missed this one.
> > > >
> > > > How does the driver know the appropriate clock frequency for the platform
> > > > if it's not in DT? The sensor supports a range of frequencies, not a single
> > > > frequency.
> > > >
> > > > Could you add clock-frequency back?
> > > 
> > > Not really, it was removed on Rob's request. The bindings do not
> > > describe driver's behavior so how the driver gets frequency should not
> > > be part of the bindings. Also it's not a real problem - the driver
> > > just calls clk_get_rate().
> > 
> > How is the rate determined? I mean, many ISPs or CSI-2 receivers that
> > provide the clock are also capable of using a variety of frequencies. But
> > only one can be used on the platform in general.
> 
> Having "clock-frequency" property in DTS did not solve that. It has no
> effect on actual frequency.

It's up to the driver to do what's needed, yes.

Please see examples in e.g. drivers/media/i2c/ov8856.c and
Documentation/devicetree/bindings/media/i2c/ov8856.yaml .

-- 
Sakari Ailus
