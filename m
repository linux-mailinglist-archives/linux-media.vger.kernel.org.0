Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5B54B6A73
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 12:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236996AbiBOLNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 06:13:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236987AbiBOLNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 06:13:50 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2887C108181;
        Tue, 15 Feb 2022 03:13:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A03BB60004;
        Tue, 15 Feb 2022 11:13:34 +0000 (UTC)
Date:   Tue, 15 Feb 2022 12:14:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 6/8] media: v4l2-mediabus: Drop legacy
 V4L2_MBUS_CSI2_*_LANE flags
Message-ID: <20220215111444.2cnssed2dqupdpce@uno.localdomain>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-7-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 03, 2022 at 06:24:12PM +0200, Laurent Pinchart wrote:
> The V4L2_MBUS_CSI2_*_LANE flags are a legacy API and are unused. Drop
> them.
>

Nice removing these

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/media/v4l2-mediabus.h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 269aaf57ba32..44195ceeccca 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -21,8 +21,6 @@
>   * clear both the V4L2_MBUS_HSYNC_ACTIVE_HIGH and the
>   * V4L2_MBUS_HSYNC_ACTIVE_LOW flag at the same time. Instead either flag
>   * V4L2_MBUS_HSYNC_ACTIVE_HIGH or flag V4L2_MBUS_HSYNC_ACTIVE_LOW shall be set.
> - * The same is true for the V4L2_MBUS_CSI2_1/2/3/4_LANE flags group: only one
> - * of these four bits shall be set.
>   *
>   * TODO: replace the existing V4L2_MBUS_* flags with structures of fields
>   * to avoid conflicting settings.
> @@ -69,11 +67,6 @@
>  #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)
>
>  /* Serial flags */
> -/* CSI-2 D-PHY number of data lanes. */
> -#define V4L2_MBUS_CSI2_1_LANE			BIT(0)
> -#define V4L2_MBUS_CSI2_2_LANE			BIT(1)
> -#define V4L2_MBUS_CSI2_3_LANE			BIT(2)
> -#define V4L2_MBUS_CSI2_4_LANE			BIT(3)
>  /* CSI-2 Virtual Channel identifiers. */
>  #define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
>  #define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
> @@ -83,10 +76,6 @@
>  #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
>  #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
>
> -#define V4L2_MBUS_CSI2_LANES		(V4L2_MBUS_CSI2_1_LANE | \
> -					 V4L2_MBUS_CSI2_2_LANE | \
> -					 V4L2_MBUS_CSI2_3_LANE | \
> -					 V4L2_MBUS_CSI2_4_LANE)
>  #define V4L2_MBUS_CSI2_CHANNELS		(V4L2_MBUS_CSI2_CHANNEL_0 | \
>  					 V4L2_MBUS_CSI2_CHANNEL_1 | \
>  					 V4L2_MBUS_CSI2_CHANNEL_2 | \
> --
> Regards,
>
> Laurent Pinchart
>
