Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6029F757B76
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 14:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjGRMIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 08:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjGRMIe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 08:08:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB11730;
        Tue, 18 Jul 2023 05:08:10 -0700 (PDT)
Received: from [IPV6:2a01:e0a:212:79f0:8124:491b:6597:2479] (unknown [IPv6:2a01:e0a:212:79f0:8124:491b:6597:2479])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aferraris)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A01F8660703C;
        Tue, 18 Jul 2023 13:08:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689682088;
        bh=0oNKTXxCKMopqaC3ISIz7JJ8CKr0aW9sUct1jjQcbtQ=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=djq4aj0nEVHJgN7E0IT8Bm5aS+xtU6Cl8I9MOJu3fgSVNfvsSR1jFVbxm+tvWc+Fy
         MmukXVep08s0rVzcfsURKn1YvVrylBqCGleCAzv2/4aHG983WEPNEJZ6KAZdlX+8We
         0t3KjwoY/g4dQJCcVt01Cip5ZVS647srooe0QB+huOX2MTVR/JEMIOty99+MHKGBmp
         sm30iFiMaUAGkTVNTLjFDcz1BUVhqcstY6HU1QQ5NqrKbdOWB7kTQPwiK9umHmr/xm
         zfT+b4LVQs4UbmHSuWMtSpFbG2Onk9zQa4rjcJWkGYZU4jfD/qhBBdfDEjK85s2JIV
         z3nwTFgc1OMhQ==
Message-ID: <02a66bb5-3029-3392-f2d2-47fa0d8a343c@collabora.com>
Date:   Tue, 18 Jul 2023 14:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/21] imx258 improvements series
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
From:   Arnaud Ferraris <arnaud.ferraris@collabora.com>
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Le 30/05/2023 à 19:29, Dave Stevenson a écrit :
> This is a set of patches for imx258 that allow it to work with alternate clock
> frequencies, over either 2 or 4 lanes, and generally adding flexibility to the
> driver.
>
> Tested with an IMX258 module from Soho Enterprises that has a 24MHz oscillator.
> Both 2 and 4 lane configurations work with correct link frequencies and pixel
> rates.
>
> Jacopo has tested on a PinePhone Pro which has an ~19.2MHz clock fed from the SoC,
> He confirms that the two lower resolution modes work, but not the full res mode.
> Comparing to the BSP it looks like they have some weird clock configuration in
> the 4208x3120 mode (nominally 1224Mb/s/lane instead of 1267).
> As it has never previously worked directly with the mainline driver this isn't a
> regression but may indicate that there is a need for support of additional link
> frequencies in the future.

FYI, I have tested this series on PinePhone Pro as well, but this time 
changing the clock to 24 MHz.
I didn't test all modes (not sure how to do this), but feel free to add 
my Tested-by to the whole series for v2.

Thanks for your work on this,
Arnaud

>
> The last patch that makes HFLIP and VFLIP configurable may be contentious as I've
> retained the default configuration of inverted from the original driver. I know
> this was discussed recently, but I can't recall the final outcome.
>
> I am relying on someone from Intel testing this out, as correcting the cropping
> and supporting flips has changed the Bayer order. Seeing as this is all above
> board in V4L2 terms I really hope that the layers above it behave themselves.
>
> Cheers
>    Dave
>
> Dave Stevenson (21):
>    media: i2c: imx258: Remove unused defines
>    media: i2c: imx258: Make image geometry meet sensor requirements
>    media: i2c: imx258: Disable digital cropping on binned modes
>    media: i2c: imx258: Remove redundant I2C writes.
>    media: i2c: imx258: Add regulator control
>    media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
>    media: i2c: imx258: Split out common registers from the mode based
>      ones
>    media: i2c: imx258: Add support for 24MHz clock
>    media: i2c: imx258: Add support for running on 2 CSI data lanes
>    media: i2c: imx258: Follow normal V4L2 behaviours for clipping
>      exposure
>    media: i2c: imx258: Add get_selection for pixel array information
>    media: i2c: imx258: Allow configuration of clock lane behaviour
>    media: i2c: imx258: Correct max FRM_LENGTH_LINES value
>    media: i2c: imx258: Add support for long exposure modes
>    media: i2c: imx258: Issue reset before starting streaming
>    media: i2c: imx258: Set pixel_rate range to the same as the value
>    media: i2c: imx258: Support faster pixel rate on binned modes
>    dt-bindings: media: imx258: Rename to include vendor prefix
>    dt-bindings: media: imx258: Add alternate compatible strings
>    media: i2c: imx258: Change register settings for variants of the
>      sensor
>    media: i2c: imx258: Make HFLIP and VFLIP controls writable
>
>   .../i2c/{imx258.yaml => sony,imx258.yaml}     |   9 +-
>   MAINTAINERS                                   |   2 +-
>   drivers/media/i2c/imx258.c                    | 994 ++++++++++++------
>   3 files changed, 675 insertions(+), 330 deletions(-)
>   rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (90%)
>

