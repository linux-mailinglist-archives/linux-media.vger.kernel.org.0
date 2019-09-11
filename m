Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C26AF8E8
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 11:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfIKJ3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 05:29:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45798 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfIKJ3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 05:29:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id r134so15855969lff.12
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+HbSvL2e9LJRsc7qJLTrafgy8tjNTtDuD0nsrSg6bW0=;
        b=WRCXJamj6BAkjVsd6Yl4pJ5BTL6NFCdkx/fYdIZJA73nOceXxx7/8f5q1hxwG5FbIP
         yOM19cHCiykRjhVO3ezQ8A01cYJCsrLY6UhnbT1789/2bVLaasNJIAOzXYDaRArsK2I9
         2RUOwBGHnLbtr4GjwCQJ70Wh2ft3UvAirXl7LXBpbxHoM1zWr1wtn8jonIJfNvqOD0xL
         AU7/8VzR9X8zR0xo0IcXLQbHOhk4RwtYtnIbAsgUl3bvB9ZZe+3+csGmQuSEtnB4mLY/
         B6VIoGiVhK3ZDvLcGefco0tQxboTn8seumveae3K8UbaBRsR1TDjM6mi8Klc7aBPzW0S
         Hb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+HbSvL2e9LJRsc7qJLTrafgy8tjNTtDuD0nsrSg6bW0=;
        b=DZDrCu4fqZvmfwvqiwebumAdBAMLESV8laYXcBjncgbKNt2bdWzWONEBGaJGg8+GJh
         GuDgLAPEk5SFwLUGHNmLqqDj/6FSSZA6Rd7aVHHlhIFJGVMvdmVpXnn2B88ndzpDsaSb
         xD8DCuWbv875asXdpjWOsOzBtKgAJHIUVjqC5Yt36FtGgPH7LuI6H/fEgdJdbyBRZE4a
         1r/cHtnYeU28QiJ7AToYg5cxBsTReFDfYu4F7b5FvVX9+FBOVlLV+S0zLonsHSEY5hvy
         StaS6EHHfMjvgP8IDYXovjQsmFqf5wCFk5OXcup1SkSJ36DtjUEHnt55trXIr5ul3+yj
         F4Hw==
X-Gm-Message-State: APjAAAVHRTPOEdXMYLwOoClKAGkUJaQ4RStiMAsWjvPvrvYSCoknxZkK
        JE+Yq8YfPKLfVSYHJs17dWzZ1Iw5Zfo=
X-Google-Smtp-Source: APXvYqxVXa9bHq4a8OoOH/3V2nRX6Q3DjJTCbYCPKCL2dFqSEpPGXTa6ytRSwkx7CmhxQasSqJdaVg==
X-Received: by 2002:ac2:50c5:: with SMTP id h5mr4769111lfm.105.1568194189299;
        Wed, 11 Sep 2019 02:29:49 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id i17sm4458821ljd.2.2019.09.11.02.29.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 02:29:48 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Fix msm8996 frequency table
To:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <1567591618-22467-1-git-send-email-loic.poulain@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <92275cdb-870e-8cfe-0b7d-1b35f1a2ff5a@linaro.org>
Date:   Wed, 11 Sep 2019 12:29:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567591618-22467-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

Thanks for the patch!

On 9/4/19 1:06 PM, Loic Poulain wrote:
> In downstream driver, there are two frequency tables defined,
> one for the encoder and one for the decoder:
> 
> /* Encoders /
> <972000 490000000 0x55555555>, / 4k UHD @ 30 /
> <489600 320000000 0x55555555>, / 1080p @ 60 /
> <244800 150000000 0x55555555>, / 1080p @ 30 /
> <108000 75000000 0x55555555>, / 720p @ 30 */
> 
> /* Decoders /
> <1944000 490000000 0xffffffff>, / 4k UHD @ 60 /
> < 972000 320000000 0xffffffff>, / 4k UHD @ 30 /
> < 489600 150000000 0xffffffff>, / 1080p @ 60 /
> < 244800 75000000 0xffffffff>; / 1080p @ 30 */
> 
> It shows that encoder always needs a higher clock than decoder.
> 
> In current venus driver, the unified frequency table is aligned
> with the downstream decoder table which causes performance issues
> in decoding scenarios. Fix that by aligning frequency table on

s/decoding scenarios/encoding scenarios

> worst case (encoding).

Did you checked the exact rate from clk_summary? Checking the frequency
table for subcore0|1 from mmcc-msm8996.c clock driver shows that the
tables are slightly different for higher rates.

Otherwise, I'd take the patch but it would be better to align the
frequency tables to avoid confusions.

On the other side we can split freq table to encode and decode tables,
but I'm still not sure is it possible to have:
subcore0_freq != subcore1_freq.

> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 0acc757..1e80689 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -427,10 +427,11 @@ static const struct venus_resources msm8916_res = {
>  };
>  
>  static const struct freq_tbl msm8996_freq_table[] = {
> -	{ 1944000, 490000000 },	/* 4k UHD @ 60 */
> -	{  972000, 320000000 },	/* 4k UHD @ 30 */
> -	{  489600, 150000000 },	/* 1080p @ 60 */
> -	{  244800,  75000000 },	/* 1080p @ 30 */
> +	{ 1944000, 490000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 490000000 },	/* 4k UHD @ 30 */
> +	{  489600, 320000000 },	/* 1080p @ 60 */
> +	{  244800, 150000000 },	/* 1080p @ 30 */
> +	{  108000,  75000000 },	/* 720p @ 30 */
>  };
>  
>  static const struct reg_val msm8996_reg_preset[] = {
> 

-- 
regards,
Stan
