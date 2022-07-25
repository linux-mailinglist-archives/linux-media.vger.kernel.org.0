Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFD757FDC9
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 12:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbiGYKoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 06:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbiGYKoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 06:44:54 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE2917AA6
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 03:44:53 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso9095330wma.2
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=xKXFAf4c9v+k9ArNNajG5E/xEEKSiRqeDdam13vRI9A=;
        b=i22cr8XmRvTtLJCG1NkUoabnEsvc8u1IyyUu34mglKJPEuyco5joLVNdAY++JWNZqV
         cW9UKDWPYJwvxz7ulbxfr3fKTjvi6xk0OCf1DNJvoMe6z5InMzRNWqTBQplZJyWYA9kO
         YEXUHJtydL2As3kono1KP8Rv4mFZZty86dGSGWWLrz8MTuRMgGhZqkqkQreiJzJJMBDX
         2s4GqIHgYKiKELfVoDv6cDxqfU5tZSeUprABqnNZmu3GqAQpFksgitKFcdi6L+UpJbFM
         nGlMo3zw2JI8AqfWUtgwgGMsK1QEe9iueRllqugIVzPtMXELlAPkAbpjufuB+KqCX94l
         PYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xKXFAf4c9v+k9ArNNajG5E/xEEKSiRqeDdam13vRI9A=;
        b=7EV2mCdDg1g1vUL6r1mGF4yh7g/iu7dsCFRpGPeoyKrtorsaCePcwesHPGchSBtQj7
         bhdREIAjkKZNp+wxIpeb8mcq/CXdrO3PUhaHrt9UWdSIXQ58x1ii9xQeTVZ2Arv+svT7
         02ffXbmmcGpmhQfr3KIWXqClWQfDRrP+Kj1LqWADMc0pMzoFnZMHniD+7bhAdlsNY9Wn
         tE+XECuxL83ERRFUhH4zN3FmoOWu9HsgeE1og0MaWj0Fqg+qBtDtfbv7U64qA19VaFrv
         AUg3yIBjrlENDQjhO3R2y/YAniyIh13yyjl7DAgTlUYmDotuOB//7x1uukom/t4nlAHr
         v2ow==
X-Gm-Message-State: AJIora/J4bp0njtuIvDjiYy5hpfoc4y2alkwB02InYdsP8BdA0+XQo7B
        aSzKZMJ7viH5F1Bk2meQm7F6Zg==
X-Google-Smtp-Source: AGRyM1tKle2Lh7fmY4CxUlvCsJdaOzo/G09gg+M8pPJrAUehy+s+dsMBqwgf6lHo1V6k/V2aGkzmiA==
X-Received: by 2002:a7b:cbd1:0:b0:3a3:187a:296c with SMTP id n17-20020a7bcbd1000000b003a3187a296cmr20620711wmi.123.1658745891767;
        Mon, 25 Jul 2022 03:44:51 -0700 (PDT)
Received: from [192.168.1.6] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id f8-20020a05600c154800b00397402ae674sm19739248wmg.11.2022.07.25.03.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 03:44:51 -0700 (PDT)
Message-ID: <6956a209-5ca6-cab2-b72c-df9211bbf7f0@linaro.org>
Date:   Mon, 25 Jul 2022 13:44:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/7] venus : Addition of EOS Event support for Encoder
Content-Language: en-US
To:     Viswanath Boma <quic_vboma@quicinc.com>,
        video.upstream.external@qti.qualcomm.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220712122347.6781-1-quic_vboma@quicinc.com>
 <20220712122347.6781-4-quic_vboma@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220712122347.6781-4-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/12/22 15:23, Viswanath Boma wrote:
>  V4l2 encoder compliance expecting End of sream  Event registration  support for Encoder.

Start sentence from the begging of the line.

> 
> Change-Id: I85f7732a2ec08eba47c0d37181f739e90a7ab63a

No Change-Ids

> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

With the comments addressed:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index b56960d7f6c89..30ddb84c24997 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -507,6 +507,20 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int venc_subscribe_event(struct v4l2_fh *fh,
> +				const struct v4l2_event_subscription *sub)
> +{
> +
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 2, NULL);
> +	case V4L2_EVENT_CTRL:
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int
>  venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
>  {
> @@ -572,7 +586,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>  	.vidioc_g_parm = venc_g_parm,
>  	.vidioc_enum_framesizes = venc_enum_framesizes,
>  	.vidioc_enum_frameintervals = venc_enum_frameintervals,
> -	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_subscribe_event = venc_subscribe_event,
>  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>  	.vidioc_encoder_cmd = venc_encoder_cmd,
>  };

-- 
regards,
Stan
