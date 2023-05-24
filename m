Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3198770F8BE
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbjEXO3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 10:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEXO3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 10:29:22 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A4B130
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 07:29:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so609085e9.1
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684938558; x=1687530558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT5z1mA2kOm4EGdcOTdshFYi0CZutnenOwVHYiSx3gk=;
        b=zRDwLlOSHYlY2If03FDmrhtJ84GwA6KFcdxpm8u56lWolhpSTQcT6fMzE/hIw8/LOY
         yKfvw3UEs6bbXM3+bduxVFGAtBY7gdTYLvhsjBfEeh69mYgH58hB2yG/i1QPJkK+3iPt
         oJCRy+MRavUOODVZgIj+9nwVFx+6M1Oapc5Z/eJUTsELFSx/UsvGySKW3aOJeq3ZkD1V
         hhu+D3AgKx2eK47FwzERYS4XUnS5KHq20z0EeMqe55ECc4QA+/jhkT/q+LEC77vclG66
         rWeE/yGWAf5nsLR6yGtr23QhDssifYuEB6nQP4n/2lNtU49sduDkwszX4hpc7JtHn8Xg
         dFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684938558; x=1687530558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT5z1mA2kOm4EGdcOTdshFYi0CZutnenOwVHYiSx3gk=;
        b=ktQsiEFbZZCcoT295Y5/5pBC5sorPmUZXd8UvyHoxhRysuVynrYLjlg2XEpYaCYq5y
         5sJ3hF1GPM13AFVTTaqGZ2KfhsOWbsxAZHDnQl+Hv87c8GByrqnmyu4SV+eW0oEvLomt
         xhBP/MvSmJXgTbNsif0X+rQapnTyHn+RjWLGfckZ9hzYsgqXgBNXiMmetIqIWeAhHPZY
         XeNkbytemRGcMK7/WDRCN+D/7t3ZpjtbpIk3CiRGEZ2rUkRsIJzskgc7xN+a4bBzaAAE
         kTeq4C1WrBhKpacffTzjI0iKoy2fa52fPqhAPQMtWrtqolckg60KRieCuMsiQG/uajsf
         J4mw==
X-Gm-Message-State: AC+VfDw3AaU/gE7NVXI6ujQgDllgt317NX7/08MxAQ6Cvq9Jp5l1RF1j
        RldMWfkZkUGt00qWCZ5Ydc1BUA==
X-Google-Smtp-Source: ACHHUZ6h+NITTapaVVRTKW+74hkwlDusonQIXdEoNDqEl/VWTijFKesVDGYIMerqKsYKcxchJPqyIA==
X-Received: by 2002:a05:600c:290c:b0:3f5:878:c0c2 with SMTP id i12-20020a05600c290c00b003f50878c0c2mr8484wmd.3.1684938558326;
        Wed, 24 May 2023 07:29:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d4dc5000000b002fe13ec49fasm14607444wru.98.2023.05.24.07.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:29:17 -0700 (PDT)
Message-ID: <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
Date:   Wed, 24 May 2023 15:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230524141312.2558810-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2023 15:12, Sergey Senozhatsky wrote:
> Video device has to provide ->lock so that __video_do_ioctl()
> can serialize IOCTL calls. Provided dedicated enc/dec mutex-s
> for that purpose.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/core.h | 4 ++++
>   drivers/media/platform/qcom/venus/vdec.c | 2 ++
>   drivers/media/platform/qcom/venus/venc.c | 2 ++
>   3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 4f81669986ba..b6c9a653a007 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -113,7 +113,9 @@ struct venus_format {
>    * @opp_pmdomain: an OPP power-domain
>    * @resets: an array of reset signals
>    * @vdev_dec:	a reference to video device structure for decoder instances
> + * @vdev_dec_lock: decoder instance video device ioctl lock
>    * @vdev_enc:	a reference to video device structure for encoder instances
> + * @vdev_enc_lock: encoder instance video device ioctl lock
>    * @v4l2_dev:	a holder for v4l2 device structure
>    * @res:		a reference to venus resources structure
>    * @dev:		convenience struct device pointer
> @@ -165,7 +167,9 @@ struct venus_core {
>   	struct device *opp_pmdomain;
>   	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
>   	struct video_device *vdev_dec;
> +	struct mutex vdev_dec_lock;
>   	struct video_device *vdev_enc;
> +	struct mutex vdev_enc_lock;
>   	struct v4l2_device v4l2_dev;
>   	const struct venus_resources *res;
>   	struct device *dev;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51a53bf82bd3..7e9363714bfb 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1760,6 +1760,7 @@ static int vdec_probe(struct platform_device *pdev)
>   	if (!vdev)
>   		return -ENOMEM;
>   
> +	mutex_init(&core->vdev_dec_lock);
>   	strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
>   	vdev->release = video_device_release;
>   	vdev->fops = &vdec_fops;
> @@ -1767,6 +1768,7 @@ static int vdec_probe(struct platform_device *pdev)
>   	vdev->vfl_dir = VFL_DIR_M2M;
>   	vdev->v4l2_dev = &core->v4l2_dev;
>   	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->vdev_dec_lock;
>   
>   	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>   	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4666f42feea3..8522ed339d5d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1558,6 +1558,7 @@ static int venc_probe(struct platform_device *pdev)
>   	if (!vdev)
>   		return -ENOMEM;
>   
> +	mutex_init(&core->vdev_enc_lock);
>   	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
>   	vdev->release = video_device_release;
>   	vdev->fops = &venc_fops;
> @@ -1565,6 +1566,7 @@ static int venc_probe(struct platform_device *pdev)
>   	vdev->vfl_dir = VFL_DIR_M2M;
>   	vdev->v4l2_dev = &core->v4l2_dev;
>   	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->vdev_enc_lock;
>   
>   	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>   	if (ret)

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
