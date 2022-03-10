Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7A44D5569
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 00:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344714AbiCJXcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 18:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239112AbiCJXb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 18:31:59 -0500
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E86019CCC3;
        Thu, 10 Mar 2022 15:30:57 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id k2so7650181oia.2;
        Thu, 10 Mar 2022 15:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ocTCqqrDPX9cRK9RPGuN5bEfKehsuGdaZayXyJQvr38=;
        b=ffEhtEU3au0LUwZ4g0XaXUzeVzlvuLrol0JpVT4890PlMPyXk6VzARGZ0493QSOxns
         p5jDm4DV2IWcdEFz+xUw/5wpIypc2Kw02fUGxrNsNxgQeOj4j2RR7iAVWYlx0lOSNBMc
         50zibUV13c9d8Be3kswZAND3/S+V92TOZSgzXT/4htMgM1x4eSaQLf9GTiegq+NRLzL9
         tKeXCKWTccCpuP2oGaTupo0AGxOzqM3nRAIe9Tbhr0cPCvAPI2vaXTb6m8RVpSvH8fi5
         28URoV0YJUKM7S/gMiZ+MCBJOg8eItb1pbeCqNdmVVIE93bwqMXKgnQyU459CgJFafg5
         BWfA==
X-Gm-Message-State: AOAM533E5EHM2Dxf/7kQFS54UkLEqjCFTwz5nFU5PcRcrme9dUQ7QZVO
        leoLUkHAqDgV4iquqO1H3KzBmcXSxA==
X-Google-Smtp-Source: ABdhPJzMcb39ssoqPYbIkrQ0/a/eZGPIWoyjuesDwYVqQtSmHOff5M6fyJUVptL7S8fI2mbYdzCw5Q==
X-Received: by 2002:a05:6808:1982:b0:2da:b57:16cc with SMTP id bj2-20020a056808198200b002da0b5716ccmr4904136oib.37.1646955056843;
        Thu, 10 Mar 2022 15:30:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a19-20020a056808099300b002da1428db03sm2916384oic.7.2022.03.10.15.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 15:30:56 -0800 (PST)
Received: (nullmailer pid 2306669 invoked by uid 1000);
        Thu, 10 Mar 2022 23:30:55 -0000
Date:   Thu, 10 Mar 2022 17:30:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Message-ID: <YiqKL45VLlhNl2Gn@robh.at.kernel.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-2-jacopo@jmondi.org>
 <d7e2a189-2773-b37a-7449-0b5138e45ded@canonical.com>
 <20220310171634.qiqnq376qizrqhw5@uno.localdomain>
 <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb33fe1-2470-7096-b77b-d147c2e55fec@canonical.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 10, 2022 at 06:26:02PM +0100, Krzysztof Kozlowski wrote:
> On 10/03/2022 18:16, Jacopo Mondi wrote:
> > Hi Krzysztof
> > 
> > On Thu, Mar 10, 2022 at 03:29:24PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/03/2022 14:08, Jacopo Mondi wrote:
> >>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>> ---
> >>>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
> >>
> >> Add the file to maintainers entry.
> >>
> > 
> > Right
> > 
> >>>  1 file changed, 93 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>> new file mode 100644
> >>> index 000000000000..dc4a3297bf6f
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> >>
> >> Missing vendor prefix in file name.
> >>
> > 
> > Right x2
> > 
> >>> @@ -0,0 +1,93 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> >>> +
> >>> +maintainers:
> >>> +  - Jacopo Mondi <jacopo@jmondi.org>
> >>
> >> Please add also driver maintainer.
> >>
> > 
> > I never got what the policy was, if the maintainer entries here only
> > refer to the binding file or to the driver too
> 
> It is a person responsible for the bindings, so indeed it might not feed
> existing maintainer.

No need for a MAINTAINERS entry as get_maintainers.pl will pick it up 
from here.

Rob
