Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964DC359E9D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhDIM0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDIM0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 08:26:44 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3A0C061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 05:26:30 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b9so5475005wrs.1
        for <linux-media@vger.kernel.org>; Fri, 09 Apr 2021 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4awueOEbMCIUE9FtvviXnk0Lavbxtvtjjw6CqsZEuAI=;
        b=FML9Mm49PWPCJkXWjWVweqRuno3eEQl+ZptjEk/PEZRuCXhyEH5IcALsaYEg0PFrNc
         XnYp8u9++Ul/l8/3sNB/K/6OsCszJ0qK1FBi2kbWg2QQfuhTJihF+XBfeEPSNDVHZw48
         P6q66c/CqqIe9+iJAUfAUEKgXt0iSBMiKqy3DESZ7QyaKcIvhRb88JROIHhqKVuqw4p0
         vHkxFh/gF/NrIe+cjohRKUYLQHUIiZG7AYJzgdmcoKE8rGVoAX4FC9a9jbi/gzrh2L30
         HETqgQ5uPsmLlr+usZOUP3azKms2+m1E2oA2LX2LvDEtaYG1iL5R6ttxuJQ1bO91LiaB
         aOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4awueOEbMCIUE9FtvviXnk0Lavbxtvtjjw6CqsZEuAI=;
        b=iinh9oK7pHIOyXyFKPLC5sgZr+eLP/JyYc187FV9wT+XrjpQTK7klhSweyb4tvonCc
         4wXCMVGxLwFDk/JXtiANnF2xbBu1sdBFhH+VVxOdWqHEgohc0bV9zlN6u7KQEF06L6Zj
         SGUYurrq9usNf/uEQPBTUE5MipjoGs1NAKlO50sm91TdgYqelhD5rNzXhl7Dfka57z9h
         ANMTY5KKV+Jh2qR7xxX7oIucB0l5q/pJc0Yplbd1zgVHrrt0TBKmC3CKaizIRIdavCV9
         p+vmZuTqDCJShBW0jwcobaYDr9+ScetorCmWdbBE/T96Ob8HrB2aVudMm5OzbEzSU/cA
         fKHA==
X-Gm-Message-State: AOAM533wAAWLYpUMhUI+I3oL7SdSMx1jaKVBTRyZfNn6uX6eYH7FD9K/
        3b2YhNsfaFCem/3Ow57kXPHWJHUw7Ho8lw==
X-Google-Smtp-Source: ABdhPJxZ6KePxvayjqJw4t9HkhtOMkdfAA8OBHgdlP7xKU4SFLmt6PMDGuYXV94+EUtzZ8mQWyFYVw==
X-Received: by 2002:a05:6000:1789:: with SMTP id e9mr17480345wrg.237.1617971188649;
        Fri, 09 Apr 2021 05:26:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u63sm3546467wmg.24.2021.04.09.05.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 05:26:28 -0700 (PDT)
Subject: Re: [bug report] media: venus: hfi,pm,firmware: Convert to block
 relative addressing
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
References: <YHBGRasttETWBHxW@mwanda>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <1eb51961-aadf-e982-b126-57be68a56319@linaro.org>
Date:   Fri, 9 Apr 2021 13:28:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHBGRasttETWBHxW@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 13:19, Dan Carpenter wrote:
> Hello Bryan O'Donoghue,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch ff2a7013b3e6: "media: venus: hfi,pm,firmware: Convert to
> block relative addressing" from Apr 2, 2021, leads to the following
> Smatch complaint:
> 
>      drivers/media/platform/qcom/venus/hfi_venus.c:1100 venus_isr()
>      warn: variable dereferenced before check 'hdev' (see line 1097)
> 
> drivers/media/platform/qcom/venus/hfi_venus.c
>    1096		u32 status;
>    1097		void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>                                              ^^^^^^^^^^
>    1098		void __iomem *wrapper_base = hdev->core->wrapper_base;
>                                               ^^^^^^^^^^
> The patch adds new unchecked dereferences before ...
> 
>    1099	
>    1100		if (!hdev)
>                      ^^^^^
> ... this check.
> 
>    1101			return IRQ_NONE;
>    1102	
> 
> regards,
> dan carpenter
>

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2540720.html
