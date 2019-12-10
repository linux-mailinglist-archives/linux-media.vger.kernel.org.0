Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A62D11829C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 09:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfLJIlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 03:41:52 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39703 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLJIlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 03:41:52 -0500
Received: by mail-ed1-f68.google.com with SMTP id v16so15226170edy.6
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2019 00:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BapN+mqvvqkIREkBzQtrQe2NlcTvEKNzg8SbCbikvEM=;
        b=TyHlp/9o6RmgZWQ9OdMTHRTg33dURWkbT7RhZ0VvLQoxDBshZlgfbnaNAQ1EBrIeiR
         6p6CTrksiYuorY9/JZ26Gt2f3IJsGyj+c80u3bTsA0IKEBM3gqYznPhreYgc0k2M9kKq
         ejEHPnCej6s5HCaTF7c5yaInyCFg6P05h79q/4XhM1n356KmdKclGKmul+h0tAqEYOP/
         soTgc77rUzb08/Id1jkZDTxEFsGN2IvKhKq5713FbUss3yIda9xplgt/jyc6d0gsFUYI
         HjxbIrJdWFkVIBREeulPwQVtA1UvhOXpJixaKu12SpArCsNnK673wHySZLoYVWKEB7Dq
         uBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BapN+mqvvqkIREkBzQtrQe2NlcTvEKNzg8SbCbikvEM=;
        b=hfqBgKQo6QQg/vRHiWpTih/nKmZvRxtUUKqPRCO1y/9K0yNs72DAza3utBym+LJmPR
         HZUIbDgAZXxOl3ClK67vh7gV6oWLobFf0cjoDre9RoHHmpXAZIBOej9SyulT+URhaYrQ
         Xuj58ZbOdmCxM2fVGp3MZqkZei5NMQwGsSNHzAzYVJvBkqfPP0U4V47WODqK8vYKM9zM
         Ip+T5jnv2IILpGLYApXBCexiyk1kwQMe1zISJGG5HvP4FjXQmCzUR1JbrbzlDSsSTtAK
         4WnQh0LRFf9NB7J3OGKepvmvHegWC72XGaXwKSD5HaGwGnuvZGj3aZH1YcdWmP8cOnde
         5j2w==
X-Gm-Message-State: APjAAAXiFnIBINolei4GD4uv/00aWgf1qnmM/M6ia6J3I0la9uI4iOn9
        lYOkueyATKNUInxmq+vp0Tg1xw==
X-Google-Smtp-Source: APXvYqxkrixkXEZmwLLK+fVnCJG0Rp9RCISTpuDg24vcflyHiDHcn215F0VicvvGIWwv4m5ULaa0uw==
X-Received: by 2002:aa7:c3d7:: with SMTP id l23mr37263172edr.82.1575967310708;
        Tue, 10 Dec 2019 00:41:50 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id bs4sm77128ejb.39.2019.12.10.00.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 00:41:50 -0800 (PST)
Subject: Re: [PATCH] media: venus: hfi_parser: Ignore HEVC encoding for V1
To:     Stephan Gerhold <stephan@gerhold.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20191209191652.222576-1-stephan@gerhold.net>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <fdac0a86-e055-3c81-64e1-0b80c6aebb3b@linaro.org>
Date:   Tue, 10 Dec 2019 10:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209191652.222576-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephan,

Thanks for the patch!

On 12/9/19 9:16 PM, Stephan Gerhold wrote:
> Some older MSM8916 Venus firmware versions also seem to indicate
> support for encoding HEVC, even though they really can't.
> This will lead to errors later because hfi_session_init() fails
> in this case.
> 
> HEVC is already ignored for "dec_codecs", so add the same for
> "enc_codecs" to make these old firmware versions work correctly.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This makes Venus work on the Samsung Galaxy S4 Mini VE (MSM8916),
> which is stuck on a rather old Venus firmware version (1.6-00040).
> The firmware is signed, so unfortunately I'm not aware of a way to upgrade it...
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 2293d936e49c..7f515a4b9bd1 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -181,6 +181,7 @@ static void parse_codecs(struct venus_core *core, void *data)
>  	if (IS_V1(core)) {
>  		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
>  		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
> +		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
>  	}
>  }
>  
> 

-- 
regards,
Stan
