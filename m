Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4AE74BAE4
	for <lists+linux-media@lfdr.de>; Sat,  8 Jul 2023 03:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGHBLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 21:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjGHBLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 21:11:01 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B02210B
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 18:11:00 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1b0606bee45so2455689fac.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 18:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688778660; x=1691370660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2y2CScRtMXUgUZCvm8+PZgZsT8tNvD9LAv/sYdlwSPI=;
        b=FD0Yd4x0ybWf40fZW2wDWAw/v4NLvTpoVu1kiEsq1XLyAZMBcgcoMujBcKDZVTct69
         zR6pRFs1s8zUXfKiO6A9UXaFRUQLnKdHT2N0Qp3+vTA6lf6kYGis0Klsx11xfdQIPQLE
         qJMD+y8VPSYm2rftln57cRhiZyLvljrUzx3ByG2nsEUECvqdzZ+tTzVwLwUSR4Z1ZM0M
         2jdr9OVnpH/h+sy0MXfKwfi/pGtZoCBjswjV2rtsxZjurg9JalLSvlTsZdiRweSSsiVd
         izjz+d15XRQ4Xsj2S8NpR65IBu9IKhaGCyy+lgXPjI827/wYGUgoRf9d5R+ZBRRhFIHK
         Z3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778660; x=1691370660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y2CScRtMXUgUZCvm8+PZgZsT8tNvD9LAv/sYdlwSPI=;
        b=CmFiueLFLFPcwq1rrMPGradlcE65d54F+X/bmJK+M5wCC/sZihTbjZYfn9Dm0oHaef
         rhQofRxcPE6WdLKj4m5SSMNJlvNomdu9j4F30B5DVKctWmJSkJ9IEJu4fnzN5N/6mBcK
         wTOWTmlyh7JYqxVbnhoS6T4Mt3LuDPUxxnxs7EZOj41RkgWN1JCjJZ9EfrZ/+sic1LAr
         BdetTF+oJet4cUEvtOryqLV80WgC/CbvmFFjN+zKtoZRiw0iASvcGsAFNKsra60wvMJy
         LyWrKY1FFsHhPW1ugPPneXCNY4X3cA/okOWLCVGp0/MRTSEtaXCXcHnrlsM41fZZ7fYW
         zBNw==
X-Gm-Message-State: ABy/qLbOtjK4vr65DaJvA1mqBb4p3dfyWAF0851Cq6g8jk10X9ZT1mEA
        KDdSSEk/1Z9ojtOlh1DE6ke5KmuBsKwBt5KZ3jg=
X-Google-Smtp-Source: APBJJlGmAt3Nth+r+z4aJRB49VruR5eJMMKz7bjc2/3/HODzbi73ra1W6jFnrRxnb6tQkR2lE3lxWpKdnW9uw2DgLoU=
X-Received: by 2002:a05:6870:171d:b0:19f:202:4fb9 with SMTP id
 h29-20020a056870171d00b0019f02024fb9mr9609554oae.38.1688778659709; Fri, 07
 Jul 2023 18:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
In-Reply-To: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 7 Jul 2023 20:10:48 -0500
Message-ID: <CAHCN7xKy8gNz5V+9rdh-GhdYbEAsWpRbhNK-HD-C9D=BSO14+w@mail.gmail.com>
Subject: Re: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for port@1
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 7, 2023 at 7:28=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> w=
rote:
>
> Greetings,
>
> I have an imx219 camera connected to an imx8mp-venice-gw74xx via the
> following details:
> - camera is a RaspberryPi Camera v2 -
> https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> - has its own on-board 24MHz osc so no clock is required from the baseboa=
rd
> - pin 11 on the camera enables 1.8V and 2.8V LDO which is connected to
> IMX8MP GPIO1_IO1 so we use that as a gpio regulator
> - MIPI_CSI1 lanes 0 and 1 are used
>
> I'm using Linux 6.4 with Laurent's pending patch to add the MIPI CSI
> DT nodes to imx8mp.dtsi [1] as follows:
>
> #include <dt-bindings/gpio/gpio.h>
> #include "imx8mp-pinfunc.h"
>
> /dts-v1/;
> /plugin/;
>
> &{/} {
>         compatible =3D "gw,imx8mp-gw74xx", "fsl,imx8mp";
>
>         reg_cam: regulator-cam {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_reg_cam>;
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "reg_cam";
>                 gpio =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>         };
>
>         cam24m: cam24m {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
>                 clock-frequency =3D <24000000>;
>                 clock-output-names =3D "cam24m";
>         };
> };
>
> &i2c3 {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         imx219: sensor@10 {
>                 compatible =3D "sony,imx219";
>                 reg =3D <0x10>;
>                 clocks =3D <&cam24m>;
>                 VDIG-supply =3D <&reg_cam>;
>
>                 port {
>                         /* MIPI CSI-2 bus endpoint */
>                         imx219_to_mipi_csi2: endpoint {
>                                 remote-endpoint =3D <&mipi_csi_0_in>;
>                                 clock-lanes =3D <0>;
>                                 data-lanes =3D <1 2>;
>                                 link-frequencies =3D /bits/ 64 <456000000=
>;
>                         };
>                 };
>         };
> };
>
> &mipi_csi_0 {
>         status =3D "okay";
>
>         ports {
>                 port@0 {
>                         mipi_csi_0_in: endpoint {
>                                 remote-endpoint =3D <&imx219_to_mipi_csi2=
>;
>                                 data-lanes =3D <1 2>;
>                         };
>                 };
>         };
> };
>
> &iomuxc {
>         pinctrl_reg_cam: regcamgrp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01     0x41
>                 >;
>         };
> };
>
> imx-mipi-csis fails to probe due to a missing port1 endpoint and I'm
> not clear what to do with that:
> imx-mipi-csis 32e40000.csi: Unable to retrieve endpoint for port@1
> imx-mipi-csis: probe of 32e40000.csi failed with error -2
>
> Any suggestions?

I think the port needs to point to an ISI node or a ISP node.
Linux-next shows port@1 pointing to  isi_in_0.  In the patch you're
referencing, it appears that node@1 is missing.

Check out:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20230707&id=3D9da15c4c85=
0dd53309e07d5611f33655f8f8c05d

See if that helps.

adam


>
> Best regards,
>
> Tim
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/2023041815310=
4.21337-2-laurent.pinchart@ideasonboard.com/
