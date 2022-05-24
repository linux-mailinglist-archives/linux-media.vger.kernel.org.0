Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A60532F2C
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 18:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239636AbiEXQom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 12:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbiEXQol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 12:44:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D82427FF
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 09:44:39 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p10so7905540wrg.12
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rwol75CyD22GB+azy1Wfb8UM7WKUYecam29j0+8w0Ds=;
        b=AcYNkjrduWPhMPZ9eJMqBTw39Am01PGf/zmGJPTUGgbAUn87jaKs/ueKmdyGsfZVnn
         O56OtEvddGE+Y/w7Rk6YMRm/Ch7fLM3zN84ngKys0xL39qiY+kNirzmMoQ27iQQuG1BP
         1ZU/75TGmGS97T10Gb6roP/OvW5XxC7TR6yIvgsGLV4N9sMvpicXph3wHok//4xSbXSQ
         b0POhcs7UXUn+0Toonc5tyAE/5GfQ3vtY41pQ1yEGsxeuLInH5f2VLrI6vj9nkMC3gik
         FCdcGRwNOER9zYFEiBkmLqAftjCnmv79ntDGZoHjzUerPfbq1OWg2Ie6+QdvwvujTXjO
         DcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rwol75CyD22GB+azy1Wfb8UM7WKUYecam29j0+8w0Ds=;
        b=DvkcVZ9NFAw0nMB7ywEuBu+UtL8HnwdJvP06qTY7krapqjmqooZ/I/pamBCzHVhkrT
         rc1lG90hXmJaVprgoZ2W4zxz4LEzh6VjELz6MQwdy0R9Pu1HKkUZpcNJoWig6paQEoHw
         N2GPJvWFeX7uT7jcstpyWauHDkt4XVi4nUZgcOsrtrI0cQSTyMikrNR6TvR++iEDs+5p
         B8sMewfTmY3K5D7hA34LxjfbvLH93YdyLm7k+bJIwjCRfoP0RkM6Rn8JUhpXyfq9VUOr
         Utg5TA7Fqxeh0NVuDrdp9VVymGEay34VR3Da+PkcARDYtRxSUHBMUdI1O5dBS5ArPtim
         kJdg==
X-Gm-Message-State: AOAM530QAukmpFfCNhccb2qm1l1j/hclZp2oR2uWVkVm8ZD06x/7MIW0
        fQkNrFrqD3VqB/VsrGmdgts12A==
X-Google-Smtp-Source: ABdhPJx1U0/7EZnEBQLMEiIuCol1THiU31e5Z21aOY17NPbYAijEjm+yap7k148vhVFlfzqRnG7PKg==
X-Received: by 2002:a5d:6c64:0:b0:20f:f413:8af8 with SMTP id r4-20020a5d6c64000000b0020ff4138af8mr2847216wrz.129.1653410677949;
        Tue, 24 May 2022 09:44:37 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e8-20020adfa448000000b0020c5253d8e5sm13594295wra.49.2022.05.24.09.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 09:44:37 -0700 (PDT)
Message-ID: <dc087955-4d00-454e-b242-7741ded6aa5b@nexus-software.ie>
Date:   Tue, 24 May 2022 17:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577
 on cam2
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
 <20220524140207.2758605-5-bryan.odonoghue@linaro.org>
 <CAA8EJpqUkeReqnhcURpftpJmFth9-3OGQoAkFqd7Y06EjfraRg@mail.gmail.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <CAA8EJpqUkeReqnhcURpftpJmFth9-3OGQoAkFqd7Y06EjfraRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2022 17:21, Dmitry Baryshkov wrote:
> On Tue, 24 May 2022 at 17:02, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> The IMX577 is on CCI1/CSI2 providing four lanes of camera data.
> 
> By default the RB5 doesn't employ the navigation mezzanine. Thus I
> suggest adding a new DTS file that will include the qrb5165-rb5.dts
> and extend it with camcc/camss setup.

It makes sense to me.

I'll wait to hear from Robert and Bjorn. We can take the opportunity to 
do it for RB3 too.

---
bod
