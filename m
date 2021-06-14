Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7577F3A6C57
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 18:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhFNQs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 12:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbhFNQs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 12:48:56 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22944C061574;
        Mon, 14 Jun 2021 09:46:53 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id s70-20020a1ca9490000b02901a589651424so257615wme.0;
        Mon, 14 Jun 2021 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tvljP/FADgJBhPk8ME8L4V47cVc2f6d7/8FHRIYD954=;
        b=B8T6dmxQE+0ZeP3z3goo/uCBgwFxsqBnOtsv8GUo1GTgIyTt2spvcvGsEqtuFBUZWK
         vFqBP36fjaqMSIiqnXoQ/A3/Xz4fE3JW3llo67SASmqge3+wpBE2MQGKpswswYUNXjYy
         hC5yVts0+mPVxHWOqj6q6nWfgTSS+APojDJ0X7g0zF4kUOuG9//tygMwPL4F76vlfryV
         2SL14T1k//Lq59mbsY/3Ey2q6vtCpxX9FdHPB9nmoNXpYtIsxllswOSA3UVhKEPO6sc0
         qiUtzhBlkS/UTy6d2FM2nxVnMeHqrC8NMGrQJuQbhqXOGEjJP20YcnqZkwmcBf4e9PRI
         mqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tvljP/FADgJBhPk8ME8L4V47cVc2f6d7/8FHRIYD954=;
        b=cwpP73TOF+pftvHxopvaHxWyDWPd6SskdeAwLFLjTvYEbzNBBM86r2M+zG68j0Ez60
         2c1oMWApsDAq/WuE1bZ2FYoHDK9B/BYQNJby8GzF84L/b30LVs30FHrb6NYwh3o6NOiX
         EFCF2Z9Vu33g6vDC4hsJCfmSBv+WsLuJxtdGjOCamFFg1x7JZG0NKezNrwU0JBfHjFpK
         WEYwu9Q4dS8x4DsU4xtljuEwornAnvB3bDOhcbaorl3/zurAOtNL1h35ZPWUFubJoSxw
         MViZz+StfAhRgs8jkzLVLKsov3Mt38PpNh4DgBm+TuyFhgTodZEvBMPpV3tIiahvPunw
         EQWw==
X-Gm-Message-State: AOAM5320Gcb+I9SfF/SUfUBXPVn86pB0R9+y0rXI4V4t/gNiK1V/vRHM
        Nd+q0ljkGwToF3J0MRvIMA==
X-Google-Smtp-Source: ABdhPJz/TgPYRiMBAJkO6DK6KCQhd3nMPx3VN/0cIYRHyDbVaEy82gCi6urK85Tm6qF8t3KosZFFRQ==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id e33mr10664wmp.39.1623689211594;
        Mon, 14 Jun 2021 09:46:51 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id x10sm16580048wrt.26.2021.06.14.09.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 09:46:51 -0700 (PDT)
Subject: Re: [PATCH v2 06/12] media: hantro: add support for Rockchip RK3066
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-7-knaerzche@gmail.com>
 <09885c89dd37ca56305630c96da88333e81a2f25.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <25edf9d4-6740-4ce3-90e4-8633b936fc5b@gmail.com>
Date:   Mon, 14 Jun 2021 18:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <09885c89dd37ca56305630c96da88333e81a2f25.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 11.06.21 um 17:50 schrieb Ezequiel Garcia:
> Hi Alex,
>
> On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
>> RK3066's VPU IP block is the predecessor from what RK3288 has.
>> The hardware differences are:
>>    - supports decoding frame sizes up to 1920x1088 only
>>    - doesn't have the 'G1_REG_SOFT_RESET' register
>>      (requires another .reset callback for hantro_codec_ops,
>>       since writing this register will result in non-working
>>       IP block)
>>    - has one ACLK/HCLK per vdpu/vepu
>>    - ACLKs can be clocked up to 300 MHz only
> Have you tested trying 400 MHz (or more) ?

Yes, I've tried this on both RK3066 and RK3036 variants - everything 
above  300 MHz results in non-functioning IP block.

See comment in RK3036 devicetree in vendor kernel at [1].

[1] 
https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm/boot/dts/rk3036.dtsi#L246-L248

>
>>    - no MMU
>>      (no changes required: CMA will be transparently used)
>>
>> Add a new RK3066 variant which reflect this differences. This variant
>> can be used for RK3188 as well.
>>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Thanks!
> Ezequiel
>
