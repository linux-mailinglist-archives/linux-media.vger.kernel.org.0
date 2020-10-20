Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756F9293946
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389824AbgJTKik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:38:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:50941 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389722AbgJTKij (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:38:39 -0400
IronPort-SDR: nCPkdDI1t/HogS4BjH7Ojy2jiFGbiZkvYS+dFh2kMK4cx/qNaWIWN4jMAbQwfxY+Yix0b9p0ho
 LYl+AoQnr6Zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167276935"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="167276935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 03:38:38 -0700
IronPort-SDR: nMQbRZD4Q4/nC6JYt/ZopTnm264ux7lyhK+5oY2af1Ds8fse9tbcxwsczWMFHkSn0yqCMeLNw8
 +ibolxJIUZcA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="347815287"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 03:38:35 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 307A12062D; Tue, 20 Oct 2020 13:38:33 +0300 (EEST)
Date:   Tue, 20 Oct 2020 13:38:33 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20201020103833.GT13341@paasikivi.fi.intel.com>
References: <20201019170247.92002-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019170247.92002-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> Add bindings for the IMX258 camera sensor.  The bindings, just like the
> driver, are quite limited, e.g. do not support regulator supplies.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v4:
> 1. Add clock-lanes,
> 2. Add Rob's review,
> 3. Add one more example and extend existing one,
> 4. Add common clock properties (assigned-*).

Using the assigned-* clock properties may be workable for this driver at
the moment. But using these properties does not guarantee the external
clock frequency intended to be used on the hardware. Using other
frequencies *is not* expected to work. That applies to this driver as well.

This, instead of the clock-frequency property, effectively removes the
ability to set the correct frequency from the driver, at least with current
set of the used APIs.

I suppose you could add a function to set the assigned clock frequency and
keep it, just as clk_set_rate_exclusive does?

Cc the common clock framework list + maintainers.

-- 
Regards,

Sakari Ailus
