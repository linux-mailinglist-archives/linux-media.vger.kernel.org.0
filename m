Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9930304CBB
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbhAZWyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393648AbhAZR4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 12:56:18 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E996CC0613D6
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 09:55:20 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d7so9320699otf.3
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XGAjO5821oAC4sZ/aNcJd6Xn2ku1+7SJ4hQLP1hvvRE=;
        b=yfVnHEUQBrqGxhoAQNdyY1lVpm+snRKy2tWnh1rshRJyJSTzdiqFCvb5hT9Rmd3PRo
         qSEU6qUL4mR7uF/6sgCrTwdhpYiZiHGA4e0FAcXb1rrww8K7o52FWxgwnsNf3iFXY1pU
         CreOHz7+g6M6/TqC9EYe6WaG3x5iD7IqEABTdmZxnYlb7jJ5z3KtnACMOuD0ulIfvD89
         aTu97VnbhrUq5JjXYZYGnC1suLgRma5ovj79MHrUvDAVADpIXTO06By0H3ARBgWmmNIK
         UiddeY7pHGxhFfyUlV+PeFlt7i7gsilw9XS5145HUT4W2iF6NznXsDR4+BCpPDZBo5Jn
         sbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XGAjO5821oAC4sZ/aNcJd6Xn2ku1+7SJ4hQLP1hvvRE=;
        b=U+ErpEG0xgFi8mh2F1j62LNZBNONRU0thrBZtkzxE0vg/PvvPyNGNelSe5dKilUihu
         WhUyjw5XxIWKmxhjGzUNsU+6BqvvBV8AmbXHRMqFvYTDUA/+zOz6rilkCYjd75PSdE0Y
         pk0xO0pP5kRZE/4IasIKThhOV0aHwsY5+yQ4V1EQIvK+SdcdanA4/M20pNr0BFQXO2WX
         AJTf47AV8Snz9L9icrO8rQuzBxAHQXz0fSSlHiwAubJVy+HtItRldeQHgjdl856xOE+N
         ycFGYabv0e1sBN7hW3FUojW+V3euFqPkUnMCt4RNBzBKRoXiHX5hjFRbEmtg+Lew3Awo
         zaGw==
X-Gm-Message-State: AOAM532ObBJRUwuS5uosy6GYEtc4U8cQUPbO11Gt9IEyBKMiPrsu5PLQ
        kWsf8tfzmYEnKU0oFpnf4ue9ow==
X-Google-Smtp-Source: ABdhPJwyia7RwuXu5YDkR6LgWeDZe3TrJHJ4bD5QrpvO79ywTLjxu+FQWu8iMPpOncrD0LLohM1Kuw==
X-Received: by 2002:a9d:7514:: with SMTP id r20mr4729246otk.318.1611683720201;
        Tue, 26 Jan 2021 09:55:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm2042299oid.51.2021.01.26.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 09:55:19 -0800 (PST)
Date:   Tue, 26 Jan 2021 11:55:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH] venus: core: Parse firmware-name DT property
Message-ID: <YBBXhfFQNaqFz8tV@builder.lan>
References: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 26 Jan 02:42 CST 2021, Stanimir Varbanov wrote:

> On production devices the firmware could be located on different
> places, this path could be provided by special firmware-name DT
> property.
> 
> Here we check for existence of such DT property and if it exist
> take the firmware path from there. Otherwise, if the property
> is missing we fallback to the predefined path from driver resource
> structure.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But firmware-name is not mentioned in the dt binding.

Regards,
Bjorn

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index d03e2dd5808c..56c8fb5a019b 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -187,6 +187,7 @@ int venus_boot(struct venus_core *core)
>  {
>  	struct device *dev = core->dev;
>  	const struct venus_resources *res = core->res;
> +	const char *fwpath = NULL;
>  	phys_addr_t mem_phys;
>  	size_t mem_size;
>  	int ret;
> @@ -195,7 +196,12 @@ int venus_boot(struct venus_core *core)
>  	    (core->use_tz && !qcom_scm_is_available()))
>  		return -EPROBE_DEFER;
>  
> -	ret = venus_load_fw(core, core->res->fwname, &mem_phys, &mem_size);
> +	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> +					    &fwpath);
> +	if (ret)
> +		fwpath = core->res->fwname;
> +
> +	ret = venus_load_fw(core, fwpath, &mem_phys, &mem_size);
>  	if (ret) {
>  		dev_err(dev, "fail to load video firmware\n");
>  		return -EINVAL;
> -- 
> 2.25.1
> 
