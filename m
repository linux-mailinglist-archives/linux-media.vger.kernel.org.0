Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983394EBBB8
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243817AbiC3H3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243821AbiC3H3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:29:50 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF551C592F;
        Wed, 30 Mar 2022 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648625275; x=1680161275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r41bn9DcC7z+dY6o3RfHp3AzxF/kNA5gjGJXhaxgEtg=;
  b=E1WE14fyCSDkxeJxeTlT54ewmG8jMF/A2t1A/5BsyzIrMANiD+TUvT+Q
   tTbb6KyKihto+HGSy8htYXUHRbiAK5O6DvA5Hyygu7eCpwljx1X7XsKRS
   3WO/rY4GQGpA+m5hLuOHcGJwfmWIydlwhw8toU7/zGtFOVrBlN+12SH3W
   K/aly9/wE7skBjtKgXzTix2x53QErjaefdUJdK1/nGph7fDu0LgDh3N63
   JQcI+v8Knbw392eJ/n2Wx4tATAHsVrYebfcZkP8+ToLT4vgsyqoMAzRH8
   yprfnxMTNFcrCbNuECYQgPp26nhsEbRsa0kK56Xcisobjhmt9dVcnS1eN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="257051262"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="257051262"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:27:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="695010228"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:27:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 88B8F20365;
        Wed, 30 Mar 2022 10:27:47 +0300 (EEST)
Date:   Wed, 30 Mar 2022 10:27:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings
 to json-schema
Message-ID: <YkQGc3hxVDfzhRls@paasikivi.fi.intel.com>
References: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
 <20220329212654.587451-3-sakari.ailus@linux.intel.com>
 <fff59e1d-2f1c-ed96-4bf8-5744b75d1998@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fff59e1d-2f1c-ed96-4bf8-5744b75d1998@kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 30, 2022 at 09:15:47AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2022 23:26, Sakari Ailus wrote:
> > Convert the old text based dw9807-vcm chip DT bindings to json-schema.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
> >  .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
> >  2 files changed, 43 insertions(+), 9 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> > deleted file mode 100644
> > index c4701f1eaaf63..0000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -Dongwoon Anatech DW9807 voice coil lens driver
> > -
> > -DW9807 is a 10-bit DAC with current sink capability. It is intended for
> > -controlling voice coil lenses.
> > -
> > -Mandatory properties:
> > -
> > -- compatible: "dongwoon,dw9807-vcm"
> > -- reg: I2C slave address
> > diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> > new file mode 100644
> > index 0000000000000..0cf153ed547fe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2018, 2021 Intel Corporation
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dongwoon Anatech DW9807 voice coil lens driver
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description: |
> > +  DW9807 is a 10-bit DAC with current sink capability. It is intended for
> > +  controlling voice coil lenses.
> > +
> > +properties:
> > +
> > +  compatible:
> > +    const: "dongwoon,dw9807-vcm"
> 
> Nothing changed here about new lines and quotes.

Oops. You're right. Accidentally sent wrong patches, will resend in a
moment...

-- 
Sakari Ailus
