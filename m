Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEFB223A03
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGQLGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgGQLGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:06:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FE1C061755;
        Fri, 17 Jul 2020 04:06:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so6494931pgm.11;
        Fri, 17 Jul 2020 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pIU64qNeE5TkzjidaYNlQMgxau3P4vIC44mqiAXffro=;
        b=qYw5H8FYj6M5wuRH75dVIudPJl9zabt8zqunDSoDH4yxosCBOa60mdAAYoe8S8A8KX
         wYHt8LUaMpOjG1MxoPi3Ufwl2swerzKtXQQ/4JVOi0QjKmxxkuDfECTsZnNKQ0/ztCqr
         bJDkC0TGD7OzGhh5Z9DAusv2KyjSd7Oa/8W1RL65imKJPJoOgostiEpfT0SFCdBFuxHU
         xkfF3JJUvyoTbgCuwxFuVq7re8S2xhMXjT8kmE1FWG5SaKmUGkwWYHICt0mW4Cr5UgQl
         d8MmAkTGsUDLcnMMdYw6SrTlJrAeiudgNDI2GSK49QqKrKI5Ir8WGg97BBSsJ96S7Kpt
         /Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pIU64qNeE5TkzjidaYNlQMgxau3P4vIC44mqiAXffro=;
        b=PG5j/QOSrmm3KS73VTAMuD6/+AD8lf7guv7UiAR3QQBh07tytpIc/7gErC7Hz8TpG/
         ti9/i+ejcdD2O4T0gEauLuQmJoc/XV1i74sCQb26kH17gLBUH1EfrDifoPSeN8zm8uoq
         tK/kuHEApXZtWd0M6rijISdWA69Uh9eqsjN+m1XMaIQ5YBpva/+0UbrAR3GUjoBKZSL8
         i7W5AIIfQ/dF2He22gnEBY9vQ6QAI9XM4pvMbIdWAKTuX2TX0UpwkzkGTLgKh1QbCAVa
         Pl63tfqw04HLZmVqD5diXzNckKV0Arcf0/by/N4MwCUEV9SQhizYZtQrb3HP6dpdgpkc
         tyhg==
X-Gm-Message-State: AOAM530vq9z9mvzcHV4uJviOio+LYaywODBehZiJKTY7YWWmQ4L30dIV
        TYeEDLU1jf1BN32UiUqsfwxRdqgY
X-Google-Smtp-Source: ABdhPJy6Ri71FOCCjxiR2MFQ5bNAB7ro4DxC69A9kkkW9opRuhqyjJ2ZStLPHXv583vz9GGcUSvlIQ==
X-Received: by 2002:a63:d446:: with SMTP id i6mr7830931pgj.438.1594983973118;
        Fri, 17 Jul 2020 04:06:13 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id 137sm7682174pgg.72.2020.07.17.04.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 04:06:11 -0700 (PDT)
Date:   Fri, 17 Jul 2020 20:06:10 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com, srinivas.kandagatla@linaro.org,
        tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ov2740: add NVMEM interface to read customized
 OTP data
Message-ID: <20200717110610.GA3297952@google.com>
References: <1591954922-14006-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591954922-14006-1-git-send-email-bingbu.cao@intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/12 17:42), Bingbu Cao wrote:
>  
> +static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
> +			     size_t count)
> +{
> +	struct nvm_data *nvm = priv;
> +
> +	memcpy(val, nvm->nvm_buffer + off, count);
> +
> +	return 0;
> +}
> +
> +static int ov2740_register_nvmem(struct i2c_client *client)
> +{
> +	struct nvm_data *nvm;
> +	struct regmap_config regmap_config = { };
> +	struct nvmem_config nvmem_config = { };
> +	struct regmap *regmap;
> +	struct device *dev = &client->dev;
> +	int ret = 0;
> +
> +	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
> +	if (!nvm)
> +		return -ENOMEM;
> +
> +	regmap_config.val_bits = 8;
> +	regmap_config.reg_bits = 16;
> +	regmap_config.disable_locking = true;
> +	regmap = devm_regmap_init_i2c(client, &regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	nvm->regmap = regmap;
> +
> +	nvmem_config.name = dev_name(dev);
> +	nvmem_config.dev = dev;
> +	nvmem_config.read_only = true;
> +	nvmem_config.root_only = true;
> +	nvmem_config.owner = THIS_MODULE;
> +	nvmem_config.compat = true;
> +	nvmem_config.base_dev = dev;
> +	nvmem_config.reg_read = ov2740_nvmem_read;
> +	nvmem_config.reg_write = NULL;
> +	nvmem_config.priv = nvm;
> +	nvmem_config.stride = 1;
> +	nvmem_config.word_size = 1;
> +	nvmem_config.size = CUSTOMER_USE_OTP_SIZE;
> +
> +	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
> +	if (IS_ERR(nvm->nvmem))
> +		return PTR_ERR(nvm->nvmem);

This registers the NVM device, but the underlying structure is not
completely initialized yet. For instance, the ->num_buffer, which
->reg_read() uses as buffer base address, is still NULL at this point.
I'd be more comfortable if we first fully setup/prepare everything and
only then register the device.

> +
> +	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
> +	if (!nvm->nvm_buffer)
> +		return -ENOMEM;

If this allocation fails, we return the error, which is handler as
dev_err() only, and keep everting as is. So any attempt of ->req_read()
will effectively do

	memcpy(val, NULL + off, count);

> +	ret = ov2740_load_otp_data(client, nvm);
> +	if (ret)
> +		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
> +
> +	return ret;
> +}

If this step fails, the NVM device is still registered and available
and we still can call ->req_read(). Is this correct? Do we need to
have an "error out" path there and unregister the NVM device?

>  static int ov2740_probe(struct i2c_client *client)
>  {
>  	struct ov2740 *ov2740;
> @@ -964,6 +1105,10 @@ static int ov2740_probe(struct i2c_client *client)
>  		goto probe_error_media_entity_cleanup;
>  	}
>  
> +	ret = ov2740_register_nvmem(client);
> +	if (ret)
> +		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
> +

Either this better be a fatal error, or we need to have an error-out
rollback/cleanup in ov2740_register_nvmem().

>  	/*
>  	 * Device is already turned on by i2c-core with ACPI domain PM.
>  	 * Enable runtime PM and turn off the device.

	-ss
