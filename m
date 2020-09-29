Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8B827C0BA
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgI2JPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:15:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:58538 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727775AbgI2JPX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:15:23 -0400
IronPort-SDR: IX01F1jy1GOnq/4T/3a5iNUaN3FWKeaN2ynQy5FHh+Cd9Bc2M2CoolrsAtdIzyYj7E44MS3+Y5
 LYtIsCY+W5GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223738816"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="223738816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 02:15:18 -0700
IronPort-SDR: 0DB0T6vhXOkGZh9FzgEDSSxLocytoEZPSXi5+vus9vfvea4Ft7NqXUZj4b0+bPNTsyCID90FCT
 V2TKn+XagUmQ==
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="489430265"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 02:15:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 42740204FD; Tue, 29 Sep 2020 12:15:12 +0300 (EEST)
Date:   Tue, 29 Sep 2020 12:15:12 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20200929091512.GF26842@paasikivi.fi.intel.com>
References: <20200923152129.21736-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923152129.21736-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> Add bindings for the IMX258 camera sensor.  The bindings, just like the
> driver, are quite limited, e.g. do not support regulator supplies.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v3:
> 1. Document also two lane setup.
> 
> Changes since v2:
> 1. Remove clock-frequency, add reset GPIOs, add supplies.

Oops. I missed this one.

How does the driver know the appropriate clock frequency for the platform
if it's not in DT? The sensor supports a range of frequencies, not a single
frequency.

Could you add clock-frequency back?

-- 
Kind regards,

Sakari Ailus
