Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9597163D9E5
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 16:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiK3Puo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 10:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiK3Puk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 10:50:40 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11702EF5E
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 07:50:38 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id m14so3816012wrh.7
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 07:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXhbYvy4H5QvUM6NxBfKoGCWk4GwJsMW9bC30ZXqwhU=;
        b=a7QrYlCyJIghi6T80QBMv2MrI3UHznrpaIgTemAQDZknsIpVldxp8lYeh8dIyyLA2+
         KhPMur3ls1xjbxHuIkXK4EWrNWqR1ftbJ3HAtc3Tt1DW8tFy00Z65/91cKQAPbnxKDmm
         wQM0pyVYWlx0b+Yu3Sf4r7LqQ339WaGjU07h+WzghLg+85ilFtjR9cmxD/Ww5PucvG3H
         2NcOfIVd3sox+OfnsuEvVQGEd2LBYrNQU4T/YkkvC2LXQJanwMrtzhVUN9W0MEwxgEWl
         D7zWh/L80PxlNB06B06b+2CCHwW+AqRuGITrHJqH7D8EH+3chFIMeF1dIwFFJKmvhxfF
         x6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhbYvy4H5QvUM6NxBfKoGCWk4GwJsMW9bC30ZXqwhU=;
        b=I4wEa00VKzpsVqKmQ2Mb/xpaBnQVXQ8K6Eu76uLxHzvyNX9hzYkqkFtyYXFDyOAjmq
         pdy7Ueh/lM5yu3MhX0OVJn2sx8MGI2+qe9R5rezVypAUBtwjnN6he80Tv4xeNf2ou+ip
         /nxYXlNo9i3gyueHdpmyYVAOMafnuX5+cXKW0Oty7i3kWE5RO2cVUsFxYV87TTOGoJV/
         aaqrU7FGOrmTtBdey0cP6GwYprcKUPjchfPaez2DRC+6wg4ar879WnU/ht7ByXdIMC6d
         EkDuJqYkZ8A333VYRzwr9SIwSOVK68H8/BxhTbEeRU7U6mTErl4pICkbJfusscS/3GyT
         9EPg==
X-Gm-Message-State: ANoB5plLA8sEPBoKdl8d4f+alZlKAOs3GSkckdGJdit+s9NxUguNpMET
        9w2jKoEWIATJLybGHmce8809yg==
X-Google-Smtp-Source: AA0mqf4rIH5dJe0EYvW4VRVj/J9Hl0mWMwmLzujwaetmCGdkLTyFbigThGpimjny8jwOLSOPD6uJmw==
X-Received: by 2002:a5d:6b45:0:b0:236:7a1c:c41a with SMTP id x5-20020a5d6b45000000b002367a1cc41amr26960805wrw.680.1669823437119;
        Wed, 30 Nov 2022 07:50:37 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b003b47e75b401sm6795179wmq.37.2022.11.30.07.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 07:50:36 -0800 (PST)
Message-ID: <32736286-9fb8-a1f1-31cb-2fd19d713e9e@linaro.org>
Date:   Wed, 30 Nov 2022 15:50:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
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
> With these changes, the CSID entity has, as it did previously, a single
> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
> virtual channel configuration is determined by which of the source ports
> are linked to an output VFE line. For example, the link below will
> configure the CSID driver to enable vc 0 and vc 1:
> 
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

Following your instructions here

root@linaro-gnome:~# media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
root@linaro-gnome:~# media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
root@linaro-gnome:~# media-ctl -l '"msm_csid0":3->"msm_vfe0_rdi2":0[1]'
root@linaro-gnome:~# media-ctl -l '"msm_csid0":4->"msm_vfe0_rdi3":0[1]'
Unable to parse link: Invalid argument (22)

?

---
bod
