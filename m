Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D20F4D95CD
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 08:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345735AbiCOIAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiCOIAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:00:34 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F8B26114;
        Tue, 15 Mar 2022 00:59:21 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 72EC41B0016E;
        Tue, 15 Mar 2022 09:59:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1647331158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x+5sXNfWorDDHdOVeryHlgE2mDRzFJBXTC/7eUPRbDs=;
        b=IcjocGzaWJvVE9/O4cb2FI9zaUwvUsQ+RukKEovpgzEugF6xRH6hZBhAH0khuqalaiK0bH
        SCMa+YwJGWMDN8iwfAQswfVVfN/sPXxMdGiKiXudOKnBjAZJXI48KsyHmmyNvKncB1SKgS
        vghsPqakxvWCtmxBxL4Pl5MiaEy2F/siyzd6tKUEqsiCsN9dG4VA6+nh3tYPFtU0/h4YyV
        dR4Ux3p8uO36zM0ieTUp9Sfj56xcYvTo+2YYokGo3v5eI0k269DNkk8WXU3p2xgIZrWitH
        AhO39jVe/RsQ8P46TY1Pgr1uD5R+heJYNiwE+ZV2BCY0yM5IsUd4tkhNiXaCeA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 03BE6634C90;
        Tue, 15 Mar 2022 09:59:17 +0200 (EET)
Date:   Tue, 15 Mar 2022 09:59:17 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Message-ID: <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1647331158; a=rsa-sha256;
        cv=none;
        b=bT2gxhw7BHIOtLAwMHvhGOf9i622vziJTBf6sODRYEvk//CGeAxbI5M4Qo/2ECNu9hkRAl
        Rl5zat4D+JhZSQmX6wEvLy5zGMnN0GzKAaN3j33e2P48YqAoYKX6lfN9uPcfOmiR/xMpB9
        zYuThgt9guLoeIPyQd9wbWMSKJiIvKzL6IYFOxqUrp1SmR6ABtJ/Rdd0/1ZFteT9dpjmTQ
        gk/341Sa2eWCLG+CLHad3o7JNQFpzmY7pPfB9WS5v3WxHyeZAwUNR5HWlLqtIR/OaALFxm
        Jo703Odh7sGwyg6jY/lbwOA/om/+6Ab35MjWUAZtV67Zlqww3kHfU5so981HaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1647331158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x+5sXNfWorDDHdOVeryHlgE2mDRzFJBXTC/7eUPRbDs=;
        b=MLp0EoyvEBMQssbsEKPhtg5fFyOWTjvVprtZCVuKvCBj0LJgF1oMm/Qcbj5/Av4DkpKL93
        5Y8BQRYAUIPYYuJ9IFwKxdaArEHRJo2YqJHMazLcwNnjlH+e7SeB3NX+fCTkB5QxrMcs71
        JZA8iy1XppcoAC2FnTl37wfvSLo/Han+nXdW8vJkv5qLgS6MF5D6Wb39O2BS2y+XuFMpre
        D/zzNrFp4eBfQgWklgJbMfCwn9xSDa90CyECx5raFICaDhl8zhYhFVff+3299DjkRFnrSd
        OXGgL0sho4G8DlBR4JGdlTYLAYlsxz9OnXGwM0A2xYOiA++rQkorXlGfnqv6sw==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof, Jacopo,

On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2022 17:27, Jacopo Mondi wrote:
> > Provide the bindings documentation for Omnivision OV5670 image sensor.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > ---
> > v1->v2 (comments from Krzysztof)
> > 
> > - Rename to include manufacturer name
> > - Add entry to MAINTAINERS
> > - Add maxItems: to -gpios properties
> > - Use common clock properties
> > - Use enum: [1, 2] for data lanes
> > - Fix whitespace issue in example
> > ---
> > 
> >  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > new file mode 100644
> > index 000000000000..73cf72203f17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV5670 5 Megapixels raw image sensor
> > +
> > +maintainers:
> > +  - Jacopo Mondi <jacopo@jmondi.org>
> > +
> > +description: |-
> > +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> > +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> > +  controlled through an I2C compatible control bus.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov5670
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
> 
> You should not need these. These are coming with schema. You can add
> these to example schema below and double-check.

They should probably be required actually.

> 
> > +
> > +  clocks:
> > +    description: System clock. From 6 to 27 MHz.
> > +    maxItems: 1
> > +
> > +  pwdn-gpios:
> > +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> 
> This does not look like a standard property, so you need a vendor prefix.

The similarly named property exists elsewhere. I wouldn't use a vendor
prefix, also for the reason that the functionality is quite common. I guess
alternative name would be possible, too --- "shutdown" seems to be more
common.

-- 
Regards,

Sakari Ailus
