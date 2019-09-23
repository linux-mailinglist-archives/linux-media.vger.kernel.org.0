Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62650BB936
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 18:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387909AbfIWQNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 12:13:37 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35203 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387827AbfIWQNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 12:13:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id a24so8277014pgj.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=apbBXLECKeCr2nfHMhDarwOs2kmb3BwARUfU7rCAU0Q=;
        b=c+kf3kCpGiWQ+r6yoJHpmwCdo1HOtkUyu2BhzHUSe/3l2DBNFlh9igGK9fhm1ViKY/
         T6XlC0n1rEh3hT3vybfjQUqDpNtkp7LzC+d1ishrqLQx+/HMgNcrSQYdEaWG29DFHVA+
         kZrhIyfTGEQq7r5MwOiQWn7rFA8cjs4XQOwyd88vsPTAV50hdZGsHD+epUiE5ZmgCF09
         8v4pRmNn/+24lfWBFqOWBHDaCKmp6ufnRccuBzmVqOyb8CrbzlADlZkVLgmLs+dBZtBO
         Vu++sFKD9gxaZOMjWOARkD6lGHs/Qzrd4JWbanTQ3NQJ+DVOz0rcMLtlVxWdryyA+SFO
         u/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=apbBXLECKeCr2nfHMhDarwOs2kmb3BwARUfU7rCAU0Q=;
        b=nhNmglDhIgyiRIyn8SY8QQMjP/8rvG7eD9fIZOZr00WUsN5btfvVdkTVRa+S9er5ys
         xXd9WmJMfhqwRp5HB1k97ZyYFTqiwNphv+b+UpUeMdjCyQ1mlTx9yJbLHH5iy//jEza6
         4HaC8+3tXptqgShH+OowM+g3k8e8g6Tflvaas56oeOWjfVNZZ56qzPAq2HdnD7x7/nPE
         VYtynH5LwfmHt4azdxHOgW4GgCufD98isR+DQg9kQIldqmDGJdo924vDGXYeaXZCurUx
         M8XWLhZCwUIvA8s07b2BTuwaTQj1dHnf2vOa6YBtRgxaJ9jv0h62J0vKtW7vETtDN7XP
         YGHg==
X-Gm-Message-State: APjAAAXk8Bv3GswPiHKeTsVIsudzhqgXtnlc7qk/eiF36+aO3498x2h2
        Ae7NjhlZMektn+2BTXn+29EB2fCAnwnUnw==
X-Google-Smtp-Source: APXvYqwmxfpSG0n37lJ/39jg2Q9LO+VPYs9m169xlU+lsFbVsdtVasfIflPpJTeYKXay6R+AlPjv7w==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr425542pfr.48.1569255214865;
        Mon, 23 Sep 2019 09:13:34 -0700 (PDT)
Received: from [172.20.34.69] ([12.157.10.114])
        by smtp.googlemail.com with ESMTPSA id k66sm12421560pjb.11.2019.09.23.09.13.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 09:13:33 -0700 (PDT)
Subject: Re: [PATCH v2] media: venus: core: Fix msm8996 frequency table
To:     Loic Poulain <loic.poulain@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <1568213159-7828-1-git-send-email-loic.poulain@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <cb608b5c-e31e-5e4a-5f60-51f888347ede@linaro.org>
Date:   Mon, 23 Sep 2019 19:13:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568213159-7828-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

On 9/11/19 5:45 PM, Loic Poulain wrote:
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
> in encoding scenarios. Fix that by aligning frequency table on
> worst case (encoding).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
-- 
regards,
Stan
