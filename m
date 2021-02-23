Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326C1323333
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 22:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhBWVYV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 16:24:21 -0500
Received: from mga02.intel.com ([134.134.136.20]:49260 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231496AbhBWVYU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 16:24:20 -0500
IronPort-SDR: YG4tvlyTlhMb9uB4m6hyqGxBHMY7A36dBe0SApzvS/pRW5WY626E3SVb4pbmSCfObW7yh98I0L
 1/eEQdF/F7qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="172089240"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="172089240"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 13:22:34 -0800
IronPort-SDR: 8IQgTQ656Kc1v0ctmrRIZT+eBMfEjrReLzSEp3AL623OIO/RUlsb68fXv5XB5zaz3lcEIURCNP
 KXLXplOXjypg==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; 
   d="scan'208";a="431097467"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2021 13:22:32 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BA76C208F7;
        Tue, 23 Feb 2021 23:22:29 +0200 (EET)
Date:   Tue, 23 Feb 2021 23:22:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Use graph and video-interfaces
 schemas, round 2
Message-ID: <20210223212229.GI3@paasikivi.fi.intel.com>
References: <20210223210127.55455-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223210127.55455-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, Feb 23, 2021 at 03:01:27PM -0600, Rob Herring wrote:
> A couple of media schemas got applied without using or incorrectly
> using the video-interfaces.yaml and graph.yaml schemas. Fix them up
> before we have more copy-n-paste errors.
> 
> Fixes: 41b3e23376e9 ("media: dt-bindings: media: Add bindings for imx334")
> Fixes: d899e5f1db7a ("media: dt-bindings: media: imx258: add bindings for IMX258 sensor")
> Fixes: 918b866edfec ("media: dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml")
> Fixes: 22f2b47517a6 ("media: dt-bindings: media: i2c: Add OV8865 bindings documentation")
> Fixes: 29a202fa7acc ("media: dt-bindings: media: i2c: Add OV5648 bindings documentation")
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I'll send to Linus for rc1.
> 
>  .../devicetree/bindings/media/i2c/imx258.yaml    | 14 +++++++-------
>  .../bindings/media/i2c/ovti,ov5647.yaml          |  5 ++---
>  .../bindings/media/i2c/ovti,ov5648.yaml          | 16 +++++-----------
>  .../bindings/media/i2c/ovti,ov8865.yaml          | 16 +++++-----------
>  .../bindings/media/i2c/sony,imx334.yaml          | 11 +++++------
>  5 files changed, 24 insertions(+), 38 deletions(-)

Thanks for addressing this.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
