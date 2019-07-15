Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA94C698B2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 17:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbfGOP7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 11:59:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36603 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730296AbfGOP7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 11:59:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so16794137ljj.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HjbeDhOV51A8sdpXnqafwlfJ9iwiNhonhrxyNQUI16E=;
        b=N+eU86f/1K4jXpLed142Olwx09e8H8Iivx69wTDwzoqwqFbC8Pe3Y7pdRrF6bmBl1f
         JhdQC7tAw/WwyEYSmz5ltzaNJ2xL7+fD+UmUOm4E4KvTPROstgSY6AXe9Tm8qYYPrS2K
         c9J9vJzxL6CrmTWBVQwLKPD9vYqRpjkpgcdwY/4H4sO7/+cMGdHMI64j+DBSE+dvsFc5
         xTJlfTlD5s0iyTDoz9gh5jLj5fLF4b2spjq3k7oowVEbmTqoKHcNx483USXg1drtBEFk
         buTzA7D5lMjlsRhVlWy3p5a+YlYB7pORyFDmytvW9qASNVxT/sQoj7DRdWrapqSeaqXn
         F8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HjbeDhOV51A8sdpXnqafwlfJ9iwiNhonhrxyNQUI16E=;
        b=jUNIS4vL0t4sUz9T1X1j70uaB2V0t/+w9YVD1NfjncODJRIcfUH29ZnPXLiWbh9MfO
         aiSMPWAflD7El8wO0fLcfsoEgiao3w3Vqu89xlncuN9tlEVkmbKc1ByhcExXJkrKIsih
         VEP2szG+26wluDCkmuprGU0Q4p91vVI1RGlcB4V/okdT2QJ6jVICBB5s4KZQP+eZVkJt
         YSygO8Myo9VHT6Luizmkh8EUHlucV+HKO6RSpSdHNIId1CVLex9cr3qUOvnDkOsmD5a+
         osVlj3pFy/z00+zoGms8QOCaOCdvByCi3kp5/DQIT6aNKXXQsKoN00mjLjpreT8N/3nr
         4C1w==
X-Gm-Message-State: APjAAAX+zZnVfPgtuwxTbLjNyvsCWMv1ShMgD3tWmNfwpXbAqcXMKlRg
        i6svvGiGo3G/bj82PoZOp2ifbg==
X-Google-Smtp-Source: APXvYqzV20YelwwZmVujNBOuf0KewDUAlMY5R7oPdGUPxlJpzk4n5D9ibscxmdTuGZoa2l4u193jag==
X-Received: by 2002:a2e:3e01:: with SMTP id l1mr11682242lja.208.1563206342726;
        Mon, 15 Jul 2019 08:59:02 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id f24sm2633350lfk.72.2019.07.15.08.59.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:59:01 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] media: venus: Update to bitrate based clock
 scaling
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
 <1562078787-516-4-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <06248dce-2c01-279b-20be-4dfcafbd792f@linaro.org>
Date:   Mon, 15 Jul 2019 18:58:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562078787-516-4-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/2/19 5:46 PM, Aniket Masule wrote:
> Introduced clock scaling using bitrate, preavious
> calculations consider only the cycles per mb.
> Also, clock scaling is now triggered before every
> buffer being queued to the device. This helps in
> deciding precise clock cycles required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 31 +++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 2c976e4..5726d86 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -399,17 +399,26 @@ static int scale_clocks(struct venus_inst *inst)
>  	return ret;
>  }
>  
> -static unsigned long calculate_vpp_freq(struct venus_inst *inst)
> +static unsigned long calculate_inst_freq(struct venus_inst *inst,
> +					 unsigned long filled_len)
>  {
> -	unsigned long vpp_freq = 0;
> +	unsigned long vpp_freq = 0, vsp_freq = 0;
> +	u64 fps = inst->fps;
>  	u32 mbs_per_sec;
>  
>  	mbs_per_sec = load_per_instance(inst);
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> +	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
>  
> -	return vpp_freq;
> +	/* 10 / 7 is overhead factor */
> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
> +		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
> +	else
> +		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
> +
> +	return max(vpp_freq, vsp_freq);
>  }
>  
>  static int scale_clocks_v4(struct venus_inst *inst)
> @@ -417,13 +426,27 @@ static int scale_clocks_v4(struct venus_inst *inst)
>  	struct venus_core *core = inst->core;
>  	const struct freq_tbl *table = core->res->freq_tbl;
>  	unsigned int num_rows = core->res->freq_tbl_size;
> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>  	struct clk *clk = core->clks[0];
>  	struct device *dev = core->dev;
>  	unsigned int i;
>  	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
> +	unsigned long filled_len = 0;
> +	struct venus_buffer *buf, *n;
> +	struct vb2_buffer *vb;
>  	int ret;
>  
> -	freq = calculate_vpp_freq(inst);
> +	mutex_lock(&inst->lock);
> +	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> +		vb = &buf->vb.vb2_buf;
> +		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
> +	}
> +	mutex_unlock(&inst->lock);
> +
> +	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
> +		return 0;
> +
> +	freq = calculate_inst_freq(inst, filled_len);
>  
>  	if (freq > table[0].freq)
>  		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
> 

The original patch has a call to load_scale_clocks from
venus_helper_vb2_buf_queue, why it is not included here?

-- 
regards,
Stan
