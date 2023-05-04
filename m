Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7286F70BB
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 19:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjEDRS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 13:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjEDRSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 13:18:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0094246B0
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 10:18:18 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4eff50911bfso900079e87.2
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683220697; x=1685812697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydyx1GdsGCwv5KCUKCfbJnd97Kzneu6w6rXsPTn81eI=;
        b=iyCx7DxjVrprI1HjHon8qcUNj/3kNRBnJZi32NW8/58NlhrpZVPdElQR+foWPWluSn
         NYQl5rz8gmDzEfMRF21I9RPRHwDA1sHb03qxdgpVG8/gI5iO24XTvtDw5HeSyVXCWzd2
         Hr7t0jDxC4PhY5q1h4ZHwRWzxKnSTSnOhzyG2sgOdsGRihj9fNynBrB5zL6xZB2JsFYc
         Bram+l9udSKDtDh01jc5bGFoPrUiRUtF/VpNaJkO+PO4eUFw7Miy1+0Wmy3n8e9m0Cds
         QQ+aSqEhULKDAwxjPybMkFnDU+Y78tQKhvyuZ6I8g+H1gJdsJxDgMa+cFI580x36gVKY
         Hcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220697; x=1685812697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydyx1GdsGCwv5KCUKCfbJnd97Kzneu6w6rXsPTn81eI=;
        b=YPvg2RB4pnBLfESmtmTR0XPqvpQS5psyBEA4Pb/Qu1KT2ML9RvwcAciiIBDzTXOU1B
         pY2DVTsqML5oVV4S1uzGJ6vdGOPavAkCIRzlGRm940O5QInLa6FXHGwmBuf9eED3Ph6S
         pjF8wTzAuR7dgNsM8ShqSKDBnLx4in0NeBd4tXixPx+7MBsdcOC5LGX1psVfMYQ75fu7
         Up0rfGw8NTbI5mIC9VZQkCX8/hW/5yC0Mh6TxmLjIbGb9+SJWS647Y4X+MiFX+Kb2QG/
         RR0yVw4MFkQ3fa8+yISF55oFGoYeOaR5W4HiWSOsJkmkrRNQKg99MjqnuqwThcPqfCmf
         /Lzw==
X-Gm-Message-State: AC+VfDzP+D+RnG9YKeC8xLgBc2dbD9CLX1clkurtwmOKZ8NULOuoB18y
        Lv+n5J2+2IpPiIUdf2D3HRImeKLzwYt6NoI0RfY=
X-Google-Smtp-Source: ACHHUZ5ssfT50ILMzEsxKpgixIlrOqcvEuA6cBO3L/j3snk5NZs8da2dQHx460ta/wwMMzdpGye1nw==
X-Received: by 2002:ac2:51db:0:b0:4ec:9f24:3e5c with SMTP id u27-20020ac251db000000b004ec9f243e5cmr2044378lfm.2.1683220697209;
        Thu, 04 May 2023 10:18:17 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c17-20020ac24151000000b004cb43eb09dfsm6612921lfi.123.2023.05.04.10.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 10:18:16 -0700 (PDT)
Message-ID: <0e0f3d0f-5d9a-12d0-3859-32cdb464d5e6@linaro.org>
Date:   Thu, 4 May 2023 19:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] venus: add support for V4L2_PIX_FMT_P010 color format
Content-Language: en-US
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1683196599-3730-1-git-send-email-quic_dikshita@quicinc.com>
 <1683196599-3730-2-git-send-email-quic_dikshita@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1683196599-3730-2-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4.05.2023 12:36, Dikshita Agarwal wrote:
> add V4L2_PIX_FMT_P010 as supported color format for decoder.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/media/platform/qcom/venus/helpers.c | 2 ++
>  drivers/media/platform/qcom/venus/vdec.c    | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index ab6a29f..5946def 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -612,6 +612,8 @@ static u32 to_hfi_raw_fmt(u32 v4l2_fmt)
>  		return HFI_COLOR_FORMAT_NV12_UBWC;
>  	case V4L2_PIX_FMT_QC10C:
>  		return HFI_COLOR_FORMAT_YUV420_TP10_UBWC;
> +	case V4L2_PIX_FMT_P010:
> +		return HFI_COLOR_FORMAT_P010;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4ceaba3..687d62e 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -43,6 +43,10 @@ static const struct venus_format vdec_formats[] = {
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>  	}, {
> +		.pixfmt = V4L2_PIX_FMT_P010,
> +		.num_planes = 1,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	}, {
>  		.pixfmt = V4L2_PIX_FMT_MPEG4,
>  		.num_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
