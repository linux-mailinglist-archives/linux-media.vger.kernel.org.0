Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFA43D8F2B
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 15:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbhG1Ncz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 09:32:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbhG1Ncz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 09:32:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77FBCEE;
        Wed, 28 Jul 2021 15:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627479171;
        bh=c1dkUuPXfClOIv5jpAqPkqsyfaPoUtpNHnoR7YUBKtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JgCARYIVVkDVfEHmvs9gFM9xYM7j/CTlLRSZtKoKNqHJIs0AF6WwqQgMxUr03ru+P
         ypa7AigHetwOwZZOaGKbE2sakovaTsIV6Ny//st1PPyyR+gwYKG/iCPI81o/tnAtk5
         iwnjIUWpksVMQze9N4GnXsCRy6iR713Kq6mBzR0U=
Date:   Wed, 28 Jul 2021 16:32:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     dafna.hirschfeld@collabora.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        slongerbeam@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v10 0/3] media: imx: add support for imx8mq MIPI RX
Message-ID: <YQFcfbrTmGw4kZvQ@pendragon.ideasonboard.com>
References: <20210728091245.231043-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210728091245.231043-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Jul 28, 2021 at 11:12:42AM +0200, Martin Kepplinger wrote:
> hi,
> 
> This patch series adds a driver for the i.MX8MQ CSI MIPI receiver / controller.
> 
> It includes the driver, the dt-bindings and the DT addition to the SoC dtsi.
> I test it using libcamera. Thanks to Laurent who helped a lot. I'm happy for
> any feedback,

Thank you for the series. I've submitted a pull request that contains
patches 1/3 and 2/3.

Shawn, Sascha, how would you like to handle 3/3 ?

> revision history
> ----------------
> v10: (thank you Dafna)
> * improve send_level documentation.
> * add some comments to 0x180 and 0x184
> * after re-reading I could eliminate the unneeded setting of 0x184 (ignored
>   by setting 0x180 to 1).
> 
> v9: (thank you Laurent)
> * improve getting the esc clock rate for hs_settle
> https://lore.kernel.org/linux-media/20210726082117.2423597-1-martin.kepplinger@puri.sm/
> 
> v8: (thank you Laurent)
> * calculate hs_settle for any clk rate and mode
> * add reviewed-by tag
> https://lore.kernel.org/linux-media/20210723101217.1954805-1-martin.kepplinger@puri.sm/T/
> 
> v7: (thank you Laurent and Rob)
> * fix the binding example (include the reset driver)
> * use pm_runtime_resume_and_get()
> * fix some logic in init_cfg()
> * add some useful code comments and fix minor bits found by Laurent in v6
> https://lore.kernel.org/linux-media/20210716102244.581182-1-martin.kepplinger@puri.sm/T/#t
> 
> v6: (thank you Laurent and Rob)
> * add reviewed-by tag to binding
> * statically allocate clk_bulk_data
> * fix how the hs_settle value is applied
> * remove s_power calls
> * remove the link_setup() callback implementation and make the link immutable
> * more cleanups according to Laurents' review from v5
> https://lore.kernel.org/linux-media/20210714111931.324485-1-martin.kepplinger@puri.sm/
> 
> v5: (thank you Laurent)
> * fix reset usage by using the already supported reset controller driver
> * remove clko2 (totally unrelated clock / had been included by accident)
> * rename pxl clock to ui
> https://lore.kernel.org/linux-media/20210618095753.114557-1-martin.kepplinger@puri.sm/
> 
> v4: (thank you Rob and Marco)
> * create fsl,mipi-phy-gpr custom dt property instead of confusing "phy"
> * add imx8mq-specific compatibile to imx8mq.dtsi for future use
> https://lore.kernel.org/linux-media/20210614121522.2944593-1-martin.kepplinger@puri.sm/
> 
> v3: (thank you, Rob and Laurent)
> among minor other things according to v2 review, changes include:
> * better describe the clocks
> * rename DT property "phy-reset" to "reset" and "phy-gpr" to "phy"
> https://lore.kernel.org/linux-media/20210608104128.1616028-1-martin.kepplinger@puri.sm/T/#t
> 
> v2: (thank you, Dan and Guido)
> among fixes according to v1 reviews, changes include:
> * remove status property from dt-bindings example
> * define a few bits in order to have less magic values
> * use "imx8mq_mipi_csi_" as local function prefix
> * read DT properties only during probe()
> * remove dead code (log_status)
> * add imx8mq_mipi_csi_release_icc()
> * fix imx8mq_mipi_csi_init_icc()
> https://lore.kernel.org/linux-media/20210531112326.90094-1-martin.kepplinger@puri.sm/
> 
> v1:
> https://lore.kernel.org/linux-media/20210527075407.3180744-1-martin.kepplinger@puri.sm/T/#t
> 
> 
> Martin Kepplinger (3):
>   dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and
>     controller
>   media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller
>   arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions
> 
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 174 +++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 104 ++
>  drivers/staging/media/imx/Makefile            |   1 +
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c  | 991 ++++++++++++++++++
>  4 files changed, 1270 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>  create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

-- 
Regards,

Laurent Pinchart
