Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07ACF6F6DB2
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 16:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjEDO2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 10:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjEDO2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 10:28:32 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76429018
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 07:28:14 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2f9b9aa9d75so404808f8f.0
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1683210493; x=1685802493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeYBoTOUVqJj803Ofa1fS+lSuPAgR5WnQRE3r1FG7lU=;
        b=BSHwV5QrhS+DbQpHCP8+VaWtrikezygTm6Fh3fInKLZ2z6ncleQl166P7CW3qesgtQ
         hVxyBYWY27Fz7feLW5IMVnXEoO24Qa/j4+JokhnGw6b1kiAhVlrDfV2+HoJ6BF9CNJyA
         81fg4cFwNu2JvYUmDrqqvdpm7IgjjT8PQe87ERqKzh/ixQ3Ga2q0rsvRycgzk+OYgkRa
         sj6utuHisHOe7vB4UXe8nkesIjI4aeXu6IH97Ag3o4NCyTMX4OOcWMQxJd+LZRfmrRw4
         M4RPhfjekhDMs1zsEK0IEbXQfOxRQGHLvFAOAK7zcNY6TVFwstYu4lnvQxDsy75pZDkf
         1ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683210493; x=1685802493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeYBoTOUVqJj803Ofa1fS+lSuPAgR5WnQRE3r1FG7lU=;
        b=VC/PJ2fLgyNg8MFMCDZTBC/9ge2v0UZ9DOuV4mkf3NWsQkSjUGtNCTFEdl37/0Iblt
         T8vYZqmJD+A3B13UTwnnnlhkk9WBj0D5F8+P3oxKqiTp4K56/rYP4PsTpEZg0OXkaXnX
         DHVifoIw9zQNrmOJfvhR1ne0bqfNNUQPPkjdm632RFXw16ISk0NUyiGVTFoWGU2GhmOg
         U725ktY3MpuAtvmnYJvFkEjjJNUygZQ6qpQpaDNCQtJmsbxT544VaFfT8lpxC0vXQ6tn
         IC++nPT9uyV0lrGhxpNx2jGXq1nDQrVZYuUVvZNoxUcVc+VzjzDi28K6ZTE0OvJ08Lxn
         qIEA==
X-Gm-Message-State: AC+VfDxmeepvBBTzE2TkQvbik5FansXZ1p+8c5ZwimOiQUoRu1597uq9
        2SptVR8Gg4l+0EjCKv+5FkGsIA==
X-Google-Smtp-Source: ACHHUZ4yZAMzfPUsO5Y9Mfbn5+au6koMHjJ0U46skIVR6HdLMxX+NXOuyrw+epY+bOVC2QPZOmWeMg==
X-Received: by 2002:a5d:564e:0:b0:306:439e:e6c with SMTP id j14-20020a5d564e000000b00306439e0e6cmr2857959wrw.49.1683210493322;
        Thu, 04 May 2023 07:28:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u6-20020adff886000000b002f28de9f73bsm36996749wrp.55.2023.05.04.07.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 07:28:11 -0700 (PDT)
Message-ID: <b79dcf81-2eb4-c376-e1a8-e947ffa6c70a@nexus-software.ie>
Date:   Thu, 4 May 2023 15:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] venus: add support for 10 bit decoding
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1683196599-3730-1-git-send-email-quic_dikshita@quicinc.com>
 <8df7f24b-9dbe-4491-bcb1-f53021bb482f@linaro.org>
 <66b8e665-1038-127a-1f4f-20d8fe7bcd8e@linaro.org>
 <facc9800-6af4-5cb3-bd22-b22b2250090a@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <facc9800-6af4-5cb3-bd22-b22b2250090a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2023 15:04, Vikash Garodia wrote:
>> Doh I see you did most of that - just missed the V2.
>>
>> Please remember to version your subsequent series. "git format-patch -v2"
> 
> Does this qualify for a version upgrade when a single patch is 
> subsequently raised as series ? IMO, the link
> 
> to previous single patch in cover letter and then starting the series 
> (as v0) seems to provide the required info.

Hmm. I'd say any series should have an increment in it to differentiate, 
with the exception being RESEND.

Also you are splitting one patch into four.

Looking through a bunch of email it might be not immediately obvious to 
understand that the new series and old series differ, which is IMO how 
the version numbers help others to know what's going on.

---
bod
