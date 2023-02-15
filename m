Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C14C697C38
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 13:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbjBOMuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 07:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOMuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 07:50:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A621934C10;
        Wed, 15 Feb 2023 04:50:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42CE461B7D;
        Wed, 15 Feb 2023 12:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F394C433D2;
        Wed, 15 Feb 2023 12:49:58 +0000 (UTC)
Message-ID: <b1ede4da-c432-1533-aab9-a73e1a1f0a55@xs4all.nl>
Date:   Wed, 15 Feb 2023 13:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] media: i2c: adv7604: Fix range of hue control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2023 23:56, Laurent Pinchart wrote:
> The ADV7604, ADV7611 and ADV7612 software manuals different the CP_HUE
> value differently:
> 
> - For ADV7604 and ADV7611, the hue is specified as an unsigned 8-bit
>   value, and calculated as
> 
>   (CP_HUE[7:0] * 180) / 256 - 90
> 
>   with the range set to [-90°, 90°]. Additionally, the values 0x00, 0x0f
>   and 0xff are documented as corresponding to -90°, 0° and 90°
>   respectively.
> 
> - For ADV7612, the hue is specified as a signed 8-bit value in the range
>   [0°, 360°[ without any formula. Additionally, the value 0x00 is
>   documented as corresponding to 0°.
> 
> The ADV7604 and ADV7611 documentation is clearly wrong as the example
> values don't correspond to the formula. Furthermore, the [-90°, 90°]
> range seems incorrect as it would cover only half of the hue space.
> 
> The ADV7612 documentation is better, although the range should likely be
> [-180°, 180°[ if the value is signed. Given that the values wrap around,
> this makes no difference in practice.
> 
> The hue values have been verified on ADV7612 to follow the
> documentation. There is a high chance they do as well on ADV7604 and
> ADV7611.
> 
> In any case, all software manuals document the register as 8-bit, so the
> current range of the V4L2 hue control [0, 128] is not correct. Expand it
> to cover the full 8-bit space, using unsigned values to avoid breaking
> any application that may rely on 128 being a valid value.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7604.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 3af0e67f9edb..3d0898c4175e 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -3548,7 +3548,7 @@ static int adv76xx_probe(struct i2c_client *client)
>  	v4l2_ctrl_new_std(hdl, &adv76xx_ctrl_ops,
>  			V4L2_CID_SATURATION, 0, 255, 1, 128);
>  	v4l2_ctrl_new_std(hdl, &adv76xx_ctrl_ops,
> -			V4L2_CID_HUE, 0, 128, 1, 0);
> +			V4L2_CID_HUE, 0, 255, 1, 0);
>  	ctrl = v4l2_ctrl_new_std_menu(hdl, &adv76xx_ctrl_ops,
>  			V4L2_CID_DV_RX_IT_CONTENT_TYPE, V4L2_DV_IT_CONTENT_TYPE_NO_ITC,
>  			0, V4L2_DV_IT_CONTENT_TYPE_NO_ITC);

Tested with the adv7604.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thank you for looking at this!

	Hans
