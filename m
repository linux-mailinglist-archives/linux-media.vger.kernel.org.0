Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE6B77E969
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 21:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345720AbjHPTJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 15:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345712AbjHPTJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 15:09:15 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A342721
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:09:09 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3197a71a9c0so106627f8f.1
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692212947; x=1692817747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09PKymi2INrdrlOMABU+GEUt5jt78IgIuvixujEnKUM=;
        b=vRWRLII6GKEsk7DVcD8uEi9WUCy+goBHYUKeOGlYF15KCbc2bwu37qSuMHzMrqZb70
         w5ZRlk+9Cs1N0YFpNBqXxNnOgPr3lvnaKA9dvFdCnvDp1H9aMAirBIgVX/c4KQzp2JOL
         vBiXFhg2ekRvp+0uIMBac+tCKUSICTgLSJSBlxl99+7YkoYhQFmjlReC67o4T8ctSmvX
         7hnakN4JPZY9ymEV6hRX3GXLHWgFU9nGluWvbjR2VmkUlR6ctD+3pwQscvmDhfBEGpsB
         bIegSmJbJguUQ4sxpwVf7NtDhNT8EPBPtws9cRBWOydUnA3uwHIBL3RdsP5IND6fNQ7i
         Ss1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212947; x=1692817747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09PKymi2INrdrlOMABU+GEUt5jt78IgIuvixujEnKUM=;
        b=bM4NtQPl710vBUxBMrllz2z9rjyTCwYzC+tpMlnHNK2srEAjUn/5uAXe/uCndbq52/
         S1cH5qCx6p8V/DDCpLdjX9eQW0DiYg09PMQN1/BTvZRSvL7rS7+DiHNASRNPedsGXpWU
         3dmkdmd9i4n/BEZwg0mlssK8y2t+8jxqHgUUoexpi0MKPQJG7r0tDMXdlzjXP3Qhena1
         TDgz7VMeDSO44erfAcuPOsYD6Ks17YKkZa580ZuEaRdCKu3jWBKUPjNbTnoM0NDL6PaA
         CJq7IRFCToqR8eZBdxx38giiydW94iXb/NxxWhqP1dx3QfXxDUxie70Lu8e3phELf0tE
         h4Tw==
X-Gm-Message-State: AOJu0Yxaz+s2neU5B/Q0WPAwgyqEYzWwLIwoRrWqX1mGe7Mms8V15zpd
        RBVByWKtiO/qNBGild1Y91LIoQ==
X-Google-Smtp-Source: AGHT+IFHhd2ahj51VAR9JLJ+iyux43T6WsIdy2vxZYFdi6uZTG4tab97q9GBhPFtAwOZyRek0RsH/Q==
X-Received: by 2002:adf:f805:0:b0:316:f4b9:a952 with SMTP id s5-20020adff805000000b00316f4b9a952mr360625wrp.31.1692212947623;
        Wed, 16 Aug 2023 12:09:07 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c280900b003fe539b83f2sm259821wmb.42.2023.08.16.12.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 12:09:06 -0700 (PDT)
Message-ID: <5332efa6-621c-a338-09e7-dfcc86f898ca@linaro.org>
Date:   Wed, 16 Aug 2023 20:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 04/14] media: qcom: camss: Pass icc bandwidth table as
 a platform parameter
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
 <20230814162907.3878421-5-bryan.odonoghue@linaro.org>
 <eaed15ca-5c0b-420e-a11e-007ef5608019@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <eaed15ca-5c0b-420e-a11e-007ef5608019@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/08/2023 18:20, Konrad Dybcio wrote:
>> +	icc_res = camss->res->icc_res;
> Would initializing at declaration time fit in 100 chars?

Ah yeah, that would be nice.

---
bod
