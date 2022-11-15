Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A2B628E27
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 01:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbiKOASj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 19:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbiKOASi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 19:18:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD26763E8
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 16:18:34 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id w14so21403125wru.8
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 16:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vINRtfn6z3E+dJUcb2ULBe4uIz62ELUPVczIYJcDNP0=;
        b=oxZlVOKKnM9F7iabaPwwDM8tISZOpT++JMY8TD1BQZmIX3WNZjy6JoQIjBZr2H6Dd4
         RGNggdZkcksxu/b54zZJC6iNvC76LbZfUpvel/2K8YRc8VQchAa5eOcseb9GJJRtpZEG
         taR4d9erfpIpj+aW9r7ZL5GLBTpyoLYSjM1wM3E2BU9ru+ur+qIIrbKZOP9OFLalVUI+
         gR1i4K77s01ZrdytoKIo4g28XqFv45RH4bpdNvicsL83wi9CAmKHBNVZyPgqtgBjv0Sl
         J0QclC+OT6VcKiT3CHLeoM9cNTToQt7HSC0xnXaIk0D/1rZkTYVJd/d2yrLz5JCqJV9d
         nlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vINRtfn6z3E+dJUcb2ULBe4uIz62ELUPVczIYJcDNP0=;
        b=gEOihYgZMUv/0zc1rCSlecXdoS/vC8E3uq5sAuzRFgwBcRMaqx7NII8MV6mFcGbpVl
         E7fUVTb+Lm+i0y1RH0iw3SirRsdOIEwgJpRXMh0pJ+01PMHDCqtioyrmNJfPrL/utqge
         kixfsaHmpeTIXNfB1hz59YZqFPH8w+xv8B/i1ZWbSdr8zs7Mvlzki2zlSJXDERBxaWUY
         YoOG4zn6K8OVrSvbcvzZFPAORXbzugYEh1+p8svg/iiAz32sBow1sPTcGObUqraRm0kw
         th9snqtbK9Ae12xDyOER7Hv4bM/21ohUJ5RgBmXEoOOovlZvJhft4616w1RGlmxbpuVg
         3aWg==
X-Gm-Message-State: ANoB5pkfyabZreEJ+LqetjAsNm8sPJAiVbSBVvh7BG9oFlXQaZDX1qgs
        TyT3ue13SIJ2zFv+58Pwu1UzPQSRAGom/A==
X-Google-Smtp-Source: AA0mqf5MxXAPtzBuOLQT3qS44TsqKsMn6N6eJVG35c+m9XczzHnUmHpkG2e9NkdqNdyldSPjpM9w6g==
X-Received: by 2002:adf:e38d:0:b0:236:78cd:f3d2 with SMTP id e13-20020adfe38d000000b0023678cdf3d2mr9498001wrm.719.1668471513384;
        Mon, 14 Nov 2022 16:18:33 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d5645000000b0022da3977ec5sm10718504wrw.113.2022.11.14.16.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 16:18:32 -0800 (PST)
Message-ID: <8ee87f1e-52d0-7c38-db25-339879f7448a@nexus-software.ie>
Date:   Tue, 15 Nov 2022 00:18:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com,
        hverkuil-cisco@xs4all.nl
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <46d82762-8b6b-8a3e-0bdd-5598163244de@linaro.org>
 <CAG3jFysAfymcFS54CyxBYhJbQ4Qh7bvhpE8UPc3S1o_8uQq7Xg@mail.gmail.com>
 <a4364e85-7970-d215-17f2-d5ff9a3dbaab@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <a4364e85-7970-d215-17f2-d5ff9a3dbaab@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/11/2022 17:18, Milen Mitkov (Consultant) wrote:
> 
> Do I need to resubmit the patches with the added new tags?

Not the committer can do that for you.

> If this is not needed, is there something else I can do to help the 
> merging process?

It looks like Hans has been merging most of this stuff on the 
linux-media side.

+ Hans

---
bod
