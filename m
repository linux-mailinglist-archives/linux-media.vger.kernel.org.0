Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C235E60C5
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 13:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiIVLTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 07:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiIVLT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 07:19:27 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B491E05D8
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 04:19:25 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id e18so6535654wmq.3
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=t8fnzrIP5Rd96wxtwCpBmqjcHWRrpM1rOLVNZO5vmNI=;
        b=dJk5Y94pITj6pxLdNyGO7ZhSsFYiSCkGIvGmbedXGBmdKEvlSGZcq86LxSMRHXjj3E
         JPd5heKCkQy+Af/mMGA4snYiwtKeH4qweugKd0AfAkyaEnwJX3aI6Jrm0J/+x0SDycjG
         YVehNs71VpYm9ngo+53T1OebmrV/FHr4XIAcqpPGEs36FSX8rVk1cRdEXXdWfmAs6A4U
         NBpR4OPQhTJJtcVzwNjXbp9OBg5vg57DczxTdLLlgSPOizzS3KsTtlQ80P4iHQ13GgEt
         9u6o9AQFV/gWWoaxTE0qT1rSWFqylvJgMO53RRBxf3EMLgJ2wUBVw5Nr+FV/D5vypH6r
         pE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=t8fnzrIP5Rd96wxtwCpBmqjcHWRrpM1rOLVNZO5vmNI=;
        b=UoALH5Q+U99Zd/8zPjHvKNjcLa5Ma7QMg7JzJOhcZX53EljmImr0vBA7niFLnmYgXm
         Ydo/x4oJATprIwbBRBlR9WZK6pok/AcOnBpF/LmahxWgS7UzxoKYfX8BwuktQoETCvhc
         jRpy8pBD/S5ppZH5eLX6ehjB7BnaBE9ij90/W8/d8m8ij37TQxqR20r22rpGEXsnCzO3
         zqeT3wNa5Ke/TnzbUGMPy2juicDlegP47ZL0qNXE7jBRjqjR1rlWReyHxC816ZrRcqZz
         DHl9Kk6kMuY+1tpMvB4y0Elg9voDbB7owxeNBuYWByx0Nbx0XPEHOMJ7FdP+NItxUXzO
         NEVw==
X-Gm-Message-State: ACrzQf000kr/UjWsvjrTu/B28OjfK22o532R0HtOq56sSs9Sq2R6fGmv
        jIjaxxMhC/B74mpPyynXAZUxCjgyJo8TTw==
X-Google-Smtp-Source: AMsMyM4n1UW0u+22gzsf6E5ChxfjDUEqJ40NQekVxaebsPOJI9bblE7GXcPC5Eb2gZeHKCWAdVTCzQ==
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id e1-20020a05600c218100b003b474e416f8mr1927026wme.174.1663845563964;
        Thu, 22 Sep 2022 04:19:23 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x2-20020a5d6b42000000b00225307f43fbsm4874060wrw.44.2022.09.22.04.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 04:19:23 -0700 (PDT)
Message-ID: <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
Date:   Thu, 22 Sep 2022 12:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible
 strings
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
 <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2022 12:16, Dave Stevenson wrote:
> It may*eventually*  work for all three parts, but isn't the time to
> add the compatible string at the point where it is actually compatible
> with the driver?

Yes. I forgot about the 0x477 chip id on your part.

I'm happy enough to drop 477 from the compat string or indeed to allow 
0x0477 as a valid chip identifier in imx412.

Sakari, what would you like to do ?

---
bod
