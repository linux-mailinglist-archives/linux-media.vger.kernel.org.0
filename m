Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C8B398D39
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 16:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhFBOjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 10:39:13 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:39858 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhFBOjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 10:39:12 -0400
X-Greylist: delayed 2747 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Jun 2021 10:39:10 EDT
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id AF6A91B00273;
        Wed,  2 Jun 2021 17:37:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1622644646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eGiRCp5aCqyxMVD1Q1mcSxa7SZTz/MxBi58ySCtfc6E=;
        b=PUDAVnXSCXhWDQPo2od8AUlHX+ynAwj7zfXEhDXhzVH5sZAmWAsPo+vmvo4j38YdItKJ1l
        6ndnKOn5zvsgokTz8Jw+dkqvWQc6OrBLdXqA9S0W+2SYChvmqQGaOz1BUSehsYmk+pXla8
        gLDrbJlg4/45S++CZOwBiH5IbD5lWHGwndv0XZ7YBeYPskYmkaA4BYge+QdO0buY7NO4eQ
        X5fgOzz1vF2UI4MWsZDX6SWf41UOHH/EexQIEOEMNeABqpdRgJESowkTw+jYgT9NhTnNlc
        Yuocq1aqkqaNpI/IqGECCbY00+uwGooI6Jlgm4GwFWDGE8cpkc5aiGTjQIrOGQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6D2CE634C87;
        Wed,  2 Jun 2021 17:36:33 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1loRzq-0002Va-Hu; Wed, 02 Jun 2021 17:37:26 +0300
Date:   Wed, 2 Jun 2021 17:37:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>, mchehab@kernel.org,
        devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <20210602143726.GZ3@valkosipuli.retiisi.eu>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
 <20210528081336.3858700-3-martin.kepplinger@puri.sm>
 <20210602135137.GW3@valkosipuli.retiisi.eu>
 <YLeQGjDdTX0iohZ0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLeQGjDdTX0iohZ0@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1622644646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eGiRCp5aCqyxMVD1Q1mcSxa7SZTz/MxBi58ySCtfc6E=;
        b=ZxZGigwqsSTicl4YEupy2ADLYu47l3/dNEnFrClkz6vhPDMFbEU2BJ74xmgpT7v08yzF12
        TcwMadyge16LtusN76Pv4fAd/PFHzGGypCVw3q0Ny4K+i5Q9AL2Ql07exCKMz+xDmg/QU5
        C8XEHlpkeIg//5tRWy6BGdANo0GFQJPwWrWjfBoGbk3JiVCBsNrugQGvvddn/E0M5AtfwE
        Uc+Py/xwl0UcCkBhafUgV7PsfYhOFc2ZGAkwtqhxC1Z2AtzQZI+qLnglamUWizIWE6/ek4
        CvBfZ/qQHjT1sRSEVhyHp0odNP3XqEmfWViJbErSrwBbg7Sqb4znrDbEyizLUQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1622644646; a=rsa-sha256;
        cv=none;
        b=jxEGKa4MCSB47NnwwI+XSCqCq564wArVY/h9RNEiHRn34xs8Z0UF+9WkHgVuTi/k0ZWkWy
        d1WD8W8IF5Elja9gF1XA7FLVYdem/8VsYPg+oOZyVwq+hKTN5iYTNTINdnJURySTvjiEIn
        bJUhmuGD8gBEqX9uSEfIVo9bRjYn4j4X/nFLNuS23qeYGXouAAaBylpifpr8HyfasVEoBO
        oU3WmfD5L/GnNmk08yZn7IFJAUj3/2VgGpWeKjoOCCzsNI++xGxJML7KDoLaLrRUBuQY1N
        JLWZvefvESrvdMLs4M8imeCwvTA/R0O7mLxm4jnwcCYbAqnzG9ARrvgUNqrG9Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Jun 02, 2021 at 05:05:14PM +0300, Laurent Pinchart wrote:
> On Wed, Jun 02, 2021 at 04:51:37PM +0300, Sakari Ailus wrote:
> > Hi Martin,
> > 
> > On Fri, May 28, 2021 at 10:13:33AM +0200, Martin Kepplinger wrote:
> > > Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> > > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > 
> > Could you read Documentation/driver-api/media/camera-sensor.rst, please?
> > 
> > I believe you'll need assigned-clock-rates device property as well as
> 
> I dn't think assigned-clock-rates should be part of the bindings, it's a
> mechanism that can be used in any DT device node.

What if it's required?

> 
> > link-frequencies endpoint property.
> > 
> > > ---
> > >  .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
> > >  1 file changed, 99 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > new file mode 100644
> > > index 000000000000..2991108e23e5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > > +
> > > +maintainers:
> > > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > > +
> > > +description: |-
> > > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > > +  interface and CCI (I2C compatible) control bus. The output format
> > > +  is 10bit Bayer.
> > 
> > Virtually all Bayer sensors can do 8 bpp, too. I'd drop the sentence
> 
> Not this one according to its datasheet (we can't rule out that this
> would be possible an undocumented of course).

Ok, fair enough.

> 
> > mentoning 10 bits.
> > 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: hynix,hi846
> > > +
> > > +  reg:
> > > +    description: I2C device address.
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: Reference to the mclk clock.
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: mclk
> > > +
> > > +  rst-gpios:
> > > +    description: Reference to the GPIO connected to the reset pin. Active low.
> > > +    maxItems: 1
> > > +
> > > +  vdd-supply:
> > > +    description: Definition of the regulator used as 1.8V digital power supply.
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            oneOf:
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - rst-gpios
> > > +  - vdd-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        hi846: camera@20 {
> > > +            compatible = "hynix,hi846";
> > > +            reg = <0x20>;
> > > +            clocks = <&clk>;
> > > +            clock-names = "mclk";
> > > +            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
> > > +            rst-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> > > +
> > > +            port {
> > > +                camera_out: endpoint {
> > > +                    remote-endpoint = <&csi1_ep1>;
> > > +                    data-lanes = <1 2>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
