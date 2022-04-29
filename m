Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A5A514399
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 10:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355350AbiD2IIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Apr 2022 04:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355362AbiD2IIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Apr 2022 04:08:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD00B89319;
        Fri, 29 Apr 2022 01:05:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B14E62083;
        Fri, 29 Apr 2022 08:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF3CC385A4;
        Fri, 29 Apr 2022 08:05:29 +0000 (UTC)
Message-ID: <d76bab1c-6547-5b9a-ad17-25a73bcc899d@xs4all.nl>
Date:   Fri, 29 Apr 2022 10:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 00/13] media: atmel: atmel-isc: implement media
 controller
Content-Language: en-US
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, claudiu.beznea@microchip.com,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
References: <20220310095202.2701399-1-eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220310095202.2701399-1-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On 10/03/2022 10:51, Eugen Hristev wrote:
> This series is the v9 series that attempts to support media controller in the
> atmel ISC and XISC drivers.
> The CSI2DC driver was accepted thus removed from the patch series, together with
> other patches.
> 
> Important note: this series applies on top of current media_staging tree, as it
> relies on previous patches in the series which were accepted.
> 
> Thanks to everyone who reviewed my work !
> 
> Eugen
> 
> Changes in v9:
> -> kernel robot reported isc_link_validate is not static, changed to static.
> 
> Changes in v8:
> -> scaler: modified crop bounds to have the exact source size
> 
> Changes in v7:
> -> scaler: modified crop bounds to have maximum isc size
> -> format propagation: did small changes as per Jacopo review
> 
> 
> Changes in v6:
> -> worked a bit on scaler, added try crop and other changes as per Jacopo review
> -> worked on isc-base enum_fmt , reworked as per Jacopo review
> 
> Changes in v5:
> -> removed patch that removed the 'stop' variable as it was still required
> -> added two new trivial patches
> -> reworked some parts of the scaler and format propagation after discussions with Jacopo
> 
> 
> Changes in v4:
> -> as reviewed by Hans, added new patch to remove the 'stop' variable and reworked
> one patch that was using it
> -> as reviewed by Jacopo, reworked some parts of the media controller implementation
> 
> 
> Changes in v3:
> - change in bindings, small fixes in csi2dc driver and conversion to mc
> for the isc-base.
> - removed some MAINTAINERS patches and used patterns in MAINTAINERS
> 
> Changes in v2:
> - integrated many changes suggested by Jacopo in the review of the v1 series.
> - add a few new patches
> 
> 
> 
> Eugen Hristev (13):
>   media: atmel: atmel-isc-base: use streaming status when queueing
>     buffers
>   media: atmel: atmel-isc-base: replace is_streaming call in
>     s_fmt_vid_cap
>   media: atmel: atmel-isc: remove redundant comments
>   media: atmel: atmel-isc: implement media controller
>   media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
>   media: atmel: atmel-isc-base: use mutex to lock awb workqueue from
>     streaming
>   media: atmel: atmel-isc: compact the controller formats list
>   media: atmel: atmel-isc: change format propagation to subdev into only
>     verification
>   media: atmel: atmel-sama7g5-isc: remove stray line
>   dt-bindings: media: microchip,xisc: add bus-width of 14

I'm a bit unhappy with the order of these patches. Mostly these are fixes,
except for patches 4 and 8, which are the meat of this series and actually
switching on the MC support.

Can those be moved to the end? That also makes it easier to merge the earlier
patches if some more work is needed for the MC part.

I'm also not sure whether patches 4 and 8 shouldn't be a single patch,
since patch 4 leaves the driver in an inconsistent state since it is
missing the link validation code that patch 8 adds. Unless I missed
something?

Regards,

	Hans

>   ARM: dts: at91: sama7g5: add nodes for video capture
>   ARM: configs: at91: sama7: add xisc and csi2dc
>   ARM: multi_v7_defconfig: add atmel video pipeline modules
> 
>  .../bindings/media/microchip,xisc.yaml        |   2 +-
>  arch/arm/boot/dts/sama7g5.dtsi                |  49 ++
>  arch/arm/configs/multi_v7_defconfig           |   3 +
>  arch/arm/configs/sama7_defconfig              |   2 +
>  drivers/media/platform/atmel/Makefile         |   2 +-
>  drivers/media/platform/atmel/atmel-isc-base.c | 518 ++++++++++--------
>  .../media/platform/atmel/atmel-isc-scaler.c   | 267 +++++++++
>  drivers/media/platform/atmel/atmel-isc.h      |  58 +-
>  .../media/platform/atmel/atmel-sama5d2-isc.c  |  87 +--
>  .../media/platform/atmel/atmel-sama7g5-isc.c  |  93 ++--
>  10 files changed, 754 insertions(+), 327 deletions(-)
>  create mode 100644 drivers/media/platform/atmel/atmel-isc-scaler.c
> 

