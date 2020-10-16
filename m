Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48028FFC3
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 10:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405056AbgJPIIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 04:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404988AbgJPIIy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 04:08:54 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8CAC061755;
        Fri, 16 Oct 2020 01:08:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a7so1769385lfk.9;
        Fri, 16 Oct 2020 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qZe2CLjNbYrE8jVJW7Bxg0tsRI3b/ccVNXtLY33BYJg=;
        b=d3vu7Heq2NfOyc1FsZpYFtDai+Xs3zayyghnh4V8U8y6gj0m7ixSpc1ovm/93Q0qEZ
         usutg6ivd4Lv3Ev8zPh/gZmnO64gYCZeooTZIZTyjTc/NX8F7OLpENlg1c2diLxQO/EF
         bmlvmjnxtbovvP/Ip1CG1IojFb2y6x+X/Rh3zrN2xTUYpLpLo9dE4HMf8X9h6vIJ0/eM
         DfFr2ppHR9B3DFjF0EbKlDGgSMhFiR6yfWbAwZi6szH2jFcwQUV2g9QH2/YilJw6dnLb
         clfia3XgxLHpj3CXd5cDrHETOM5kPL1ba4hx0AXuoaXIfEcSEJ94DBjsjcCPRv0xj6ak
         SKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qZe2CLjNbYrE8jVJW7Bxg0tsRI3b/ccVNXtLY33BYJg=;
        b=Q2R3Ra2B8CdFT9cR+tGCVEo+MOUSgP323AaGfr2Zm+Kd5OZtCpgV43moU8FR1JpZaz
         mZDrqjyYkbshC4XesbzWezykFgl6GU246v8+nl3/9rMCSAjwTkVd0G3PLj9Nj2mtbjbR
         QagCO8U3W7Jefx5R90xJNKl8prIg462EwfSSgueZmOQYDio3CR1VMFxlMEsBOo9DAoMm
         9EuKs1J/CcVIZLh+joczjjkyFAOyoOFIRbWcP43V+PxiHYWHG5iKct/yBmHbaa67eF0w
         fH8CzU1xxqmQpp6qgGVkA8gxgmQknB89bh1zhcWh8aihQySLyqoyQeT/b/HwUl/QMhCp
         YtIQ==
X-Gm-Message-State: AOAM5301/YjQI3lVLgntfuqwbxTMFiOWIIrS/Eb0xLL/wJQcRC3/VqHk
        Q+G9F4ygTEpA0BG4CsV+9N0=
X-Google-Smtp-Source: ABdhPJyj4PJbafl41hzy4tbyoGjRVJdCzt1YMxHhDWj9o44Bmfvdyu6Orr9SSPXyhKO+BEuMt14cmw==
X-Received: by 2002:a19:7509:: with SMTP id y9mr809233lfe.306.1602835732292;
        Fri, 16 Oct 2020 01:08:52 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42b1:307f:5872:636a:7546:106a? ([2a00:1fa0:42b1:307f:5872:636a:7546:106a])
        by smtp.gmail.com with ESMTPSA id q2sm579439lfe.50.2020.10.16.01.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 01:08:51 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] media: i2c: max9286: Make channel amplitude
 programmable
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
 <20201015182710.54795-5-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <09c29e37-6adb-f5e4-fe57-46babaa6dae4@gmail.com>
Date:   Fri, 16 Oct 2020 11:08:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015182710.54795-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 15.10.2020 21:27, Jacopo Mondi wrote:

> Instrument the function that configures the reverse channel with a
> programmable amplitude value.
> 
> This change serves to prepare to adjust the reverse channel amplitude
> depending on the remote end high-threshold configuration.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>   drivers/media/i2c/max9286.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 89a7248f5c25..163e102199e3 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -906,19 +906,29 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
>    * Probe/Remove
>    */
>   
> -static void max9286_reverse_channel_setup(struct max9286_priv *priv)
> +static void max9286_reverse_channel_setup(struct max9286_priv *priv,
> +					  unsigned int chan_amplitude)
>   {
> +	/* Reverse channel transmission time: default to 1. */
> +	u8 chan_config = MAX9286_REV_TRF(1);
> +
>   	/*
>   	 * Reverse channel setup.
>   	 *
>   	 * - Enable custom reverse channel configuration (through register 0x3f)
>   	 *   and set the first pulse length to 35 clock cycles.
> -	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> -	 *   high threshold enabled by the serializer driver.
> +	 * - Adjust reverse channel amplitude: values > 130 are programmed
> +	 *   using the additional +100mV REV_AMP_X boost flag
>   	 */
>   	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> -	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> -		      MAX9286_REV_AMP_X);
> +
> +	if (chan_amplitude > 100) {
> +		/* It is not possible express values (100 < x < 130) */

    "To express", perhaps?

> +		chan_amplitude = chan_amplitude < 130
> +			       ? 30 : chan_amplitude - 100;
> +		chan_config |= MAX9286_REV_AMP_X;
> +	}
> +	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
>   	usleep_range(2000, 2500);
>   }
>   
[...]

MBR, Sergei
