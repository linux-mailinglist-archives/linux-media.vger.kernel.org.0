Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39B8632B6F
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 18:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiKURtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 12:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiKURth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 12:49:37 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8710FD089A
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 09:49:36 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EB8C5E0006;
        Mon, 21 Nov 2022 17:49:33 +0000 (UTC)
Date:   Mon, 21 Nov 2022 18:49:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 00/10] media: ar0521: Add analog gain, rework clock
 tree
Message-ID: <20221121174933.fousgbqgmgxvvdmf@uno.localdomain>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I just noticed patch 10/10 was missing.

Now sent in reply to this thread.

While at it, gentle ping to see if this can make it for 6.2 ?

Thanks
  j

On Fri, Nov 04, 2022 at 03:24:43PM +0100, Jacopo Mondi wrote:
> Hello,
>   this series adds a few features to the ar0521 driver to enable its usage
> with libcamera.
>
> In particular:
> - enum_frame_sizes
> - global analog gain control
> - LINK_FREQ
> - Rework blanking handligs
>
> v3 (Dave)
> - Check __v4l2_ctrl_modify_range() return value
> - Make LINK_FREQ readonly to avoid additional churn in s_ctrl
> - Fix trivial early return in s_ctrl
> - Use exposure's default value when modifying the controls' limits
> - Change the exposure default to 0x70 to match the register default value
>
> v2:
> - I have dropped the most controverse part that allows to change the link
>   frequency to obtain 60FPS. It can be eventually be applied on top.
> - Use register 0x3028 to control analog gain not to overwrite the global digital
>   gain.
> - Fix the HBLANK/VBLANK max by using the values read from on-chip registers.
> - Fix handling of LINK_FREQ in s_cltr (but do not make the control read only).
> - Fix errors reported by 0-days:
>   - use do_div() for 64-bit division
>   - declare variables in function scope and not in case scope in s_ctrl
>
> Jacopo Mondi (10):
>   media: ar0521: Implement enum_frame_sizes
>   media: ar0521: Add V4L2_CID_ANALOG_GAIN
>   media: ar0521: Set maximum resolution to 2592x1944
>   media: ar0521: Rework PLL computation
>   media: ar0521: Refuse unsupported controls
>   media: ar0521: Add LINK_FREQ control
>   media: ar0521: Adjust exposure and blankings limits
>   media: ar0521: Setup controls at s_stream time
>   media: ar0521: Rework startup sequence
>   media: ar0521: Tab-align definitions
>
>  drivers/media/i2c/ar0521.c | 352 ++++++++++++++++++++++++++-----------
>  1 file changed, 250 insertions(+), 102 deletions(-)
>
> --
> 2.38.1
>
