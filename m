Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBC1778912
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 10:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbjHKIlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 04:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjHKIlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 04:41:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27D52D61
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 01:41:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso26321791fa.0
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691743295; x=1692348095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+NSvmyecR0AA67O5qT8+rvxVYE/YooOcFFLOmqkxFk=;
        b=j1XioGwJPTfOdYSkg/8y/rfj2DeMi4UxADMDw1pDCAnm1jCl9QXLpqpLKVa14PgQx2
         wmeYn82PTkfrBejDYgbgicgrtZtPsPQ/wqwie0wvMN8zzvd1VRDO6+QybUrVhivSJsjA
         0XQ7aBu+kQxZOEowIDzNIoMrzuH2LH0jDjIIJoGpSRe2rwWpzoLGt2qq7/1BRTh1mIY0
         kTfTeeVumJ8cVZCIu+1FsrzgLU79i4KZJ5aI3syOXhmZVMG2X3BYQzfBvMJAcib/Xm45
         REQoyZbtqgYjx5qu8azxdI8wWB1ws+yAs4jplV7PXfr/gH3njsdcaQWQouklSMXnohkY
         99rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691743295; x=1692348095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+NSvmyecR0AA67O5qT8+rvxVYE/YooOcFFLOmqkxFk=;
        b=XNFJcm14GzP24SWmunAx6ScG7RubC3cVh7CYdMv+OhuaYVw4iRVdJmAmNUBD25Lnjr
         HL7PzTfhJeZrp5VgOL5Ts/GrNEHkOSvOuwYrjhVYfo7AqPrvyUI5sO2Q5wh0921shu3E
         WcL/YnxtgHXBwsiGMjwKlI4szgRTA+VMcQuqOJ+ExHcWTP1JPHj5hfD6ieuoS3PgWK0/
         GKlZleVKfFlRrKIzsmOayqbjq38GiDqeLB3GK7s1q7X52E85kbos8T0P0Js8HmS360bu
         Njc/GIiKGPKpI09DiPJFzuFKljGV701EOXpjQPYk7YwaLmxzuWzDkvMxXjAQwptM3Zc/
         hMWw==
X-Gm-Message-State: AOJu0YyeN4mjrPQkzqsH18Vgyh6i8kKOyS01RbW75jhV1uPdU6ABV2CL
        0eTU9kD77qZTJgN56hen9wGeyg==
X-Google-Smtp-Source: AGHT+IG1P7gw+e7ixivnmr9ePqvYMWrt397ZiLk0RdpXHw4+IGFY6zH89HJsNUbBBGWicP2Tty6fZg==
X-Received: by 2002:a2e:98d3:0:b0:2b7:15d:24 with SMTP id s19-20020a2e98d3000000b002b7015d0024mr1135122ljj.41.1691743295029;
        Fri, 11 Aug 2023 01:41:35 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003176c6e87b1sm4693455wrm.81.2023.08.11.01.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 01:41:34 -0700 (PDT)
Message-ID: <e763934d-dd4b-9cee-9992-eb24dce0435f@linaro.org>
Date:   Fri, 11 Aug 2023 09:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] venus: hfi: add checks to handle capabilities from
 firmware
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, tfiga@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <1691634304-2158-1-git-send-email-quic_vgarodia@quicinc.com>
 <1691634304-2158-4-git-send-email-quic_vgarodia@quicinc.com>
 <59b61d65-a827-d252-cdc2-a256f99cb4d9@linaro.org>
 <a1713beb-e1bc-4118-ab58-b5d8e7fb3cbf@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a1713beb-e1bc-4118-ab58-b5d8e7fb3cbf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/08/2023 06:54, Vikash Garodia wrote:
> The case is all about rogue firmware. If there is a need to fill the same cap
> again, that itself indicates that the payload from firmware is not correct. In
> such cases, the old as well as new cap data are not reliable. Though the
> authenticity of the data cannot be ensured, the check would avoid any OOB during
> such rogue firmware case.

Then why favour the old cap report over the new ?
