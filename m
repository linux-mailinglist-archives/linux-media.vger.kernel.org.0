Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F2762B098
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 02:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiKPBhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 20:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKPBhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 20:37:41 -0500
Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com [115.124.28.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FDD165B4;
        Tue, 15 Nov 2022 17:37:40 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1183142|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0154537-0.00396874-0.980578;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=lee@arducam.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.Q8Hh54P_1668562637;
Received: from localhost(mailfrom:lee@arducam.com fp:SMTPD_---.Q8Hh54P_1668562637)
          by smtp.aliyun-inc.com;
          Wed, 16 Nov 2022 09:37:18 +0800
Date:   Wed, 16 Nov 2022 09:37:15 +0800
From:   lee <lee@arducam.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221116093715.00004724@arducam.com>
In-Reply-To: <394fe30e-3077-d749-b6b1-29a1aba32109@linaro.org>
References: <20221104152601.000035fd@arducam.com>
        <394fe30e-3077-d749-b6b1-29a1aba32109@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 4 Nov 2022 09:17:15 -0400
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 04/11/2022 03:26, lee wrote:
> > Add YAML device tree binding for IMX519 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Lee Jackson <lee@arducam.com>
> > ---
> >  .../bindings/media/i2c/sony,imx519.yaml       | 107
> > ++++++++++++++++++ MAINTAINERS                                   |
> >  9 ++ 2 files changed, 116 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml new
> > file mode 100644 index 000000000000..9b6cda96f613 --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Lee Jackson <lee@arducam.com>
> > +
> > +description: |-
> > +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image
> > sensor
> > +  with an active array size of 4656H x 3496V. It is programmable
> > through
> > +  I2C interface. The I2C address is fixed to 0x1A as per sensor
> > data sheet.
> > +  Image data is sent through MIPI CSI-2, which is configured as
> > either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx519
> > +
> > +  reg:
> > +    description: I2C device address  
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply
> it. Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
> Thank you.
> 
> Best regards,
> Krzysztof
> 

Hi,
Thanks for your friendly reminder. Sorry for my last error commit. I have modified the dts based on your comments and resubmitted new driver. 
I have checked it using make dt_binding_check command. 
You are welcome to submit new comments again.
Have a nice day.
Lee.
 
