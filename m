Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E96978FF64
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345990AbjIAOnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 10:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343605AbjIAOny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 10:43:54 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BC310CF;
        Fri,  1 Sep 2023 07:43:49 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 381BQwb1013201;
        Fri, 1 Sep 2023 16:43:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=hY3r0yZOfH3NsDgAjFUEN
        Juf3sBAYxJNoDPD9+XNP58=; b=o3jP3SQOJ9OfSWj5XFoIi4P5f2xBBhpnHCC1K
        1GjqKoFLDdhlh79rCdk7SS3b//SzHsAFtoTF4A61cuwVpa/pkAmAAyf4pnOUvVol
        viUQV8nE7e/4/Bk9t0dmNeiGi0sl4DPZbhUUHwuxEwQY5Jc3uR4vSDnyxe3TOmQK
        ruTXHx62xJx032cH9n7E2ovexQ0Y+gzmDZB1smvoQFHdWkg3/Wh2hPQ8lM+caQAz
        UcXCPgHRH+CpV8AFQ7XOPmqgpKvC0mruyXdtMxsHQm50n8O5vlqXcbX4Jgjtj4i8
        I5zMDNGrP0KhqgM+Lj/7yKnck61dB68EpIE0IwDm5GiFEiM8g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq6tg2bmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Sep 2023 16:43:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E72D100056;
        Fri,  1 Sep 2023 16:43:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5129D236942;
        Fri,  1 Sep 2023 16:43:27 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 1 Sep
 2023 16:43:26 +0200
Date:   Fri, 1 Sep 2023 16:43:18 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Conor Dooley <conor@kernel.org>
CC:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: media: add bindings for dcmipp driver
Message-ID: <20230901144318.GA248638@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Conor Dooley <conor@kernel.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230829132357.192535-1-alain.volmat@foss.st.com>
 <20230829132357.192535-2-alain.volmat@foss.st.com>
 <20230829-juror-decathlon-f7b252a330bf@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829-juror-decathlon-f7b252a330bf@spud>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_12,2023-08-31_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Conor,

thanks for the review.  I've taken into account your comment and
will push this into the v3.


On Tue, Aug 29, 2023 at 04:00:06PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Tue, Aug 29, 2023 at 03:23:45PM +0200, Alain Volmat wrote:
> > Add the yaml binding for the DCMIPP driver.
> 
> Please drop all mentions of drivers, bindings are for hardware.

Ok

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../bindings/media/st,stm32-dcmipp.yaml       | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > new file mode 100644
> > index 000000000000..63f03a1c42b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/st,stm32-dcmipp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 DCMIPP Digital Camera Memory Interface Pixel Processor binding
> 
> s/binding// to appease the bot.

Ok

> 
> > +
> > +maintainers:
> > +  - Hugues Fruchet <hugues.fruchet@foss.st.com>
> > +  - Alain Volmat <alain.volmat@foss.st.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: st,stm32mp13-dcmipp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: kclk
> 
> Can drop the items: here since you only have one. The name is also
> pretty pointless when you only have one...

Ok, I removed clock-names (from required as well).
> 
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    unevaluatedProperties: false
> > +    description:
> > +      DCMIPP supports a single port node with parallel bus.
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          bus-type:
> > +            enum: [5, 6]
> > +            default: 5
> > +
> > +          bus-width:
> > +            enum: [8, 10, 12, 14]
> > +            default: 8
> > +
> > +          pclk-sample: true
> > +          hsync-active: true
> > +          vsync-active: true
> > +
> > +        required:
> > +          - pclk-sample
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/stm32mp13-clks.h>
> > +    #include <dt-bindings/reset/stm32mp13-resets.h>
> > +    dcmipp: dcmipp@5a000000 {
> 
> Neither of the labels here are used AFAICT, please remove them.

Done

Regards,
Alain
