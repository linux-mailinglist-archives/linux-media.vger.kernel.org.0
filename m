Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524DB5263D2
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345226AbiEMOYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244638AbiEMOYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:24:12 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421A25047F
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:24:11 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D727220005;
        Fri, 13 May 2022 14:24:05 +0000 (UTC)
Date:   Fri, 13 May 2022 16:24:04 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 00/28] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <20220513142404.7obbuidmc42wn3sf@uno.localdomain>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

  I -litterally- just sent a v7 to you and Mauro (and list) to fix the
warning. Feel free to ignore it then

On Fri, May 13, 2022 at 05:15:20PM +0300, Sakari Ailus wrote:
> Hi folks,
>
> Reworked the internals a little so that no compile warnings are produced
> for intermediate patches. In the past we've allowed them but now with
> warnings considered as errors, this is a problem.
>
> The end result is unchanged. Still testing for compilation.
>
> I'm still sending this all to list as several patches got changed:
>
> 	media: ov5640: Associate bpp with formats
> 	media: ov5640: Rework CSI-2 clock tree
> 	media: ov5640: Split DVP and CSI-2 formats

In my v7 I have only moved ov5640_code_to_bpp() from [4/28] to
[6/28] where it is actually used.

Hence the changed patches for me are:

        media: ov5640: Associate bpp with formats       [4/28]
        media: ov5640: Update pixel_rate and link_freq  [6/28]

Are there other warnings to fix which I have missed ?

Thanks
   j

>
> Hugues Fruchet (1):
>   media: ov5640: Adjust vblank with s_frame_interval
>
> Jacopo Mondi (27):
>   media: ov5640: Add pixel rate to modes
>   media: ov5640: Re-arrange modes definition
>   media: ov5640: Add ov5640_is_csi2() function
>   media: ov5640: Associate bpp with formats
>   media: ov5640: Add LINK_FREQ control
>   media: ov5640: Update pixel_rate and link_freq
>   media: ov5640: Rework CSI-2 clock tree
>   media: ov5640: Rework timings programming
>   media: ov5640: Fix 720x480 in RGB888 mode
>   media: ov5640: Split DVP and CSI-2 timings
>   media: ov5640: Provide timings accessor
>   media: ov5640: Re-sort per-mode register tables
>   media: ov5640: Remove duplicated mode settings
>   media: ov5640: Remove ov5640_mode_init_data
>   media: ov5640: Add HBLANK control
>   media: ov5640: Add VBLANK control
>   media: ov5640: Remove frame rate check from find_mode()
>   media: ov5640: Change CSI-2 timings to comply with FPS
>   media: ov5640: Implement init_cfg
>   media: ov5640: Implement get_selection
>   media: ov5640: Register device properties
>   media: ov5640: Add RGB565_1X16 format
>   media: ov5640: Add BGR888 format
>   media: ov5640: Restrict sizes to mbus code
>   media: ov5640: Adjust format to bpp in s_fmt
>   media: ov5640: Split DVP and CSI-2 formats
>   media: ov5640: Move format mux config in format
>
>  drivers/media/i2c/ov5640.c | 1650 ++++++++++++++++++++++++++----------
>  1 file changed, 1188 insertions(+), 462 deletions(-)
>
> --
> 2.30.2
>
