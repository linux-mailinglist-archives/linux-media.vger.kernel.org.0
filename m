Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010334E54B0
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 15:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244937AbiCWPAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbiCWPAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 11:00:36 -0400
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A853D3EB95;
        Wed, 23 Mar 2022 07:59:06 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id r22so3350891ejs.11;
        Wed, 23 Mar 2022 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XaPLNIbTZ6ig0UcGfT0Yt46183CT83p4yX3ROwiTphE=;
        b=wFzZYIWPLYixU81458cModGeShKbQFiyAsme82pUYJrd7pjx0ScofYozbW+k+vIMYf
         IPTiGPZdhnRPM6kXo5NqIJB7LYmBBo28+O61ZMB/qsO4SxYG6zl0WtDb4qMmYFjJs8zX
         qlcH4TBdG0RFSmXi+UT8SFoL7zCZ0amMnun1hNjiY3ZbiRdGqXea9pvTwIsJkyGHVmjR
         1NbwXBHt0kzBSisnY34m3F8bAosH4WLoybl+ljuahXHYPekT006NF/ChajhhDOdWbqMa
         Areu9hhEXpc3yOOD5Rxy+vthcvW+wqQ13odFOqCgL16RYEeDDOkOYaF1lI+7PkEbDZhS
         n5nQ==
X-Gm-Message-State: AOAM530TutS8VQDAyyC7zO7+vn2tf+C6GlpA3YXxUxpilpZkcwFTdY3e
        UdQAfTnUztXVaIBul0E2e8I=
X-Google-Smtp-Source: ABdhPJzNlwtJhz6AOkRK0Kp5pU7ok69MlwNly2WsQOmGQ/sZA/W0p69u+gVLx5OmP1ISbYkgR7kktA==
X-Received: by 2002:a17:907:e87:b0:6df:6a26:e17c with SMTP id ho7-20020a1709070e8700b006df6a26e17cmr391979ejc.666.1648047545119;
        Wed, 23 Mar 2022 07:59:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id gb3-20020a170907960300b006dfafbb4ba4sm48588ejc.83.2022.03.23.07.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:59:04 -0700 (PDT)
Message-ID: <c51c156a-4e70-86ca-8fe6-a03fbad258f7@kernel.org>
Date:   Wed, 23 Mar 2022 15:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-3-sakari.ailus@linux.intel.com>
 <7e937551-fba4-760d-f3ce-16f811e10bd8@kernel.org>
 <YjszuFazVgIBw3gl@paasikivi.fi.intel.com>
In-Reply-To: <YjszuFazVgIBw3gl@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2022 15:50, Sakari Ailus wrote:
> Hi Krysztof,
> 
> On Sun, Mar 20, 2022 at 12:58:08PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2022 17:51, Sakari Ailus wrote:
>>> There is firmware out there that uses "dongwoon,dw9807" compatible string
>>> that never made it to upstream as-is. Add it to the driver to make it load
>>> on such systems.
>>>
>>> The chip also has an EEPROM part which is AT24 compatible (for reading
>>> purposes) on a separate I²C address. Adding possible support for this in
>>> the future is not affected by this change.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/i2c/dw9807-vcm.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
>>> index 95e06f13bc9ed..ada8e467a0450 100644
>>> --- a/drivers/media/i2c/dw9807-vcm.c
>>> +++ b/drivers/media/i2c/dw9807-vcm.c
>>> @@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
>>>  
>>>  static const struct of_device_id dw9807_of_table[] = {
>>>  	{ .compatible = "dongwoon,dw9807-vcm" },
>>> +	/* Compatibility for older firmware */
>>> +	{ .compatible = "dongwoon,dw9807" },
>>
>> You need to add it to the bindings as well.
> 
> Why? Generally things that are there for binary compatibility but
> deprecated are not documented in bindings.

Because:
1. Otherwise it will get removed by someone as undocumented, unknown
stuff. Someone might treat it as mistake.
2. Putting it in the driver code is already self-documenting, so someone
might start using it. This should be clearly discouraged and bindings
help in it - the compatible is marked as deprecated with the comment you
mentioned.
3. Bindings are used beyond Linux kernel, so they might document
something more than we use here in DT.


Best regards,
Krzysztof
