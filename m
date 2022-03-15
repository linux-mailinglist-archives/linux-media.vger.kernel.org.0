Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9794D9B81
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 13:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348444AbiCOMtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 08:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348447AbiCOMtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 08:49:05 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C09E21BF
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 05:47:46 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C1D4720B35;
        Tue, 15 Mar 2022 14:47:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1647348463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cHbHWIO3v/4uzPK/vNJivbMFMVvCAB+Og4bwZt72Fow=;
        b=W3VXlMy7kx79MIxDDNfIkNPb6paFeUue6rlQZyIuwaY4yKS/8WR83aBtrXNOmlUiEdeM+p
        HLpY4EZTirHAQdfg7xG86HsQN3WKlV0LoCJT0yzQe7XoTQiJ8ywI1v3vWoYW16yPdZ8GT+
        Q6qdfwbqaJ8O3A55JbH1poixw95NGLE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4D01B634C91;
        Tue, 15 Mar 2022 14:47:43 +0200 (EET)
Date:   Tue, 15 Mar 2022 14:47:43 +0200
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
Message-ID: <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
 <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
 <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1647348463; a=rsa-sha256; cv=none;
        b=ZsUET/5Rqo72w6Hqz65ZwURFh9blVjkyhCeVacvcQV2zz+efufHERVaOrQ4bVK8Gqxmbx9
        W55P5SsWiDivVlQZV0QjX+bAv/HB5UF8PELWN0ajPPwPJ1sYwXmW/WxXkViIhOKdWhPcJg
        glLRz0eliq/z/4S19dOFcasTRYxws3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1647348463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cHbHWIO3v/4uzPK/vNJivbMFMVvCAB+Og4bwZt72Fow=;
        b=SXXbz1WCHCpNKWqX6nr8UhZyY4cSzW5fTADHMqpWyjrPRol516TapQOgCwJJ9yuAJW4TNR
        xuL6YV6DYpE+Cq/Mk2DsEj3hQQBSqWDReINiZ4GJ3CFqo6BxGQO+ox466PMt8MN8WjGpNA
        WSvBAJWMkLKr/se74AzdWArk0IQCXqk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 15, 2022 at 09:03:41AM +0100, Krzysztof Kozlowski wrote:
> On 15/03/2022 08:59, Sakari Ailus wrote:
> > Hi Krzysztof, Jacopo,
> > 
> > On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> >> On 14/03/2022 17:27, Jacopo Mondi wrote:
> >>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>
> >>> ---
> >>> v1->v2 (comments from Krzysztof)
> >>>
> >>> - Rename to include manufacturer name
> >>> - Add entry to MAINTAINERS
> >>> - Add maxItems: to -gpios properties
> >>> - Use common clock properties
> >>> - Use enum: [1, 2] for data lanes
> >>> - Fix whitespace issue in example
> >>> ---
> >>>
> >>>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> >>>  MAINTAINERS                                   |  1 +
> >>>  2 files changed, 100 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> >>> new file mode 100644
> >>> index 000000000000..73cf72203f17
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> >>> @@ -0,0 +1,99 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> >>> +
> >>> +maintainers:
> >>> +  - Jacopo Mondi <jacopo@jmondi.org>
> >>> +
> >>> +description: |-
> >>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> >>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> >>> +  controlled through an I2C compatible control bus.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: ovti,ov5670
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  assigned-clocks: true
> >>> +  assigned-clock-parents: true
> >>> +  assigned-clock-rates: true
> >>
> >> You should not need these. These are coming with schema. You can add
> >> these to example schema below and double-check.
> > 
> > They should probably be required actually.
> 
> Why required? The hardware can work with different clocks, get their
> rate and configure internal PLLs/clocks to new value. Having it required
> might have sense for current implementation of driver but this is
> independent of bindings. Bindings do not describe driver, but hardware.

We've had this discussion before and the result of that was this (see
"Handling clocks"):

Documentation/driver-api/media/camera-sensor.rst

> 
> >>
> >>> +
> >>> +  clocks:
> >>> +    description: System clock. From 6 to 27 MHz.
> >>> +    maxItems: 1
> >>> +
> >>> +  pwdn-gpios:
> >>> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> >>
> >> This does not look like a standard property, so you need a vendor prefix.
> > 
> > The similarly named property exists elsewhere. I wouldn't use a vendor
> > prefix, also for the reason that the functionality is quite common. I guess
> > alternative name would be possible, too --- "shutdown" seems to be more
> > common.
> 
> It exists in three bindings, so it is not a standard property...
> although something closer to standard is "powerdown-gpios" so maybe just
> use that one?

Seems like a better choice.

-- 
Sakari Ailus
