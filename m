Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027DD660260
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 15:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjAFOmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 09:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAFOmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 09:42:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F395E651
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 06:42:06 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnv2-0008Cb-UT; Fri, 06 Jan 2023 15:42:04 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnv1-0005va-I6; Fri, 06 Jan 2023 15:42:03 +0100
Date:   Fri, 6 Jan 2023 15:42:03 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] media: imx-pxp: add support for i.MX7D
Message-ID: <20230106144203.GG24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <Y7gW/FPqt0CBxu/Q@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7gW/FPqt0CBxu/Q@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 06 Jan 2023 14:41:32 +0200, Laurent Pinchart wrote:
> Hi Michael,
> 
> On Thu, Jan 05, 2023 at 02:47:21PM +0100, Michael Tretter wrote:
> > This series adds support for the PXP found on the i.MX7D to the imx-pxp
> > driver.
> > 
> > The PXP on the i.MX7D has a few differences compared to the one on the
> > i.MX6ULL. Especially, it has more processing blocks and slightly different
> > multiplexers to route the data between the blocks. Therefore, the driver must
> > configure a different data path depending on the platform.
> > 
> > While the PXP has a version register, the reported version is the same on the
> > i.MX6ULL and the i.MX7D. Therefore, we cannot use the version register to
> > change the driver behavior, but have to use the device tree compatible. The
> > driver still prints the found version to the log to help bringing up the PXP
> > on further platforms.
> > 
> > The patches are inspired by some earlier patches [0] by Laurent to add PXP
> > support to the i.MX7d. Compared to the earlier patches, these patches add
> > different behavior depending on the platform. Furthermore, the patches disable
> > only the LUT block, but keep the rotator block enabled, as it may now be
> > configured via the V4L2 rotate control.
> 
> Sounds good to me.
> 
> > Patch 1 converts the dt-binding to yaml.
> > 
> > Patches 2 to 5 cleanup and refactor the driver in preparation of handling
> > different PXP versions.
> > 
> > Patches 6 and 7 add the handling of different platforms and the i.MX7d
> > specific configuration.
> > 
> > Patch 8 adds the device tree node for the PXP to the i.MX7d device tree.
> 
> I've reviewed the whole series and comments are mostly minor. As you're
> reminding me of the PXP, I'll take this as an opportunity to post
> patches that I've had in my tree for way too long :-) There will be
> minor conflicts with yours, so I'll first rebase them on this series,
> assuming that v2 will be similar in places where conflicts occur.

Thanks for the review! I will send a v2 to address your comments.

Thanks for your other patches as well. I will take a look and probably just
include them in my v2.

Michael

> 
> > Michael
> > 
> > [0] https://lore.kernel.org/linux-media/20200510223100.11641-1-laurent.pinchart@ideasonboard.com/
> > 
> > Michael Tretter (8):
> >   media: dt-bindings: media: fsl-pxp: convert to yaml
> >   media: imx-pxp: detect PXP version
> >   media: imx-pxp: extract helper function to setup data path
> >   media: imx-pxp: explicitly disable unused blocks
> >   media: imx-pxp: disable LUT block
> >   media: imx-pxp: make data_path_ctrl0 platform dependent
> >   media: imx-pxp: add support for i.MX7D
> >   ARM: dts: imx7d: add node for PXP
> > 
> >  .../bindings/media/fsl,imx6ull-pxp.yaml       |  62 ++++++++
> >  .../devicetree/bindings/media/fsl-pxp.txt     |  26 ---
> >  arch/arm/boot/dts/imx7d.dtsi                  |   9 ++
> >  drivers/media/platform/nxp/imx-pxp.c          | 148 +++++++++++++++---
> >  4 files changed, 197 insertions(+), 48 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt
