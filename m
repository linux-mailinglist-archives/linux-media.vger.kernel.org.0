Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EB3786BF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfG2Hyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 03:54:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37661 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG2Hye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 03:54:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so3366488ljn.4
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8547tTieJTlVcp1ebRnVxi/sn+gdsxGXf1dlpzxnCUw=;
        b=L8sOkg7Ax87vy+96EbbXXe/57YWfMfL5VN12MJf0jWV2nZrspx9wgCZekwqwSafd+U
         ZRyGHhnULDy68f7hnWZPmk7IKc+tNUGqcMJRpeyjY78EgutxWvTEr4fq/8sfr87zj/vH
         GZAvXJswddC6YrbIKnEbsOHxrwqAF0t8pW7jyTBFPuxMiiQCoEIdEWWQNWzt2Vy+ruNF
         EeXQiBZGrIN/lw84IuwycszDODdxj5/tTnNzSKWgQzwc4m/8tA5/JitSBkOp3WPyFW+l
         D9cUX7ZgMX+vsw7kKdMQaE78AQyO+sTBk6vnQ25VQKkj+pWK3VGjFkA8POTzzxpygod0
         7FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8547tTieJTlVcp1ebRnVxi/sn+gdsxGXf1dlpzxnCUw=;
        b=tI8Mg/u7Lmu0CTMAXBiDdJtbX2LfRMIT4ymKIgvhKd3vHYBM1ZHtgl8q2qKmQCd1m9
         cbUEobxdONQZSxdpnTMQ28TGLa/J6Va6v6A9oM5CctVi+DYkRS+G7og9UAJ6aNdd+RGh
         ANeZ0qJllcPkamGGCjq+1JurhLe8Z3iab+PCIDGvVTzk8BJdVn2U8O3FKUKpklF5nOXV
         RDgG6cwWKQeF06BmQ9zh9MufMCIHvZVj1MHvBn3vCHyK31YSoIICrBX1bGR8uageTJyE
         CK8Rwihwu5iUNmK8oWkoOplKf7ehYSfcmtszGJkyqzgARJxrjmPSA7v92J3NLvWWotD4
         sQYA==
X-Gm-Message-State: APjAAAUB9vhprHXGRUQkfPcJfHWS09beFCJMVvIS10QHNoKM2VIQAubb
        lKasgs0Y8VeS4Wy8rNybuEvFXQ==
X-Google-Smtp-Source: APXvYqz7DCW+GeWXbJrTMfzV+L8GHnWeJgYI0K9b3blm41IrHJaUWwJy69BQehoTrVZg+fDehswliQ==
X-Received: by 2002:a2e:b0e6:: with SMTP id h6mr5315235ljl.18.1564386872598;
        Mon, 29 Jul 2019 00:54:32 -0700 (PDT)
Received: from [192.168.28.50] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id t1sm12678137lji.52.2019.07.29.00.54.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 00:54:31 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] media: venus: Update to bitrate based clock
 scaling
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-3-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <dd436fa8-085b-1c97-26bd-4c1d54a5d612@linaro.org>
Date:   Mon, 29 Jul 2019 10:54:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563786452-22188-3-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/22/19 12:07 PM, Aniket Masule wrote:
> Introduced clock scaling using bitrate, preavious
> calculations consider only the cycles per mb.
> Also, clock scaling is now triggered before every
> buffer being queued to the device. This helps in
> deciding precise clock cycles required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 33 +++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 2c976e4..edf403d 100644
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

the lock is not needed and having it will produce a deadlock.

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
> @@ -1093,6 +1116,8 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
>  	if (ret)
>  		goto unlock;
>  
> +	load_scale_clocks(inst);
> +
>  	ret = session_process_buf(inst, vbuf);
>  	if (ret)
>  		return_buf_error(inst, vbuf);
> 

-- 
regards,
Stan
