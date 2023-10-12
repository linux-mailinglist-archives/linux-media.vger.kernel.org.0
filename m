Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A827C69FA
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 11:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235621AbjJLJrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 05:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbjJLJrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 05:47:09 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42657BB
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 02:47:07 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32167a4adaaso704170f8f.1
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697104025; x=1697708825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeXq+sUDC3iybMZQ272ShVYmOdXvv1Ct1/FwJd1aa9o=;
        b=edqsYuxkZLbFD+hkob0yMwXHAQH1QcpASHOLBr+z2wvwZpSr/uIKyiAH2FR9RFo5jw
         LuhECETq7JNP1R338vO0M8pnP0gpBZwaOJZcfUc2fH6O4tvv+ModYFsYY86SIT5LThTU
         ld46b+Uer2B60gzK3gFVdusCbV/l6a1ObMnvNoKzub2Yyhd4MRj+4EPZAP/7nklMVNAV
         BAUtAiYWgfAVr/pSEd8sxqqdGdF2ZiGMsCE5fUtsl+3eDBF7+FeAEhUnntCKQgKmlIne
         74zESbY0VmiDMlzRd8av4gBHin5ZBiLvVA4EmRVE4tzcrTwl1P5k5ummMcdTJ2UJbfU9
         K9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104025; x=1697708825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeXq+sUDC3iybMZQ272ShVYmOdXvv1Ct1/FwJd1aa9o=;
        b=bG4yhxsR3WOHwf5uUUBz1zM/oXdHRsCe16kCWGMdKpG0Bef/vc7INVeOCSUQ6Z1p71
         WDT0BLXNNtEo0ztdGUidCjhEr2cIp59XnIt9z1MYveabOHGUTFJx252KEnH/IBum4fsI
         UGzjkpA0WAMclyr4viEWMJqTC61ADFuYOuF0PVg24Uvc6LP2Hy5mha4EqKPKtRmpK/6F
         Gw6+pI2cbncJr22yGU7wJKoHDVCFLqApCdep7BScNK2zmwQbH1sSYJ79U2KTROKBC8+E
         EQf5tk5Lpu8IyhetMQB4/MIdpfhPT2XFFAXsi9bBtXbBXzIsZyBybU79gU0pRO7Yh2Un
         Qb1Q==
X-Gm-Message-State: AOJu0YwmmXQ61ZlGQyORZoZZH6X6K/d82z+7O8klwdEUQrJNU4NwySUu
        tQID0T6oUvTK8h5deCyNslXcuQ==
X-Google-Smtp-Source: AGHT+IF6r7I9r42k4ezEvRypqI+xNwUcQQhDvwzlcBBRZUMp2y+pZPHzECAyVxIq0q1oNpYu8Z0E/g==
X-Received: by 2002:adf:c805:0:b0:329:6bfa:dc8c with SMTP id d5-20020adfc805000000b003296bfadc8cmr13510782wrh.46.1697104025557;
        Thu, 12 Oct 2023 02:47:05 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id e14-20020adffd0e000000b00315af025098sm18065099wrr.46.2023.10.12.02.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:47:05 -0700 (PDT)
Message-ID: <4fb9f4e8-2b6d-46ae-bf7a-cc21a3ea2366@linaro.org>
Date:   Thu, 12 Oct 2023 10:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: clean up a check
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Robert Foss <rfoss@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2023 10:42, Dan Carpenter wrote:
> Imagine that "->vfe_num" is zero, then the subtraction will underflow to
> UINT_MAX.  Plus it's just cleaner to use >= instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index be9d2f0a10c1..ddfe94377ee5 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -270,7 +270,7 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
>   	unsigned long time;
>   	u32 val;
>   
> -	if (vfe_id > camss->res->vfe_num - 1) {
> +	if (vfe_id >= camss->res->vfe_num) {
>   		dev_err(camss->dev,
>   			"Error: asked reset for invalid VFE%d\n", vfe_id);
>   		return -ENOENT;

 From my @linaro.org address

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
