Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F5D6F70C4
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 19:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEDRVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 13:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjEDRU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 13:20:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774C0E77
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 10:20:58 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f13bfe257aso893356e87.3
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683220857; x=1685812857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x03inJk1u8Dl+C485ZgejmLGtZM16EKxZlLJMRQD5GU=;
        b=CI0xsUrSJoPZc3hn8va7m74kLj9rg4kPxmQ2T1/R068MJp5jW7mBh1Pcox80Uuf7B0
         Q3Gbvi8g8KBRtJcqNzvdrg3aMMfdsVinB7BvmCIpUN1coOQnGsPPpo3fSSnGPTgN049X
         h2HJZnYfUVjNz1qBnbciaG59E7P6UEsvBdFvd9MocP+XJmek9XdZWZp46gpPcmLqrknQ
         Yr9RRdTU6LvcA6J3aztC9CgYtnQThTNbivXAnrv6zJtCb93ckSpOgkHzGqW3axD5I7sT
         Kdqaz3BS06CYmvqURLZlutmRWo1lo0vKRg40JqAC5NbmxUQiEX0D7Ol8No6LOdBxO42E
         UKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220857; x=1685812857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x03inJk1u8Dl+C485ZgejmLGtZM16EKxZlLJMRQD5GU=;
        b=fCwvP3hFOYKLwCkHFRRxnhWf6OjtB+ZQu9Elu8Jj8OdZbR1q0yiQj0EUyIDfDc9h7q
         vA3OgcZElTAySiySej1VGJj+SJpTcazEHbQ4mGYDWxXK0ES8yvLtgRyweITjrrFlg6zP
         DOEThzQ3YCknEPIF9E7i94mivMuCTVVGL7g7df7nvsxqaatEMWAnMVj4DG/irkxioF1b
         rqTMGLqBkUi0+QHrNDrotibmeVl8KqyH6do1xvh5TR+c0PUQV1RQ1BeqnZ2poO80+m3D
         l1txQKAntjk/35z2w3WF0bGXLndN5pTMJgI4nvGvah+WGv3XoEg6WX10ZxLrJW5H3nGl
         sytw==
X-Gm-Message-State: AC+VfDxdC43lzQG0bzMJivYbZJ9G+/rXPnXmv+cmrmwe+1acyyLxPoVq
        dP4HB+NpZyuHKit1qc3nudmDQg==
X-Google-Smtp-Source: ACHHUZ4C6t1iYtTRYW+vZQQ/bmsstMMU41QpxPtkhpn1Yrgd4/LIy3h5wflkeRXteZ14Wf2EjtrHUw==
X-Received: by 2002:a05:6512:38b1:b0:4ec:a9c5:f3ae with SMTP id o17-20020a05651238b100b004eca9c5f3aemr1879977lft.11.1683220856716;
        Thu, 04 May 2023 10:20:56 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id i20-20020ac25234000000b004eb07f5cde6sm6591133lfl.297.2023.05.04.10.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 10:20:56 -0700 (PDT)
Message-ID: <02f5d449-a64b-8f5e-6b72-2fdf8d9bafbe@linaro.org>
Date:   Thu, 4 May 2023 19:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] venus: return P010 as preferred format for 10 bit
 decode
Content-Language: en-US
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1683196599-3730-1-git-send-email-quic_dikshita@quicinc.com>
 <1683196599-3730-5-git-send-email-quic_dikshita@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1683196599-3730-5-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4.05.2023 12:36, Dikshita Agarwal wrote:
> If bit depth is detected as 10 bit by firmware, return
> P010 as preferred decoder format to the client.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 69f7f6e..ed11dc2 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1468,8 +1468,13 @@ static void vdec_event_change(struct venus_inst *inst,
>  	inst->out_width = ev_data->width;
>  	inst->out_height = ev_data->height;
>  
> -	if (inst->bit_depth != ev_data->bit_depth)
> +	if (inst->bit_depth != ev_data->bit_depth) {
>  		inst->bit_depth = ev_data->bit_depth;
> +		if (inst->bit_depth == VIDC_BITDEPTH_10)
> +			inst->fmt_cap = &vdec_formats[3];
> +		else
> +			inst->fmt_cap = &vdec_formats[0];
This doesn't scale and is very error-prone, please enumerate the
entries and assign it using the enumerator, like:

enum {
	VDEC_FORMAT_FOO,
	...
};

... vdec_formats[] = {
	[VDEC_FORMAT_FOO] = { foo, bar, baz }
}

Konrad
> +	}
>  
>  	if (inst->pic_struct != ev_data->pic_struct)
>  		inst->pic_struct = ev_data->pic_struct;
