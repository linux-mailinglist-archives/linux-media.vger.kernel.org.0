Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3283D2C241F
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732516AbgKXL2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729105AbgKXL2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:28:12 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AE3C0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 03:28:11 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id o9so28001824ejg.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 03:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hhvxHqkvhpCtQ6NNZ2UFIum9Umz9gTvQwQEBUmRS/nA=;
        b=gUd2H9GbGEiqJmI/LicXygK+RomOWc7/9ZBs0LGaljvlsKtBJIGduXf9jJvoD/pmQY
         JkDOqUaURy4Bidt4Wx85R7dwoP5Q4gw/qtoiS5thVBFwLdxMkNpdeNkNDkENI905K4Lp
         Qja4rRRPhV6JyJsj0jy1NYcbmh85ZW6/9i168=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhvxHqkvhpCtQ6NNZ2UFIum9Umz9gTvQwQEBUmRS/nA=;
        b=BbEVGsDlyAlfI2yesIMRo89yVji1/F2c7+4X1G2rBjnqfDj6zwmeT8bQaWdLUJ7Wy9
         hP5NmcfGR8GIjwTOnVM1ArEvgSdopgiJilSxEABBRvBhp1kMpqR2hZ3FApEtWbZkpDX9
         LyPeLnRt9QJmmWnaKRr7vrZBr8I2MabWGVa6QW5guUJV1mzWg7/s5WNdX8mkgzzgVX9S
         DFR01SkoFswu4Pqy0wzan1Ouoxh5z3bsKZ7pkr5B63gYcEXxwwhb0HP9WdTqfMrAECtG
         W199HXzOv4cdH+KWixXoVcPmQruisrPCYdptR+Y5sDVnJPE2+miKiqi30+eabchW3Po2
         ljTg==
X-Gm-Message-State: AOAM531OvapkXqxv3VwTMt3LS6AiLqBRVfpuQA0lnedS+xqEDT6DbxmA
        FlwpF3MCDHrAkCGoA3VWwaczv0U25olGUQ==
X-Google-Smtp-Source: ABdhPJwTp0gtcpqu6VtaKlg2neMu3KWKOeL9HVQsrjZbm4hCPeSBun+su28HZYk1GFTuKN7ReNSE4Q==
X-Received: by 2002:a17:906:d790:: with SMTP id pj16mr3829543ejb.125.1606217289784;
        Tue, 24 Nov 2020 03:28:09 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id u5sm4240852edp.5.2020.11.24.03.28.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:28:09 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id x22so2088635wmc.5
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 03:28:08 -0800 (PST)
X-Received: by 2002:a1c:208f:: with SMTP id g137mr3844148wmg.116.1606217288307;
 Tue, 24 Nov 2020 03:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
In-Reply-To: <20201116155008.118124-1-robert.foss@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 24 Nov 2020 20:27:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BeZC9vpcyOZTWTnAwyf=vF5mFmAF6FqLzwej2V_pfWOA@mail.gmail.com>
Message-ID: <CAAFQd5BeZC9vpcyOZTWTnAwyf=vF5mFmAF6FqLzwej2V_pfWOA@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, Nov 17, 2020 at 12:52 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> Remove the 3280x2464 mode as it can't be reproduced and yields
> an output resolution of 3264x2448 instead of the desired one.
>
> Furthermore the 3264x2448 resolution is the highest resolution
> that the product brief lists.
>
> Since 3280x2464 neither works correctly nor seems to be supported
> by the sensor, let's remove it.
>

Let me check which modes are used by our projects. For one I'm sure
it's the 3264, but not sure about the other.

To be fair, 3280 sounds like a valid setup, with black pixels on the
edges. It's sometimes needed to add the black pixels either due to ISP
requirements or to obtain the black pixel values.

Best regards,
Tomasz

> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/media/i2c/ov8856.c | 202 -------------------------------------
>  1 file changed, 202 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 2f4ceaa80593..3365d19a303d 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -148,196 +148,6 @@ static const struct ov8856_reg mipi_data_rate_360mbps[] = {
>         {0x031e, 0x0c},
>  };
>
> -static const struct ov8856_reg mode_3280x2464_regs[] = {
> -       {0x3000, 0x20},
> -       {0x3003, 0x08},
> -       {0x300e, 0x20},
> -       {0x3010, 0x00},
> -       {0x3015, 0x84},
> -       {0x3018, 0x72},
> -       {0x3021, 0x23},
> -       {0x3033, 0x24},
> -       {0x3500, 0x00},
> -       {0x3501, 0x9a},
> -       {0x3502, 0x20},
> -       {0x3503, 0x08},
> -       {0x3505, 0x83},
> -       {0x3508, 0x01},
> -       {0x3509, 0x80},
> -       {0x350c, 0x00},
> -       {0x350d, 0x80},
> -       {0x350e, 0x04},
> -       {0x350f, 0x00},
> -       {0x3510, 0x00},
> -       {0x3511, 0x02},
> -       {0x3512, 0x00},
> -       {0x3600, 0x72},
> -       {0x3601, 0x40},
> -       {0x3602, 0x30},
> -       {0x3610, 0xc5},
> -       {0x3611, 0x58},
> -       {0x3612, 0x5c},
> -       {0x3613, 0xca},
> -       {0x3614, 0x20},
> -       {0x3628, 0xff},
> -       {0x3629, 0xff},
> -       {0x362a, 0xff},
> -       {0x3633, 0x10},
> -       {0x3634, 0x10},
> -       {0x3635, 0x10},
> -       {0x3636, 0x10},
> -       {0x3663, 0x08},
> -       {0x3669, 0x34},
> -       {0x366e, 0x10},
> -       {0x3706, 0x86},
> -       {0x370b, 0x7e},
> -       {0x3714, 0x23},
> -       {0x3730, 0x12},
> -       {0x3733, 0x10},
> -       {0x3764, 0x00},
> -       {0x3765, 0x00},
> -       {0x3769, 0x62},
> -       {0x376a, 0x2a},
> -       {0x376b, 0x30},
> -       {0x3780, 0x00},
> -       {0x3781, 0x24},
> -       {0x3782, 0x00},
> -       {0x3783, 0x23},
> -       {0x3798, 0x2f},
> -       {0x37a1, 0x60},
> -       {0x37a8, 0x6a},
> -       {0x37ab, 0x3f},
> -       {0x37c2, 0x04},
> -       {0x37c3, 0xf1},
> -       {0x37c9, 0x80},
> -       {0x37cb, 0x16},
> -       {0x37cc, 0x16},
> -       {0x37cd, 0x16},
> -       {0x37ce, 0x16},
> -       {0x3800, 0x00},
> -       {0x3801, 0x00},
> -       {0x3802, 0x00},
> -       {0x3803, 0x06},
> -       {0x3804, 0x0c},
> -       {0x3805, 0xdf},
> -       {0x3806, 0x09},
> -       {0x3807, 0xa7},
> -       {0x3808, 0x0c},
> -       {0x3809, 0xd0},
> -       {0x380a, 0x09},
> -       {0x380b, 0xa0},
> -       {0x380c, 0x07},
> -       {0x380d, 0x88},
> -       {0x380e, 0x09},
> -       {0x380f, 0xb8},
> -       {0x3810, 0x00},
> -       {0x3811, 0x00},
> -       {0x3812, 0x00},
> -       {0x3813, 0x01},
> -       {0x3814, 0x01},
> -       {0x3815, 0x01},
> -       {0x3816, 0x00},
> -       {0x3817, 0x00},
> -       {0x3818, 0x00},
> -       {0x3819, 0x10},
> -       {0x3820, 0x80},
> -       {0x3821, 0x46},
> -       {0x382a, 0x01},
> -       {0x382b, 0x01},
> -       {0x3830, 0x06},
> -       {0x3836, 0x02},
> -       {0x3862, 0x04},
> -       {0x3863, 0x08},
> -       {0x3cc0, 0x33},
> -       {0x3d85, 0x17},
> -       {0x3d8c, 0x73},
> -       {0x3d8d, 0xde},
> -       {0x4001, 0xe0},
> -       {0x4003, 0x40},
> -       {0x4008, 0x00},
> -       {0x4009, 0x0b},
> -       {0x400a, 0x00},
> -       {0x400b, 0x84},
> -       {0x400f, 0x80},
> -       {0x4010, 0xf0},
> -       {0x4011, 0xff},
> -       {0x4012, 0x02},
> -       {0x4013, 0x01},
> -       {0x4014, 0x01},
> -       {0x4015, 0x01},
> -       {0x4042, 0x00},
> -       {0x4043, 0x80},
> -       {0x4044, 0x00},
> -       {0x4045, 0x80},
> -       {0x4046, 0x00},
> -       {0x4047, 0x80},
> -       {0x4048, 0x00},
> -       {0x4049, 0x80},
> -       {0x4041, 0x03},
> -       {0x404c, 0x20},
> -       {0x404d, 0x00},
> -       {0x404e, 0x20},
> -       {0x4203, 0x80},
> -       {0x4307, 0x30},
> -       {0x4317, 0x00},
> -       {0x4503, 0x08},
> -       {0x4601, 0x80},
> -       {0x4800, 0x44},
> -       {0x4816, 0x53},
> -       {0x481b, 0x58},
> -       {0x481f, 0x27},
> -       {0x4837, 0x16},
> -       {0x483c, 0x0f},
> -       {0x484b, 0x05},
> -       {0x5000, 0x57},
> -       {0x5001, 0x0a},
> -       {0x5004, 0x04},
> -       {0x502e, 0x03},
> -       {0x5030, 0x41},
> -       {0x5780, 0x14},
> -       {0x5781, 0x0f},
> -       {0x5782, 0x44},
> -       {0x5783, 0x02},
> -       {0x5784, 0x01},
> -       {0x5785, 0x01},
> -       {0x5786, 0x00},
> -       {0x5787, 0x04},
> -       {0x5788, 0x02},
> -       {0x5789, 0x0f},
> -       {0x578a, 0xfd},
> -       {0x578b, 0xf5},
> -       {0x578c, 0xf5},
> -       {0x578d, 0x03},
> -       {0x578e, 0x08},
> -       {0x578f, 0x0c},
> -       {0x5790, 0x08},
> -       {0x5791, 0x04},
> -       {0x5792, 0x00},
> -       {0x5793, 0x52},
> -       {0x5794, 0xa3},
> -       {0x5795, 0x02},
> -       {0x5796, 0x20},
> -       {0x5797, 0x20},
> -       {0x5798, 0xd5},
> -       {0x5799, 0xd5},
> -       {0x579a, 0x00},
> -       {0x579b, 0x50},
> -       {0x579c, 0x00},
> -       {0x579d, 0x2c},
> -       {0x579e, 0x0c},
> -       {0x579f, 0x40},
> -       {0x57a0, 0x09},
> -       {0x57a1, 0x40},
> -       {0x59f8, 0x3d},
> -       {0x5a08, 0x02},
> -       {0x5b00, 0x02},
> -       {0x5b01, 0x10},
> -       {0x5b02, 0x03},
> -       {0x5b03, 0xcf},
> -       {0x5b05, 0x6c},
> -       {0x5e00, 0x00}
> -};
> -
>  static const struct ov8856_reg mode_3264x2448_regs[] = {
>         {0x0103, 0x01},
>         {0x0302, 0x3c},
> @@ -963,18 +773,6 @@ static const struct ov8856_link_freq_config link_freq_configs[] = {
>  };
>
>  static const struct ov8856_mode supported_modes[] = {
> -       {
> -               .width = 3280,
> -               .height = 2464,
> -               .hts = 1928,
> -               .vts_def = 2488,
> -               .vts_min = 2488,
> -               .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> -                       .regs = mode_3280x2464_regs,
> -               },
> -               .link_freq_index = OV8856_LINK_FREQ_720MBPS,
> -       },
>         {
>                 .width = 3264,
>                 .height = 2448,
> --
> 2.27.0
>
