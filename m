Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD54379158F
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 12:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238199AbjIDKPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 06:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbjIDKPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 06:15:48 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A097BD
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 03:15:44 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so1034004f8f.2
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693822543; x=1694427343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTdHOgrL8joAFyrmUnJ3WmRGjutDtwn1KMWzUgkG9XM=;
        b=PV+43A8glGk9uJK/hIkEMFAsj2rgZMruWU1sLs7KeELCEF/9hmLCjfykjwY5zTHNd1
         kvTb9FUJhU9Lmv2RKzd7IsK24A3hoNphiD8P5xDAHa6XE0j3xMDc3awN7vdgXHB0OW2n
         3Ye4h3/qLEsiPJytL+8IePQWxLeJHypoWbJBVB2bOKCAYm783z1Mkhu2Mv16YHZMCOix
         8yP5h4Dvww9JibfjVpqKGmVyZBkdCpkWQZ3pWrHw0jenGpltQ9tqpCqTFObLA3KfIgru
         C0iMKKXulkEsZlr80OV98rW2UGNMZMBS7SMpViOcXdjzKw8lLlkee1Kvt8MQsCLTa7no
         LFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693822543; x=1694427343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTdHOgrL8joAFyrmUnJ3WmRGjutDtwn1KMWzUgkG9XM=;
        b=ZTFKOWa78bVx2L6AnfhcRJKfSudKmWSeJ53MJ9KJLXT0Eh1RExOw01JtnG2Jg1otgo
         NDDSf17zZtZrG0+3rt3rAFLFOkLaAV5UNr33A4xSI1L81std8d7k7IhW2z0KYpvZNA4J
         03ak/XFXLl/rPK7tDD70J939CiDsOGIszS1yEtJ9nJd00ksMzdLYcJUhhwg4+3rGDvyE
         Ln3ani9j1yAi3EFKGrmLul11aIqoZIywD3J/S7brVHbYbzGBDv7RzVleEGwuSHQ/GO/H
         FvQ5P1CJ6MZQCb4IKNVdtOwnhJKVivtP+5oVV1DCy+QM3zoJy4fVXzy/qHySbD6/PrqP
         /YpA==
X-Gm-Message-State: AOJu0YytWKGlUIf6HzfRNqo9y19UjBjIG6KpxK0A9JJn+bvPt3eZjPpX
        cAu5A39umXTBuVS66wLLBT+SNg==
X-Google-Smtp-Source: AGHT+IGc7nbyEo5kfIQp2Sldm+lS8fxJnYAwJm9zglze8escvSipt5lNYGHeChqkfAyqH82jFZUrjA==
X-Received: by 2002:adf:e94a:0:b0:313:e8b6:1699 with SMTP id m10-20020adfe94a000000b00313e8b61699mr6200965wrn.55.1693822543031;
        Mon, 04 Sep 2023 03:15:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z12-20020adff1cc000000b0031ddf6cc89csm13953870wro.98.2023.09.04.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 03:15:42 -0700 (PDT)
Message-ID: <62f78aac-c1e4-018c-93c2-4dac1ec7c688@linaro.org>
Date:   Mon, 4 Sep 2023 11:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/15] media: qcom: camss: Capture VFE CSID dependency
 in a helper function
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-8-bryan.odonoghue@linaro.org>
 <20230828184716.GM14596@pendragon.ideasonboard.com>
 <9fb41649-b4fb-d652-3207-7c8ff8b32f24@linaro.org>
 <20230828194010.GF17083@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828194010.GF17083@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/08/2023 20:40, Laurent Pinchart wrote:
> On Mon, Aug 28, 2023 at 08:37:44PM +0100, Bryan O'Donoghue wrote:
>> On 28/08/2023 19:47, Laurent Pinchart wrote:
>>> Hi Bryan,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Aug 23, 2023 at 11:44:36AM +0100, Bryan O'Donoghue wrote:
>>>>   From sdm845 onwards we need to ensure the VFE is powered on prior to
>>>> switching on the CSID.
>>>
>>> Based on the discussions with Konrad in the mail thread, I would record
>>> here the reason for this requirement.
>>>
>>> What happens if you unconditionally power up the VFE prior to switching
>>> the CSID on ? Will this break something on platforms older than SDM845 ?
>>
>> vfe->power_count will bump and you will be fine.
> 
> Then maybe that would be a simpler solution than having a
> device-specific power sequence ?
> 

So, this works.

I'll send out a patch based on this suggestion.

---
bod
