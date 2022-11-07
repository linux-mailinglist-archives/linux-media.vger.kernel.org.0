Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8557A61F093
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 11:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiKGKZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 05:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiKGKZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 05:25:22 -0500
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007EC193CF;
        Mon,  7 Nov 2022 02:24:47 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0846245|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0678466-0.00920196-0.922951;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=lee@arducam.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.Q1PAhQl_1667816684;
Received: from localhost(mailfrom:lee@arducam.com fp:SMTPD_---.Q1PAhQl_1667816684)
          by smtp.aliyun-inc.com;
          Mon, 07 Nov 2022 18:24:45 +0800
Date:   Mon, 7 Nov 2022 18:24:45 +0800
From:   lee <lee@arducam.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221107182445.00003b43@arducam.com>
In-Reply-To: <250e8acd-cf5d-f6f2-2d89-e0fd58a14424@linaro.org>
References: <20221103110424.00007a48@arducam.com>
        <4556aebd-1296-bb08-2cd7-3d92571ed71b@linaro.org>
        <20221107104202.00002f0f@arducam.com>
        <250e8acd-cf5d-f6f2-2d89-e0fd58a14424@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 7 Nov 2022 09:24:53 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 07/11/2022 03:42, lee wrote:
> > On Thu, 3 Nov 2022 09:05:05 -0400
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> > Hi,
> > Thanks a lot for detailed comments and suggestions for
> > revisions,there is one place where I have some doubts.  
> >> On 02/11/2022 23:04, lee wrote:  
> >>> Add YAML device tree binding for IMX519 CMOS image sensor, and
> >>> the relevant MAINTAINERS entries.
> >>>
> >>> Signed-off-by: Lee Jackson <lee@arducam.com>    
> >>
> >> Your From does not match fully SoB.
> >>  
> >>> ---
> >>>  .../bindings/media/i2c/sony,imx519.yaml       | 107
> >>> ++++++++++++++++++ MAINTAINERS                                   |
> >>>  9 ++ 2 files changed, 116 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> >>> b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml new
> >>> file mode 100644 index 000000000000..9b6cda96f613 --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> >>> @@ -0,0 +1,107 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> >>> +
> >>> +maintainers:
> >>> +  - Lee Jackson <lee@arducam.com>
> >>> +
> >>> +description: |-
> >>> +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image
> >>> sensor
> >>> +  with an active array size of 4656H x 3496V. It is programmable
> >>> through
> >>> +  I2C interface. The I2C address is fixed to 0x1A as per sensor
> >>> data sheet.
> >>> +  Image data is sent through MIPI CSI-2, which is configured as
> >>> either 2 or
> >>> +  4 data lanes.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: sony,imx519
> >>> +
> >>> +  reg:
> >>> +    description: I2C device address    
> >>
> >> Skip description.
> >>  
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  VDIG-supply:    
> >>
> >> Use lower case names.  
> > 
> > Here we refer to other drivers (imx219), they are all uppercase, is
> > lowercase mandatory?  
> 
> Lowercase is the convention. Just because some other driver used
> uppercase is not really correct argument. If other driver has bug, you
> also copy it?
> 
> 
> Best regards,
> Krzysztof
> 

Hi,
Thanks for your quick reply. 
I just want to refer to the driver that has passed the review, as a template, is there anything I can refer to?
Do you have any good suggestions?
