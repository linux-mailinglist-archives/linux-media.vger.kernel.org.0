Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D2174BA8A
	for <lists+linux-media@lfdr.de>; Sat,  8 Jul 2023 02:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjGHA2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 20:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGHA2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 20:28:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A5C1991
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 17:28:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso40536411fa.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 17:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1688776090; x=1691368090;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/5scLeTRuOJLInnV6UUpK9QZKO8xpvC3qyWzv3ycz0E=;
        b=2p6N4YTdXt9LoozL+7rAtoW4mrl/qAPP07Az723pbUljbdQOz79PQyprhFQvzWN6o3
         etCvmXkVWKAWg/sPTsWWtznOTr+7o+Y1riTBfgLP9LwLYRo1zQs7bBuq7VncyO11WWs8
         6QbiG8+pLkH4klxHZONBMIgiAxF0/zTiBgGNu6bWHZJiBCGJ8wKjAKa3AYipsLjrrdD/
         lhK1ZosIqulbJTXz6X7pCpuQ2/mK7uVw4NwIngnvVgoGrtahqMwJszptFBZYUNj9cu23
         wlT1kCNBE7VPMt6+nOl/u4jBvcPoX8+qYN2UG/vUeB2XeXRQFTKLz2fYnDZxR4jy24Bd
         QUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688776090; x=1691368090;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5scLeTRuOJLInnV6UUpK9QZKO8xpvC3qyWzv3ycz0E=;
        b=Ht/5EypCCGmPzrG1mo+1DQ5egWvgjP/vjHXBasNa8V0EplRXsUQXpDp6M/Pji1DIO/
         5j9ZeobwrE+xgHmqPR/P1uih75IS+Z1Pu2ELxfCDjqMUyaaFtptm1FqSlu146YGEgPOE
         6MDxuHqs5Yjr/gJU1+mgTT4ez2rq7B6gP4Ud6N515qSkcaxnAxYtrydHy0PzbnBWcXEK
         22Nb3HSrce/mdNkSjhG0wDAQgtsAU8OzSCkNGvmSKxSBpko8p4+DDqh66skbRTOG2kzZ
         2MLOQrF9FNBctHirSuQKE+c9qppmV9+MS9lj5y29uWjBb3XeB6mdGjDpIgL52FJpGnC/
         iMYw==
X-Gm-Message-State: ABy/qLYmTMja85uuLLF6szY5fXAQO/5OBqv4+rGPY+PaIBrKk7Emvq8T
        7NX25ev1zUdKS7ZXHwaSHSgJqJh9RTKafGlwCZtGgA==
X-Google-Smtp-Source: APBJJlEvYRMg598Y4N5/Mgh3vA6pGobLMUcsAdA7Dt8h8VbMZbD2ha3TDNZHFVx4QDUyaN/MOXclvrHuC5dercnbdRM=
X-Received: by 2002:a05:6512:4018:b0:4f8:5ede:d452 with SMTP id
 br24-20020a056512401800b004f85eded452mr5545356lfb.55.1688776089752; Fri, 07
 Jul 2023 17:28:09 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 7 Jul 2023 17:27:58 -0700
Message-ID: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
Subject: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for port@1
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I have an imx219 camera connected to an imx8mp-venice-gw74xx via the
following details:
- camera is a RaspberryPi Camera v2 -
https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
- has its own on-board 24MHz osc so no clock is required from the baseboard
- pin 11 on the camera enables 1.8V and 2.8V LDO which is connected to
IMX8MP GPIO1_IO1 so we use that as a gpio regulator
- MIPI_CSI1 lanes 0 and 1 are used

I'm using Linux 6.4 with Laurent's pending patch to add the MIPI CSI
DT nodes to imx8mp.dtsi [1] as follows:

#include <dt-bindings/gpio/gpio.h>
#include "imx8mp-pinfunc.h"

/dts-v1/;
/plugin/;

&{/} {
        compatible = "gw,imx8mp-gw74xx", "fsl,imx8mp";

        reg_cam: regulator-cam {
                pinctrl-names = "default";
                pinctrl-0 = <&pinctrl_reg_cam>;
                compatible = "regulator-fixed";
                regulator-name = "reg_cam";
                gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
                enable-active-high;
                regulator-min-microvolt = <1800000>;
                regulator-max-microvolt = <1800000>;
        };

        cam24m: cam24m {
                compatible = "fixed-clock";
                #clock-cells = <0>;
                clock-frequency = <24000000>;
                clock-output-names = "cam24m";
        };
};

&i2c3 {
        #address-cells = <1>;
        #size-cells = <0>;

        imx219: sensor@10 {
                compatible = "sony,imx219";
                reg = <0x10>;
                clocks = <&cam24m>;
                VDIG-supply = <&reg_cam>;

                port {
                        /* MIPI CSI-2 bus endpoint */
                        imx219_to_mipi_csi2: endpoint {
                                remote-endpoint = <&mipi_csi_0_in>;
                                clock-lanes = <0>;
                                data-lanes = <1 2>;
                                link-frequencies = /bits/ 64 <456000000>;
                        };
                };
        };
};

&mipi_csi_0 {
        status = "okay";

        ports {
                port@0 {
                        mipi_csi_0_in: endpoint {
                                remote-endpoint = <&imx219_to_mipi_csi2>;
                                data-lanes = <1 2>;
                        };
                };
        };
};

&iomuxc {
        pinctrl_reg_cam: regcamgrp {
                fsl,pins = <
                        MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01     0x41
                >;
        };
};

imx-mipi-csis fails to probe due to a missing port1 endpoint and I'm
not clear what to do with that:
imx-mipi-csis 32e40000.csi: Unable to retrieve endpoint for port@1
imx-mipi-csis: probe of 32e40000.csi failed with error -2

Any suggestions?

Best regards,

Tim
[1] https://patchwork.linuxtv.org/project/linux-media/patch/20230418153104.21337-2-laurent.pinchart@ideasonboard.com/
