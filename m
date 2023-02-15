Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488E1697C35
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 13:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbjBOMtd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 07:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBOMtc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 07:49:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A01637F21;
        Wed, 15 Feb 2023 04:49:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D45D61B8F;
        Wed, 15 Feb 2023 12:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F824C433EF;
        Wed, 15 Feb 2023 12:49:29 +0000 (UTC)
Message-ID: <e852e9e8-4f62-6529-71a0-066076895b7c@xs4all.nl>
Date:   Wed, 15 Feb 2023 13:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] media: i2c: adv7604: Enable video adjustment
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230210225622.24411-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230210225622.24411-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2023 23:56, Laurent Pinchart wrote:
> The video adjustments (contrast, brightness, saturation and hue) are
> ignored by default by the device when the VID_ADJ_EN bit is clear. The
> corresponding V4L2 controls exposed by the drivers have thus no effect.
> Fix this by setting the VID_ADJ_EN bit.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7604.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 9d218962d7c8..3af0e67f9edb 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -1805,6 +1805,9 @@ static void select_input(struct v4l2_subdev *sd)
>  		v4l2_dbg(2, debug, sd, "%s: Unknown port %d selected\n",
>  				__func__, state->selected_input);
>  	}
> +
> +	/* Enable video adjustment (contrast, saturation, brightness and hue) */
> +	cp_write_clr_set(sd, 0x3e, 0x80, 0x80);
>  }
>  
>  static int adv76xx_s_routing(struct v4l2_subdev *sd,

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
