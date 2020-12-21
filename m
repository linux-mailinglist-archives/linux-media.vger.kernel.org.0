Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031022DFFCB
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgLUSbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgLUSbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:31:38 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E48BC0611C5
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:30:58 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c7so10509468edv.6
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQj+lY9Q9qTAn9h/O1jDrfQPMWDKTY6Q2BZuiHff5Iw=;
        b=M4D2E9qGgwUTj7URXt5FnCh0RdB4oZABXC+0HZNClkcuxBkU9CdQRKlz8YKek9BZHH
         D77YcPivFf1wXHWK2uURuSSYydhawUwSdWYdi7rbl5BWLT7TxAetQVQH9VgKaoJU7GHi
         6b/QSaziho4fNBVzAEAOaAFkWtpvXNibJ22YN+9tqA4ITGeT9dmMamDXuBdOeUjbMgbl
         Pg/ayiieEx96VwFVWbvYJXOtpXhzUeRZj4fvwX3IoCpyNP6P0axAjOsTOo0PvO3YTSSS
         mTgSExhzUSKZDdymmYUR5SsKy5/fyX0dWB08dffvd1AFU/gLvW/GvnUlfsn6vZfvwXfY
         im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQj+lY9Q9qTAn9h/O1jDrfQPMWDKTY6Q2BZuiHff5Iw=;
        b=AIeqo2LCFxtqkZIyXiOMSQifwaHmCJSfy0H6PJYWXG7qYW5J45RafI+YHwrdSN4x5e
         XGzYxQEqUS66BWVhZE93B22o+aOI4dL2JMu5kzXVXSym3Bre1UIGR+j2cOuhIVJhGupi
         I0n6c3zaWxdXX1mS7bvu9DVjpOIoEQ1U5aLOeifS5+dUI8FQussvnIDej+D3mnFnBiZH
         6dc/q6Mnb0OIJUzUd//iDx3V5EmJfdYU9IO8e2XAeHrEYL6bkacc5+RiHngaBIqNQ6rV
         k+YOBh9qMdV976ShrE8ovfbsYmz2bWyvPifEbj/FXbk2n4zGePwEwjmKGbNaCPkovs5z
         QmXw==
X-Gm-Message-State: AOAM533dP6cPp/eGHuxr2olF/XPWRzwizJ2PUW6LbUun7ozo8dEoCmxT
        xQ8aFDsjGMhzOcXCQRW9Ne48QamE7S2fERYw
X-Google-Smtp-Source: ABdhPJyjlK1WG/DEJVU6rq0koBfatPri8F85K0VZBp6e6CGUZPIxaBB5iaiRtPXEUR0komHKBL4gTw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr19393526wru.174.1608566516071;
        Mon, 21 Dec 2020 08:01:56 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.204])
        by smtp.googlemail.com with ESMTPSA id d191sm23176698wmd.24.2020.12.21.08.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 08:01:55 -0800 (PST)
Subject: Re: [PATCH] venus: venc: set IDR period to FW only for H264 & HEVC
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <80ba09a0-d830-4b08-1a76-44b5d7fb38ee@linaro.org>
Date:   Mon, 21 Dec 2020 18:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/16/20 9:06 AM, Dikshita Agarwal wrote:
> HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD is supported for only
> H264 & HEVC codec. There is no need to set it for VP8 since
> all key frames are treated as IDR frames for VP8.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3a2e449..618cf92 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -588,16 +588,19 @@ static int venc_set_properties(struct venus_inst *inst)
>  			return ret;
>  	}
>  
> -	/* IDR periodicity, n:
> -	 * n = 0 - only the first I-frame is IDR frame
> -	 * n = 1 - all I-frames will be IDR frames
> -	 * n > 1 - every n-th I-frame will be IDR frame
> -	 */
> -	ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> -	idrp.idr_period = 0;
> -	ret = hfi_session_set_property(inst, ptype, &idrp);
> -	if (ret)
> -		return ret;
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> +	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +		/* IDR periodicity, n:
> +		 * n = 0 - only the first I-frame is IDR frame
> +		 * n = 1 - all I-frames will be IDR frames
> +		 * n > 1 - every n-th I-frame will be IDR frame
> +		 */
> +		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> +		idrp.idr_period = 0;
> +		ret = hfi_session_set_property(inst, ptype, &idrp);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (ctr->num_b_frames) {
>  		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
> 

-- 
regards,
Stan
