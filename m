Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632774202A1
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 18:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhJCQVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Oct 2021 12:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhJCQVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Oct 2021 12:21:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32127C0613EC;
        Sun,  3 Oct 2021 09:19:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y23so26138230lfj.7;
        Sun, 03 Oct 2021 09:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=llNEIxhbTSZcUz/lPANGAqOblDCi/UrFP7kaAKP4keU=;
        b=iMBm8AwapfDJTBhIZYAwPszSAxnzFsOVLZ+j8Uyli8khiCJhULvx8qM7JmI/KKUK2f
         EzP8bV6h8QYSevFDyf0DMcJOT+o48h1b8uJsvRfP1Z76mM9ZXQfZAuNgqMDUNrbXWvm4
         2aUVqbWVeCNfJKNRLLulqkem+/oNsS6RcRXJ10rZr+ZovkXH5Ko3wAPAtts1B6EBRhbK
         I/R3Q+P1toK8ptlGvXGYcXm5aomTnTTJ8sbmWJ2BSdQEtc1+WOqyg2FhYeMwB1/+qqbp
         j2zsgZzWgCzzIUhbScMj6xZjXYKQOFMjK74hnGq7+SxILDl4IguVnHw2+qdw/sfp5YY2
         VVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=llNEIxhbTSZcUz/lPANGAqOblDCi/UrFP7kaAKP4keU=;
        b=IT7PvSA+x6ylNcycoyW13sBRVLhOICRvoP3/muxeN7WqfSnqTSO7mgnvLNy+eDZq+5
         /yCTYt9EMPQ5dicekdKFvd/4l3QUFvBInSWsG8NBMuHRgn3AbPQ/TjsCzocCX7mP37Gl
         NhexLXY0JUYYlLi4cuuWhz3PKvxKJk+FWK9jPMmdOdtkmwgMDcE+beKikwcpKgJ9Ypp/
         Dp6/YaCE5CUmY9DLa/lvc1bROg6Ye0yRgDbju6C/oeG+kZxo9LgnHej6eUIGztex9Pkq
         vFwX6vPyf+H1wuDrHz0Q9BOdIcsK0SJhymC7KXTQ9neEeAmkNZv8eZ+oNBmUIFADErKa
         EY6w==
X-Gm-Message-State: AOAM532nLonHwvGy/UAz1XD3/bpeHYcB/OKo7dMYjwdwcsSzVRLaOqMY
        ov72SgX0v8VGTrme48kutBw5ArpLLF4=
X-Google-Smtp-Source: ABdhPJz9BjYRvkt6eRG7+7adWwZUvWuFcpNGUlKEL2xMti3oEMnwTfmWXA6Kv8Fq/UwxgF1mHJRSRg==
X-Received: by 2002:a05:6512:344f:: with SMTP id j15mr4527384lfr.521.1633277961257;
        Sun, 03 Oct 2021 09:19:21 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.120])
        by smtp.gmail.com with ESMTPSA id u21sm1292162lju.26.2021.10.03.09.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 09:19:20 -0700 (PDT)
Message-ID: <1bad16dc-e11e-4096-2014-a0eae92686e8@gmail.com>
Date:   Sun, 3 Oct 2021 19:19:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
Content-Language: en-US
To:     Ammar Faizi <ammar.faizi@students.amikom.ac.id>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bedirhan KURT <windowz414@gnuweeb.org>
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/21 02:17, Ammar Faizi wrote:
> Bedirhan reported build error:
> ```
>    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
>    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>     1649 | }
>          | ^
>    cc1: some warnings being treated as errors
>    make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
>    make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomisp] Error 2
>    make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Error 2
>    make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
>    make: *** [Makefile:1868: drivers] Error 2
> ```
> 
> Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
> remove useless returns") incorrectly removed a required return results
> in the above build error. Reinstate it.
> 
> Cc: Pavel Skripkin <paskripkin@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
> Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remove useless returns")
> Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
> ---
>   .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8e085dda0c18..1bd917e81743 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
>   	default:
>   		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>   	}
> +	return INPUT_SYSTEM_ERR_NO_ERROR;
>   }
>   
>   // Test flags and set structure.
> 

Hi, Ammar!


Thank you for fixing this, but it's already fixed in linux-next tree. 
See commit 05344a1d2ea7 ("media: atomisp: restore missing 'return' 
statement").

Again, I am sorry for introducing this bug :(




With regards,
Pavel Skripkin
