Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972DD2AFDF0
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgKLFc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbgKLFLr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 00:11:47 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DA9C0613D1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:11:46 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id m13so3169596pgl.7
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GO7qUrL6FQeZieIqc4nnjVzdihrDHwBzswmjlHWxO28=;
        b=Yeymv4HNPx2j+bVUZceeoVmgo2wmSTe/nktJTTeYIgnXwUaU21d+bLJ4etEsQ2n8f/
         76+14NEpIKANUhSOiCo27BwVaZBx8FAV++1vRTbJ9AERY87uDj1NnSbI+PvoluysclQn
         rJcMItzMoxfN78v7OXuIYRM95+hMAaCijBXLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GO7qUrL6FQeZieIqc4nnjVzdihrDHwBzswmjlHWxO28=;
        b=g2AhBh4hV0kKX3L5WSOl4KENxa7MhLxxsOk4E1NQY1IKMAiQNZD5w77ZRiqSbw69TW
         8CBQu7MUM8BtQranaIC5+HGKuDg6iSylJNMIV9Ydbc3qOTPP/NkjyRczj8jTX5QxEbZD
         LevSPjrajlLKE6DPSHIx+wPJrZtWN7hKH7ZteMeLgp82l6qmsvjz+bjic5jGSKx7Jviw
         2v2ij+otbIQ1d9XazQXGnaR2UoahX96bTnmP1dpnAPIIisw/w8IYO+yqjRgSU2R+fN5G
         J9cOr1Hp9cc8rnrXc+MoFgGRND6ybAZ2zMlmKnRJTFTU/kp8NjUs1Pyg5ISERTw+D/ay
         HG+Q==
X-Gm-Message-State: AOAM531u0ySrJ7/KU0SsiTGKBZjYg+HVu+0yFYqvHa9tS5udXWRqH75Z
        zZkPMbxfXJrH4EndzRS+MN4uhGigDKOpQ/Hu
X-Google-Smtp-Source: ABdhPJxflJg6gn+IRLhpijnQ8H4XWsPjuz7biGAK1xp9kzEX7a9sxoS6ckVDEhmlaCJpwoVGvvYLXQ==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr24564285pgh.441.1605157906349;
        Wed, 11 Nov 2020 21:11:46 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
        by smtp.gmail.com with ESMTPSA id o132sm4464395pfg.100.2020.11.11.21.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 21:11:45 -0800 (PST)
Date:   Thu, 12 Nov 2020 14:11:42 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: Re: [PATCH v3 2/2] media: ov2740: allow OTP data access during
 streaming
Message-ID: <20201112051142.GB2685362@chromium.org>
References: <1605076797-31058-1-git-send-email-bingbu.cao@intel.com>
 <1605076797-31058-2-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605076797-31058-2-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 11, 2020 at 02:39:57PM +0800, Bingbu Cao wrote:
> OTP data access of ov2740 need enable the streaming mode to load
> and it could be done in any time, so driver need allow the OTP
> data access during streaming instead of return EBUSY, this patch
> try to read the OTP data out in STREAMON if OTP data is not ready
> before first time streaming start.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 189 +++++++++++++++++++++++----------------------
>  1 file changed, 96 insertions(+), 93 deletions(-)
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 41c17df46f47..d723e0e7adf7 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -598,13 +598,109 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
>  	fmt->field = V4L2_FIELD_NONE;
>  }
>  
> +static int ov2740_load_otp_data(struct nvm_data *nvm)
> +{
> +	struct i2c_client *client = nvm->client;
> +	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
> +	u32 isp_ctrl00 = 0;
> +	u32 isp_ctrl01 = 0;
> +	int ret;
> +
> +	if (!nvm)
> +		return -EINVAL;
> +
> +	if (nvm->nvm_buffer)
> +		return 0;
> +
> +	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
> +	if (!nvm->nvm_buffer)
> +		return -ENOMEM;
> +
> +	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read ISP CTRL00\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read ISP CTRL01\n");
> +		goto err;
> +	}
> +
> +	/* Clear bit 5 of ISP CTRL00 */
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
> +			       isp_ctrl00 & ~BIT(5));
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> +		goto err;
> +	}
> +
> +	/* Clear bit 7 of ISP CTRL01 */
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
> +			       isp_ctrl01 & ~BIT(7));
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> +			       OV2740_MODE_STREAMING);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set streaming mode\n");
> +		goto err;
> +	}
> +
> +	/*
> +	 * Users are not allowed to access OTP-related registers and memory
> +	 * during the 20 ms period after streaming starts (0x100 = 0x01).
> +	 */
> +	msleep(20);
> +
> +	ret = regmap_bulk_read(nvm->regmap, OV2740_REG_OTP_CUSTOMER,
> +			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> +			       OV2740_MODE_STANDBY);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set streaming mode\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	kfree(nvm->nvm_buffer);
> +	nvm->nvm_buffer = NULL;
> +
> +	return ret;
> +}
> +
>  static int ov2740_start_streaming(struct ov2740 *ov2740)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> +	struct nvm_data *nvm = ov2740->nvm;
>  	const struct ov2740_reg_list *reg_list;
>  	int link_freq_index;
>  	int ret = 0;
>  
> +	ov2740_load_otp_data(nvm);
> +
>  	link_freq_index = ov2740->cur_mode->link_freq_index;
>  	reg_list = &link_freq_configs[link_freq_index].reg_list;
>  	ret = ov2740_write_reg_list(ov2740, reg_list);
> @@ -934,99 +1030,6 @@ static int ov2740_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ov2740_load_otp_data(struct nvm_data *nvm)
> -{
> -	struct i2c_client *client = nvm->client;
> -	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
> -	u32 isp_ctrl00 = 0;
> -	u32 isp_ctrl01 = 0;
> -	int ret;
> -
> -	if (!nvm)
> -		return -EINVAL;
> -
> -	if (nvm->nvm_buffer)
> -		return 0;
> -
> -	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
> -	if (!nvm->nvm_buffer)
> -		return -ENOMEM;
> -
> -	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to read ISP CTRL00\n");
> -		goto err;
> -	}
> -
> -	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to read ISP CTRL01\n");
> -		goto err;
> -	}
> -
> -	/* Clear bit 5 of ISP CTRL00 */
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
> -			       isp_ctrl00 & ~BIT(5));
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> -		goto err;
> -	}
> -
> -	/* Clear bit 7 of ISP CTRL01 */
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
> -			       isp_ctrl01 & ~BIT(7));
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> -		goto err;
> -	}
> -
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> -			       OV2740_MODE_STREAMING);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set streaming mode\n");
> -		goto err;
> -	}
> -
> -	/*
> -	 * Users are not allowed to access OTP-related registers and memory
> -	 * during the 20 ms period after streaming starts (0x100 = 0x01).
> -	 */
> -	msleep(20);
> -
> -	ret = regmap_bulk_read(nvm->regmap, OV2740_REG_OTP_CUSTOMER,
> -			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
> -		goto err;
> -	}
> -
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> -			       OV2740_MODE_STANDBY);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set streaming mode\n");
> -		goto err;
> -	}
> -
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> -		goto err;
> -	}
> -
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> -		goto err;
> -	}
> -
> -	return 0;
> -err:
> -	kfree(nvm->nvm_buffer);
> -	nvm->nvm_buffer = NULL;
> -
> -	return ret;
> -}
> -
>  static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
>  			     size_t count)
>  {
> -- 
> 2.7.4
> 
