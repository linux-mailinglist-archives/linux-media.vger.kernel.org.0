Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8259D62C546
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbiKPQrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbiKPQq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:46:56 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D9AB7EE
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:43:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id y16so30834459wrt.12
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mg8BLiZDIrzFPjEBwBabss46gMI5R4ZVMU35uXlxBTI=;
        b=KnJCcAVeeUt+Fp6/dBLi9wQ6HmYy4ECIsa0htd/xLYsi0wV4oCcQyxg7IItoR6BGi+
         8tfSvt/eb/KCS9MXTHQhfmVU7UrOtUrewcsq8jO8AHepF/J1TFgImgFxX4K3ZD7tPrko
         4LYKkSSVqWxBlHZj1MtD2cuorY/+pCKM6PwYog6tPSHqAyqIc2bZ4o7ZjcB8Wpxi+lma
         c6reVYAO0UFzN06dGWd/qLDX1TV7G6KEmvwbwVR8U5qC6wolEUZW+Hd1O3NICjd4kEt8
         1vJLL5rHfKBnBqvM27mvou/9rvIuDEjHDc8VMJ/mC+bTaJChPXebtdgTmY+T9rpdohUC
         x+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg8BLiZDIrzFPjEBwBabss46gMI5R4ZVMU35uXlxBTI=;
        b=OWLQOUf5aBkETaMyqeX3T9P0EU/9ZZcIsy1ejjxlyq8QTtRT1Ouhrr0W7APxQfCH7x
         /0WpdesS18R7FTX71iwwl74XWhT5D12kTHqIvse8GN3t8csEdmXoqo12O6grn2mEHT26
         EUKmjATj8n6OXn/pFoCIea3j/DfUEt65SY7sQZOlWq0MkU+W7ZouR2aBSlkjXZdhxR8X
         iz2XqYTLefuT0Ylsydp+FnOpDqW2GAUP4sILzZb5E6jsLiH5cgtHeflw8CqTsvPFEAlP
         hpBXkb9uVWR8ippTY61FIW68torJHWlJG5MgSMPDGAQEvpmy4fAxkbekBSiOXy/5B3ZX
         gQHQ==
X-Gm-Message-State: ANoB5pmuaJOiyDAPRiDjZlYhFI/h92h7br5XfABdKA5Vg+6+liuiVZM6
        C0jxxhcR6FsAGOi4pucG+Kgrow==
X-Google-Smtp-Source: AA0mqf67LYFft+QXALi0Jd02t0VVrQxSWwTomK8ABv/hJAyUdTyZxAU3mSFgojXlQs4DZjMVOpvqCg==
X-Received: by 2002:a05:6000:136e:b0:236:783e:5947 with SMTP id q14-20020a056000136e00b00236783e5947mr14185234wrz.168.1668617008098;
        Wed, 16 Nov 2022 08:43:28 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p6-20020a1c5446000000b003b47e75b401sm2507531wmi.37.2022.11.16.08.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:43:27 -0800 (PST)
Message-ID: <6fe6723b-842e-7a56-a15c-6b7e044c7d45@linaro.org>
Date:   Wed, 16 Nov 2022 16:43:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/7] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, robert.foss@linaro.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-6-bryan.odonoghue@linaro.org>
 <730467dc-419f-bcb6-c4d8-24951b4dde62@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <730467dc-419f-bcb6-c4d8-24951b4dde62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2022 16:39, Konrad Dybcio wrote:
> I know you're just moving things around, but.. any reason this thing is 
> still disabled?
> 
> Konrad
>> +
>> +        port {
>> +            ov7251_ep: endpoint {
>> +                data-lanes = <0 1>;
>> +/*                remote-endpoint = <&csiphy3_ep>; */ 

Because so is the remote-endpoint here.

---
bod
