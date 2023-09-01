Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A69A78F975
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 10:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242584AbjIAICR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 04:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbjIAICR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 04:02:17 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B1510D7;
        Fri,  1 Sep 2023 01:02:14 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3A6A51007F5; Fri,  1 Sep 2023 09:02:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1693555332; bh=hAB9s4XrUu7LHVJzvkljFiphva5beXTT7msBZLZEBik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qwFfL+hgCH8bfV7jFXSUAVurMFlcFyfbk54nZRRDFq6G0FEb81orDgMedlONbQT3r
         z6V3rxGcBhL1RCO1hmvcqYOUOxwRaWcWYBN1XDaI2ZR6lMdo4T2ASNq3OsFSf2fHe8
         h3qrZPkHn7eXZxwTkjmbpQdOliVId5EVQ8McECSfpwhYq1FxnUp3lrcf+oxh3cacWU
         Y9yaiZ6ou77KDW9NuXhbTIrP1D1JQDhUu1pygY4L5tRp0AKtJYfuLplrCtv+/7dCbV
         p4+ylaWdtqxusZ3x2cQJZ3n3u6vV1ognjHcvtAe/XKKScWwKkUsRT/kb24OR1ICM9f
         xXzw45ejGUGWQ==
Date:   Fri, 1 Sep 2023 09:02:12 +0100
From:   Sean Young <sean@mess.org>
To:     Zelong Dong <Zelong.Dong@amlogic.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Message-ID: <ZPGahNKlq/31MXbh@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 31, 2023 at 08:13:22PM +0800, Zelong Dong wrote:
> 在 2023/8/29 15:39, Sean Young 写道:
> > On Fri, Aug 25, 2023 at 07:53:08PM +0800, zelong dong wrote:
> > > From: Zelong Dong<zelong.dong@amlogic.com>
> > > 
> > > Meson IR Controller supports hardware decoder in Meson-S4 and later
> > > SoC. So far, protocol NEC could be decoded by hardware decoder.
> > On Meson-S4, only the hardware decoder for NEC can be used using this
> > driver. Does the Meson-S4 hardware support software decoding? If
> > software decoding could be used, then any protocol could be supported,
> > not just NEC.
> > 
> > Also, out of interest, is there are documentation available for this
> > hardware?
> > 
> > Thanks,
> > 
> > Sean
> > 
> Yes, IR driver still supports SW decoding on Meson-S4. The decode mode could
> be changed by 'support_hw_decoder'.

This requires changing the source code, it cannot be done at runtime.

> If IR Controller works in SW decoding, driver will be registered by
> RC_DRIVER_IR_RAW and allows all protocol.
> Otherwise, driver will be registered by RC_DRIVER_SCANCODE and only allows
> NEC.
> 
> 489         if (ir->rc->driver_type == RC_DRIVER_IR_RAW) {
> 490                 ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
> 491                 ir->rc->rx_resolution = MESON_RAW_TRATE;
> 492                 ir->rc->min_timeout = 1;
> 493                 ir->rc->timeout = IR_DEFAULT_TIMEOUT;
> 494                 ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
> 495         } else if (ir->rc->driver_type == RC_DRIVER_SCANCODE) {
> 496                 ir->rc->allowed_protocols = RC_PROTO_BIT_NEC;
> 497                 ir->rc->change_protocol = meson_ir_hw_decoder_init;
> 498         }

There are other drivers too which can do hardware decoding and software
decoding. Ideally we should have a mechanism to switch between them at
runtime, but as-is rc-core does not provide for this.

> Do you get Meson-S4 datasheet? Please refer to chapter 13.5 Infrared Remote.

I did not get it, unfortunately. Any help would be appreciated, thanks.

Other than that, the driver does look fine. Nothing to hold up merging for. 
I'll apply it when I can.

Thanks,

Sean
