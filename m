Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A7B1CE4CE
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgEKTyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:54:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:53672 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbgEKTyl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:54:41 -0400
IronPort-SDR: 9QS6IqBZgzmK2xr3peMXjjFwHGwjIIq7iwSlkPvqglCyjzDAmCc99QZYl/ajzxT6ZID9Ic/WiW
 fzHQEiCNFP7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 12:54:40 -0700
IronPort-SDR: nrkVhs2KY64uvbGWb8TbDdcpt1XqGWxWNDd41wC2FKPz9dUaJM9u6VAMspAPx6nHD6QH2LMvZ+
 w72qZcPRYfEQ==
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
   d="scan'208";a="297792634"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 12:54:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 379F6204C7; Mon, 11 May 2020 22:54:34 +0300 (EEST)
Date:   Mon, 11 May 2020 22:54:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200511195434.GG11272@paasikivi.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
 <20200511160207.GA32476@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511160207.GA32476@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, May 11, 2020 at 11:02:07AM -0500, Rob Herring wrote:
> On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
...

> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The driver only supports 1-lane operation.
> 
> What the driver supports is not relevant.
> 
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +              - const: 3
> > +              - const: 4
> > +
> > +          clock-noncontinuous:
> > +            type: boolean
> > +            description: |-
> > +              MIPI CSI-2 clock is non-continuous if this property is present,
> > +              otherwise it's continuous.
> 
> Assume this has a common definition, so just need:
> 
> clock-noncontinuous: true
> 

...

> > +                    data-lanes = <1>;
> 
> This doesn't match the schema which says this should be 4 entries.

I believe the intent has been to say there would be 1, 2, 3 or 4 entries
--- i.e. the number of lanes.

-- 
Kind regards,

Sakari Ailus
