Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6E563FCA3
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 01:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbiLBAPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 19:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiLBAPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 19:15:23 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72756CEFA7
        for <linux-media@vger.kernel.org>; Thu,  1 Dec 2022 16:15:20 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so3039338wmi.3
        for <linux-media@vger.kernel.org>; Thu, 01 Dec 2022 16:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2D84EDouCN7XmlWSTUGW7hZGoW7CEiKcZAnB/6kbQZg=;
        b=sjkMf0YANbCPnmejOoRiY67Rnvbxce8lkLzcBoMPhrpCgQgwVRfY5EVVGfCXtXZOBi
         EWvTaKAaeXMLMS1rRhh5EVUy3JgalPz5joSv8+6HuyaEPDlooXWJrto4w4//+/bJuCMH
         +FhlAeIV1EWJFfarH5/qur6N4ru9exnjG3RHkGdGYsEjM5Us8dNJBgpc3gS5PdXczRxv
         VCO2PSsbEd8/yjAxCcY+VK+2Qo3S2Kyyb2DUkGmLZtDSdrFMoBwycklLxuH5KbzYyUP0
         b5TpH5QPjOx8IcBiw/pO57wXQdUnW2IsvV1wIS1KBmSKL+eo07c7ZSuhrVIaC23uyXA3
         owTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2D84EDouCN7XmlWSTUGW7hZGoW7CEiKcZAnB/6kbQZg=;
        b=NFriJ3Kc8yb+NjWabQYYyNuRtsyi/u/3s6/EkwvA8BNFEFWEcaFgxUf5jzlUqgooYU
         ntdrTeVcr1ADpe9Y2Yg5KCkqMurpO9W5W3KRJXrwrcBCAbI4gqmNbH9PaB9LMZQG0PLd
         6xhzstFyd6J79BuOfB2OQaZKFn/iRH8upCrjKNhe3wA36jN2bOvL/y54WaDDKKLkvLE1
         HoJrD7oYwuWat66fsHEoaiSP28QQTTQhBsY8vTGP/z+/q3d+dhkN7d0f7jkn+a53tSGz
         AtL+481gCtAzWvF4Vi9236bWlPSs53o5PyG8J9u+J20M7IwPvr8nq3dNkmZfH7Nxqqc/
         FvNw==
X-Gm-Message-State: ANoB5pnwyQ6bAc916efU37cWoPgw3bTVn4EU9hUxgY99YUG6xJHFQSf3
        WshEsw1yN9aF1O0NYIUVTRWGvg==
X-Google-Smtp-Source: AA0mqf76PeXFg50mba5VYWHoMsTeHj4rX99gZcJIpf3mh613Xs2Ndm9FSkrA0U78/QrBXRhZWSwYOw==
X-Received: by 2002:a05:600c:3514:b0:3cf:a985:7692 with SMTP id h20-20020a05600c351400b003cfa9857692mr43478064wmq.104.1669940118987;
        Thu, 01 Dec 2022 16:15:18 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a1-20020adffac1000000b0024194bba380sm5751873wrs.22.2022.12.01.16.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 16:15:18 -0800 (PST)
Message-ID: <39b9bffc-6d1c-a052-77a0-86880d1859e7@linaro.org>
Date:   Fri, 2 Dec 2022 00:15:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/4] media: camss: sm8250: Virtual channels for CSID
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
 <20221128144210.1028-2-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221128144210.1028-2-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/11/2022 14:42, quic_mmitkov@quicinc.com wrote:

Hey Milen.

This bit here is racy.

> +
> +		csid->phy.need_vc_update = true;


enable_irq(csid->irq);

ret = csid->ops->reset(csid);
if (ret < 0) {
	disable_irq(csid->irq);
	camss_disable_clocks(csid->nclocks, csid->clock);
	regulator_bulk_disable(csid->num_supplies,
			       csid->supplies);
	pm_runtime_put_sync(dev);
	return ret;
}

csid->ops->hw_version(csid);

csid->phy.need_vc_update = true;

You're updating need_vc_update - after enabling the IRQ.
Its a hypothetical bug but still not thread safe even if it has no 
unintended side-effects we should initalise all of our data-structures 
prior to enabling a potential path of parallel execution.

---
bod
