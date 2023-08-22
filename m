Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 070D17849DA
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 21:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjHVTDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 15:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjHVTDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 15:03:18 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA82CE5
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 12:03:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31aeef88a55so2774258f8f.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692730995; x=1693335795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4y/tYkdfMEnG/r7NsnV0Qpgrj3K7aEmUSWBwjIvA288=;
        b=gH30mBjXx/T4x3/bbNoWtSwhINjghjbmI9J3A/nzdQk7ADWBsYoMeGxaOkWrgRZh5q
         LXfOR16LnDy6vToem6yQuHi7J7YgaF8bmiLd4CW35bHRCdISaZNllbLfixZzZWC0yaLw
         f8dueIJtEmh44GDIQOm4Pgz1c2Dc6yJ9mAk7SmtDi00s/I+6XfruxLK0XFJU/84qEeO3
         hV8v1ooSZ11Wfp3TEHrWGdCmOP4/7LyEHPp8XTgF+q8XkRyY4h5hcpG5ApwChl3eNp7i
         RPjlIu5ZDtx3lu2/304BpDKhcaTPucOpbhkbWZQRkzFKTzJZ7as16zN4t/sn0WPhUOQT
         FDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692730995; x=1693335795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y/tYkdfMEnG/r7NsnV0Qpgrj3K7aEmUSWBwjIvA288=;
        b=SUmTN+eJ0I1sgMhYO00VweGux4R63JFvcjUJIWMRj24zR6WQ5gp4Qc2kLqqjRIrKbL
         MQwP4X2gLwEw1caCfaQcyYl5eZVU96KC8NTBg6QpNE9I4FF+vGQ17PnVP2TMVZaTwuaG
         hME+8Ht8noog8Au3wAwhFP7k4SXNQvtS+rcBoES4TKsBJvaduxnqKoeUZCUQaN8A0+HO
         lsb7CX9pZFdwmC4m+NNjiIZZPDhANqEnra+m0qEiOhUG7vivtuO0eRm0C7zdpuJcBYyQ
         nCjR74+KuUeR2Gm41vlktv+cF7UPsJ/JL16xy5Q4ZwtQQVSujUgcV3H8WTEHvjj42Q/v
         VlDQ==
X-Gm-Message-State: AOJu0YxJjIQF3je6kWgC6hEL7MtocLoCCoIUDQOxjbFOcbHsVbozG6wP
        +Hk5pDPTx1JiEM0l0X+HmBBN/A==
X-Google-Smtp-Source: AGHT+IFHh+2nHJ5TWX9xOp6UY9xKwnPv1pEu9bofMmPzz2hsGeObe/yNVv85n8wutMxEIwnFylCjTg==
X-Received: by 2002:adf:db4c:0:b0:317:6314:96e2 with SMTP id f12-20020adfdb4c000000b00317631496e2mr8986014wrj.14.1692730994912;
        Tue, 22 Aug 2023 12:03:14 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm16577518wru.54.2023.08.22.12.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:03:14 -0700 (PDT)
Message-ID: <b5b3a8a6-c54d-c503-db76-c8c38942b3b0@linaro.org>
Date:   Tue, 22 Aug 2023 20:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE
 when VC is greater than 3
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230822161620.1915110-1-bryan.odonoghue@linaro.org>
 <20230822161620.1915110-9-bryan.odonoghue@linaro.org>
 <5c917927-92ed-4139-a69f-95761ec63c83@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5c917927-92ed-4139-a69f-95761ec63c83@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2023 17:32, Konrad Dybcio wrote:
>>   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>> +	if (vc > 3)
> I hope you don't pull your hair out, but I think GENMASK(1,0) could be


I generally dislike the pattern of 1 << value in this code but, it's not 
something I'm proposing to solve at this time.

> in order here with a comment about the bitlength requirements

Not parsing the bitlength requirements comment, whatdoyoumean ?

---
bod

