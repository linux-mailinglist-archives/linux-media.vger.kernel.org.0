Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0C954B3B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 16:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbiFNOoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 10:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356373AbiFNOnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 10:43:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499331A391
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 07:43:45 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id e66so8685599pgc.8
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4cFnRvgmCgZilg+kua2nS8hJF1hI6XababS0iH20TWo=;
        b=wBDys1FsoPdSRBO3RkTw5jlPlUveLtj70wIv5jWeDeDLEXnPegBmCF3tkiBJbp6xmr
         kcnSZ9qvtjIuBe7II3as/t5SoZ1juk65X+SVmJ9SOmJ/DN+edJzpzYzN/UY1U8ydxEy4
         qNdG/90Ex/j6q6jZ6FPsB+YADxJK5BpFKLhyNaj2ZEinXendLg5kraR7ulE8m0frtNm2
         /dILb8+Azt2pGcQ4CXh1KORlJIOxo7q47pTt9HYRGfNdcgxZuJZ3IpLrNAYlbreaC/f9
         jrq1sKedHCX/0IVWRvzdOBW93TTTpD+39TZicokOhiMCldjMxSosTQPQnmgVMVAZ4PEx
         X8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4cFnRvgmCgZilg+kua2nS8hJF1hI6XababS0iH20TWo=;
        b=shmeG2vahgLGsCbZMcYAAeHTip+YOStt9lEburzGgJDHSXraCqwRgcm3R58ZZ594uP
         yhh/K65+pZ9lJR0oDrThXwGjDwDCWL4RUp4pbkK1X0wYBxmfMIhYO1D1L56+iHQkbD6V
         w91fRp7DOp3S8iDQR25q5ICHdiJ5pUQ0qiLFk7xKHcvNNn1SeLbIwVqk3n9O9vEuFFA9
         Fn+IeSzKpcC2pT1nFhqZ+eu0ZFpV2QlC29qo7KOT3uLuiX5uwwnLmHX92uhyqqhLFOCm
         79gT5O3zp6NLLp34xnInhcADITmx8mAJkDCECb9oIg0fkLuGeX0TqqpixRCXmqg6xfMb
         iJsQ==
X-Gm-Message-State: AOAM530lkE0ppR0qXgwn+ufOLYx+zMuju62cMo73+hE6vtqEyneEs1xN
        X8VfXUIouCNID3Zfw4+I/H4Ong==
X-Google-Smtp-Source: ABdhPJypR8vjAMFkGvsZC+cplFp5gkSzlPo/jUCX+Nh+gTxI9BNzxBVZce/Kf+3LESVZiCbBz1Stcg==
X-Received: by 2002:a05:6a00:a21:b0:522:9134:c620 with SMTP id p33-20020a056a000a2100b005229134c620mr4853896pfh.68.1655217824803;
        Tue, 14 Jun 2022 07:43:44 -0700 (PDT)
Received: from [172.20.0.51] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id g7-20020a63ad07000000b003db822e2170sm7866328pgf.23.2022.06.14.07.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 07:43:44 -0700 (PDT)
Message-ID: <26dc329e-b663-e779-a30f-b495206ced48@linaro.org>
Date:   Tue, 14 Jun 2022 07:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
 <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
 <Yqh4ewFMP5QcO/ta@valkosipuli.retiisi.eu>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Yqh4ewFMP5QcO/ta@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2022 05:00, Sakari Ailus wrote:
> Thanks for the patch.
> 
> Surely the sensors still have some differences.

They do, they absolutely do, the imx577 has a whole bunch of extra modes.

We don't have any reference code or access to documentation for those modes.

My reference is the qualcomm camx code for the rb5 board, which includes 
a imx577 sensor. That stack uses the same init code as for the 412.

So for that baseline mode, the imx412 driver works perfectly.

> Even if the same registers would work as-is (the imx577 might still benefit
> from different MSRs?), the user should know which sensor it is. I.e. please
> set the media entity name accordingly. See e.g. the CCS driver for an
> example.

Agreed, I'll do that.

---
bod
