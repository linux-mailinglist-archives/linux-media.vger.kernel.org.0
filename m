Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957516F04F2
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 13:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243736AbjD0LZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 07:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243735AbjD0LZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 07:25:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F6361A7
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 04:25:06 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79B4C9DE;
        Thu, 27 Apr 2023 13:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682594659;
        bh=Gy5kNlQOsGyAv5tyZVPdqGKMk3SHlIeQFClAIiiT9Mk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6FTWI1BmU3P1XD+ONc2ZSicSlCQHYBw2Qi1d+PvtrNjd6gU7W81Opl+QXJ3CTFT1
         29QOb6qab9NaAeWkRQ1xuW1dP+H6sDQKLGvOpxHwO+TN0In+QrsuqAT33GZfAMv+Af
         B8u7nQpMC7nS7j3TqLLtal2y1eBMDoOumK1H8OJs=
Date:   Thu, 27 Apr 2023 13:24:28 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "Guoniu.zhou" <guoniu.zhou@nxp.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com,
        jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH] media: ov5640: fix incorrect frame frate issue for
 defulat VGA
Message-ID: <2t35gvk4cqen5p4d77mnod72sa3rmwflegubprph5mwfvrteti@uaudytaf4rw6>
References: <20230423021458.1138760-1-guoniu.zhou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230423021458.1138760-1-guoniu.zhou@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu

On Sun, Apr 23, 2023 at 10:14:58AM +0800, Guoniu.zhou wrote:
> If runn OV5640 with 640x480@30 default setting after power up,
> the real frame rate for it is 60, not 30. The reason is default
> frame interval parameter initialized in probe is 30 but default
> link frequency is to generate 60 frame rate, so correct it.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

The frame_interval calls are only used for parallel mode and are
ignored in CSI-2 mode. This means that the frame rate has to be
controlled by adjusting blankings (and possibly LINK_FREQ which this
driver registers in read-only mode though).

I recall the choice of that DEFAULT_LINK_FREQ was the one that allowed
to obtain the highest frame rates, hence I think it's right to chose
it by default.

Maybe this comment, that reports @30, is misleading
         *
	 * default init sequence initialize sensor to
	 * YUV422 UYVY VGA@30fps
	 *

> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 1536649b9e90..80e1a2858abd 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -179,7 +179,7 @@ static const s64 ov5640_csi2_link_freqs[] = {
>  };
>
>  /* Link freq for default mode: UYVY 16 bpp, 2 data lanes. */
> -#define OV5640_DEFAULT_LINK_FREQ	13
> +#define OV5640_DEFAULT_LINK_FREQ	19
>
>  enum ov5640_format_mux {
>  	OV5640_FMT_MUX_YUV422 = 0,
> --
> 2.37.1
>
