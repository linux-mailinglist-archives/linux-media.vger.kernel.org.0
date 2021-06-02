Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81993398B0B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFBNxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:53:25 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:58168 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhFBNxY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 09:53:24 -0400
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3A7391B005D7;
        Wed,  2 Jun 2021 16:51:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1622641898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9IV/vIcRwyEal3HXySNvtHK7MT+y8kpQ9zcFjS4CbmQ=;
        b=FclW3wh7hGy6E40k7CkAMO0X3d3yotizBQjk7cq7Ee1+/vD02XYjS1S7LJGl2TZtFQ23SE
        WkFcPwjVOXc1JJ64wAQ28149KhbW7LuAceZZN2C6L+gB46vX1SuDJaWGXIaMMUkcrVdMKX
        G0pY/Pqmo1jXWa98W4r1xyH2x2wbd07KR/8QyPsXGwxVxabqCNrCf49I+npKVioCNp3Zg9
        bEeZ8ZgCtpxbW8WDQiMQCZLpCj6Jzx4gXvLoSpQrepXhOtp+FFAqvvdM4fM2KFWHE2+6Ca
        x+oS95w42gTPzTrqz4hfO5I8WrM2GkMRzPXUEAj73+HUo8eto2K65aJT6Ji/fw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D87A1634C87;
        Wed,  2 Jun 2021 16:50:44 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1loRHV-0002Uc-OA; Wed, 02 Jun 2021 16:51:37 +0300
Date:   Wed, 2 Jun 2021 16:51:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <20210602135137.GW3@valkosipuli.retiisi.eu>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
 <20210528081336.3858700-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528081336.3858700-3-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1622641898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9IV/vIcRwyEal3HXySNvtHK7MT+y8kpQ9zcFjS4CbmQ=;
        b=wPnsmgLAAXrmvd4FCyQ/xPA4CRCwKhNRgHOHlhy/KISEBPmmXobvJSa7aEIfj9L7W7ikvp
        WXGLni8W2h3GGpGtslfr8wlD0kV65iV6MtpcK3872f7EBS9HcIYmhvaDJ49PsHYvc6sAeU
        DzXxRyvBrIinz9URpIF3tnlg32MB0d8hwSijkIi+WoSHPTwFC8Dk2bf3g/VKD08cq4sDKQ
        9XrMz78+/WdOScUn+AogI9E6MBtopiIi/z1j95nKi6q2JRXA7onkiVSj4XRTxH8Ijab1Ua
        vJkyhW92WJumY4V78FykFT/xlisNEfBiJ5NMolZMGfBma7sqf7YfDSfJh1vO6g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1622641898; a=rsa-sha256;
        cv=none;
        b=BZ0WZQQsDEYZS7RWjr2kHuUxkCDaw3+qZbG+GybxUhfmmC36MgKPOgYiV2yhrH+hfxiTJk
        CjFPis7Evct6LgTqIkpTKJpmyEK8JWwflDz3NqitIBG09TT7tP6vNamcKXeLZCpBF3GgP5
        I3KeGjHiLtrg2JILpGVzMxkESYm0J5fSSUSWHscCKPQV1poWdZqix2hfIclTQN5jdR8d54
        Zgyh7L73aAzjlC2dAq26YaR2CsUf4k9UpmYQWyEH4kDabm/L2uHptk36smz/j1iuuzevCu
        CWVQarhtzg/oGwEM3GDm+UjrpRACy84W/wHYrP9gccEjBGPS2Q84Je9zqEOH9w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, May 28, 2021 at 10:13:33AM +0200, Martin Kepplinger wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Could you read Documentation/driver-api/media/camera-sensor.rst, please?

I believe you'll need assigned-clock-rates device property as well as
link-frequencies endpoint property.

> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> new file mode 100644
> index 000000000000..2991108e23e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is 10bit Bayer.

Virtually all Bayer sensors can do 8 bpp, too. I'd drop the sentence
mentoning 10 bits.

> +
> +properties:
> +  compatible:
> +    const: hynix,hi846
> +
> +  reg:
> +    description: I2C device address.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference to the mclk clock.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  rst-gpios:
> +    description: Reference to the GPIO connected to the reset pin. Active low.
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Definition of the regulator used as 1.8V digital power supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - rst-gpios
> +  - vdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hi846: camera@20 {
> +            compatible = "hynix,hi846";
> +            reg = <0x20>;
> +            clocks = <&clk>;
> +            clock-names = "mclk";
> +            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
> +            rst-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera_out: endpoint {
> +                    remote-endpoint = <&csi1_ep1>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Kind regards,

Sakari Ailus
