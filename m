Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D6A5ED325
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 04:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiI1Cod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 22:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiI1Cob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 22:44:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F71C10BB35
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 19:44:30 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x18so17632132wrm.7
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 19:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rfeEWB4hqFKVwU0tDlUbuArLHiWBlS0F+9pIIWEw9wI=;
        b=rxZXmG7UWBw1gZ2z03EWwBL0ckA3lL4NZInsFTN1soCzeK+XZlTTjpXU0LLOIQ8j7p
         OC9e2cwWYXsp3S9Z/bMhhFl0wP/Xq98LGu/VBihBZjHEjEaFsUejAqwFzUSyikklApAX
         e85ScxlBo9r6kE+YIq+/SElCirrdNpGHpHYjzJQGWwrD6Kn5h0QiGVuzM76m+YtFwUQ1
         RVRc9r+oTK+go4cQ0aIOITzuMpbaobZxB8Oc4iw7brQGifbA/5sO00sotLXvXs/b0B7L
         bBon7gxU++fSmFMfYqNgozF18LFvgZpKB9Y1BsGb/5gIQUR4/h1VHruGlWhoaLHAyVs/
         eWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rfeEWB4hqFKVwU0tDlUbuArLHiWBlS0F+9pIIWEw9wI=;
        b=LzblTd2g5V65L1ZQpZEQJzdogQ1fKISKsLoTU72Hg5omYuOHJAGiE7gBiJ+5FLKisM
         E2XfUyHKLnXig+nGOX6mB7I0Ve2+9znz2vIqFfs4KBBe1Zz5tvTfL8OkrOWZ6GPBxHtn
         tG4AdGT11iXXIWyScmElPRNFDpuNWCBPN3ozULagvRsXtWCiOSPH4BauGn/DE4ETieZp
         plRv4iMmi+YwWSr/U/Ko/al2HOQbtKBhhsm6DdYD59J3q2McrIqnClCegw8hngxaqkhV
         BoGcaS3ZPQtJPI5nMOSmoekUirT3+6L4t7OwfWxCmjSpHwYRWITd+9UN5PdiXXu1HK/p
         JdUQ==
X-Gm-Message-State: ACrzQf3FGQwRPXNEzmA5JoZBMtjL9atApRrqY1dPlNp2ufIquaQ3Q5CG
        IXlPZJ3sEdbSd6HgyWuIYrAq8g==
X-Google-Smtp-Source: AMsMyM60CMzWJfpbSeKO09y6k/LLbXFoORwyrFn9Nc7m8SzSVvDZpJsxDfFQOF99OCiXpZ0wYokd6w==
X-Received: by 2002:a5d:4342:0:b0:22c:9161:7776 with SMTP id u2-20020a5d4342000000b0022c91617776mr12245359wrr.228.1664333069025;
        Tue, 27 Sep 2022 19:44:29 -0700 (PDT)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020adff252000000b00228dbf15072sm1213525wrp.62.2022.09.27.19.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 19:44:28 -0700 (PDT)
Message-ID: <ee5fa2f9-c3bc-b903-014f-ed5fea064f9f@linaro.org>
Date:   Wed, 28 Sep 2022 03:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] media: camss: sm8250: Pipeline starting and stopping
 for multiple virtual channels
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com>
 <20220926142505.1827-5-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220926142505.1827-5-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/09/2022 15:25, quic_mmitkov@quicinc.com wrote:
> +	fmt.stream = 0;

Thanks for updating your series.

I downloaded and applied but the above is generating an error for me on 
linux-next..

Its probably because its late/early but I don't see which branch you are 
working from here ?

---
bod
