Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2521C13447B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 15:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgAHOCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 09:02:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43088 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbgAHOCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 09:02:24 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so2610990edb.10
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 06:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ds+dq9f0s0dxXv1nBND8TITp4Nv8HF77iael9SL7DN8=;
        b=QAK824DgB7qAYCvs7/tap5J/t3fDYH+VSEWid67loZP0Qk5QS6Wrib1nrqQ7qu+0Vx
         BVpfURCkazWbj2k/mWJw9AJ6+K46VciP7XekHoG0hxH5gmQFNnnpIsP5J3ayYL8z4S7X
         /sgv/GMOe+MksZV4bf+GLa7kLSCvVIlFz5VMaKkQSmPQgb8bXT30u7umv4QOwwHyF6TI
         ouaf0RJ7ULblCRc2nHvPaev/97QXMGYJKyFBVNcID/kIhmrRwhZLc6KiMnUuFcYWSsSm
         +BHENqd+qn8tduEn+8IwgYBL6U4AXkyP7EZsFNLxWaHzzS2fVy6fEl3KLL9yFm0JlhEc
         f7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ds+dq9f0s0dxXv1nBND8TITp4Nv8HF77iael9SL7DN8=;
        b=ObbEe8OPH3hFqAGDF4kGt48p0lNfxERFEDO/ddLRzGD8NW6kwIH6zuVVpR5uQR6BMT
         WcpAhB2TCFaSJKVXfSjwJFO/PqJZTi9GN+hVtFUCT9gVPhjlCzPMmL1DYl8ZEer75IW3
         /n9vNtwVsLxb42VJuPz0FTV46yx4o/vl1+HWdJCYMDLWGDEtb4qH1rO0pwJ8bAId0yJL
         nZS14Requ5EiOC7uEUpAW7EffsOshJrdrmjmQoe3ZXZKjini8cnS37Dbp6nSOjQsLNyM
         17lNNNBI94trc2p4VAHKVAjaGaAXy99iqYA5ztyBH+Df5sUkziu9SeMJ1JbIDDxcUJ89
         gfig==
X-Gm-Message-State: APjAAAVs2IZ0U/D75DpNYVLUERNJvjC89wIOqACo4NMc435PVRAhKbDK
        nH5gf7jxxVy7BzWvmqKhlNQQFA==
X-Google-Smtp-Source: APXvYqzS9RGXGFkjwgm40AM4nuzPQXYvInePHpf3fyv+tBEkbo02iH+6UFlDDapNKRADWWLP8p4smA==
X-Received: by 2002:a17:906:49cd:: with SMTP id w13mr4770281ejv.324.1578492142438;
        Wed, 08 Jan 2020 06:02:22 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id c19sm81884edu.76.2020.01.08.06.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 06:02:20 -0800 (PST)
Subject: Re: [PATCH v1] media: venus: firmware: Use %pR to print IO resource
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191115143044.55512-1-andriy.shevchenko@linux.intel.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c31790ae-f604-e44f-3282-2d83c9f7e569@linaro.org>
Date:   Wed, 8 Jan 2020 16:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115143044.55512-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thanks for the patch!

On 11/15/19 4:30 PM, Andy Shevchenko wrote:
> Replace explicit use of members of struct resource by %pR to print
> the resource.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index d3d1748a7ef6..de6812fb55f4 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -100,8 +100,7 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  
>  	mem_va = memremap(r.start, *mem_size, MEMREMAP_WC);
>  	if (!mem_va) {
> -		dev_err(dev, "unable to map memory region: %pa+%zx\n",
> -			&r.start, *mem_size);
> +		dev_err(dev, "unable to map memory region: %pR\n", &r);
>  		ret = -ENOMEM;
>  		goto err_release_fw;
>  	}
> 

-- 
regards,
Stan
