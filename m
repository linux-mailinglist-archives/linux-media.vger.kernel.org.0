Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771B06385CC
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 10:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiKYJC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 04:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiKYJCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 04:02:23 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5613B1D327
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:02:22 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F42124000D;
        Fri, 25 Nov 2022 09:02:16 +0000 (UTC)
Date:   Fri, 25 Nov 2022 10:02:16 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     "Guoniu.zhou" <guoniu.zhou@nxp.com>
Cc:     linux-media@vger.kernel.org, slongerbeam@gmail.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hugues.fruchet@st.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] media: ov5640: set correct default link frequency
Message-ID: <20221125090216.ailzadkbnziywzhd@uno.localdomain>
References: <20221125084832.2857820-1-guoniu.zhou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125084832.2857820-1-guoniu.zhou@nxp.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello again

On Fri, Nov 25, 2022 at 04:48:32PM +0800, Guoniu.zhou wrote:
> current_link_freq field in ov5640_dev structure is link frequency,
> not link frequency array index, so correct it.
>
> Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")
>

The empty line might be dropped when applying the patch ?

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Please retain the tags you receive in the next version you send.

Re-adding it here:
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
> v2:
>   - Correct typo issue(s/structrue/structure)
> ---
>  drivers/media/i2c/ov5640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2d740397a5d4..3f6d715efa82 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3817,7 +3817,8 @@ static int ov5640_probe(struct i2c_client *client)
>  	sensor->current_mode =
>  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
>  	sensor->last_mode = sensor->current_mode;
> -	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
> +	sensor->current_link_freq =
> +		ov5640_csi2_link_freqs[OV5640_DEFAULT_LINK_FREQ];
>
>  	sensor->ae_target = 52;
>
> --
> 2.37.1
>
