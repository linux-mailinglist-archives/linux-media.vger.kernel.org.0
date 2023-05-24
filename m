Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474F670F6AD
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbjEXMkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjEXMkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:40:14 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA49139
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:40:12 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d4e4598f0so883751b3a.2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684932012; x=1687524012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pAICOAZEYoF1OGimsbond0ssy6jgdLXoNKu17c1NoEc=;
        b=lTxyiuW0gLBBlcU4qmcwsM+I+d/g8+KFnHiX/wCsZWTANny8fP8yMnSsJCMNIv12GF
         cRiezTtq5AHJLbGpoo2aQWwNFGsqXI4s79dcCb1mI1ORJjz1XjHVBCEeS8LzYCrXOe++
         dKdg4f+JoPvCsylxkcE54uDuwgqJMv1zpY/HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684932012; x=1687524012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAICOAZEYoF1OGimsbond0ssy6jgdLXoNKu17c1NoEc=;
        b=IOEIFcgPfkfCCEiCItrKhO9huh7jdi8MSXrUzE9jZE91KzJJAMfFj2eW8vrto+KTLf
         1uBl3h/hl/GaegdRvBuaER+AkNvXgLpCS8Y1NlNgTEbI6PlVfmWT3z6woz6oY3gtzZlk
         G9/J+4PF2zRFISSn1BtxSVMyiZJsQiK9UUPFhKXpnwk/qnf8PCV3rRAYiLgwc31S6H0A
         VTRCCKZAR6cl3LXMzMdXRO6Ho3rq11yKK/woADaD5ZgjIQAeqOPKzSKP5MF1Q0d38qkx
         /tOfJZKKtF+fDRQwHvdAvRKNYTOoPBGei0ZBLD7Ev+XaAkmTOx9FR+0UjrktvPT4/oJ1
         1dJQ==
X-Gm-Message-State: AC+VfDxYWSdxAoptryWgYu/s9pX6+02ECLII8wyAciNGk4bw4a/+K89g
        x0u2XiEyl+FsCGXxowGFSPGU1A==
X-Google-Smtp-Source: ACHHUZ6uv1bkmZJ8LT4YhMG1Xk4RvMoWtOrdpYDPKJVhU3Sqbvnsu/TpuVYGjHEtn1sWPlXdePesbQ==
X-Received: by 2002:a05:6a00:1a15:b0:64d:f5a:3fd2 with SMTP id g21-20020a056a001a1500b0064d0f5a3fd2mr2716289pfv.28.1684932012198;
        Wed, 24 May 2023 05:40:12 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id c15-20020a62e80f000000b0063b8ddf77f7sm7295020pfi.211.2023.05.24.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 05:40:11 -0700 (PDT)
Date:   Wed, 24 May 2023 21:40:07 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: venus: provide video device lock
Message-ID: <20230524124007.GA30543@google.com>
References: <20230524013732.2503561-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524013732.2503561-1-senozhatsky@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/05/24 10:36), Sergey Senozhatsky wrote:
> Video device has to provide ->lock so that __video_do_ioctl()
> can serialize IOCTL calls.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 1 +
>  drivers/media/platform/qcom/venus/venc.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51a53bf82bd3..90b359074c35 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1767,6 +1767,7 @@ static int vdec_probe(struct platform_device *pdev)
>  	vdev->vfl_dir = VFL_DIR_M2M;
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->lock;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4666f42feea3..e6b63ff5bc0e 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1565,6 +1565,7 @@ static int venc_probe(struct platform_device *pdev)
>  	vdev->vfl_dir = VFL_DIR_M2M;
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->lock;

Or should it use a dedicated mutex to serialize video_do_ioctl()?
