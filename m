Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53F87B81D3
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 16:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242725AbjJDOJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 10:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242696AbjJDOJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 10:09:13 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E12A1
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 07:09:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2Yd-0000Gc-Qd; Wed, 04 Oct 2023 16:08:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2YY-00B3Jy-Fj; Wed, 04 Oct 2023 16:08:54 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2YY-00Cm9v-Cn; Wed, 04 Oct 2023 16:08:54 +0200
Date:   Wed, 4 Oct 2023 16:08:54 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 00/13] media: rockchip: rga: add support for multi-planar
 formats
Message-ID: <20231004140854.GB3042281@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <dec8d5b1-234a-40eb-b0e2-7d02e10a71e6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dec8d5b1-234a-40eb-b0e2-7d02e10a71e6@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 25 Sep 2023 09:45:10 +0200, Hans Verkuil wrote:
> On 14/09/2023 14:40, Michael Tretter wrote:
> > This series adds support for the V4L2 multi-planar API to the Rockchip
> > RGA driver. Once the RGA driver supports the multi-planar API, it is
> > easier to share buffers with other V4L2 drivers that also support the
> > multi-planar API and may not expose planar formats with contiguous
> > planes.
> > 
> > With non-contiguous planes, the U and V planes may not start at the same
> > offset as with the continuous planes. Therefore, the RGA driver cannot
> > rely on its calculation of the plane offsets based on the format and
> > frame size anymore, but must remember the offsets when it created the
> > mapping. Therefore, I also reworked how the DMA mapping is handled.
> > 
> > As a bonus, the RGA driver should now work correctly on devices with
> > more than 4 GB of memory. Video buffers should now be allocated within
> > the 4 GB boundary and an import of buffers that have higher addresses
> > into the driver should fail.
> > 
> > Patch 1 fixes the swizzling of RGA formats. While testing all formats of
> > the driver on rk3568, I discovered that the color channels of the RGB
> > formats are wrong when converting to NV12. I didn't test this on other
> > SoCs with an RGA and I am not sure, if they behave differently regarding
> > the color channels. Please report, if this breaks the color conversion
> > on other SoCs, and I will make this SoC-specific.
> > 
> > Patches 2 to 6 are the rework the DMA descriptor handling for the RGA
> > MMU. The patches clean up, how the driver uses the DMA API, and make the
> > creation of the descriptor list more explicit. Furthermore, the driver
> > is changed to keep the mapping per video buffer instead of using a
> > single mapping that is updated with every buffer.
> > 
> > Patches 7 to 11 prepare the driver for the multi-planar API including a
> > cleanup of the format handling in the buffer, and finally switch to the
> > multi-planar API.
> > 
> > Patch 12 updates the code that creates the DMA-descriptor mapping to
> > correctly handle buffers with multiple planes. The driver has to iterate
> > all planes and make them the continuous for the RGA.
> > 
> > Patch 13 enables the NV12M format, which is the multi-planar variant of
> > the NV12 format.
> 
> I get these smatch warnings for this series:
> 
> drivers/media/platform/rockchip/rga/rga-hw.c: In function 'rga_get_addr_offset':
> drivers/media/platform/rockchip/rga/rga-hw.c:46:65: warning: variable 'uv_factor' set but not used [-Wunused-but-set-variable]
>    46 |                      y_div = 0, uv_stride = 0, pixel_width = 0, uv_factor = 0;
>       |                                                                 ^~~~~~~~~
> drivers/media/platform/rockchip/rga/rga-buf.c:129 rga_buf_prepare() warn: unsigned 'ret' is never less than zero.

Thanks, I will run smatch on the series and send a v2.

Michael

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Michael
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Michael Tretter (13):
> >       media: rockchip: rga: fix swizzling for RGB formats
> >       media: rockchip: rga: extract helper to fill descriptors
> >       media: rockchip: rga: allocate DMA descriptors per buffer
> >       media: rockchip: rga: split src and dst buffer setup
> >       media: rockchip: rga: pre-calculate plane offsets
> >       media: rockchip: rga: set dma mask to 32 bits
> >       media: rockchip: rga: use clamp() to clamp size to limits
> >       media: rockchip: rga: use pixelformat to find format
> >       media: rockchip: rga: add local variable for pix_format
> >       media: rockchip: rga: use macros for testing buffer type
> >       media: rockchip: rga: switch to multi-planar API
> >       media: rockchip: rga: rework buffer handling for multi-planar formats
> >       media: rockchip: rga: add NV12M support
> > 
> >  drivers/media/platform/rockchip/rga/rga-buf.c | 166 ++++++++++++++++-------
> >  drivers/media/platform/rockchip/rga/rga-hw.c  | 143 +++++++++++++-------
> >  drivers/media/platform/rockchip/rga/rga.c     | 187 ++++++++++++--------------
> >  drivers/media/platform/rockchip/rga/rga.h     |  35 ++++-
> >  4 files changed, 329 insertions(+), 202 deletions(-)
> > ---
> > base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> > change-id: 20230914-rockchip-rga-multiplanar-0d7c79b1ba93
> > 
> > Best regards,
> 
> 
