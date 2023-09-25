Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC22A7AD237
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 09:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjIYHpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 03:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjIYHpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 03:45:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F9F197
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 00:45:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86677C433C8;
        Mon, 25 Sep 2023 07:45:11 +0000 (UTC)
Message-ID: <dec8d5b1-234a-40eb-b0e2-7d02e10a71e6@xs4all.nl>
Date:   Mon, 25 Sep 2023 09:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] media: rockchip: rga: add support for multi-planar
 formats
Content-Language: en-US, nl
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2023 14:40, Michael Tretter wrote:
> This series adds support for the V4L2 multi-planar API to the Rockchip
> RGA driver. Once the RGA driver supports the multi-planar API, it is
> easier to share buffers with other V4L2 drivers that also support the
> multi-planar API and may not expose planar formats with contiguous
> planes.
> 
> With non-contiguous planes, the U and V planes may not start at the same
> offset as with the continuous planes. Therefore, the RGA driver cannot
> rely on its calculation of the plane offsets based on the format and
> frame size anymore, but must remember the offsets when it created the
> mapping. Therefore, I also reworked how the DMA mapping is handled.
> 
> As a bonus, the RGA driver should now work correctly on devices with
> more than 4 GB of memory. Video buffers should now be allocated within
> the 4 GB boundary and an import of buffers that have higher addresses
> into the driver should fail.
> 
> Patch 1 fixes the swizzling of RGA formats. While testing all formats of
> the driver on rk3568, I discovered that the color channels of the RGB
> formats are wrong when converting to NV12. I didn't test this on other
> SoCs with an RGA and I am not sure, if they behave differently regarding
> the color channels. Please report, if this breaks the color conversion
> on other SoCs, and I will make this SoC-specific.
> 
> Patches 2 to 6 are the rework the DMA descriptor handling for the RGA
> MMU. The patches clean up, how the driver uses the DMA API, and make the
> creation of the descriptor list more explicit. Furthermore, the driver
> is changed to keep the mapping per video buffer instead of using a
> single mapping that is updated with every buffer.
> 
> Patches 7 to 11 prepare the driver for the multi-planar API including a
> cleanup of the format handling in the buffer, and finally switch to the
> multi-planar API.
> 
> Patch 12 updates the code that creates the DMA-descriptor mapping to
> correctly handle buffers with multiple planes. The driver has to iterate
> all planes and make them the continuous for the RGA.
> 
> Patch 13 enables the NV12M format, which is the multi-planar variant of
> the NV12 format.

I get these smatch warnings for this series:

drivers/media/platform/rockchip/rga/rga-hw.c: In function 'rga_get_addr_offset':
drivers/media/platform/rockchip/rga/rga-hw.c:46:65: warning: variable 'uv_factor' set but not used [-Wunused-but-set-variable]
   46 |                      y_div = 0, uv_stride = 0, pixel_width = 0, uv_factor = 0;
      |                                                                 ^~~~~~~~~
drivers/media/platform/rockchip/rga/rga-buf.c:129 rga_buf_prepare() warn: unsigned 'ret' is never less than zero.

Regards,

	Hans

> 
> Michael
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Michael Tretter (13):
>       media: rockchip: rga: fix swizzling for RGB formats
>       media: rockchip: rga: extract helper to fill descriptors
>       media: rockchip: rga: allocate DMA descriptors per buffer
>       media: rockchip: rga: split src and dst buffer setup
>       media: rockchip: rga: pre-calculate plane offsets
>       media: rockchip: rga: set dma mask to 32 bits
>       media: rockchip: rga: use clamp() to clamp size to limits
>       media: rockchip: rga: use pixelformat to find format
>       media: rockchip: rga: add local variable for pix_format
>       media: rockchip: rga: use macros for testing buffer type
>       media: rockchip: rga: switch to multi-planar API
>       media: rockchip: rga: rework buffer handling for multi-planar formats
>       media: rockchip: rga: add NV12M support
> 
>  drivers/media/platform/rockchip/rga/rga-buf.c | 166 ++++++++++++++++-------
>  drivers/media/platform/rockchip/rga/rga-hw.c  | 143 +++++++++++++-------
>  drivers/media/platform/rockchip/rga/rga.c     | 187 ++++++++++++--------------
>  drivers/media/platform/rockchip/rga/rga.h     |  35 ++++-
>  4 files changed, 329 insertions(+), 202 deletions(-)
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230914-rockchip-rga-multiplanar-0d7c79b1ba93
> 
> Best regards,

